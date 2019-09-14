Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA1B2CDE
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Sep 2019 22:20:28 +0200 (CEST)
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9EWw-0001Mc-V3
	for lists+qemu-devel@lfdr.de; Sat, 14 Sep 2019 16:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i9EVt-0000rp-SM
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 16:19:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i9EVr-0003NC-GU
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 16:19:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50666)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i9EVr-0003Ms-Bj
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 16:19:19 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65964A0350;
 Sat, 14 Sep 2019 18:59:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 344FF60BE0;
 Sat, 14 Sep 2019 18:59:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8B76B113865F; Sat, 14 Sep 2019 20:59:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
References: <156839258306.2228854.8411024885973295628.stgit@bahia.lan>
Date: Sat, 14 Sep 2019 20:59:46 +0200
In-Reply-To: <156839258306.2228854.8411024885973295628.stgit@bahia.lan> (Greg
 Kurz's message of "Fri, 13 Sep 2019 18:36:23 +0200")
Message-ID: <87o8zm3dr1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] 9p: Print error hints if option parsing
 fails
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg Kurz <groug@kaod.org> writes:

> Option parsing fonctions are called with &error_fatal, which

functions

> causes error_setg() to call exit() and the hints are never
> printed.
>
> Use an intermediate error object so that exit() happens in
> error_propagate() after error_append_hint() could be called.

Hmm.

Code that creates error objects should not need to know how they are
handled.

Your patch shows that error_append_hint() requires error_propagate() to
work regardless of how the error is handled.  We should amend
error_append_hint()'s contract in error.h to spell this out, and search
the tree for more misuse of error_append_hint().


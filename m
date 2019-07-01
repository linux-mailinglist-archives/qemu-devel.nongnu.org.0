Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D7582BC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 14:40:21 +0200 (CEST)
Received: from localhost ([::1]:50394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgThM-0002BC-A5
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 08:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51538)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hgTgh-0001de-T1
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 08:39:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hgTgg-0002ch-QD
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 08:39:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56128)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hgTgg-0002c7-JO
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 08:39:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BBD2B31628FF
 for <qemu-devel@nongnu.org>; Thu, 27 Jun 2019 12:39:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-169.ams2.redhat.com
 [10.36.117.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89EDA5D9E1;
 Thu, 27 Jun 2019 12:39:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 26C9811386A0; Thu, 27 Jun 2019 14:39:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1560165301-39026-1-git-send-email-pbonzini@redhat.com>
Date: Thu, 27 Jun 2019 14:39:25 +0200
In-Reply-To: <1560165301-39026-1-git-send-email-pbonzini@redhat.com> (Paolo
 Bonzini's message of "Mon, 10 Jun 2019 13:14:54 +0200")
Message-ID: <87y31ndwxu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 27 Jun 2019 12:39:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH 0/7] Proof of concept for Meson
 integration
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> Hi all,
>
> this is just a simple example of introducing Meson into the build system,
> converting a few contrib/ subprojects to use it instead of Makefile.objs.
> There are certainly many rough edges, but I wanted to throw this out to
> show what it could look like.
>
> I chose contrib/ because it's a simple example of how the current build
> system causes clutter in the toplevel Makefiles and how interrelated the
> Makefile, Makefile.objs and contrib/*/Makefile.objs file are even for
> such simple executables.

This left a pleasant first impression, apart from the rather large
ninjatools.py (which I didn't actually review).  I think I'm at the
point where I go "okay, now show me something complicated".  Something
going beyond "build this from that", where both "this" and "that" are
basically literals.  Show us how to *compute* in the brave new Meson
world.

To avoid misunderstandings: I think the less computing we need in the
build system, the better.  But I doubt we can banish it entirely there.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDDA2014C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 10:27:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRBjo-0003j3-OA
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 04:27:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hRBiV-0003AA-2j
	for qemu-devel@nongnu.org; Thu, 16 May 2019 04:26:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hRBiU-0003RE-9g
	for qemu-devel@nongnu.org; Thu, 16 May 2019 04:26:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32989)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hRBiU-0003Qf-4s
	for qemu-devel@nongnu.org; Thu, 16 May 2019 04:26:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2CB583091740
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 08:26:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB83A17B8D;
	Thu, 16 May 2019 08:26:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6EBBD11385E4; Thu, 16 May 2019 10:26:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190509130345.227526-1-sgarzare@redhat.com>
	<20190509130345.227526-2-sgarzare@redhat.com>
Date: Thu, 16 May 2019 10:26:15 +0200
In-Reply-To: <20190509130345.227526-2-sgarzare@redhat.com> (Stefano
	Garzarella's message of "Thu, 9 May 2019 15:03:42 +0200")
Message-ID: <87ftpevm8o.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 16 May 2019 08:26:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/4] net: fix assertion failure when
 ipv6-prefixlen is not a number
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefano Garzarella <sgarzare@redhat.com> writes:

> If 'ipv6-prefixlen' is not a number, the current behaviour
> produces an assertion failure:
>     $ qemu-system-x86_64 -net user,ipv6-net=feca::0/a
>     qemu-system-x86_64: qemu/util/qemu-option.c:1175: qemu_opts_foreach:
>     Assertion `!errp || !*errp' failed.
>     Aborted (core dumped)
>
> This patch fixes it, jumping to the end of the function when
> 'ipv6-prefixlen' is not a number, and printing the more friendly
> message:
>     $ qemu-system-x86_64 -net user,ipv6-net=feca::0/a
>     qemu-system-x86_64: Parameter 'ipv6-prefixlen' expects a number
>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C57302C01
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:53:12 +0100 (CET)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l47vC-0002md-M0
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l47sj-0001V8-7k
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:50:37 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:60058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l47se-0005Az-0y
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:50:36 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 66E38746395;
 Mon, 25 Jan 2021 20:50:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 397F174632F; Mon, 25 Jan 2021 20:50:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 37A0D746358;
 Mon, 25 Jan 2021 20:50:23 +0100 (CET)
Date: Mon, 25 Jan 2021 20:50:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/2] trace: make the 'log' backend timestamp configurable
In-Reply-To: <20210125113507.224287-1-stefanha@redhat.com>
Message-ID: <afa594a-921a-6c3d-db29-56173570f080@eik.bme.hu>
References: <20210125113507.224287-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Jan 2021, Stefan Hajnoczi wrote:
> Zoltan reminded me that the 'log' backend prints tids/timestamps and this can
> be unwanted in some cases. It's easier to look at trace output without them and
> in some cases parsing is also more convenient with them.
>
> Extend -msg timestamp=on|off to control the 'log' backend's tid/timestamp output.

Thank you, this works for me

Tested-by: BALATON Zoltan <balaton@eik.bme.hu>

but I had to remove build dir and rerun configure to get it omit 
timestamps. Just running make (which reruns configure) or make distclean 
and running configure does not seem to be enough to pick up some changes 
since the meson conversion. (I had similar problem with gtk being detected 
and used despite having --disable-gtk on configure before the gtk test was 
moved to meson; so I think there's some problem detecting changes in 
configure options somewhere. That was also fixed by rerunning configure 
after starting from clean build dir but did not work when keeping old 
build dir or make distclean. This is probably not a problem for someone 
downloading the sources and compiling it once, only annoying for 
developers who build it all the time.)

Regards,
BALATON Zoltan

> Stefan Hajnoczi (2):
>  error: rename error_with_timestamp to message_with_timestamp
>  trace: make the 'log' backend timestamp configurable
>
> docs/devel/tracing.txt           |  3 +++
> include/qemu/error-report.h      |  2 +-
> softmmu/vl.c                     |  2 +-
> util/qemu-error.c                |  4 ++--
> scripts/tracetool/backend/log.py | 19 +++++++++++++------
> 5 files changed, 20 insertions(+), 10 deletions(-)


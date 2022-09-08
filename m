Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80975B2389
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 18:24:04 +0200 (CEST)
Received: from localhost ([::1]:33454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWKJv-0002Vr-QB
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 12:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oWKBC-0000M6-A4
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 12:15:02 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:58027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oWKB9-0006Vx-IE
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 12:15:01 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.141])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4B3962B477;
 Thu,  8 Sep 2022 16:14:55 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 8 Sep
 2022 18:14:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006d4345006-ae52-4d02-ac32-7f0ab2a15cc6,
 B02C07B1D5AE2B4A5F5E9DA07B2DFCF1042A4A0C) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 8 Sep 2022 18:14:17 +0200
From: Greg Kurz <groug@kaod.org>
To: Linus Heckemann <git@sphalerite.org>
CC: <qemu-devel@nongnu.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Qemu-block <qemu-block@nongnu.org>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <f4bug@amsat.org>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>
Subject: Re: [PATCH v3] 9pfs: use GHashTable for fid table
Message-ID: <20220908181417.781ae1f4@bahia>
In-Reply-To: <ygaillx6e4r.fsf@localhost>
References: <20220908112353.289267-1-git@sphalerite.org>
 <20220908141841.6a451d85@bahia> <ygaillx6e4r.fsf@localhost>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 9309f6bc-f2ef-4467-a4b5-4eb67c8ae336
X-Ovh-Tracer-Id: 1502794901937035558
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtfedggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeekjedtveegkeeileffvdetvddvgedtudduiefghffhgfdvhfegjeetkeehfeeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.43.201; envelope-from=groug@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 08 Sep 2022 18:10:28 +0200
Linus Heckemann <git@sphalerite.org> wrote:

> (sorry for the dup @Greg, forgot to reply-all)
> 
> Greg Kurz <groug@kaod.org> writes:
> >> > g_hash_table_steal_extended() [1] actually allows to do just that.
> >> 
> >> g_hash_table_steal_extended unfortunately isn't available since it was
> >> introduced in glib 2.58 and we're maintaining compatibility to 2.56.
> >> 
> >
> > Ha... this could be addressed through conditional compilation, e.g.:
> 
> It still won't compile, because we set GLIB_VERSION_MAX_ALLOWED in
> glib-compat.h and it would require a compat wrapper as described

ah drat, you're right !

> there. I think that's a bit much for this far more marginal performance
> change. I'm happy to resubmit with the TODO comment though if you like?

Either that or Christian may add it when merging.

Cheers,

--
Greg


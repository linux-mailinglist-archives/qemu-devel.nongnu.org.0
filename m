Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5C5340308
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:20:06 +0100 (CET)
Received: from localhost ([::1]:60998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpl7-0000W6-HM
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMpk6-0008Be-VF
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMpk3-0006hX-Jd
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616062737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pw9N8S2fyBYvhZbaLRvZkk8jgbOcQTbuuRuN0Jxr0y0=;
 b=NgtGOrGo+K3n/316sYncF37X8MRv7K0zsrCf0L4wv9wpmmZQumO2+B+mHZymo7sBrppq2S
 XLBVjmNu/rkTJ/226K+KCb45TfUsuYaH2LyiD113rVp6EMBBIINK6jier/HuzfsGnO7vPQ
 moIo3Blt28LNlDLKjX6vK9MY/qsD2zU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-jpk_k9dSNGKWTBWuYqrpIA-1; Thu, 18 Mar 2021 06:18:53 -0400
X-MC-Unique: jpk_k9dSNGKWTBWuYqrpIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33FD481431C;
 Thu, 18 Mar 2021 10:18:52 +0000 (UTC)
Received: from work-vm (ovpn-115-13.ams2.redhat.com [10.36.115.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0549C6F96F;
 Thu, 18 Mar 2021 10:18:50 +0000 (UTC)
Date: Thu, 18 Mar 2021 10:18:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: of AVR target page size
Message-ID: <YFMpCPtMJzXUeeIk@work-vm>
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Wed, 17 Mar 2021 at 20:17, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > Hi Michael,
> >   I noticed your AVR code defines:
> >
> >   #define TARGET_PAGE_BITS 8
> >
> > and has an explanation of why.
> >
> > Note however that's not going to work with the current live
> > migration/snapshotting code, since you're a couple of bits smaller
> > than the smallest page size we had so far, and for many years
> > the RAM migration code has stolen the bottom few bits of the address
> > as a flag field, and has already used 0x100 up; see migration/ram.c
> > RAM_SAVE_FLAG_*    - and it's actually tricky to change it, because if
> > you change it then it'll break migration compatibility with existing
> > qemu's.
>=20
> If you want to use low bits as flags for other stuff, you
> should have a compile time assert that you have the number
> of bits you expect, or otherwise force a compile error.
> Otherwise you'll end up with unpleasant surprises like this one...

Yes, I think that's been around for a long time.

> I think that for the cpu-all.h uses of low bits we would
> end up with a compile error for excessively small TARGET_PAGE_BITS
> because we define the bits like this:
> #define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 6))
> and I expect the compiler will complain if the RHS of the '<<'
> is a negative constant. But I don't know if that's deliberate
> or a happy accident :-)


Something like this, does fail for AVR:

From 8a617836955ebba1a4932d238fce600be51b9182 Mon Sep 17 00:00:00 2001
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Thu, 18 Mar 2021 10:17:27 +0000
Subject: [PATCH] migration: Check TARGET_PAGE_SIZE vs RAM flags

migration/ram.c steals the bottom few bits of address for flags;
check that we don't run into TARGET_PAGE_SIZE

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 1ee7ff9c6d..f053d45f3c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -81,6 +81,8 @@
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
=20
+#define RAM_SAVE_FLAG__MAX RAM_SAVE_FLAG_COMPRESS_PAGE
+
 static inline bool is_zero_range(uint8_t *p, uint64_t size)
 {
     return buffer_is_zero(p, size);
@@ -4101,5 +4103,10 @@ static SaveVMHandlers savevm_ram_handlers =3D {
 void ram_mig_init(void)
 {
     qemu_mutex_init(&XBZRLE.lock);
+#ifndef TARGET_PAGE_BITS_VARY
+    QEMU_BUILD_BUG_ON(RAM_SAVE_FLAG__MAX >=3D TARGET_PAGE_SIZE);
+#else
+    QEMU_BUILD_BUG_ON(RAM_SAVE_FLAG__MAX >=3D (1 << TARGET_PAGE_BITS_MIN))=
;
+#endif
     register_savevm_live("ram", 0, 4, &savevm_ram_handlers, &ram_state);
 }
--=20
2.30.2

> thanks
> -- PMM
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



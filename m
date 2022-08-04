Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAFA589D87
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 16:33:24 +0200 (CEST)
Received: from localhost ([::1]:33812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJbud-0004ES-Ls
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 10:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJbsg-0002G6-5H
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:31:22 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:57536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJbsc-0007Hp-Gf
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:31:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70679618CB;
 Thu,  4 Aug 2022 14:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD43C433D7;
 Thu,  4 Aug 2022 14:31:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="XmwrLad4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659623472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYxFLRCVOBoPrI9690IH22pI84yUr8kzvw+91uaVNvw=;
 b=XmwrLad4pUkGLjB9IKBI2QRsYNk1agAEMsKeL/sVTqVfEeXGWch/QkLIurLxEKI/0yLYEb
 bSUaA1HMrDPAxAXA0GQaWOTlHgIEXQQQTafWVTcd0RGj9fbD0guhiVMgCbgXmmj+Ng95UD
 kBkasndDEIvUNJFqXDxzVYYUybNQof4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e4aaf2e4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 4 Aug 2022 14:31:12 +0000 (UTC)
Date: Thu, 4 Aug 2022 16:31:06 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] pc: add property for Linux setup_data seed
Message-ID: <YuvYKq5pXZlCCP6O@zx2c4.com>
References: <20220804131320.395015-1-pbonzini@redhat.com>
 <YuvHu3NW592rGFXz@zx2c4.com> <YuvKGrUsSAzQEzfL@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YuvKGrUsSAzQEzfL@redhat.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Daniel,

On Thu, Aug 04, 2022 at 02:31:06PM +0100, Daniel P. Berrangé wrote:
> On Thu, Aug 04, 2022 at 03:20:59PM +0200, Jason A. Donenfeld wrote:
> > On Thu, Aug 04, 2022 at 03:13:20PM +0200, Paolo Bonzini wrote:
> > > Using a property makes it possible to use the normal compat property
> > > mechanism instead of ad hoc code; it avoids parameter proliferation
> > > in x86_load_linux; and allows shipping the code even if it is
> > > disabled by default.
> > 
> > Strong NACK from me here.
> > 
> > If this kind of thing is off by default, it's as good as useless. Indeed
> > it shouldn't even be a knob at all. Don't do this.
> 
> You're misunderstanding the patch. This remains on by default for
>  the 7.1 machine type.

Ahhh, I think you're right. Sorry for mis understanding. The "even if it
is disabled by default" of the commit message isn't quite true then,
right?

If I understand correctly, this is a yes/no/auto, which defaults to
auto on newer machine types. And auto triggers if the kernel has a newer
boot header. Is that correct?

    if (x86ms->linuxboot_seed != ON_OFF_AUTO_OFF &&
        (protocol >= 0x209 || x86ms->linuxboot_seed == ON_OFF_AUTO_ON)) {

I think it's working as described (after applying the below fixup to
this broken patch).

> The patch is merely exposing a knob so that users can override the
> built-in default if they need to. Imagine if we had shipped this
> existing code before today's bugs were discovered.  The knob
> proposed her would allow users to turn off the broken pieces.
> This is a good thing.

I'm still not really keen on adding a knob for this. I understand ARM
has a knob for it for different reasons (better named "dtb-randomness").
If this knob thing is to live on here, maybe it should have
"-randomness" in the name also.

> > Rather, let's fix the bug. The code as-is -- going back to the 2016 DTB
> > addition -- is problematic and needs to be fixed. So let's fix that.
> > Trying to cover up the problem with a default-off knob just ensures this
> > stuff will never be made to work right.
> 
> It isn't covering up the problem, just providing a workaround
> option, should another bug be discovered after release. We
> still need to fix current discussed problems of course.

Thanks for the explanation. I don't like adding a knob. But if it's on
by default for the default machine type, then that's a compromise I
could accept.

Jason


diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 00c21f6e4d..074571bc03 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -446,6 +446,7 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,

 static void pc_i440fx_7_0_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_1_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 5bcf100b35..f3aa4694a2 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -383,6 +383,7 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,

 static void pc_q35_7_0_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_1_machine_options(m);
     m->alias = NULL;
     pcmc->enforce_amd_1tb_hole = false;
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 3fbab258a9..206ce6c547 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -785,6 +785,7 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
     SevKernelLoaderContext sev_load_ctx = {};
+    enum { RNG_SEED_LENGTH = 32 };

     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -1075,7 +1076,7 @@ void x86_load_linux(X86MachineState *x86ms,
     }

     if (x86ms->linuxboot_seed != ON_OFF_AUTO_OFF &&
-        (data.protocol >= 0x209 || x86ms->linuxboot_seed == ON_OFF_AUTO_ON)) {
+        (protocol >= 0x209 || x86ms->linuxboot_seed == ON_OFF_AUTO_ON)) {
         setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
         kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
         kernel = g_realloc(kernel, kernel_size);



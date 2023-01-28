Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684C167F77E
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 12:16:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLjB0-000810-LJ; Sat, 28 Jan 2023 06:15:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLjAy-00080o-HE
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 06:15:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLjAw-00043B-6e
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 06:15:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674904511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CRTI5dWkcyVWKKNbuRxB8XsdzMimrbukL7Ulo+bRFdY=;
 b=R8aSVHRUThJHttPvbO0dLAw7Tz5K7wEe6Bk4+q13W2v/RDn1P5JwDgy5rlIe/tBj57LLLh
 8qOD+NveZjqfryGe15W/0r0t+8RykJZ/o+6q0NmzBcbMNKJDXDUXChouqWC2BO3A+88+5a
 J/zoGcuW7HKRygB65mud18F8DuCq+M8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-Z9SiN8RDMuOaoLYjOH1AmQ-1; Sat, 28 Jan 2023 06:15:09 -0500
X-MC-Unique: Z9SiN8RDMuOaoLYjOH1AmQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 h9-20020a1ccc09000000b003db1c488826so6197038wmb.3
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 03:15:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRTI5dWkcyVWKKNbuRxB8XsdzMimrbukL7Ulo+bRFdY=;
 b=QPIFrnC1w8BJqoRMKMV1YdZCUgm9A6+g9pILeXJHKTFvaOglhkMgfCH1l27slPmc7S
 9PWFv5x6MfBcSWbVtHpsVzf2WJeWtVwkYv+H6cPS4F8/RS5x/Z/y9UR44vVOZ+dWr7Gk
 qyS+RinTLEx0d0eGd0q2kG3SQJ5yqZXrwb8iWvKnDZjheRz5kl6FnFUF9J1ZoraK63Gj
 abXjIF/bKhNOzCcc5OWt0yHm6ePR2NIDJTG29s0hr33oF/CTPwLSlSuzOMd1bJIWXORK
 fD4EmU996myXe5+1WXgKb2/XyVJE0fsJ73WLtIcLp+IF9t6Omlqcs7LzVjOtmQo36wHM
 FS2Q==
X-Gm-Message-State: AO0yUKUEFA/uLaMtnZBvXHOi58aJJ5Y9WMjfrmSosPLZmsVYtYZNiK2V
 TVGMzE+w+ioO2hfpfkv09qTKQwVHTAG3ZL0aIh0h+0qkmoRKztArKH9D4CBg/HkciXVUnV0sbYV
 5xzSny+uwXVrVE9I=
X-Received: by 2002:a5d:5229:0:b0:2bf:b54b:6ed9 with SMTP id
 i9-20020a5d5229000000b002bfb54b6ed9mr13500894wra.15.1674904508251; 
 Sat, 28 Jan 2023 03:15:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8WxXPNGup4b6xIhVsP0YK1zMI5g00dVPEPAkKbo392UgRlf/FYnI9dW+evObZeJgvNKjkikg==
X-Received: by 2002:a5d:5229:0:b0:2bf:b54b:6ed9 with SMTP id
 i9-20020a5d5229000000b002bfb54b6ed9mr13500874wra.15.1674904507973; 
 Sat, 28 Jan 2023 03:15:07 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 h1-20020adfe981000000b002bfb02153d1sm7504420wrm.45.2023.01.28.03.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 03:15:07 -0800 (PST)
Date: Sat, 28 Jan 2023 06:15:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Eric Biggers <ebiggers@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 pbonzini@redhat.com, Mathias Krause <minipli@grsecurity.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <20230128061015-mutt-send-email-mst@kernel.org>
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
 <Y72FmQlNwBsp8Ntc@zx2c4.com>
 <20230110125005-mutt-send-email-mst@kernel.org>
 <Y84LSgtrq1Rq3ItD@sol.localdomain>
 <20230123071128-mutt-send-email-mst@kernel.org>
 <CAHmME9qXnA=0tBwXe=S=X_LzdBa0irDbWNSNnTdUHSQYJkfPpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9qXnA=0tBwXe=S=X_LzdBa0irDbWNSNnTdUHSQYJkfPpQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 23, 2023 at 06:37:21AM -0600, Jason A. Donenfeld wrote:
> On Mon, Jan 23, 2023 at 6:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sun, Jan 22, 2023 at 08:21:30PM -0800, Eric Biggers wrote:
> > > Hi Michael,
> > >
> > > On Tue, Jan 10, 2023 at 12:50:42PM -0500, Michael S. Tsirkin wrote:
> > > > On Tue, Jan 10, 2023 at 04:34:49PM +0100, Jason A. Donenfeld wrote:
> > > > > Hi Michael,
> > > > >
> > > > > Could you queue up this patch and mark it as a fix for 7.2.1? It is a
> > > > > straight-up bug fix for a 7.2 regression that's now affected several
> > > > > users.
> > > >
> > > > OK. In the future pls cc me if you want me to merge a patch. Thanks!
> > > >
> > > > > - It has two Tested-by tags on the thread.
> > > > > - hpa, the maintainer of the kernel side of this, confirmed on one of
> > > > >   the various tributary threads that this approach is a correct one.
> > > > > - It doesn't introduce any new functionality.
> > > > >
> > > > > For your convenience, you can grab this out of lore here:
> > > > >
> > > > >   https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/
> > > > >
> > > > > Or if you want to yolo it:
> > > > >
> > > > >   curl https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/raw | git am -s
> > > > >
> > > > > It's now sat silent on the mailing list for a while. So let's please get
> > > > > this committed and backported so that the bug reports stop coming in.
> > > > >
> > >
> > > This patch still isn't on QEMU's master branch.  What happened to it?
> > >
> > > - Eric
> >
> > Indeed though I remember picking it up. Tagged again now. Thanks!
> 
> Thanks. What branch is this in? I didn't see it on:
> https://gitlab.com/mstredhat/qemu/-/branches/active
> https://github.com/mstsirkin/qemu/branches

I don't use github really. And it was not pushed to gitlab as I was
figuring out issues with other patches before starting CI as CI minutes
are limited.  BTW as checkpatch was unhappy I applied a fixup -
making checkpatch happier and in the process the code change a bit
smaller.  If you want to do cleanups on top be my guest but pls
make it pass checkpatch. Thanks!


commit a00d99e04c4481fca3ee2d7c40d42993b7b059c2
Author: Michael S. Tsirkin <mst@redhat.com>
Date:   Sat Jan 28 06:08:43 2023 -0500

    fixup! x86: don't let decompressed kernel image clobber setup_data

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 1b19d28c02..29f30dd6d3 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -378,7 +378,7 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
     MicrovmMachineState *mms = MICROVM_MACHINE(machine);
     BusState *bus;
     BusChild *kid;
-    char *cmdline, *existing_cmdline = fw_cfg_read_bytes_ptr(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA);
+    char *cmdline, *existing_cmdline;
     size_t len;
 
     /*
@@ -388,6 +388,7 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
      * Yes, this is a hack, but one that heavily improves the UX without
      * introducing any significant issues.
      */
+    existing_cmdline = fw_cfg_read_bytes_ptr(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA);
     cmdline = g_strdup(existing_cmdline);
     bus = sysbus_get_default();
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
@@ -413,10 +414,11 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
     }
 
     len = strlen(cmdline);
-    if (len > VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(existing_cmdline))
+    if (len > VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(existing_cmdline)) {
         fprintf(stderr, "qemu: virtio mmio cmdline too large, skipping\n");
-    else
+    } else {
         memcpy(existing_cmdline, cmdline, len + 1);
+    }
     g_free(cmdline);
 }
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b57a993596..eaff4227bd 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -803,7 +803,7 @@ void x86_load_linux(X86MachineState *x86ms,
     bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
     uint16_t protocol;
     int setup_size, kernel_size, cmdline_size;
-    int dtb_size;
+    int dtb_size, setup_data_offset;
     uint32_t initrd_max;
     uint8_t header[8192], *setup, *kernel;
     hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0, first_setup_data = 0;
@@ -818,8 +818,10 @@ void x86_load_linux(X86MachineState *x86ms,
     SevKernelLoaderContext sev_load_ctx = {};
     enum { RNG_SEED_LENGTH = 32 };
 
-    /* Add the NUL terminator, some padding for the microvm cmdline fiddling
-     * hack, and then align to 16 bytes as a paranoia measure */
+    /*
+     * Add the NUL terminator, some padding for the microvm cmdline fiddling
+     * hack, and then align to 16 bytes as a paranoia measure
+     */
     cmdline_size = (strlen(machine->kernel_cmdline) + 1 +
                     VIRTIO_CMDLINE_TOTAL_MAX_LEN + 16) & ~15;
     /* Make a copy, since we might append arbitrary bytes to it later. */
@@ -1090,22 +1092,24 @@ void x86_load_linux(X86MachineState *x86ms,
             exit(1);
         }
 
+        setup_data_offset = cmdline_size;
         cmdline_size += sizeof(SetupData) + dtb_size;
         kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
-        setup_data = (void *)kernel_cmdline + cmdline_size - (sizeof(SetupData) + dtb_size);
+        setup_data = (void *)kernel_cmdline + setup_data_offset;
         setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = cmdline_addr + ((void *)setup_data - (void *)kernel_cmdline);
+        first_setup_data = cmdline_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_DTB);
         setup_data->len = cpu_to_le32(dtb_size);
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
     if (!legacy_no_rng_seed && protocol >= 0x209) {
+        setup_data_offset = cmdline_size;
         cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
         kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
-        setup_data = (void *)kernel_cmdline + cmdline_size - (sizeof(SetupData) + RNG_SEED_LENGTH);
+        setup_data = (void *)kernel_cmdline + setup_data_offset;
         setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = cmdline_addr + ((void *)setup_data - (void *)kernel_cmdline);
+        first_setup_data = cmdline_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6016A2EA9
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 07:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWAut-0000Dz-IV; Sun, 26 Feb 2023 01:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWAuq-0000DU-Ll
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 01:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWAuo-0002Vl-NX
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 01:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677394424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yy/AIjKvLpTL8bndZv522JPoAQLUUJqygs9QzR8ntZw=;
 b=elMM5RDycFSba2kQ99maA8aoT7PYX2wH06kppl72R5QcmIcavNpqOnpeCpMmBFGgUKjLFU
 BaG0iEyvnKk16ZKKE5xkRsbmQYPELk6dJTXkpv6BQ7cSnIY2lsMmkAxG+oMfrbC65XKp2k
 xSoSmd+jgcvROz0a7V2B9vuuSy5pPyA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-k6VvQFjiPwOO1D4tJ4VZgQ-1; Sun, 26 Feb 2023 01:53:42 -0500
X-MC-Unique: k6VvQFjiPwOO1D4tJ4VZgQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so3558382wml.2
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 22:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yy/AIjKvLpTL8bndZv522JPoAQLUUJqygs9QzR8ntZw=;
 b=YPvjk2nh0vgfbhx245JpKUZr15powALxYHn6M2PefMFaYWwEyyBVzc3BxuAlJ1mtti
 sLOiWfl127PcsAMiMD9xvBF3pDuMFlvCnWEjNDRSCcnKY9ScPSxik5S7dLFtme49YiaL
 pYPLVysu1kv6hV89SmirQrcjy0o7khQ3feo+/nalfQit2WcK96+jNg10//w6qocm5ROg
 djLV5QYo4tGE5EmP5EDxauVUOeTxkWHEasybBd8r8MZfmJikyKJvPCeDIk5Bqo09JgXy
 V3nytd4ybRUVZTMkbKBnQS/2hu75hSBNHUROy7t5yvG+x5aSxFPikD5HeTjrGQGaSc3A
 BJMw==
X-Gm-Message-State: AO0yUKV5Ece5b4We9qqX3FD6A8vFfXZjosAn60w86kCtW//fs7MYsYkE
 Geskp7t9f78Yo6yXLoH3Vjur8AVIMcqDsad7yQzOtGt5DYRoskMqzTRGux/tIobgv46+TdafYza
 5b50CwetkBAEwVqY=
X-Received: by 2002:a05:6000:12d2:b0:2c5:60e6:eac with SMTP id
 l18-20020a05600012d200b002c560e60eacmr16779867wrx.24.1677394421839; 
 Sat, 25 Feb 2023 22:53:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZEff+VBNbj4kuCmuh7K63bPTffh2PKNnYKjA0FagcBoKBpGOVAq5ky00+S/FecS5o1SR9IA==
X-Received: by 2002:a05:6000:12d2:b0:2c5:60e6:eac with SMTP id
 l18-20020a05600012d200b002c560e60eacmr16779848wrx.24.1677394421521; 
 Sat, 25 Feb 2023 22:53:41 -0800 (PST)
Received: from redhat.com ([2.52.24.119]) by smtp.gmail.com with ESMTPSA id
 d2-20020adfef82000000b002c5801aa9b0sm3660317wro.40.2023.02.25.22.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 22:53:41 -0800 (PST)
Date: Sun, 26 Feb 2023 01:53:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Hoffman <dhoff749@gmail.com>
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2] hw/i386: fix microvm segfault with virtio cmdline
Message-ID: <20230226015236-mutt-send-email-mst@kernel.org>
References: <20230226002757.1162730-1-dhoff749@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230226002757.1162730-1-dhoff749@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Sat, Feb 25, 2023 at 04:27:57PM -0800, Daniel Hoffman wrote:
> The 'microvm' machine type allows for disabling ACPI, in which case
> the VirtIO device configuration is passed via appending it to the
> kernel cmdline.
> 
> If no cmdline parameter was passed, then a null pointer is dereferenced when
> the new cmdline is copied back. A solution is to always define the cmdline
> in the fw_cfg so the read to append happens before the first write in the
> multiboot case and to explcitly re-write the value to update the length.
> 
> Fixes: eac7a7791b ("x86: don't let decompressed kernel image clobber setup_data")
> 
> Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>

Hmm. My tree has a commit reverting this one.

I will send a pull request with that RSN, then ping you
to rebase and re-test. Thanks!


> ---
>  hw/i386/microvm.c | 3 ++-
>  hw/i386/x86.c     | 9 +++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 29f30dd6d3..587ca53def 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -417,7 +417,8 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
>      if (len > VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(existing_cmdline)) {
>          fprintf(stderr, "qemu: virtio mmio cmdline too large, skipping\n");
>      } else {
> -        memcpy(existing_cmdline, cmdline, len + 1);
> +        fw_cfg_modify_i32(x86ms->fw_cfg, FW_CFG_CMDLINE_SIZE, len + 1);
> +        fw_cfg_modify_string(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA, cmdline);
>      }
>      g_free(cmdline);
>  }
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index eaff4227bd..ac6d921a6b 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -827,6 +827,15 @@ void x86_load_linux(X86MachineState *x86ms,
>      /* Make a copy, since we might append arbitrary bytes to it later. */
>      kernel_cmdline = g_strndup(machine->kernel_cmdline, cmdline_size);
>  
> +    /*
> +     * If no kernel cmdline was passed as a parameter, machine->kernel_cmdline is
> +     * blank but fw_cfg is undefined. The microvm cmdline fiddling hack requires
> +     * it to be defined, even if it is empty, as g_strndup(NULL) == NULL and 
> +     * g_strndup("") != NULL
> +     */
> +    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(machine->kernel_cmdline) + 1);
> +    fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline, strlen(machine->kernel_cmdline));
> +
>      /* load the kernel header */
>      f = fopen(kernel_filename, "rb");
>      if (!f) {
> -- 
> 2.37.2



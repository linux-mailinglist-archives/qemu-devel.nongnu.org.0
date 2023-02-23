Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182A56A0319
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 08:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV5cc-0003XD-Cv; Thu, 23 Feb 2023 02:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pV5cW-0003We-5R
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 02:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pV5cU-0000oA-GL
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 02:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677135741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kUVgaydzIm9scvVmYFQdC6frhhj6HvHeUSM8b4oRyKA=;
 b=PgAZ+cVQQMtUYBb4Ec+FswUHNfTEmUCxKg4vtJdcamzMU2Ae4w5ReY+DPtQkD+IS1Um1GG
 bbS04RnnODsA6baGxfr+NzPfW45+veFfOmkkovfL43cedVcL4dyWfdU6Nim5fgqACjFeRK
 0SwZTQYHKU/5YhLtbY5JPxmNkkNYoac=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-345-I4YC6RfhMWS6W2qi8NhtMA-1; Thu, 23 Feb 2023 02:02:20 -0500
X-MC-Unique: I4YC6RfhMWS6W2qi8NhtMA-1
Received: by mail-wr1-f71.google.com with SMTP id
 4-20020a5d47a4000000b002c5699ff08aso1990304wrb.9
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 23:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kUVgaydzIm9scvVmYFQdC6frhhj6HvHeUSM8b4oRyKA=;
 b=P4ktQabw+9Zi+aO+cZZ9ehVzQwFVA/MqA/t9u/C6pnWQYNcrqgTWLNUEFkuWj7p9CK
 zNhKSVegJCtm25QF5unZnuEPlkdZ0ekCzfbyBDE8sGmTMlpM8fvunvkpUQZD+BPoz7kt
 EBn0E+vQOY0pltmOTlFcqAat02WTgQnIbN3aFeaNsob0PT9RcivYOoBsvgn9bEkFq97A
 +ckVw8zvYawRjMK94ceylm6nS+gpmkqYgEkbal0A+4M83ZwW6hcs6VRYsZad3KP/U2S8
 e/FdRs6Fv4qcMS7BYNyvnuLwy+R9aOA+fATWmh27st7BzjaV1zfi0q5DQkUpF0BDy2Gw
 PPXg==
X-Gm-Message-State: AO0yUKUiwFcJVgPCbnizqaKqqdGOFahGY8NGBD8ARb6JdwgfdB5b4FTJ
 2rMY9oadz/Bp/2MFSFUIZs0ki+4sEYVCglOcuWC+ibotsfvRREbmpYzJBx+XoHLw7U1h6jHY8oi
 cRK30inXeiMKG4WQFYjSW
X-Received: by 2002:adf:fb49:0:b0:2c6:6e35:4414 with SMTP id
 c9-20020adffb49000000b002c66e354414mr10303184wrs.6.1677135738010; 
 Wed, 22 Feb 2023 23:02:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/8ZFj2CVOEpeESe/WwOfAtS9xCw/qNAZqUDydLUnmwrBOZ7zVi4j45YKKUvebLAtbrzYwrHQ==
X-Received: by 2002:adf:fb49:0:b0:2c6:6e35:4414 with SMTP id
 c9-20020adffb49000000b002c66e354414mr10303160wrs.6.1677135737683; 
 Wed, 22 Feb 2023 23:02:17 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 e9-20020adff349000000b002c704271b05sm6805858wrp.66.2023.02.22.23.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 23:02:17 -0800 (PST)
Date: Thu, 23 Feb 2023 02:02:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Hoffman <dhoff749@gmail.com>
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] hw/i386: fix microvm segfault with virtio cmdline
Message-ID: <20230223015942-mutt-send-email-mst@kernel.org>
References: <20230223063910.69081-1-dhoff749@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223063910.69081-1-dhoff749@gmail.com>
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

didn't read the patch yet but just formatting comments:

On Wed, Feb 22, 2023 at 10:39:10PM -0800, Daniel Hoffman wrote:
> The 'microvm' machine type allows for disabling ACPI, in which case
> the VirtIO device configuration is passed via appending it to the
> kernel cmdline.
> 
> If no cmdline parameter was passed, then a null pointer is dereferenced when
> the new cmdline is copied back. A solution is to always define the cmdline
> in the fw_cfg so the read to append happens before the first write in the
> multiboot case, and to explcitly re-write the value to update the length.

explicitly

> 
> Fixes: eac7a7791b

format is:

Fixes: hash ("subject")

> 
> Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>
> ---
>  hw/i386/microvm.c | 3 ++-
>  hw/i386/x86.c     | 4 ++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 29f30dd6d3..be64280530 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -417,7 +417,8 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
>      if (len > VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(existing_cmdline)) {
>          fprintf(stderr, "qemu: virtio mmio cmdline too large, skipping\n");
>      } else {
> -        memcpy(existing_cmdline, cmdline, len + 1);
> +	fw_cfg_modify_i32(x86ms->fw_cfg, FW_CFG_CMDLINE_SIZE, len + 1);
> +	fw_cfg_modify_string(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA, cmdline);

Pls use spaces not tabs same as surrounding code.

>      }
>      g_free(cmdline);
>  }
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index eaff4227bd..7dd02b7409 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -827,6 +827,10 @@ void x86_load_linux(X86MachineState *x86ms,
>      /* Make a copy, since we might append arbitrary bytes to it later. */
>      kernel_cmdline = g_strndup(machine->kernel_cmdline, cmdline_size);
>  
> +    /* If the cmdline is undefined, set it as an empty allocated value */
> +    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, cmdline_size);
> +    fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline, cmdline_size);
> +
>      /* load the kernel header */
>      f = fopen(kernel_filename, "rb");
>      if (!f) {
> -- 
> 2.37.2



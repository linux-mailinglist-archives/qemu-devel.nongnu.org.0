Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7730A85D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 14:12:24 +0100 (CET)
Received: from localhost ([::1]:32948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Z0B-0006ZK-6Y
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 08:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Yx4-0003e2-Nx
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:09:10 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Yx2-0003lB-WD
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:09:10 -0500
Received: by mail-ej1-x62b.google.com with SMTP id sa23so7963573ejb.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 05:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rP9I+61hg7LNIUhfLLrTy63wjzGJQeyog0qeGD9KQOk=;
 b=PqljVBE7qJ3DWkvlnvaUln3090pAAuOSz/DQV8eqwDSLCduh6EOA+HKQcrTK05r7O7
 wOhRqk2exJ1038aBtNY2ugNVEx5Ei7H6zj9E0YuLI786lxJ44EMzOVYuamswZPG/GWnW
 u+mX0q0CPvkWkDXyWYjrTPeO8UwmavQSnDmcYCJHj20fvEG7FCo9FcrK28NH0h+JHESU
 KSJEacavGpsmlcbRRSwC/6lnj5dPr9JHXGC7s6IwcPgr8nosYzQna+4/t+8P+xhE6GHg
 2pKpb+tdPYokxpZVdworJIEMcU4qE+hb+Q1kATfChus1ukNQZUYjiiMAPLS/EfUCu/t0
 Ntfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rP9I+61hg7LNIUhfLLrTy63wjzGJQeyog0qeGD9KQOk=;
 b=oNy8A1yc1OePH5Rejore0HGvZTcZXIRo00iwKVjuwDIOi7uuPeng3j3SvaQk3Qv7c1
 00MnKHgnP7x8NSrKhmZlKAtdsH+blWilGbFTMu/GRuXgLf6oB9gf3ZeXNsHNKK5DRqBl
 p7KiG+ZGT26/VfiUS0j+u4zQ87EsHmjs9pS8udJ8N5/I0USYcFlVCX8bHWYCv2naPrrn
 lzl1ZBpusYdPGgC5c1gu2hCxedEKwnlV1x0JMIpM3ZnDX//ifHcmxsL4Knfv3k9gT/gF
 Mll5PipdmLYA0GNY0KxifwYWj0UrhyDnuZ44F7J/7I1AeNZ7k6IARPl0ljepHcp0n8LJ
 K0QQ==
X-Gm-Message-State: AOAM533DFrhS9mN5JE+W5kLRDzucaG96QXF2Ei1X1srosAcjOvQufYJZ
 9QCmvqDBkE0eYIHafxF+nUE=
X-Google-Smtp-Source: ABdhPJw40nPrERTfiMARHLjmWXlD4UMilhu04GifoKIpMYQFjX66d7uewWoAbwIsEoqdkYi/phZtTg==
X-Received: by 2002:a17:906:8410:: with SMTP id
 n16mr17948338ejx.551.1612184947588; 
 Mon, 01 Feb 2021 05:09:07 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id jt8sm8070132ejc.40.2021.02.01.05.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 05:09:06 -0800 (PST)
Subject: Re: [PATCH v3 5/7] hw/xen: Make xen_shutdown_fatal_error() available
 out of X86 HVM
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210201112905.545144-1-f4bug@amsat.org>
 <20210201112905.545144-6-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a77a620d-beca-0d13-6ffe-861528c6cbc4@amsat.org>
Date: Mon, 1 Feb 2021 14:09:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201112905.545144-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 12:29 PM, Philippe Mathieu-Daudé wrote:
> xen_shutdown_fatal_error() is also used by XEN_PV.
> 
> This fixes when XEN_PV without XEN_FV:
> 
>   /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt_config_init.c.o: in function `xen_pt_status_reg_init':
>   hw/xen/xen_pt_config_init.c:281: undefined reference to `xen_shutdown_fatal_error'
>   /usr/bin/ld: hw/xen/xen_pt_config_init.c:275: undefined reference to `xen_shutdown_fatal_error'
>   /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt.c.o: in function `xen_pt_pci_read_config':
>   hw/xen/xen_pt.c:220: undefined reference to `xen_shutdown_fatal_error'
>   /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt.c.o: in function `xen_pt_pci_write_config':
>   hw/xen/xen_pt.c:369: undefined reference to `xen_shutdown_fatal_error'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/xen/xen-hvm.c | 13 -------------
>  hw/xen/xen-utils.c    | 25 +++++++++++++++++++++++++
>  hw/xen/meson.build    |  1 +
>  3 files changed, 26 insertions(+), 13 deletions(-)
>  create mode 100644 hw/xen/xen-utils.c
> 
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 7156ab13329..69196754a30 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -28,7 +28,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/range.h"
> -#include "sysemu/runstate.h"

^ self-nack, was not supposed to remove this.

>  #include "sysemu/sysemu.h"
>  #include "sysemu/xen.h"
>  #include "trace.h"
> @@ -1570,18 +1569,6 @@ void xen_register_framebuffer(MemoryRegion *mr)
>      framebuffer = mr;
>  }


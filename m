Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3A6AE217
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:22:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYCt-0008Vw-Ew; Tue, 07 Mar 2023 09:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYCk-0008BX-Cq
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:22:18 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYCi-0005Zj-NP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:22:14 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bx12so12265365wrb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678198930;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e1T7dwTAFynIqBbDPT+25OMILowKxuyALasx/unKD6A=;
 b=ah0BH9g0PDl8+P8TM81AODYdMIlTRJ3nnN0V7sjJDQSQMmrCv9UMlkpayOW/ccFnT8
 onwTS+v1PIqriHeg+o0DpY5tr76TiqqDmNJiMp8/eE+v6u21l/c7aKzBZ5ESCGslkDWq
 OYdTK+WRTpJgYiSazr7hKDujqNlGiOsURSHcy16/YhbmK2YWOk3eekUs+SNnC9aH4qBC
 QBglJlQ7L64P5Xq+zMhiCjv0t942LBdpQKFJ71Kzf8oFh9BU1wbBnzw2iNW6W5kKwbty
 k6oL1wod4Er9MfGf2cBWyApGLT/7JBbXETySYfZxVS9+GoNPTiIXg/H4PsIKrvQdrazf
 fsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678198930;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e1T7dwTAFynIqBbDPT+25OMILowKxuyALasx/unKD6A=;
 b=j4TdGcq3HEfNqO4phML7szGJ1trJXuXXcaarXfMyhuNL0/Apku6WO5lotwknzsJ27Z
 ApyRp+ofTOgZOpDPj90kxZ34pgG7xNvLr3C4UcySmuo+IAcRjc3OhZm039TvWYiQLz2k
 E499yWHYrlgrq4vYJNnvXOY+4xfdZvhY/UEAmEXIL1Ke3HwxDMxHgaGxZzbz5NAO3Lnz
 Dfz2WAw//DHutoXRTtKK9vADRGRSDq1a8y0yyihV4WVFnFs+XACm9WWZFT9yQLikoiVk
 ybuZxTC0ALhRIB869CfDA31eewr/DIxMgp0UNqJVGkXPWC/TNgvsafoClImbJfWKVz/r
 pQlQ==
X-Gm-Message-State: AO0yUKUdZtlfDW413khT2cAuvuLuuzskfBi+vnPst58ApzjUzgR5vc7X
 GZC1d+Y8SdJJJrGNgL296yM=
X-Google-Smtp-Source: AK7set+/tlPexfD8420vsP0Uvu9OA/xu7ONG39HFE1Bfdz8z05dvKTOFlcpJ8UPQ5E/Xu1PKDjW+ng==
X-Received: by 2002:adf:eed1:0:b0:2c5:4c9f:cf3b with SMTP id
 a17-20020adfeed1000000b002c54c9fcf3bmr11972241wrp.7.1678198930253; 
 Tue, 07 Mar 2023 06:22:10 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d40c3000000b002ce37d2464csm8961236wrq.83.2023.03.07.06.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:22:09 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <fb9c8676-75b9-85c3-2eac-4cf7d31cd894@xen.org>
Date: Tue, 7 Mar 2023 14:22:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 10/25] hw/xen: Add gnttab operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-11-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-11-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Move the existing code using libxengnttab to xen-operations.c and allow
> the operations to be redirected so that we can add emulation of grant
> table mapping for backend drivers.
> 
> In emulation, mapping more than one grant ref to be virtually contiguous
> would be fairly difficult. The best way to do it might be to make the
> ram_block mappings actually backed by a file (shmem or a deleted file,
> perhaps) so that we can have multiple *shared* mappings of it. But that
> would be fairly intrusive.
> 
> Making the backend drivers cope with page *lists* instead of expecting
> the mapping to be contiguous is also non-trivial, since some structures
> would actually *cross* page boundaries (e.g. the 32-bit blkif responses
> which are 12 bytes).
> 
> So for now, we'll support only single-page mappings in emulation. Add a
> XEN_GNTTAB_OP_FEATURE_MAP_MULTIPLE flag to indicate that the native Xen
> implementation *does* support multi-page maps, and a helper function to
> query it.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
[snip]
> @@ -65,7 +195,34 @@ struct evtchn_backend_ops libxenevtchn_backend_ops = {
>       .pending = xenevtchn_pending,
>   };
>   
> +static xengnttab_handle *libxengnttab_backend_open(void)
> +{
> +    return xengnttab_open(NULL, 0);
> +}
> +
> +
> +static struct gnttab_backend_ops libxengnttab_backend_ops = {
> +    .features = XEN_GNTTAB_OP_FEATURE_MAP_MULTIPLE,
> +    .open = libxengnttab_backend_open,
> +    .close = xengnttab_close,
> +    .grant_copy = libxengnttab_fallback_grant_copy,
> +    .set_max_grants = xengnttab_set_max_grants,
> +    .map_refs = xengnttab_map_domain_grant_refs,
> +    .unmap = xengnttab_unmap,
> +};
> +
>   void setup_xen_backend_ops(void)
>   {
> +#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40800
> +    xengnttab_handle *xgt = xengnttab_open(NULL, 0);
> +
> +    if (xgt) {
> +        if (xengnttab_grant_copy(xgt, 0, NULL) == 0) {
> +            xen_gnttab_ops->grant_copy = libxengnttab_backend_grant_copy;

As we found out, this ^^^ is dereferencing a NULL pointer. Switching 
'xen_gnttab_ops->' for the obviously intended 
'libxengnttab_backend_ops.' fixes the problem.

> +        }
> +        xengnttab_close(xgt);
> +    }
> +#endif
>       xen_evtchn_ops = &libxenevtchn_backend_ops;
> +    xen_gnttab_ops = &libxengnttab_backend_ops;

With that rectified...

Reviewed-by: Paul Durrant <paul@xen.org>

>   }



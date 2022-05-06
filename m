Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E01151D26C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 09:38:40 +0200 (CEST)
Received: from localhost ([::1]:57878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmsXu-0000HK-Vv
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 03:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nmsUj-0006Yn-8J
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:35:22 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nmsUe-0001Ob-82
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:35:18 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so7374191pjb.0
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FSq39btoSUPbxgijg54rilLRVSPMSsyBPUtASQE0ZQc=;
 b=IyU7hxYCf46mLXq4TYu7zKIWabBQUqgLbCdR0yuaDMi8mdcn0HHimj4KCSeKnjC5eP
 7lMwUoRRFufshGD0vj+AyBDv3OX7XklYcu1MDsHvmudCPgT7cCUv3R/CiUNKIRTFwIfo
 ZPNsF6t7Pfuh2+E4SK467DfmulP5wLZ2EwIVxFl4fO+nYc/tnFOxys4XJv18lKPzbuqE
 +fGQxpub8zAfv54jEZdhF1tS2dlxeMSMOCMNgwnBRcrdcoK9F0n+CrCbulqR4PSpXRBQ
 LgNj3E1Nz0lKkj39gvDLNmt/kXG3p56pMZ0P4m+6op354KlG8Y4qHW2W0fq7KAlGPWlG
 mWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FSq39btoSUPbxgijg54rilLRVSPMSsyBPUtASQE0ZQc=;
 b=QDluso7VTBo9ZDsoD+LvntAHCaT6Li6wylQ/juF7RJf0odp75S0wMO0prkePYOblAC
 EPxgi4hv7DEAPlQKrBAHzGjzeI0x3XhSh2EdyYXSIpI3X7SrAezXdI0JduPgd+Zn2isA
 kTH5BVdVKH/nCE79X1DYYKnhJo6EoU+Geix/08YQ0gUNRWjbHCOSCwlaypk1ATW/ExpR
 lHrqIA1jgCBoSCwJK/gdTQ6rhaXSOK4W0m5EAVzFXpQNG7oY98OUJhI+brGp5VtlO4si
 504OCxKplAvL0sEx4yaXYnFLqIE2lROzk+TT/W1YkSBC/3rK4JntQ42BVGw+KTjb6Fwz
 TgPA==
X-Gm-Message-State: AOAM532cw/8BFuLIIHMIV9qOXlaqV73NU1rPIb5QmF6CyXEfPSDO0sP6
 TB/LWKRY6a+sd8raVwh6mykFKg==
X-Google-Smtp-Source: ABdhPJywN9hRS+zfdR48appRWM/2jtzeAcKIltu0OxkcXMY3J+aaTMdpR1ENI9FoTIKKVDhVsA79Tw==
X-Received: by 2002:a17:90a:fd85:b0:1d9:6281:d158 with SMTP id
 cx5-20020a17090afd8500b001d96281d158mr10705043pjb.187.1651822513540; 
 Fri, 06 May 2022 00:35:13 -0700 (PDT)
Received: from [10.255.89.252] ([139.177.225.255])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a170902c64300b0015e8d4eb277sm914469pls.193.2022.05.06.00.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 00:35:12 -0700 (PDT)
Message-ID: <849547ae-003d-baa8-ac3e-3cb9b60b21b2@bytedance.com>
Date: Fri, 6 May 2022 15:31:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] hw/nvme: fix smart aen
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>
References: <20220506063649.13361-1-its@irrelevant.dk>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20220506063649.13361-1-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/6/22 14:36, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Pass the right constant to nvme_smart_event(). The NVME_AER* values hold
> the bit position in the SMART byte, not the shifted value that we expect
> it to be in nvme_smart_event().
> 
> Fixes: c62720f137df ("hw/block/nvme: trigger async event during injecting smart warning")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 08574c4dcbc8..a2f6069f7fe1 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5325,7 +5325,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
>   
>           if ((n->temperature >= n->features.temp_thresh_hi) ||
>               (n->temperature <= n->features.temp_thresh_low)) {
> -            nvme_smart_event(n, NVME_AER_INFO_SMART_TEMP_THRESH);
> +            nvme_smart_event(n, NVME_SMART_TEMPERATURE);
>           }
>   
>           break;

It looks good to me.

Acked-by: zhenwei pi <pizhenwei@bytedance.com>

-- 
zhenwei pi


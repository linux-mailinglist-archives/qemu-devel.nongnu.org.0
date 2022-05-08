Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E2751EB37
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:15:16 +0200 (CEST)
Received: from localhost ([::1]:42268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXO7-0002sG-Pz
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXMq-0002DK-Ir
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:13:56 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXMo-0007rO-Pe
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:13:56 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso10070606pjj.2
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Hp1fPDO1u4v/Mjpq0bcySlwpoUzKl8xyBL7Xbw5Bvf4=;
 b=Fn4OL2LowCc8T5FbSev7fGPAKu8vwM3GFdXf3UEK6m/9+K6vpcG0k/I+sbCHVcimN6
 7vzCFUzSVTBp7QKh1B5EYQbRC701RYwLE+YCPam5mIyMdAtDeF2t/ZCrMQy5w3w6Gck+
 Ub4EGmQbcZMdUg9BLh0sHYSr4Wq/VmMozAFfG/97f+JmgpIhUN3BbbydyY0C6s7351lG
 1s/PE8Ub78SR1LK2Xyt+uGLmNpaIQciN+ejsu9VmQFwKMgSHbZ8r9Fxeleynzs2Genix
 MiCg/SbiqvKxEk+fk/28NLORQKdX9o6XfGEB1WJFSZwYl6tgNcjUl9mhHkXWBZk8QQwx
 svKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hp1fPDO1u4v/Mjpq0bcySlwpoUzKl8xyBL7Xbw5Bvf4=;
 b=7x+Br/zS9beLP1qpjWjBMuEqosh/UHV2ZASYFQcuUn94mcRdCwUt4w+dWoijKAvUjd
 9zIIPRFxYbWeWQs8KTRggm2jJpG1guYTQp+aL68WQl+Fk0xTVgfHsqHIIPQZo0BeK510
 XSmifTMGwX0ioCLRkJMStPycQ8mNtih1Rfy/onJ+vk8ixwkInwM12qmNjOtHEil0at6t
 +UB3yNkpBvQzzDOBcQP2hwA456AcHlVub6bbT28TDDvPEEKRyWq4QSXabil8/0/8JVzx
 4X6cpuqDb8G0c5Wdm3zO4FsluRRIjEf1Ru3B2m5c1/IugmE3R5lA6bdPir7aY13+tkCF
 2AcA==
X-Gm-Message-State: AOAM530o2JU3KejCKZn1EKHp2GdpKcw8Ju0jd0QtBrrHCUgEE+Oiamd4
 ZWu7cOvt6VFBGOpk9LfYqs26BA==
X-Google-Smtp-Source: ABdhPJydl27xLRfNZaaLc/jEwsXpnSN+i+54u+uHGKg5SK46XOdvVoiCwg0MGcaB2xywJxytGMjg1Q==
X-Received: by 2002:a17:90b:1091:b0:1d8:b371:4b29 with SMTP id
 gj17-20020a17090b109100b001d8b3714b29mr19733265pjb.234.1651979633103; 
 Sat, 07 May 2022 20:13:53 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 14-20020a62140e000000b0050dc76281besm5853912pfu.152.2022.05.07.20.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:13:52 -0700 (PDT)
Message-ID: <3859a271-6889-ad03-8726-a414570741fc@linaro.org>
Date: Sat, 7 May 2022 22:13:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 43/50] hppa: move hppa_pci_ignore_ops from pci.c to
 machine.c
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-44-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-44-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> The memory region only has one user which is for ensuring accesses to the ISA
> bus memory do not fault.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/hppa_sys.h |  1 -
>   hw/hppa/machine.c  | 23 +++++++++++++++++++++++
>   hw/hppa/pci.c      | 26 --------------------------
>   3 files changed, 23 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


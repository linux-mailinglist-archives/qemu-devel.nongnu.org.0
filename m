Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461D03499AE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 19:47:46 +0100 (CET)
Received: from localhost ([::1]:42784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPV1F-0000r1-9W
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 14:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPUx3-0007UJ-4m
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:43:25 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:46706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPUx0-0007vt-JZ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:43:24 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso2884582ott.13
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VZEGcvfuiMoCLzAP9F+FB8awUM8uBWNSyg+ua/dxfjw=;
 b=fbi+lwF5LxWTEnQObzgazYRptXq4C2V581mnVsDu5yvNykp27/Fdqwi3CinaYSggNR
 Rw9qkjOblNvHYYfwp63HtfoRIcid0H6BfHQd4ieGohtDb/TOMs9B1pXhJqJhrbgzHEM5
 75eRS2Lp2z4e8gdaHhRvHlMEby/jTkZUc6Nb2o41INCOkv3FTl5YwMwPeya5IpfAwVTk
 ZFOei0vBvKi6Amn20ndE+dhmx8VZCRhIXc/Wz/CNtSv0hbiGiV4WMbyNopCVYUIk7QnU
 AZoF9BzmKUHRjQzLxMi4OzSupWRIKGpaFC0QcRRVU1jHyKoGkSc3boHsdL7hlNN4fHWl
 Lceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VZEGcvfuiMoCLzAP9F+FB8awUM8uBWNSyg+ua/dxfjw=;
 b=VJdYO4Rk64QIF0ptRxFfSmcVnPc9Ht2bZvoiVclaMtXhUQ7hNKP6vRr47yxZpUsJ7F
 efzl1ZSu9XGJTxLGkFByfQlpiybtE1qtxwszd6Y6KKU2nxMa4PeU2aHbaGtrMmvhit9W
 4iQ7apPMvDdx44JBlFhILG6tF2mRL+SpQK0ESu27jd6YQHxTw8Qavlgi41hQMcVAHKjr
 mklagOlgiG7FLL3Oa50i9hcLBgMu6vISNcAUUIAwpxvKeVbXHZ+7xUnlCYYd1dS8HGrb
 BTyV68umf2ux+Ogd8biC0k3ZI9TeRPy3qDAndhpVg9R1od9iG/jXYmlSAAM/IF256cl6
 V/yA==
X-Gm-Message-State: AOAM533lkSwoNExLtq69eBMlsN4FpmWlNDkh7/cnb2O6vo80WoqF68nn
 SdOGvrWqwewBJwBeUZL6VYHnCw==
X-Google-Smtp-Source: ABdhPJzOfWw4V4htBA8aJArvyMCgtE7jeXXgl5Nxy3WvWToHD8KSI8ZHZ7fAMOOKT4fr4iLGNR9+pg==
X-Received: by 2002:a05:6830:91:: with SMTP id
 a17mr8981176oto.309.1616697801283; 
 Thu, 25 Mar 2021 11:43:21 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id d13sm1531212otk.74.2021.03.25.11.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 11:43:20 -0700 (PDT)
Subject: Re: [RFC v11 28/55] target/arm: refactor exception and cpu code
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-21-cfontana@suse.de>
 <47ea27b1-a11f-b10d-a084-0f7698691a6b@linaro.org>
 <519488da-3ce9-3fe9-d4a2-4bc76e2519b6@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d76557a-c3b8-ac56-74cf-dc795286e696@linaro.org>
Date: Thu, 25 Mar 2021 12:43:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <519488da-3ce9-3fe9-d4a2-4bc76e2519b6@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 5:59 AM, Claudio Fontana wrote:
>> Isn't tcg/tcg-* redundant?
> 
> I considered that, and at some point I had "cpu.c" for x86 too. After working on it for a while, I noticed how
> it got really confusing in practice to have files called just "cpu.c" when working on them, just too many files are called "cpu.c". It was confusing.
> 
> I also like the extra emphasis on the accel for this:
> 
> kvm/kvm.c
> kvm/kvm-cpu.c
> kvm/kvm-stub.c
> 
> tcg/tcg-cpu.c
> tcg/tcg-stub.c

But then you go and invent

cpu-sve.c
kvm/cpu-sve.c
tcg/cpu-sve.c

etc.  So, please make up your mind.


r~


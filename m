Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC1D658913
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 04:15:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAjMZ-0001YS-Ka; Wed, 28 Dec 2022 22:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pAjMX-0001YB-CA
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 22:13:45 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pAjMV-0008Rk-QR
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 22:13:45 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 u4-20020a17090a518400b00223f7eba2c4so17758340pjh.5
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 19:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DX/DGttRLdf5aEkF3P87bx3Ea86Sj8pXYBFhEPg9goQ=;
 b=OigHWAC4tDZ8d4U5eEunmd9dkdx9sCvRk/I1jNQeSJUWkkYhf6/skq02gieIMI13sk
 oE/phSsd+jo3LcMFe2vIrR86UZVIzc9U65GeUic46uR2NRe1hcwH8sxvsaswzRWtyqD1
 PM6WVKv48En+UZy+H/Azw0mS722/l8e/JVRf5V2PzXNRwh/Yor78eBs6+4CF/qZOmAs+
 tzpcYwIMuKCutpEogtSOP6ExfLBDYvXOXdR7GaA0BOiApuRnsEZPeehR1+y+wy6n00ur
 ymCpw5ueVMOt2/rsgq/YNENvTzkNe1ck9ZPovn+u8Ksj9rvhzoxs+Cr6qn1hyler1ThS
 3gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DX/DGttRLdf5aEkF3P87bx3Ea86Sj8pXYBFhEPg9goQ=;
 b=3bMCR7z2f45+7eGZV9qKcfr3cygp/VYh7cUHic6J58jeDICTP7EsNCzAO7wbM8Nl9l
 LCfMNuxzq9GcoQFe0nGv4H6xXFYTQyqw779B4WjTPVCkYDuLwuYxN6+FvumW/EKuflVY
 1PTs2626pS1w6gYGI3OKweIXn2InNq+NWFyu552l5JKc57s88WVZqOTuPWem4RvogMle
 Nzkh97XIeKDVPJOmo1s7GO0E+Fd3lQRPNCo3qzNS/LE/tquAKu5uHCf2CnQMRhP6Noak
 et8He5wnJ1UxtapZCIjASxpfPaXQmTEDMG+wZN6YNUS8gIbnJ7DgVcZ8US9ZXtI2rz93
 rZaw==
X-Gm-Message-State: AFqh2kr4ByMBTeHAF4mv5amDUdbfGVp45dLTpn+d1lJ6B/mpuooWTHR5
 NqmEyFeL8/9V/jgFnQSWRpmRvz5vnWjHtF+Q
X-Google-Smtp-Source: AMrXdXtMRWzrAXJsYayqbbcl43a10Aq+rrAkKPEqlDY26I6k1YD2q/4qPiT88AjRcp2zIzZdZxi+ag==
X-Received: by 2002:a17:902:7042:b0:189:6a5a:7289 with SMTP id
 h2-20020a170902704200b001896a5a7289mr36157374plt.52.1672283621884; 
 Wed, 28 Dec 2022 19:13:41 -0800 (PST)
Received: from [172.16.2.190] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 5-20020a630705000000b0047911890728sm9411781pgh.79.2022.12.28.19.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 19:13:41 -0800 (PST)
Message-ID: <27113bcc-c8f9-02cb-c218-bb11e8d5d794@linaro.org>
Date: Wed, 28 Dec 2022 19:13:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 01/43] target/loongarch: Add vector data type vec_t
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-2-gaosong@loongson.cn>
 <99e4fdf2-fe70-03c7-1168-f300ac7a1ead@linaro.org>
 <4852b017-1841-cf6f-fbc2-e1789a7f9496@loongson.cn>
 <d8e55869-8553-68b9-1b42-0075705dd03f@linaro.org>
 <2544efc0-5eaa-31d3-99a1-95155d0f7859@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2544efc0-5eaa-31d3-99a1-95155d0f7859@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 12/28/22 17:51, gaosong wrote:
>> A related question though: does the manual mention whether the fpu instructions only 
>> modify the lower 64 bits, or do the high 64-bits become zeroed, nanboxed, or unspecified?
>>
>>
> Only modify the lower 64bits,   the high 64-bits is unpecified.

These two options are mutually exclusive.  If upper 64 bits unmodified, then they *are* 
specified to be the previous contents.


r~


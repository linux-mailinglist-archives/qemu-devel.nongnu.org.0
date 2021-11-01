Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F08944205C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:56:24 +0100 (CET)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcTn-0007JO-3P
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbGn-0006bV-Se
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:38:54 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:42690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbGl-0004wG-Q8
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:38:53 -0400
Received: by mail-qt1-x82d.google.com with SMTP id f1so16528734qto.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vxtYdT7tuil2KNSsdqxVZtgL8WILDaWBTN/F2v/nUt8=;
 b=ujg/YHSU0uezidS0Y7M44EVHJXJks4QlAKjkl9XV9g6nq58hEBxi/Gk7xWIgkjPyob
 mC/WBG321cs+Q1A6hujFEgHv15r8WaAZr58UHVtYS0oH3VIGyLJw7ewccS14H2+SryvO
 y/aGMWWx1cLJ89WtjqSuFx+sorp8UQIhRn7v4QW/3iSw6bjCRQmY4ZYdJPsiy+S1BZwJ
 fS2FUfYUxPfgj0e5r03SB2TFn4dPg7zb7NLVO4I8DA0qafgz1fZD4dAJlNvBk/m5kaEj
 kLngEUN3DsN0iJekS50vaiOY/wg10at4hmE70MuFPwdapioInGPATNUnyUqSVlmX7n/P
 fTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vxtYdT7tuil2KNSsdqxVZtgL8WILDaWBTN/F2v/nUt8=;
 b=MsA9z3Zc5iYULFOcFH2SFxNo/IQhTArcH6WBiT10z5JGGB4KXdbKFYpa3MaCKeNIrv
 CfLDSS7ANbcVMEYq2+Pj5wV1iMXxeTyKn+RAMZURoea3Ukqzgyyu+0wxgkli+oLhRGtY
 S5jm7/SoYy5sh5egYnKHupxjemJ48e3KPigE6SL1atnT9sO0+36e/Nu0Fj+SHtVCKkRe
 Z91643GmqkXcNAs54luFCuijW8F451FxbzdMXYCxoFSLexB68YnqT6JoO5VjjX0X1TBM
 DLNaaIKro0OsfW7OBQuCglZs5BQqaaZdv/g1AxVgEumrJArNtSGAQ1BJ0f44gbJ7g6sz
 W9RQ==
X-Gm-Message-State: AOAM5305KYHGaewau7JbByIIjUto95s4atMVoU8qw7++aOE3kNNZZEtH
 uJwn//104Nw4ZyeL08mV/C4SSH/Zg0aTIA==
X-Google-Smtp-Source: ABdhPJzMntHkYHFRc4UWJ38uInLPcM9zUkC6q6uYJV1ie58Lm48rfHF3LwVYJUqZgPhhW4cgJg0hcg==
X-Received: by 2002:a05:622a:58e:: with SMTP id
 c14mr27898798qtb.225.1635788330756; 
 Mon, 01 Nov 2021 10:38:50 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id o190sm10202067qka.16.2021.11.01.10.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:38:50 -0700 (PDT)
Subject: Re: [PATCH v2 for-6.2] target/arm: Advertise MVE to gdb when present
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211101160814.5103-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc90c451-c38a-00ce-cc9a-64ce7e1f08c9@linaro.org>
Date: Mon, 1 Nov 2021 13:38:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101160814.5103-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 12:08 PM, Peter Maydell wrote:
> Cortex-M CPUs with MVE should advertise this fact to gdb, using the
> org.gnu.gdb.arm.m-profile-mve XML feature, which defines the VPR
> register.  Presence of this feature also tells gdb to create
> pseudo-registers Q0..Q7, so we do not need to tell gdb about them
> separately.
> 
> Note that unless you have a very recent GDB that includes this fix:
> http://patches-tcwg.linaro.org/patch/58133/  gdb will mis-print the
> individual fields of the VPR register as zero (but showing the whole
> thing as hex, eg with "print /x $vpr" will give the correct value).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
> Reposting this unchanged except to remove the 'RFC' tag, as
> the gdb patches have now gone upstream and the XML layout is
> therefore finalized.
> ---

Thanks, applied to target-arm.next.


r~


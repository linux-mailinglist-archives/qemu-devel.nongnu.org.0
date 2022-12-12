Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89564A2F7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:14:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jQj-0004Xk-QD; Mon, 12 Dec 2022 09:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4jQf-0004UW-Gy
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:05:13 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4jQd-0002R3-FJ
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:05:12 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h10so12195364wrx.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=QpfD64l+rEnpRGgYGmn31YTTewDcIj1X6K4Z0AmsmYw=;
 b=mEhO+EW9oi7XOpJthXA0O8wEx62yf4NTgKvigm3mdCX7EGWGvE15OyGhvysU0uHJiK
 TnVVtGB8K/lEighf2n5VRNHarUspgP9ub2vuiwqvpGR1pfCoFcnJrfDJNBOzzzovT395
 Lkgnb2DKmfsqyLTzwIng+CpDeL8+XigKyEYtAG2JrTieQ1I2pAY69nCz2trVeDyU2Yg/
 Ik+j148xzebQV6aGsK3HC3lJUbwd/qqxOusaHrh++w6LqM4Mg+muiaYPwg+OOdJNVwi9
 FeMe9ycnV9YFvsy1GqaJijp4wtHnUOSAwTSz3Jq8oG31yYbbgrBP8hLS8/3wA84E49+/
 +8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QpfD64l+rEnpRGgYGmn31YTTewDcIj1X6K4Z0AmsmYw=;
 b=VL/JCtLGqc/7lprTDvJo4xhEZoFFxmE4tym6UtX+iDLijh1Kw6H22w+Ox0tQCX0s58
 yStngfnZa23rHicN/52cj7XHrgwg/Wqwq8Aa0y8oyswtxsHufGrQi3Ex2rGJARuTg3eE
 /FB2vigM08X4mITEABPkurBlo7Ue34GV8o1bgssdH7Iaw2Il+6mUhvSBLWypx3Hg8Cjl
 /qAcr8NWsVKgxm8T6F841jvfVNfPn9h42JZoEHR1zpxfOchV+6caAiVwuA2Xf+OKehEi
 ijMWBEWmi1TWGrVnXIZaJGVOPa/9X2A+mTkM0OwVmMzektNdw//Q2bvR5chvBVFnwzie
 O3DQ==
X-Gm-Message-State: ANoB5pm/7MRamRg2ylR8Tz7RMq5zz+vya5F6LC6GbUqaDTCaSbeaOHUo
 QEWdkMhn93egcUI2ko6AksY=
X-Google-Smtp-Source: AA0mqf7f1DiSR+jjhLW5YLC8TL3MhmGk+NJ+4a6sKcKrNJMwcLi2y+5QZ9Zgxh0+dWui2nUCfZtJrw==
X-Received: by 2002:a5d:4344:0:b0:232:be5d:48c5 with SMTP id
 u4-20020a5d4344000000b00232be5d48c5mr9542325wrr.57.1670853909791; 
 Mon, 12 Dec 2022 06:05:09 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 m18-20020adff392000000b00242109cf587sm8938758wro.28.2022.12.12.06.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:05:09 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ec04702e-8475-e43d-75a4-618a942448b6@xen.org>
Date: Mon, 12 Dec 2022 14:05:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 09/22] pc_piix: allow xenfv machine with XEN_EMULATE
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-10-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-10-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/12/2022 09:55, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This allows -machine xenfv to work with Xen emulated guests.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/pc_piix.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>



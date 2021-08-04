Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088C73E0AE2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 01:34:52 +0200 (CEST)
Received: from localhost ([::1]:39392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBQPS-0004qv-J2
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 19:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBQOE-0004Cf-Mm
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 19:33:34 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBQOD-0001df-5G
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 19:33:34 -0400
Received: by mail-pj1-x102e.google.com with SMTP id a8so5326957pjk.4
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 16:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=BRxWHr5CqCRC5X23KG7NblIA0rcaLBHcAf7e80hjSLE=;
 b=fk4IOG0um2El1fCzTESHaR62wbmpaWdI9jTds8T6TFQgf3KPiIc9FZ/bmG2m6aIOYW
 skYMou82d1lYrlJc2X/FIZBtUtFaTU7RlrudoKhp3IuHKPumbcQg/n3gZYBRDv1qplDJ
 jNy6+lQCsrf+KsgFFGvttaU98CLD0S1zCgfDtHTI12Pxgq3eqAGjKeFoODupKgyX0AFB
 6syPClSgQZ4Ov6EjuvbJrjVGiTwjn/h/du4cnF1PuganBmntuxG28dMS1em6wVCfB/Oa
 n+NUpZc0tD0FTES2Zb+jHOyX7dJG7ICo/1FkBj0XHWKAslGPJcMgYb8RWXtOBEMB6Udi
 YjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BRxWHr5CqCRC5X23KG7NblIA0rcaLBHcAf7e80hjSLE=;
 b=P+RHVDnoyqUqKGvVHJuDrmhjVLguwlDAzG919zlzpAl+9mh9HogtFewS/7qlQ3ZkC+
 sP5XUyDSB+aIrgiCC6COAhjQoGfSPLpX6YatoZdl0Wnz6rMjVcrwgZG3jz8eY8bjDmR0
 KfaOxMis2WXc4dyT9DbnVB0GGcoMM1ft6G5d1bD+WWPXJYj2iChBc+/iRW1GWVR5f5rn
 kUI9iiYnSH5Qmy6kUAWJWl6BpeGL67y5Dkmzoow9UOJ/x3VCH92iDNCxxH4BydP0bJto
 FiUyEdQp4tX0RK/90vWs3AYfHJD4Luvvn8LehsE+8a/wSb2APWmET6en9IJZ1KE9ZCsU
 XUYg==
X-Gm-Message-State: AOAM53083E1LPLfWfpBFS/bhb6id7sSni+L1Pj+E+pswNb+ZnBWDsmOP
 PHj1PysxBbhDNY5leDl7PwP9hrdumbbUPA==
X-Google-Smtp-Source: ABdhPJxfyMU4lpqWs/E34E/G2jhE6QTO6OhpZIqB/SGy4Y3DyvINHUxK1Xc7y5+ZJ1YRwdvvqlTtxg==
X-Received: by 2002:a17:90a:ce17:: with SMTP id
 f23mr11902985pju.236.1628120010660; 
 Wed, 04 Aug 2021 16:33:30 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id o9sm4478473pfh.217.2021.08.04.16.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 16:33:30 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/hppa: Clean up DisasCond
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708205807.827147-1-richard.henderson@linaro.org>
 <20210708205807.827147-3-richard.henderson@linaro.org>
 <521679fb-9295-284d-ef67-f8f459c178c9@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b82aa5a-d16c-2fdb-0c4b-766c0b1c8353@linaro.org>
Date: Wed, 4 Aug 2021 13:33:27 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <521679fb-9295-284d-ef67-f8f459c178c9@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/21 11:01 AM, Philippe Mathieu-Daudé wrote:
> On 7/8/21 10:58 PM, Richard Henderson wrote:
>> The a0_is_n flag is redundant with comparing a0 to cpu_psw_n.
> 
> Preferably split as 2 patches:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Already in mainline for 3 weeks.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5FA486E5B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 01:12:48 +0100 (CET)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5csA-0003tA-Oj
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 19:12:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5cqu-0002lu-W5
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:11:29 -0500
Received: from [2607:f8b0:4864:20::629] (port=33330
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5cqq-00039g-Sk
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:11:28 -0500
Received: by mail-pl1-x629.google.com with SMTP id i6so3661448pla.0
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MMhQRMURxQ6dRd8cznX2pon+Jf9ANoYtJL1KrVsghWM=;
 b=PRJpRKM7U8WrStgJlZAAVb1KbkmY3fu7hxkFbu6CPAyuqZWNu2/HP2s/seVA7KUfAB
 XAA9SAq10916DIqciutXo9a/1jqnAp3/1KjTdcjsnvokITXAVB/VXuMBaVF/2JW8G+OX
 4nHNtgw+OHVerGJTdWtiHssBtycWAN8tWWZGHJZfU+xnBnIVrr6hlVxxR0LMZjVpp0af
 21U70pYn/aDQWQQ5Sr1kcPcDlciOTSv1lxeUjmYCVr0/cd/KkrT8nXqQ2JAxMZI5S5Ka
 AanGH5+KLOtnTZnYMSmqEOpe8fz050IrE3C8qIx1H7TlCmmCv3gbke7vBlz8bGgwgUiz
 Ty7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MMhQRMURxQ6dRd8cznX2pon+Jf9ANoYtJL1KrVsghWM=;
 b=V61D63TtjhDjHsyBf+BRV1YkAU1JUp8b4BZ3fpyS1kt+P+6MZXQI+aGiogpAsaVuvK
 vZOPouDA+HKebb7lAtMd3DnqIidphKkJ1j7VY3aFIfid0IIMnGa6opID2omp58te3jGM
 UqJvcdzTKgutge6lnj63WJBzmmvZgz1VOG67C+EzNF5LLf3C54aMZcXVAN49Ozn+og84
 6VKgHXOtezsHjtHJgq0x/C4PqK4nLw6M75iI2Jd4Ic1778tV4r+lsNBZsE1puQN5a4cs
 q79CsWJjgEjTk1azGp3/NNqAXZLCcEKC8vWxLlJREDtufRABI7ok4xPQdEL7w96lLmKn
 ufPg==
X-Gm-Message-State: AOAM532GUvA3mvejlQBxpz60WRnsvwZC4bE71v+FLT8mfULxAmdd2bTM
 dtuCZZFHSRFIsTBfXbJ0pZ1ysg==
X-Google-Smtp-Source: ABdhPJxnyKl658y1jrJNztPFIpELRTOQdiIT7Qbk7s8ug4GsnZ7KR4jci78sXqqC8TReySaAF6bVsw==
X-Received: by 2002:a17:902:cecb:b0:149:3fe9:12f3 with SMTP id
 d11-20020a170902cecb00b001493fe912f3mr61095982plg.24.1641514266247; 
 Thu, 06 Jan 2022 16:11:06 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s35sm3474411pfw.193.2022.01.06.16.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:11:05 -0800 (PST)
Subject: Re: [PATCH v1 25/34] linux-user/elfload: add extra logging for hole
 finding
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-26-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94486079-71cc-e1de-ae77-c612d5e90033@linaro.org>
Date: Thu, 6 Jan 2022 16:11:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105135009.1584676-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Laurent Vivier <laurent@vivier.eu>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 5:50 AM, Alex Bennée wrote:
> The various approaches to finding memory holes are quite complicated
> to follow especially at a distance. Improve the logging so we can see
> exactly what method found the space for the guest memory.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   linux-user/elfload.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


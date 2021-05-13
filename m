Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68719380104
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 01:56:02 +0200 (CEST)
Received: from localhost ([::1]:35618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhLBR-0002r1-9D
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 19:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhLAV-0001qu-3g
 for qemu-devel@nongnu.org; Thu, 13 May 2021 19:55:03 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:35414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhLAT-0005KG-58
 for qemu-devel@nongnu.org; Thu, 13 May 2021 19:55:02 -0400
Received: by mail-qt1-x830.google.com with SMTP id k19so1712927qta.2
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 16:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/qMfehtvo3599yn8a8bYsGA9AaRXnjV6uoGhkSAr1MY=;
 b=jcLeCV1DpeGZhRqJkro1FbNwJ4enR5xcmVTmFr1UHBDblRGU/ZaGGSzvHZ38QyJis6
 COIjTxxIADXYTEeQ+YCYjLMOEOPCfODd+PQYJkMCvmTIDUDPzqhZsjXWCe9/RtT7RzRY
 Yn52/MzVCPUOwrvsNKZvvlmefxTAuG23/Oquxe0mqXCWps5vTi02wGP+teabD1trLjYC
 7NhxkHgFWaTsusUaSkBrekP7KIyAX6j61KknCmrbtSxTV69a0HkRYP10ulystkYuJKXf
 FOYDodbomagiIdjgYRBvgb5j7TK+sBdl75tZ/yM5iRcQD+rWROM/BLtOuYUtYAQfgpoT
 1z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/qMfehtvo3599yn8a8bYsGA9AaRXnjV6uoGhkSAr1MY=;
 b=AGl4xzbZltVP8PdIvLZmo1hY/i39HJFuGTrt4Kj6HWdFEClWgg+xocr6Khxl7YwgFw
 L49T2CLA0OOIhwSD8LAVs44H3k0w0lkT+8GYKhwJGRTbBoiWqEXhC4OviHOcbu84gWns
 3whQTC4O8qRwNi0HonMx7si8hAeCN7w0DgvVijImrIItJBQMBCoLLwBz1rL4Kx/CJrDz
 rJJdNgcAzFcjx1pvkpUwebEf/SHIHaEmS/z+8S3YJ/LmkuNWJx0hY2PMJf45UfWPtfDm
 xQf2X2A6M3ZQdLQESM3B1k2jfRfcUXY4mWFfypcXEts106RKB6g6Tk+HdwYococijSpF
 Go3A==
X-Gm-Message-State: AOAM530hbVC8oJ3fF0JflUBsi0A9py9Ci0W/Vn6SZF6oKVS6lVPXdrf0
 HEJylpORM02jbBa/xMlKSP6AUg==
X-Google-Smtp-Source: ABdhPJwWT49ZaIXq7JBgpCPqm6euAEzL79+9ONQ4a5TI/CGE1LRmyqDR1aEbRA+WuBJRS6eSgqC3+A==
X-Received: by 2002:ac8:425a:: with SMTP id r26mr17371069qtm.335.1620950100071; 
 Thu, 13 May 2021 16:55:00 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id d11sm3408184qkk.110.2021.05.13.16.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 16:54:59 -0700 (PDT)
Subject: Re: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <878s4jg3hf.fsf@linaro.org> <d58df6e7-381d-9dfe-679c-60d5cbf61e73@linaro.org>
 <87o8delokc.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1611468-8aa7-9a0c-09e0-2cb1de76d00f@linaro.org>
Date: Thu, 13 May 2021 18:54:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87o8delokc.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 8:33 AM, Alex Bennée wrote:
>> Now add and mul columns are going down when the only change is to
>> muladd?  Is this just more noise?
> 
> Running again more times I think it is a real effect:

I don't believe it.  If source code for a given function is not changing then 
the generated code should not change (much, especially with FLATTEN), and thus 
the runtime should not change (much).

Are you absolutely sure that you're measuring what you think you are measuring?

Is your compiler mis-behaving somehow and not inlining stuff?


r~


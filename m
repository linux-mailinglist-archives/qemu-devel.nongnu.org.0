Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6349A44D86C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:37:06 +0100 (CET)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBCL-00070L-Gf
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:37:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAw3-0000HE-Gj
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:20:15 -0500
Received: from [2a00:1450:4864:20::435] (port=40873
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAw2-0007GK-0p
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:20:15 -0500
Received: by mail-wr1-x435.google.com with SMTP id r8so10042396wra.7
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2wvM7CeXeb/PhI4rNFjtqVANMHU9c8ONHneZAMpEmtQ=;
 b=oZH0yA/SfmXxNsSCglx9iKXRMUlFu+DD0OQJ1OwMlyQsM34+KUWH7W4RtpIcbPOT98
 vYuL1J+2Yl9R7tggp6HWz+Dk8hkGn1rXjUECH7HiwoblmVo+4qPQtQlg/cRnzLcaSNrU
 7c5RsBd0TE2lKSqjz2sYm1umfa+AzUPtji8yjalxa/lQ6+OjFLrCWYheBsJO6+249gjN
 iNQDQnW0O+7+rOmcPNh/J43Kv7ZYXMS6L8gGKmyBcV0EJmAn2m8GWMJdxWATUVyZn/5D
 kBrCWJKTLSiDuB9fzeHAS2b6nXwBW0LmbTnlZQpJDvNGsU+5IRGfwsGpjOmZY3knPFR9
 a89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2wvM7CeXeb/PhI4rNFjtqVANMHU9c8ONHneZAMpEmtQ=;
 b=awqmosF9PWA5+URr3INK7FEP47PX48HGFBvBN99y0WTEtYR71stGaj7JJLQU6KDy0P
 2XBpLijmJMZ/D8t7emiY8lewod/8ftd2XOJi37qP0IAkiDR1DqAIyh6uRuS93Mu+GI6z
 8MrMd3lh+9EBgJeQqmp8QJle3H4WzSKw2oi/+mB1i8mejjGk25a7Zu8L0jlhh8Dq6rvB
 WAkKIwxzyo/AW/zJ8OrJ4yI8s3f98hkv2+dYrezzpNvSLD5Dt1UEKuADmXpcmCcy/OBN
 rTDHXYJpVO0AGCdPnQ1byGRFlfzhPppY6iadIHbX+Anxb8h7QGvmsjYLfP6IktvXyQfi
 m50A==
X-Gm-Message-State: AOAM530ZUYgh08t6Nl1SuvU1pCN1Uxn/oRqqer9TJAl6h8WS5LRXa6ye
 I6zbcoaqpQDpi0N9F36H4u/fOQ==
X-Google-Smtp-Source: ABdhPJxpbT+4n2rDjy4awOxAzlcGtmeV3d6OgrZ35GaD7QY9vdyquha3VCrOmk1x9OioNX8sO3YE4Q==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr9089572wru.316.1636640412292; 
 Thu, 11 Nov 2021 06:20:12 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id z11sm3075045wrt.58.2021.11.11.06.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 06:20:11 -0800 (PST)
Subject: Re: [PATCH-for-6.2 v3 5/6] tests/unit/test-smp-parse: Constify some
 pointer/struct
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce2f3362-d142-bfe2-4328-f17bb0b462dd@linaro.org>
Date: Thu, 11 Nov 2021 15:20:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 11:03 AM, Philippe Mathieu-Daudé wrote:
> Declare structures const when we don't need to modify
> them at runtime.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


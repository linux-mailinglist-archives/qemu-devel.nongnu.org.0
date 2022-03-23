Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA904E5737
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:14:10 +0100 (CET)
Received: from localhost ([::1]:41490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4Yj-0004RH-CT
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:14:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX4Xf-0003kn-W4
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:13:04 -0400
Received: from [2607:f8b0:4864:20::1033] (port=40726
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX4Xd-00015S-Cs
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:13:03 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so7013692pjb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ldSXnFcVfVQaoM7nn43elUT/DMMs/WoQBDFZKx9l79A=;
 b=T1F7BMHq7jxHl5wl/KXNJ9dSqjoj7Z6pJx4MMBCcwXjBvvx+pSfT5dUl0WaPrC3QQx
 MHflv4pwSPxcG+9CqUCnd5EPILbsOR6e/EMlEn3Gw+ViKfOxqdYedxLiy83g/LXqbdUS
 Kv9VTdQImpKtX1J7ggzA4VHTLyMo0FZfZJ5kS+FDqg2fvw/ORAD9vlAsbmfq4SNbFTGk
 1ujAnWBN9/EW7cs6taZQ+xHteIlFkZMS6ouRWeSrBprIApoOBDI/gFzVPo5ODRaC+J4a
 BiTr9WE5LCXb5XWdP0GFpaG3CJzBZqrRcIKmDt1TCf/ZE1OeYxlUOyZ7W1LqvfuKrZ8p
 Rbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ldSXnFcVfVQaoM7nn43elUT/DMMs/WoQBDFZKx9l79A=;
 b=qqJFozzf8aESajgmrLdriWYmRXEUKXXtA00vv7azGUZhhtcFiU/HI1dxrE1BShVY3Y
 kxLuU5qkpBeL8vZ7PWaUIrBBhYHoKiLnsL7D6Bzg9tQOd1AhQs3nrvtFyXgsMQffK1nL
 /Liy5XE9K/NK0ABoNiXoYCrX7dPNUjc5XkrvgBt01rH9a5HQjxNnqBmvXKq+OWcLxfUW
 tmSE+B8hcALbMS1S62psfmWBJWaYolwvHJpBdCq9is4rqXFA6lobb2vBFpEP8hhvuSHR
 ah/zkONAVGC63pkfI8z1r/NWtlxh80fvP79n8yvVbKlvIdqGhmaT3kRN3dx/VRjFgzOz
 iXjw==
X-Gm-Message-State: AOAM531Mggx2sHNn0gHpHCaXV+VBSuoaRAD8n2p6/Jq0kqO4JQBErdJF
 GDt6k1CJM5mMrw5uqv/iDz9EyA==
X-Google-Smtp-Source: ABdhPJx9zIy+zf1WU4W68QbEo2skuxwY5aDFbP0E5W0VAVjSHnNY9cGvlxxzi88loi9kEdIVHa2Vmg==
X-Received: by 2002:a17:90b:1a89:b0:1c6:4398:673 with SMTP id
 ng9-20020a17090b1a8900b001c643980673mr12932642pjb.40.1648055578754; 
 Wed, 23 Mar 2022 10:12:58 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a056a00188700b004fae6f0d3e5sm310097pfh.175.2022.03.23.10.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:12:58 -0700 (PDT)
Message-ID: <194c1ddf-041d-802a-f1e9-e31834f218b1@linaro.org>
Date: Wed, 23 Mar 2022 10:12:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/32] Replace TARGET_WORDS_BIGENDIAN
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-8-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Convert the TARGET_WORDS_BIGENDIAN macro, similarly to what was done
> with HOST_BIG_ENDIAN. The new TARGET_BIG_ENDIAN macro is either 0 or 1,
> and thus should always be defined to prevent misuse.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> Suggested-by: Halil Pasic<pasic@linux.ibm.com>
> ---

Ah, poison in here, so perhaps I had asked for it wrt target not host.
But still HOST_WORDS_BIGENDIAN needs poisoning.

Anyway, for this one,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


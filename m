Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F0417446F
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Feb 2020 03:10:11 +0100 (CET)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7rZy-0008LP-2r
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 21:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7rZ9-0007wa-GK
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 21:09:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7rZ8-0005Gd-Ej
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 21:09:19 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:41829)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7rZ8-0005E9-84
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 21:09:18 -0500
Received: by mail-pl1-x643.google.com with SMTP id t14so1929690plr.8
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 18:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CeWAF+gLGmq+gc8yygVRlhbXN52mRE9eI6r7G7sG2vU=;
 b=AcBK1hHPwveVf6YQ9+0gsxDk3M0SQu7U4X4t7SyCicMwJgjAdkHG3iQ6UJjythaa1g
 fZFgH/E8batgbdba0OisgkplGQD59QJcRJXNdnjsnazkwWjvvG2FNo8g/6Z1q8XnL+8L
 DVcsGxR9hXHnd7S09J+6wgIKLZN8t5gNbloEqlyKBEXHoYqRAY0apO0SmcSTYnqtsHEj
 jdaCG8JecpNj8SI0st21i8bBeeTQbSQABgH4qHG7jYleXc9aK5C2IOT3i0xLNYaM48wq
 3eNWFluf7H9tu2g8ngdEYk6X52Lb5rb29YUhWZEqQ+j+1P7XuFkyz9aBMg/8XiXRUWwl
 eYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CeWAF+gLGmq+gc8yygVRlhbXN52mRE9eI6r7G7sG2vU=;
 b=m0QNO8hXqhQdOG6Fn5lt+sfbCP2oDOHr8u+wqFjBlbcXY/LBBTxMOteG5kpsgOMAPa
 TKOm3KVqObuL22QL3rADdfyNhlnLSYQl1T2o/b+TXxbLhp1jX2fPAki8VcQZMf4/2NFC
 HrnmdooVmKXttx/pvMVR73fqC4dLg3P2Tc+r7sXc+InII1NzbFanfuToQCM3tRJiDraX
 NAUKkbS6R3FN+fLVPNwYDqrXKg9WXi1lTFs3wDx47xc3KQMIBZIV+xzKXWuZPgJ+9LUn
 VIN1yLM/3xGIGXOypSmRp9ub2PBWipjhBK4Qtb81ZvOe8FK01PQWvqeCuJ94EQLuRja3
 Pbsg==
X-Gm-Message-State: APjAAAVLjCY5OrlvDa5YPDFl0tKcknf+dgB4eh2llh5o1TS+GrLPHqVs
 ZMeLZE2KECCF07Eszi2nCkLxhw==
X-Google-Smtp-Source: APXvYqxewUeRIVyVgu/+I+1Zaf+h8jjJlQ+005A4a6CydhCK3tuc0ozITpi+XAyn2iX0LJNCwS45hg==
X-Received: by 2002:a17:902:124:: with SMTP id
 33mr6990276plb.128.1582942156619; 
 Fri, 28 Feb 2020 18:09:16 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 u1sm12468046pfn.133.2020.02.28.18.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 18:09:15 -0800 (PST)
Subject: Re: [PATCH v3 2/2] util: add util function buffer_zero_avx512()
To: Robert Hoo <robert.hu@linux.intel.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, laurent@vivier.eu, philmd@redhat.com,
 berrange@redhat.com
References: <1582856696-45663-1-git-send-email-robert.hu@linux.intel.com>
 <1582856696-45663-3-git-send-email-robert.hu@linux.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8a87ddf-7d51-c9e4-6122-a9e3c1b84c29@linaro.org>
Date: Fri, 28 Feb 2020 18:09:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582856696-45663-3-git-send-email-robert.hu@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: robert.hu@intel.com, chao.p.peng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/20 6:24 PM, Robert Hoo wrote:
>              if ((bv & 6) == 6 && (b & bit_AVX2)) {
>                  cache |= CACHE_AVX2;
>              }
> +            if ((bv & 6) == 6 && (b & bit_AVX512F)) {
> +                cache |= CACHE_AVX512F;
> +            }

Oh, one more thing I missed -- we have to ensure that the 512-bit registers are
enabled.  I believe the minimum is bits 6 and 7 enabled (ZMM_Hi256, Hi16_ZMM),
since we don't know that the compiler won't allocate registers from zmm16-31.

So: (bv & 0xc6) == 0xc6.

You'd be right that some comments would be helpful on these lines.  :-P

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


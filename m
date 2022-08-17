Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF9596FB7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 15:27:45 +0200 (CEST)
Received: from localhost ([::1]:39894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJ5E-0004Dm-Du
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 09:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOJ3h-0002NL-B5
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:26:09 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:37779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOJ3f-0006WU-Qv
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:26:09 -0400
Received: by mail-oi1-x22a.google.com with SMTP id m6so3481356oib.4
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=+/R3nSAE0IBIrw5Ga+Z1S0Ec9gKyXDRLCS70WOUt96c=;
 b=QhsV0EwTTKcke/xfpUvd1h6qPQZDmCbZ/6f8sIbpPczapmHYqRYjh4Vpxdks41hZKA
 nkT25ks1Z/Tcc1GFPJs28XqXQh+22QzPvI5Lt8h0brF6kPC1v/VOPzWXf9NkpmV8PCbC
 AneUsT/qOCT39odIGWatzOBLC3XzNO9ZS9pnrSYK66K+YrpzpTiFkCpq39HHyHpRBQES
 EDnhD/oinhtjtsrFd7cY+ybyQvXf1zDdzPh8BiZmQQIT/75JWPbsf7R8xfYaGpDRKhZ2
 1aMx3jPaUotJE+UL7cyWBztgwk6KcIuaDvQyIFkbiR7C38SbxCwLDqtk9IN5Itmv4Lx7
 86AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+/R3nSAE0IBIrw5Ga+Z1S0Ec9gKyXDRLCS70WOUt96c=;
 b=gDcDjahR0sqxJDb+BIttTBFT1UsMUyB1mZlxQgBF4H4Ujt8ncNxozJLxGbd5/oJPMq
 gzHpxdrIyR4MlY2BjWhHe+WNm84ezbJrjJBcb0PYXnfE3eob6yFVjpXLbm7T3ebFC3zI
 oqTL70IvWEt4CcBTDSaqHijg2O6Bxxr1ZQpMxsRKotDx316EQiEyQ6xN1IZ7ltJiyKlu
 DBBQR8g+OWNT2wpL4Lvl/8T1JeCCCcJoJpuFgCdqh4rMchOzLIfHYwJbi21SsZR9WlPn
 xDaRi8KtFME2slbfMmkmDyRYLk0TLYQVQYyndwCpsux+sRgAKQ+n7R0MX3Rr9vXhOKCx
 cSXA==
X-Gm-Message-State: ACgBeo3mGmrMsfkYqkfCEUVZiRv9nXXDRdEp2/81mBdd8mZ1OHDg7LFe
 eeIrb2Hbbr7tQ97gUPBX1KL3zQ==
X-Google-Smtp-Source: AA6agR6050H7gbSBPIfGblmEnytRGC2DNWX7SDEWzv8nQJMvTYOE/GGETWznPTev1lrrc6plDP1MKg==
X-Received: by 2002:a05:6808:21a6:b0:344:beb5:1fb1 with SMTP id
 be38-20020a05680821a600b00344beb51fb1mr1507305oib.175.1660742766396; 
 Wed, 17 Aug 2022 06:26:06 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f2:9412:75e8:df77:dd33:d368?
 ([2605:ef80:80f2:9412:75e8:df77:dd33:d368])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a9d70d5000000b00618fa37308csm3329273otj.35.2022.08.17.06.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 06:26:05 -0700 (PDT)
Message-ID: <ac55b78a-602a-e875-5bf0-c5040d7de2a1@linaro.org>
Date: Wed, 17 Aug 2022 08:26:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 3/4] target/loongarch: rename the TCG CPU "la464"
 to "qemu64-v1.00"
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, gaosong <gaosong@loongson.cn>,
 chen huacai <zltjiangshi@gmail.com>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 maobibo <maobibo@loongson.cn>
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-4-i.qemu@xen0n.name>
 <1c4ae4dd-7365-1d5b-0608-31ba04ee96e0@linaro.org>
 <CABDp7VrhdgGG5WP7Bm5G2KmUytZ17GTDA3kYO6RPMcB5FyUo9Q@mail.gmail.com>
 <2382c1cd-6318-34a2-35e8-addc751f6aeb@loongson.cn>
 <a5fde3dc-0fd4-8739-82b1-d94781637169@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a5fde3dc-0fd4-8739-82b1-d94781637169@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/17/22 04:10, WANG Xuerui wrote:
>  From my own experiences, different use cases care about different aspects of the CPU, and 
> that IMO is an argument in favor of providing both (high-fidelity models named after 
> actual product model names, and virtual models named after ISA levels). But before we have 
> truly high-fidelity models I think we should start with the virtual ones first. And don't 
> pretend the currently implemented model is LA464 -- the kernel change I've linked to [1] 
> implies the opposite.

No, it simply pointed to a bug in qemu that could have been fixed.

The trouble with inventing virtual models is that no one knows what they mean.  Targeting 
real hardware is better, because we have a documented standard.


r~


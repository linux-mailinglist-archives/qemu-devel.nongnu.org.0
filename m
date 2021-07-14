Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8F53C8972
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:14:04 +0200 (CEST)
Received: from localhost ([::1]:34698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iSR-000617-VY
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3iHn-0003YJ-S8
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:03:03 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3iHm-0007bU-51
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:03:03 -0400
Received: by mail-pg1-x529.google.com with SMTP id u14so3089835pga.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EXF+F2qGwUCgDPVZP0ILsPlmMymyh4GGhgUCzyj0jK8=;
 b=oolBmRi4r2LpZ4AzlgAJzqyaQbWlg9xcu4f7tWJGJcr5cc+aP+Is4RMEuoc/mL9YE/
 BHEohONFcp4516ncuEa2UEvJrFeYqQi4YkJcR6uxxMcCKGpE1xIEDNEn0JUZ9O0X/v9T
 R5xUWl/70VUuumi+c1jnYZN1gmuuv3HKYzAdp65hSTcibEtlgE3jtqqMsDyDw8bwaTv7
 MDWLXt6B7QnGp+qpuX6DrCYwt4RcIe0IcagNDm55j4ZzidXWlzJk7Qgfk1IRByPjSqJ2
 jF9BzRBFagdiTk8sr4v2y4Oiw7KyTySdcljwLedeoB2RGuVZ32Qu6roD2bq5azxsfi/O
 zWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EXF+F2qGwUCgDPVZP0ILsPlmMymyh4GGhgUCzyj0jK8=;
 b=IZRDZNng8d+i9NWydKaWDwXtV4WDR/jRAawt0SBYYHYGrLmSBpGIqlkCy71vDX6GBy
 4K99RDu2Qr4Ft1Nk7mmdcf7odpgZXLbn3nbiaBgJ7exoUL4ThsL+WkbBTLnjER+hu7RU
 XUT6qjLdf1k1pY2G8F35OpcJce0FdT8bs4xlaVoNnOUSC+0jEwiKBUXpDmsNIwok7hDQ
 BgFlxNDKIcTaLVS62UoOwqnidohKyodankeDSyd+b9v6Wq5BlpwzFFz350AGU2TvHn1b
 DP1GUBqwOeiiLre6Ta/MtWlif1LlSlARQ4ptWUsPcpwv90PzTWcmqLUVYdD8QCINugfe
 zBBw==
X-Gm-Message-State: AOAM531trJ1E52jEHZFsGV4vvnv3FFwvCNf92Fc2JA3sqB2RmPMBYK6o
 8yNxf8r9z/opCytRJlvfMy4riV8LoeJAEA==
X-Google-Smtp-Source: ABdhPJwXTCY+OKlvKzPaeKv/OtFlbg+fDGwLu79xqSu/SDXr0sKqIjyyx0QEEzg7c8oKe/48wvuSXg==
X-Received: by 2002:a62:d108:0:b029:304:33e5:4dde with SMTP id
 z8-20020a62d1080000b029030433e54ddemr11291109pfg.74.1626282180157; 
 Wed, 14 Jul 2021 10:03:00 -0700 (PDT)
Received: from [192.168.101.210] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id c2sm3457942pgh.82.2021.07.14.10.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 10:02:59 -0700 (PDT)
Subject: Re: [PATCH for-6.2 01/34] target/arm: Note that we handle VMOVL as a
 special case of VSHLL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48388536-f22f-7ab4-70de-f5eaf84a5bf2@linaro.org>
Date: Wed, 14 Jul 2021 10:02:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:36 AM, Peter Maydell wrote:
> Although the architecture doesn't define it as an alias, VMOVL
> (vector move long) is encoded as a VSHLL with a zero shift.
> Add a comment in the decode file noting that we handle VMOVL
> as part of VSHLL.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve.decode | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


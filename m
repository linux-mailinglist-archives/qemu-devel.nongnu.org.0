Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370AB54B6DB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 18:54:30 +0200 (CEST)
Received: from localhost ([::1]:35494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19oD-0006hg-4T
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 12:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o19e8-00081B-Bp
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:44:05 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o19e6-0001ta-UD
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:44:04 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id el14so6853240qvb.7
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d14mlMahU2rZJWPFskV/FciDVkQ2C0WYYTCk8YbiMzY=;
 b=xMtNk3QgJzjilTL6HW9GXKisX4dMpM/fvbDITh4RkIZH40Vwx7+u0jguhLKkro6Y3S
 Zzc8bZSm+RJ/XoaKYXvxyQO45rgL3aJ10gnlPUBZUpYvom+n7xomOwGsrwOFa0QzYbzv
 F6JI3JajbfEwbstlb5yV/fVQTPmaFAnGtvDJatbyuUE1+b9eD4DeborHAtnwmMIOzKkH
 oSju7n6m7gyjOeyU8Gd1xzI5q70+D+754zkBIzYCRveV7croE7lkyO0WuDTxB1W8rC3H
 6mz2NNUsFXbt9Q+SkRBdP7W7+GOpZpsF/r+lvejeMFwbahSlEcY6psTLdYWNmUlsUk/L
 o8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d14mlMahU2rZJWPFskV/FciDVkQ2C0WYYTCk8YbiMzY=;
 b=eCW2k6dSCvY+shOZOKNlGiKA5VllnWSmmi33KbJJzPhGd7iO9qU8FnTy1+AyVRb53P
 yAgbxwsoEP8obvkjgC0tMR/c756+qnN9gXm//w5nG0APMT11ySDp4DLPJOcgWGZHt4Dj
 1TlCVWeLiTbB/5esE6rLrLcXcHIgSiTFeL50A6WjUdvN1Kdxic5DjR8+giJvwL9R5fTf
 gNR31NfkZc8tn7jqJqkKyUgPYBdW4h0VWR/yW7ntqPy0eGLDuRcW8HDdueFq4QOUxZZi
 OF+o/9uzTzLi5icYTUKTC9ODNTLNArz5j6QTsPHyAaXuubACp4yviM8n//5nJEkC9xfI
 iZFA==
X-Gm-Message-State: AJIora/jwQ8XaNCXGgZKnPkQJUmG+8A69bzZOiatLcgZKSGzL7CVwc0s
 WqZbQ0M/KezYSzaby4GKzUHq9g==
X-Google-Smtp-Source: AGRyM1tZyTgSDADa5RrYJTKywWXAMdKVXgKh5w1hvXSQaDmcrsCEiXHhUv10u5xNSEthbVHgcgWHww==
X-Received: by 2002:ad4:5d69:0:b0:466:1be0:88db with SMTP id
 fn9-20020ad45d69000000b004661be088dbmr4209522qvb.41.1655225041688; 
 Tue, 14 Jun 2022 09:44:01 -0700 (PDT)
Received: from ?IPV6:2607:fb90:806a:4827:adb5:6bfe:ffa:b215?
 ([2607:fb90:806a:4827:adb5:6bfe:ffa:b215])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a05620a410500b006a787380a5csm6576207qko.67.2022.06.14.09.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:44:01 -0700 (PDT)
Message-ID: <c4e96edd-c83a-6b66-7acf-7d67492847d0@linaro.org>
Date: Tue, 14 Jun 2022 09:43:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v16 9/9] target/loongarch: Update README
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220614090536.1103616-1-gaosong@loongson.cn>
 <20220614090536.1103616-10-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220614090536.1103616-10-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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

On 6/14/22 02:05, Song Gao wrote:
> Add linux-user emulation introduction
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/README | 39 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 37 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


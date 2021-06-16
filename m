Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9B3AA414
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:13:06 +0200 (CEST)
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltayH-0001az-8u
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltauV-0005bC-GP
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:09:11 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltauT-0004y0-3H
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:09:11 -0400
Received: by mail-pf1-x434.google.com with SMTP id x73so2958724pfc.8
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lnmvf5DIME30DRHpOT2jqtHezB0zMpmGN1Y+BQNmOZY=;
 b=BcINbtVRW8noHCT+EgDNpUdEc0N6v7SQL2GgIM/cYfnGNuDrUxnDd/Qi5sc6XSg39v
 uVstyUmt2JcyWtfw+yYyvV4Hhwcgk/H/vvrNv0SmYoSFntrLlYvAtjwwdw48+bnZ5m6p
 VSh436XA4KqyWS2L+SEM7nbpfNFEQ6ODhVja+LJw7uHxEIecHv4te/0dVA2qmT8rrMh8
 wgDb83jnGI0Pq3jcDGgekTHpvPU61aL4RcB30Nd4nSAY+ipuxAGClMm9ite8hapCHvLW
 3xnvheYTrnfp6gbQjoC7y2fwajhUNKr6TL5TvxqE0F8KdafkHZS648XzZ77l9HIKdND5
 +5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lnmvf5DIME30DRHpOT2jqtHezB0zMpmGN1Y+BQNmOZY=;
 b=pDyy01Sk5w1sQf2NbPL+EilcV83Y9zK+amomlchjm3jkJAWouku5VK0phwWZwvdBIH
 A98jpvaz0WN5Voba4PtN16NEKeNbi2YmwCpay/VQ0KmMI2gmSo9G6TEiEakeXZoJGNTH
 aOpm1SOfmEmLA7tPB8rL9DCsk9H4R1fM1mnRmIUH2k9vjWQhwXY4bNqQnXVHfnWdSQuw
 43ZSRNazIBYrpJV3Ekt39KBQtx2nKHJsUo6o8ilgnaSo4V3LYWP6N/osGXZkb45t+0sc
 rYOJRvq/T5VgRdjoyiWSsNYDkXqfSds1p67uYN8nSN2/qiH6TCxhsqYIUIsr8WAnuaSm
 cKiA==
X-Gm-Message-State: AOAM530e1/QJr9v2WrrjVdqQIuzA++O16Bg2RlNsoVgNvTTD1FKvO4bA
 6Tz3aYeFgRWREALbuTFmtkY7bw==
X-Google-Smtp-Source: ABdhPJzEiKImJfIFKkSoPErViXZ9PsxnNkw/IqrmYJapWu0dAKgpCyubUaTFdmrFSeOZ1gQaSzxNkg==
X-Received: by 2002:a63:530a:: with SMTP id h10mr1147734pgb.98.1623870546945; 
 Wed, 16 Jun 2021 12:09:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j4sm6079437pjv.7.2021.06.16.12.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 12:09:06 -0700 (PDT)
Subject: Re: [PATCH v4 3/7] chardev/socket: Use
 qcrypto_tls_creds_check_endpoint()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210616162225.2517463-1-philmd@redhat.com>
 <20210616162225.2517463-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb743365-55fe-6f96-507c-00635a36163e@linaro.org>
Date: Wed, 16 Jun 2021 12:09:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616162225.2517463-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:22 AM, Philippe Mathieu-Daudé wrote:
> Avoid accessing QCryptoTLSCreds internals by using
> the qcrypto_tls_creds_check_endpoint() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   chardev/char-socket.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


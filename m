Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABCC279380
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 23:27:16 +0200 (CEST)
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLvFL-0002eq-Fn
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 17:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kLvE8-0001me-Vq
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 17:26:00 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:33705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kLvE7-0002hc-Ag
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 17:26:00 -0400
Received: by mail-pg1-x542.google.com with SMTP id o25so3680230pgm.0
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 14:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QsjyM/cO3i5yVWHNiAmViT/L05joNfQdUK/RhFNsoyU=;
 b=sSQJ6B+GJWVJ0yWFYaVv/2aOjKGKDmUkmdBfyAm1nztyO+vLxHhvtmwacfQHqBzEBH
 b7FtGxOs0gTKm/d0RbOLuToSPiuz8F8sc/yzDF0OwP9hCOA8jHiLjE3iIjCd/K5ScROa
 Agk02bbmq/45kov/vi6t0UR87EfGxN7rnEeC6x7W5ge4e0oJHssYaOZWcY/1jD9hB59r
 5pOYuij1Vl7cboC+e4w0X0eiN+SXD8yfzgsVSwu1Pgs+54vbwTXEcQRMO3JLnI+1oxOu
 1O9XwqV2LL+jnWfBhpBQgHzT91RXhAp4HGaS2xG7g2BivAT43qShyqDK1o9HQAlEicYk
 SvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QsjyM/cO3i5yVWHNiAmViT/L05joNfQdUK/RhFNsoyU=;
 b=bMIyh1P0+ELBwYzuLgSz8ajLDPJ/5gGHn7/jL7lz3vD/1onhTG/WG9cgGmbwdqcoP8
 6u8zZborCji4y3/FwrN+xzaoTd7OG8wqmpUaFZEFxunNj/MQqnutsY4a4bo7d6PZwlfn
 hmbOHdJsLoYWIO34/AEnHCRi3sfi3mLxlh4xfglk/XVLgRTsos5UBr59gcQ48oKqQfVC
 fSRA/uGvcdi6CoqlLVRdpoxt64XYrmaE8yLx1/8FcT5pLfZIVYfp3MoZj2juUbDeq4mZ
 b+Qg4W2HiADpRGOtXFj5VZmaqf38kaeIfOUGlbKvs2EzOiYymxnMC9D8VK71JjMx+VMH
 9fLw==
X-Gm-Message-State: AOAM5308hE723CLZxYwLirIXQ+YRuHEJh+iV7fQfvo/fLJx1DhLrTLRK
 3knZ7uIGlWZ5dk/7cyePd7ibfw==
X-Google-Smtp-Source: ABdhPJzidcqp4IET+dtnuzm0p0XaluUTwp0jXxd2bfojUB7ZcN79WZo4X6POp1yBiQOUFAx903NHpg==
X-Received: by 2002:a17:902:b7c4:b029:d0:b7a2:d16 with SMTP id
 v4-20020a170902b7c4b02900d0b7a20d16mr1327415plz.11.1601069157847; 
 Fri, 25 Sep 2020 14:25:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gg13sm127227pjb.3.2020.09.25.14.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 14:25:57 -0700 (PDT)
Subject: Re: [PATCH v1 2/8] s390x/tcg: Implement SUBTRACT HALFWORD (SGH)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20200922103129.12824-1-david@redhat.com>
 <20200922103129.12824-3-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <697aea1b-1d02-e2d4-fe4d-71c9b341263f@linaro.org>
Date: Fri, 25 Sep 2020 14:25:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922103129.12824-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.238,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/20 3:31 AM, David Hildenbrand wrote:
> Easy to wire up.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/insn-data.def | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5379D49D4D0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 23:04:58 +0100 (CET)
Received: from localhost ([::1]:47990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCqPR-0000ot-DA
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 17:04:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCqJs-00041d-9h
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:59:15 -0500
Received: from [2607:f8b0:4864:20::102c] (port=42976
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCqJq-0003tq-K5
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:59:11 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so930317pjb.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5WkW5/dzj+Wt7TBlkbD1f7KqgmXMe8x72sPxOyXiyuI=;
 b=AIVWKqrgYfcPjTDUipN5+32a8ILteEC8ZqdUo2RLTg0dlMHPQoxQAXlVj3+ty0RUlg
 AIE1RdZY8drtm8LwmBt/g3h3nyyb9uLzgjH73ljWP23qG4CWQN62p0pwlQQFepBzd2Fz
 k6R2u24SX7cVZ+e8LaKt3CZArskF+W/al3FqBS+8l6+C1HAeTOf5RorxhdjmCl2rCh2r
 CCet/10tRjLiwqbwM+rWxjYXauUCfqzYyYf7wJybHep8LR06hOI+n9GowQ+qimsvptPm
 sZip1/7yrzV8Cv/wOcTlHZGtBk/FNSkicCjDP9n7do6jLrQTyoBs3Y3g3y7ArsWq8z07
 0/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5WkW5/dzj+Wt7TBlkbD1f7KqgmXMe8x72sPxOyXiyuI=;
 b=O2Y2HnwLPc0cvKNJzpO5rHVTv3/hEjfvk/lJ/dsBAsAk9BfXKmUDXySH1xoffZMzhw
 kLMQTDW5MYSUqKmvo+bnHpM0/xBmK8VI0POETfk1JMUTuiYzo3HbKmHbc6PJWmJ7Aq5E
 NPzkeQQ0L4+0ipASXFtKwFybD4LWoLYpbjLUe/b68upozN3OQWAKyZ6bjgSHNO2QgZvv
 kzvc3BffPX3VdZTVAmS4pzjO6DREb6XbcfFhywtuy6K+6xmIAIutcl0ZUEr/kDX/96AB
 7lzmqXiWTTVxvRbLevcFAnJP3yPWBXoJShQ6neBESvGgAqhdJ4hRSZe0V+YotEvC2ZLj
 /eow==
X-Gm-Message-State: AOAM530y1dCTgNVE+/c6w7RhtXEL3xa+soAlTg7vLGQ7g6eLH/s5nnxE
 0ZUPYgrJv14F1jv8ifSP41Z3rUAnRIVbU1fX
X-Google-Smtp-Source: ABdhPJxmvjpyPDfanOgWvEKU3iQXKpwUosa7x/CNjELLvBSJp/uH3kWK6GqIJzzbamkkLYuvaDA+Qw==
X-Received: by 2002:a17:902:b201:: with SMTP id
 t1mr922946plr.145.1643234335271; 
 Wed, 26 Jan 2022 13:58:55 -0800 (PST)
Received: from ?IPv6:2001:8003:1d71:4f01:4dac:f487:9ea0:53e8?
 ([2001:8003:1d71:4f01:4dac:f487:9ea0:53e8])
 by smtp.gmail.com with ESMTPSA id l14sm5007208pjf.1.2022.01.26.13.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 13:58:54 -0800 (PST)
Subject: Re: [PATCH v2 05/14] target/ppc: 405: Critical exceptions cleanup
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-6-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31261a59-6edc-cb07-29dd-6c1451fe6dfa@linaro.org>
Date: Thu, 27 Jan 2022 08:58:48 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118184448.852996-6-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 5:44 AM, Fabiano Rosas wrote:
> In powerpc_excp_40x the Critical exception is now for 405 only, so we
> can remove the BookE and G2 blocks.
> 
> Signed-off-by: Fabiano Rosas<farosas@linux.ibm.com>
> Reviewed-by: David Gibson<david@gibson.dropbear.id.au>
> ---
>   target/ppc/excp_helper.c | 17 ++---------------
>   1 file changed, 2 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


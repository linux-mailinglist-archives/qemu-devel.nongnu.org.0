Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E01EBD51C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 00:53:13 +0200 (CEST)
Received: from localhost ([::1]:43474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCtgF-0000uC-Fc
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 18:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40749)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iCtXl-0000k7-7q
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 18:44:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iCtXk-00078x-2a
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 18:44:25 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41931)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iCtXj-000785-Sf
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 18:44:24 -0400
Received: by mail-pg1-f193.google.com with SMTP id s1so2057937pgv.8
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 15:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dQksLTLNEueKsdhcISeGAXpoI0/6/XCEzuXpOzHb6Jc=;
 b=N8o3vKE51uDkZp9XTUUNSf+FVAUHC7XMgSj9AzMRFBd5Z1N0lFAypppB3YtsVC0Ks1
 k1/omHP2CnO6cvLE5pIn6qJT5u6XfnPys5Jv/hCIXG96EBzMFbj51wQV4Pnl50h7C7rx
 WKKJ0wWEf83E/AfkI/mZhapY637B0XwJsp7MtFMYN+es5thYJzJqvy9MNI+eVCd+/fxO
 2RDOVMU29/cjvlebsp/2YfSGMGnZaXnt699z05c4UIoa1zRK0bwTkefwlW64aVJhV/QW
 BcG/LFt7fHiNWoYWxXB2xBUUtvqvSUl2MMDMSe+ScznY1fzK1A/ioXMI7E6BMmivCY/N
 DfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dQksLTLNEueKsdhcISeGAXpoI0/6/XCEzuXpOzHb6Jc=;
 b=omLDVMDkTaO6s2lBxjaNU6DCWesxvFOAnI1cgRXWw5nkjN6U6DSHFM/cNForww4NBY
 EQaJBEExmfjb2uGSPjrueh46/XMXSciQkFmzgtPH68T+9AyieExaXVVk0rq5u7J5De/S
 Dk4eTQfGUTOjWg3kJcMs/tGoDALSSXhxhqTxTFoxWKAmlAUS6mUuD/akYvT9o4bmOsGx
 uisy40Ol0mop7yMYDG7VJCmoSWo7SKB/ZJZjZrY4RWOPr6ZyTuOe5u0+01/kEJopHc6S
 8zdbv3YYWV8/k0K0tRcG8lWoanQNY8xdzrW2FCBgyeFC7Wvip4ZYY2BslMNtqnKenV0c
 Kqqw==
X-Gm-Message-State: APjAAAUyGxcR2qUN1wxKvx+wdooXc5B7NegzAa4umqrP9F08s1OhIbHl
 /7ByVZBPRrXOzgm/mNvpSJl3tg==
X-Google-Smtp-Source: APXvYqxwrR7+8quuDxpBiYO6BOCmR/SIq341VEJ5kGz5r0vrsmw/5jGPbjiTfNMtN9oNu6/VdDAQJQ==
X-Received: by 2002:a17:90a:7d06:: with SMTP id
 g6mr2246220pjl.53.1569361275418; 
 Tue, 24 Sep 2019 14:41:15 -0700 (PDT)
Received: from [172.20.32.216] ([12.157.10.114])
 by smtp.gmail.com with ESMTPSA id v44sm3654171pgn.17.2019.09.24.14.41.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 14:41:14 -0700 (PDT)
Subject: Re: [PATCH 5/7] target/ppc: change struct PPC_DFP decimal storage
 from uint64[2] to ppc_vsr_t
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, pc@us.ibm.com, david@gibson.dropbear.id.au
References: <20190924153556.27575-1-mark.cave-ayland@ilande.co.uk>
 <20190924153556.27575-6-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cba6a410-f7d3-9a93-a3da-342e1afacd0c@linaro.org>
Date: Tue, 24 Sep 2019 14:41:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924153556.27575-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
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

On 9/24/19 8:35 AM, Mark Cave-Ayland wrote:
>  struct PPC_DFP {
>      CPUPPCState *env;
> -    uint64_t t64[2], a64[2], b64[2];
> +    ppc_vsr_t vt, va, vb;

This I don't think is a good idea.  It's not a vsr_t.

I think this step would be clearer with

  union {
    decimal64 d;
    uint64_t i;
  } u;

  union {
    decimal128 d;
    uint64_t i[2];
  } u;

in the separate dfp_prepare_decimal{64,128} functions.  Which is basically what
we have before, only smooshing the a64 and b64 scratch-pads together, and using
a nice union instead of an ugly cast.


r~


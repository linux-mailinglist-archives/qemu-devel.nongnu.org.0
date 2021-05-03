Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743BD3717FD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:28:36 +0200 (CEST)
Received: from localhost ([::1]:34856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldaUt-00049b-5R
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldaSS-0002wx-CR
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:26:04 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldaSQ-0004JS-Pk
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:26:04 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 fa21-20020a17090af0d5b0290157eb6b590fso2211908pjb.5
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=onREnbAygYmc58zsRAd0li2KYytGUUxVwr7TrfHx4SI=;
 b=zGP9VDWH6GiI+CIel7exM1xcZsIrbdTOI7rOeCfXT2pAnpWpc2sEfqTR0z7nZXRJxm
 GAnBIDTpfp6OJpZjkrf6ahH3PWnGU3H1HECdHcx7uToW/ytsz/pzVIot55ryrv9hiGjg
 c6mRUNBIPBvT8lwBVu3XXFxTG8mth/1nsinmPTPPmQYb80I+Y7qZ+pi3QMaBKaEqjvWj
 Gtqss7IVQzl6YzkSEN7K1LRck3z9yj1v1TW7Ru18IDM2f9y2ran+8eVHLRrnxhMrau2Y
 lvJ/VWc+bUlco90ESXFW4PL7nMaLdbTsFy24yyHlkQHAAKxjxQm99CSgPJrjS3lgCSyx
 kKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=onREnbAygYmc58zsRAd0li2KYytGUUxVwr7TrfHx4SI=;
 b=ZZjuWbF6LyKQpVmTp+CJ11LR8qMMJTRVPF09yCBS0Z10phQTzMgsgkXFPCpLbYB0Zq
 RjklxwtgUQmu9S6zdQiMNYE15dLL9gMtz/BgkzD7EmJfRf8zr1E0TA17wj7eCoMVyYl3
 idCBFn+8GCbJFuNeT1mJJmCKTiUT8eyul27lnftTzWyzjM22q7V6EkWJPGng5l58LNUJ
 dblbJbqIB6jBTz7ieqxGtCaP7OtPx1MOMAQjDlQdnJ2F+rtTWYNyPeIVGQg0cARkt/ZA
 5y4swyvjnzi9iuPP2kx3/7IQ/d1NWd6ewtWtwuWipFUT2CAlIiHmDA6tWfeVOYcMro4C
 3FmA==
X-Gm-Message-State: AOAM530nzbHCklCmnKMTsfUuMZ9K1Bi0l1ZNRPa83fUoBpV6t17wWPKq
 XyUK1wxCK1Z2E4GZE3eerC1BWg==
X-Google-Smtp-Source: ABdhPJzqdJEBo6osNAzoKwJKDbv2yocBZ1rIXO/2zZcSFqNzd/7DIfMhTALwrWOP4T9h5OuKjSFrQw==
X-Received: by 2002:a17:90a:5304:: with SMTP id
 x4mr21164491pjh.221.1620055559468; 
 Mon, 03 May 2021 08:25:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i24sm3978704pfd.35.2021.05.03.08.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 08:25:59 -0700 (PDT)
Subject: Re: [PATCH v3 4/7] target/ppc: turned SPR R/W callbacks not static
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-5-bruno.larsen@eldorado.org.br>
 <79cda095-9ba0-0ec6-c89d-77e2d6dbf312@linaro.org>
 <ba205951-0286-25d8-c453-848e1d0123af@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <923b7fd2-122a-316b-adbe-fb9a2655ab61@linaro.org>
Date: Mon, 3 May 2021 08:25:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ba205951-0286-25d8-c453-848e1d0123af@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 4:28 AM, Bruno Piazera Larsen wrote:
>> Note for future cleanup: Make spr_tcg.c be standalone as well. Just need to 
>> move a few declarations to a translate.h.
> it's not that easy, unfortunately. The readers and writers use a lot of global 
> variables declared in translate.c, so we'd need to create getters and setters, 
> or some better solution, before doing that.

No need for getters, and certainly not for setters (all of the globals are 
write-once at startup).  Just move the declarations into a shared translate.h. 
  That's what we've done for target/arm/.


r~


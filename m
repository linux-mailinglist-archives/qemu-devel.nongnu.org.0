Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340602802A5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 17:23:40 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO0Ql-0008Oq-92
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 11:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO0L6-0000Zw-4j
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 11:17:48 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:41790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO0L4-0008OF-Cy
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 11:17:47 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id t3so1561673ook.8
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e6hpdWWJtuusPfDjuvPD2LTEmj0bTNhgIzy8RUPrr2A=;
 b=pJm8IlseG0MRDxeYCTyaLPV5FytsefXzE2xXqDaC3tj9Zy6tVMmyPJ0IMRrlP5Nnkv
 StsKa3lr8Elp5rYbxeH4R9ILj/XxUYbKJXzLoTY7ppaeSMFlGd1/LPEZDx3XT3OSKVLU
 uoinpeq/VFmiER4qZd2TMcpdrEz2F9SUmmwzdfRw3uPCNjcA2Rfe7Poq7JhoGFNgOO67
 hjflRsob+buBCY75EZm6V3AyQGMC4Rbo0S4CCBO3tH2ik7F3uaf388w08cA++sJ1PQ1O
 wNPeoae0ADhCuyvWrLaikJqwIIUkj+hyfAZOjbUAtPnRMq/cF6ogUqm1D874BcqOpobs
 8iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e6hpdWWJtuusPfDjuvPD2LTEmj0bTNhgIzy8RUPrr2A=;
 b=oaItc8BkPYRKx272dhqJdasMfvNKu/mX7IDVtZKu+6rdDYP0l+hL0v9Y6oTCeck8x6
 38XlLlDP9BHj34I7CDS8QN3Shj/CJL5aVNWHx4nbCHsppjADwM+TQsyWqdShwnfciGlE
 kr6+nXRHMKLCeNqVwdQGrTRm2j/QVKwPUcHs6mioVXIb71AkFZaGQzalGQ6QIP/Bs9/6
 8q0q6KnNeNt9wyoMvm8tx4+82yFwlwmQQg3m2ncnBrPDjT2+/Wh4iqM4o+yHe4qcLO5b
 l1VqI6rV1l4G2sltV60mlCnKOKJDfJw9z4JE/sGGK/r1yEfwhZTE6tHdfoB3YlN5ALmm
 1M3A==
X-Gm-Message-State: AOAM530bkFlkt+rQg/wkGk/1Jzp6K69dQP1ZBo3NDYOAXu13gmhsY8SA
 EDjkk696m+imYuneBkg7LPFDgw==
X-Google-Smtp-Source: ABdhPJwIPBf48C5NgKNE5oWOuNJpImfId4qbVa3w7ReIED12UTR+jtDPCBDCuwgQ2sp+nvJu1kzY8g==
X-Received: by 2002:a4a:e689:: with SMTP id u9mr6105843oot.52.1601565464859;
 Thu, 01 Oct 2020 08:17:44 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r3sm1345125ooo.16.2020.10.01.08.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 08:17:43 -0700 (PDT)
Subject: Re: [PATCH v1 02/20] s390x/tcg: Implement VECTOR BIT PERMUTE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20200930145523.71087-1-david@redhat.com>
 <20200930145523.71087-3-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84292bd0-7751-1cc8-afc8-83b40d89a754@linaro.org>
Date: Thu, 1 Oct 2020 10:17:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930145523.71087-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.26,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/30/20 9:55 AM, David Hildenbrand wrote:
> +        bit = !!(s390_vec_read_element8(v2, bit_nr / 8) &
> +                 (0x80 >> (bit_nr % 8)));

I think this would be clearer as

  bit = (s390_vec_read_element8(v2, bit_nr / 8)
         >> (7 - (bit_nr % 8))) & 1;

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


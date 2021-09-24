Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BAB41780D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 17:54:44 +0200 (CEST)
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTnX9-0000kh-EA
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 11:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTnVf-0008L2-BS
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:53:12 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:38719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTnVc-0001Ky-Jr
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:53:10 -0400
Received: by mail-qk1-x729.google.com with SMTP id q81so24853630qke.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 08:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Jmy47qkzWBcYR8cf4usUASZwsJDFunh6PnZhYuWqcvA=;
 b=BeFItlM16ufnX2f1UIRKJWMDxkDVA5fOGjvXk+bWCinvIhmNLvftXOmiSFEFBa9xDV
 c+Y9dIe5xmdORE1XbiN0qeuyaL1ZYy4tnc0rGEdrzS2FsE7QnaYTLyA1qlh8bUUVuUUh
 Z03PmDHBGCa50RsgAB1xODb1AaF2PQ3pR5pVAyu42iFCjnh+GhiZP2DGuHjStN5wDZBb
 WbwNR00kTdl3FzzgWHdtE1AbjliXKWRrOXCusw9G1AOQBtFt6wuFNJg93r8KrlzEc4jN
 9l1V4hBmxVSMSuKHymVaHMEu9m8szwnBhn9GozfguZWGvWKQzv1H91+hQoFJT7sfqNrw
 L2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jmy47qkzWBcYR8cf4usUASZwsJDFunh6PnZhYuWqcvA=;
 b=pYeAkYKL80tbArq1nOyjhtYi5NSN/HVc5XvNNnoPxvRM3RLg2piIWC8y/yz2xyEKVh
 yl8S8VC74DJEeUXm1NWm8HDVH8YZmZHSV6I80H57CFLVe5c0Y6JLLBA2HdcWFG2NtZyl
 TMZgpOlyEG8K4tMR5um82BRiE5iFBmiT+vfc3+dsB6S37iLP+Wk9M+ByOywAXCi9Fhu4
 GtL8qTkUvptKtziz1R7h2JNki2VMTHXw11FoKp+ZDFcdwCcd7sfe+FbP39rKeoTxR+Th
 xbaOQ1ujA9eM3SaVRmfcRN4XlAPRSrhkCW14XDUM0NcdIXGXIj8wIk9bPj41K30XnIpD
 au8w==
X-Gm-Message-State: AOAM531nVjojx63P1a9C6wSyfxZOKEN4I6+N6iGHHFw1TXDvj1Fgt2f+
 NdueQSw3mePxAWxOROKbff2L2n8lGe3LRQ==
X-Google-Smtp-Source: ABdhPJwuDfN9UO8bCEA3bBrpU00zkfo0+cft3qIrHWSaqgXuZvtYWlcdS7shzBXRayoMQmob1VjuRA==
X-Received: by 2002:a37:bc85:: with SMTP id m127mr8390306qkf.119.1632498787389; 
 Fri, 24 Sep 2021 08:53:07 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id q14sm6531181qkl.44.2021.09.24.08.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 08:53:07 -0700 (PDT)
Subject: Re: [PATCH v3 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel <qemu-devel@nongnu.org>
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-10-git@xen0n.name>
 <5ace7b10-b7de-46e2-2021-01129024ffe2@linaro.org>
 <7ca2e822-839f-96ab-9dc9-276565d03478@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26730e70-e5be-1dd2-7c19-d4c6a82d36ec@linaro.org>
Date: Fri, 24 Sep 2021 11:53:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7ca2e822-839f-96ab-9dc9-276565d03478@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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

On 9/24/21 11:08 AM, WANG Xuerui wrote:
> Oops, for some reason I only received this at about 8 pm...

That was my fault.  I wrote a bunch of stuff off-line yesterday while traveling, and the 
mail queue only flushed this morning.

I'll note there's a bug in my example code wrt initializing rd with addi, then overwriting 
with cu32i.d.

I like your v4 version of movi, with the high-bit-set predicate.  The only case I can 
think of that you miss is e.g. 0x7fffffffffffffff, which can be

	addi.w	rd, zero, -1
	cu52i.d	rd, rd, 0x7ff

One possibility is to extract a subroutine:

static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
{
     /* Single instruction cases */
     /* else lu12i.w + ori */
}

static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
                          tcg_target_long val)
{
     if (type == TCG_TYPE_I32 || val == (int32_t)val) {
         tcg_out_movi_i32(s, rd, val);
         return;
     }

     /* PC-relative cases */

     if (ctz64(val) >= 52) {
         tcg_out_opc_cu52i_d(s, rd, TCG_REG_ZERO, val >> 52);
         return;
     }

     /* Slow path.  Initialize the low 32-bits, then concat high bits. */
     tcg_out_movi_i32(s, rd, val);

     rd_high_bits_are_ones = (int32_t)val < 0);

     /* Your imm_part_needs_loading checks; rd is always written. */
}


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC6C21108E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 18:27:21 +0200 (CEST)
Received: from localhost ([::1]:56706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqfZw-0004Bg-2r
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 12:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqfYh-0002Dv-BU
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 12:26:03 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:38287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqfYf-0000zc-83
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 12:26:02 -0400
Received: by mail-pj1-x1043.google.com with SMTP id k5so1680186pjg.3
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 09:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UGNrzErWTkxLmxh9La29txsfoELABioK+bURfbuipYc=;
 b=O3sAgADuI/RxrjEPNfGgyBTUdGGiZrxKmETcCu9GWWHtcDLDaKbbM3KQ/QOWZe1sWd
 bsYq+J2alsxPsH1ZgR401lhK6UMh4+RkQTcLyqVE8NZnJkM+rx1VnvwrnAMbOhn5sTOJ
 tiSEA3M/9PceWiN1JTh+fLtpW7R0eyyDsDusASBzxCs2kfEdiglyVyqOt1u8RSYhskB5
 ejWnMpn8rYPHlVFGOrX26lH8ppT870SFMhW+6kPYUufkJF+oGturUoBaIE5Ftfz4A/Cq
 Wb5aI39y51fzWymNftPbtGe1TvJdl2T09O0+/zEwnoN5kKhiRFGqhO61iT2kZf6n9ACj
 AIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UGNrzErWTkxLmxh9La29txsfoELABioK+bURfbuipYc=;
 b=LZzdnLrPXmbN4Hpk6sx8iZvl7BCsCpr+tN4b8FdM2RzqiECy5YAHa8i7phdRYJbWQ1
 zmxCxgbXxifQpDzsalohRsvb+5tWsbqYnX+zmq29BMmmfCDZ5CFdcKTxeMg0nr55mdcA
 HVnqqy0IZnjWbLrvcg156aIRBsi5VlgxSWzFweR+PdyKLnLGaACg72NYA3mbRVzLex2D
 EixjsyEZn4rrCQzcPcHeL7aampEekbH7O52FSREHXkafvPzRFTy3BAECYULePta9lK//
 P2/pEed8K7sC/7KnJX+QCqy1Lj2y9kz4H1qaTFmcT0PpaOCpbTI3pBmlQ1punAkeksvi
 AHJg==
X-Gm-Message-State: AOAM532AAJuPOSwzQlIlo7IFSfYXJtDP+NqRFpe7yufe6N1v3N5hZWOR
 OxLoVnBr0xhrU8+tkgPaQ/cWKA==
X-Google-Smtp-Source: ABdhPJx+z+EJIFVR/baB9YaOob+BFc5dm+P1Csy9xgERRxWIW7FcTAJ5jDbkY65DThADASlZR3Vb0g==
X-Received: by 2002:a17:902:8488:: with SMTP id
 c8mr22658413plo.49.1593620759155; 
 Wed, 01 Jul 2020 09:25:59 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s6sm5984163pfd.20.2020.07.01.09.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 09:25:58 -0700 (PDT)
Subject: Re: [PATCH 1/1] tcg/tcg-op: nonatomic_op should work with smaller
 memop
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20200701152156.1147-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e828263f-e592-d787-b4cd-44c41a41e7f3@linaro.org>
Date: Wed, 1 Jul 2020 09:25:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701152156.1147-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: palmer@dabbelt.com, wenmeng_zhang@c-sky.com, Alistair.Francis@wdc.com,
 wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/20 8:21 AM, LIU Zhiwei wrote:
> -    tcg_gen_qemu_ld_i32(t1, addr, idx, memop & ~MO_SIGN);
> +    tcg_gen_qemu_ld_i32(t1, addr, idx, memop);
> +    tcg_gen_ext_i32(val, val, memop);
>      gen(t2, t1, val);

I was just about to post a simiar patch.
The difference with mine is that I do not modify val:

-    gen(t2, t1, val);
+    tcg_gen_ext_i32(t2, val, memop);
+    gen(t2, t1, t2);


r~


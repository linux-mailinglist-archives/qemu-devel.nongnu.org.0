Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725763C25E3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:26:32 +0200 (CEST)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rSZ-00026n-Hb
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1rQt-0001OO-BF
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:24:47 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1rQr-0002nH-Qz
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:24:47 -0400
Received: by mail-pg1-x536.google.com with SMTP id h4so10118184pgp.5
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2W9JKbj+0wPv01ggjUgpAuGZVQmllNMjFcd8jzV9eNo=;
 b=pEqCiTbe2TK9Lf11JYTKQHqhGmS6D3j76yO2zOXAp7NI2knk64NrxXYZfL42iZuzOJ
 1LPpDdGEg1CtcdpM+kGQUCIL6HR4GQjhnzZLsSA+w7z0XJv9mIs8H6q6B+xem/3cDGdc
 urKY7l7zSjLmPsbQxU53Ip1tejcthrmjb9pBdFbv7AjzHradzZymSpNRa6l0iLWJ74ab
 qSpwOJYJT6UdLqPDiqpXRNUZ5dIQ4Adt+WaNgBepT2GkgDsi8VjfNS3wiwt26UVb+/qp
 NmhMtYn2ntqEDrc1BEJ7nkEGNgj+TEe3qrdiLhD0aWkdWX/9H3z6MVC8lY0lev2sLr85
 tHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2W9JKbj+0wPv01ggjUgpAuGZVQmllNMjFcd8jzV9eNo=;
 b=twwGW1OhJz7Osslp9KGmMZasJXsep8KqFPpMRRhLWeE8dbtFrONWFsa5rWLXtdChKb
 5deKKJ350nP4PljP+9IwMQPjLUi9SiuDNWa442xfmEujIZLGpUR9orJg3EXuIOspwtjX
 /JG2MN7LJi0/o/H4FNuW2Ea4i+B0fdGP/dd4cSzMMwzqj0Z/Eprd7u9tnnzmD8u/w8vl
 c6Si9n7TTpMTQzYYCRPfNLXvxOiIiFjomCsPDB1UIBYjYdiceM32+URj/VaTixIrdxUH
 csOxRkXrR+SNi+TY4pabUASTlFJ3ycBbnyRUdqccaMDNIDwAKxttBxrbU4EqkgCnkCHr
 oE0Q==
X-Gm-Message-State: AOAM531YJ5AcOie0ZnnGMW72M2MTTUjQs/gzhC4FAOdJG0Kww5hg4R99
 sNAkZU+hN7Nz89+XYLNSD2qbAPo9n8cusA==
X-Google-Smtp-Source: ABdhPJwcoT+ZSaCHbwFVHHheuPtZJyrzrPLA0carA51f3HBq5n7BtUmDU/6Ief3y2nFhGuYB+tLHoQ==
X-Received: by 2002:a05:6a00:1951:b029:319:db4d:5d9a with SMTP id
 s17-20020a056a001951b0290319db4d5d9amr35214962pfk.12.1625840683884; 
 Fri, 09 Jul 2021 07:24:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 30sm7787680pgq.31.2021.07.09.07.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 07:24:43 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/hppa: Use tcg_constant_*
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708205807.827147-1-richard.henderson@linaro.org>
 <20210708205807.827147-2-richard.henderson@linaro.org>
 <b5f660c2-7e93-2442-34ed-f2673781a053@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4531bd57-2d18-5a8a-c4f5-2c6b7ac4389c@linaro.org>
Date: Fri, 9 Jul 2021 07:24:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b5f660c2-7e93-2442-34ed-f2673781a053@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 7/9/21 12:08 AM, Philippe Mathieu-Daudé wrote:
> What about this one?
> 
> @@ -3385,7 +3385,7 @@ static bool do_depw_sar(DisasContext *ct
>       /* Convert big-endian bit numbering in SAR to left-shift.  */
>       tcg_gen_xori_reg(shift, cpu_sar, TARGET_REGISTER_BITS - 1);
> 
> -    mask = tcg_const_reg(msb + (msb - 1));
> +    mask = tcg_constant_reg(msb + (msb - 1));
>       tcg_gen_and_reg(tmp, val, mask);
>       if (rs) {
>           tcg_gen_shl_reg(mask, mask, shift);

Also used as destination, so it's an initialized temp not a constant.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335235F1F56
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 22:26:02 +0200 (CEST)
Received: from localhost ([::1]:34922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oej3h-0001H2-2n
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 16:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oej1Y-0008Ke-Q7
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 16:23:48 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oej1X-00050i-82
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 16:23:48 -0400
Received: by mail-qk1-x731.google.com with SMTP id d15so4731798qka.9
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 13:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=jLYIa1YGL/t0IlypKXCYkg1bH/XpH5VWlUtKZmt1FAA=;
 b=m1e0+Sacj8py1+mnzbR/0AEK60svWS8wJqSptOgUgeUSEvszE4TocnpE25uVi2E6ZO
 kgliM8IdI98uUEgQDtZ38NZrqW3j3K/sX4A+yplPWoR4MUET1fT/YzMoHf8072eb53q9
 ftm0oyXhHSUoEd+/hWPhWzGcR9Rtmt6HvTgiBYBsQSJ5DSjdkbtrgL/XS4apEQVyDYX+
 9MIhcQPj8PGlkQ80U97GZED3joGNe/AF3qJIqtjVv3JoQNdlGUULyLVvhj35Y+KFkR3K
 Kxq/dsFALOQm61cy4Srf05BUUDsb2DjF0cqS9dMd6g0n4Fb+sVckM3T0PxjXWOjZoVak
 b9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jLYIa1YGL/t0IlypKXCYkg1bH/XpH5VWlUtKZmt1FAA=;
 b=U+KpXuKizkD0SS6Ubvtuw1aDJRhWl9Rk0wMiwAjIh9D//4dZXYlCeWYhk1pGIzJoG+
 4bQwCbbE5uSBP4BfAb1QAFyNVRKFz8MHOn5lo5lnBJ/UhwJSfdpKqolTvVQfx5a9eZLk
 fNORHBybNlrTtZV/oFHBZGwPiPHhJYXDyd/azpjO0oix76oOZpklKu6r5d/E59vYkQ6Y
 3bSzNqQEtCvwsM8PusvwWc4E66wFjctiJawWRKAZqH4RrK+bZt1ewLUkECFonNZ79UAi
 C4+/6FpvXeu1wgqLDCHrvrARGCu9AHWLAepZ9qvUA8vid2EZ8cVjtkqdPfomu/AkwQsR
 pv1A==
X-Gm-Message-State: ACrzQf2jsrWNv9LKW3hifk/cRW0y1AxWvhNm3g7aEHdFUnQGtLD1LkSZ
 jCe7Ct7XJioGtTr7H6vdXNN1oQ==
X-Google-Smtp-Source: AMsMyM7NQZT9Jw/HB+StodSu+pCRzk7SXLq+zvA/WqFUVKYJqe0mhhE8IOXkfbZmMHwr61l7kEEmBw==
X-Received: by 2002:a05:620a:448d:b0:6cf:2a91:9a31 with SMTP id
 x13-20020a05620a448d00b006cf2a919a31mr10108742qkp.660.1664655825614; 
 Sat, 01 Oct 2022 13:23:45 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8095:7cb4:807f:680f:cbdb:28c5?
 ([2605:ef80:8095:7cb4:807f:680f:cbdb:28c5])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a05620a080600b006ce9d6e51f4sm6108299qks.67.2022.10.01.13.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Oct 2022 13:23:44 -0700 (PDT)
Message-ID: <3ca717d7-fbc9-b2f9-71cc-01ef459da257@linaro.org>
Date: Sat, 1 Oct 2022 13:23:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: access guest address from within instruction
Content-Language: en-US
To: BitFriends <commandspider12@gmail.com>, qemu-devel@nongnu.org
References: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.743,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/1/22 13:10, BitFriends wrote:
> Hello,
> 
> I am trying to create a custom instruction that accesses guest memory specified by an 
> address in a register. I specifically want to read from that address. So I tried to do 
> that using "tcg_gen_qemu_ld_i64(&res, env->regs[R_EDI], 0, MO_LEUQ);", but that doesn't 
> save any result in res.

This statement should have given you compilation errors, so I don't know what you mean by 
"doesn't save any result".  There's clearly a disconnect between what you describe and 
what you actually attempted.

Anyway, by the name you can see that function "gen"erates a "tcg" operation, which is then 
later compiled by the jit, the output of which is later executed to produce a result. 
Which is, in general, what you want for implementing a custom instruction.


r~


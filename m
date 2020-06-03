Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34FE1ED46E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 18:35:27 +0200 (CEST)
Received: from localhost ([::1]:46564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgWMQ-0007je-VF
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 12:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgWJu-0005Sx-1d
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 12:32:50 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgWJs-0008Iu-JL
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 12:32:49 -0400
Received: by mail-pg1-x541.google.com with SMTP id s10so2143518pgm.0
 for <qemu-devel@nongnu.org>; Wed, 03 Jun 2020 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8691S7U8WPQBsYhXFOCmpM6zzL6H1VQkru/rGFWq52A=;
 b=E3TVvfDM8apQKqhiE4iAb3qG/VnAy0zbUORlkZIOcTPadQJeFyHUBMnWTpbTXAhSR9
 nPUGKZIk1/mXnfOTIrevOS8eZCXSQkY3yhRHNQ7mY03xPlAYko3yeAu5vaPKZDvgpVTT
 9Qk12HsdoETQDLPA8ARUnkMWzgt8NkBeigSnR8nrKV8ztNVB9famh4z84wGCJxCrwizu
 XeRBO+QHy+WXp8+8/SyeuoQfYMYOCG+iKFbor6CvE+id2g4+28cKmkivt4oCwx9mrgpg
 9QSTRLUcuTPA0ei5Ov1ZJDRv8Y3rpXU2vtetrPOrrv7qK09H0IK4O93TaAliNKE+4Wgl
 Gdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8691S7U8WPQBsYhXFOCmpM6zzL6H1VQkru/rGFWq52A=;
 b=ePySBDxgIGGpoaNRiEqScKWvb/RuY7cHd0aNjU/Msbp7LCR8fpWzYxefq2O78vUv7N
 qkqeY/kMJDk+U1mBZdg08cPxyy4QuPBl7XPxbeMpI1vkS7DuoR5UNHepYq6CgEr8FWL8
 qVjvivQoDnkq5hlQmeEYPNIxbQeLG+H5jWo/hrTjYESNfhVXuLoOW7PP9dOSyr4Sa1Er
 bR7v2gXnl4h316MntCZ15Lg79u9nxicCgTlSAWPMb4hQ29sOWcwpv9eVmLrvt15g18V6
 PvMPktS77K/uX2hzgXmxpAx7MnZ2V8BVOkc3YZ5HwvTnX+E+WtXmL4mcJEteWrkpO21n
 7QpA==
X-Gm-Message-State: AOAM531iDk+oca3e9B43fdRpNnVZJ67827Qp89jsizwFVegyFN7p5g0T
 k97oC9oscA1dbYeSbKZyCA+5jg==
X-Google-Smtp-Source: ABdhPJyxTz9okbTsj3oyo9S5F3ztW9NRnwT78/b3H3cdPoXLbkPS33t2x+ZsTC8huu9oNXkGrBCIag==
X-Received: by 2002:a17:90a:f194:: with SMTP id
 bv20mr732774pjb.82.1591201966697; 
 Wed, 03 Jun 2020 09:32:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q134sm2183638pfc.143.2020.06.03.09.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 09:32:45 -0700 (PDT)
Subject: Re: [PATCH v3] osdep: Make MIN/MAX evaluate arguments only once
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20200603013603.2400199-1-eblake@redhat.com>
 <03a13d47-fe7d-88e5-b92e-3c396591f9c7@linaro.org>
 <ecef14ce-47ca-749e-25b4-8e3ee378bd34@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e894b8d-a510-0689-83dc-f6c8da16410e@linaro.org>
Date: Wed, 3 Jun 2020 09:32:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ecef14ce-47ca-749e-25b4-8e3ee378bd34@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 crosthwaite.peter@gmail.com, quintela@redhat.com, f4bug@amsat.org,
 dgilbert@redhat.com, kraxel@redhat.com, dirty.ice.hu@gmail.com,
 pbonzini@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/20 7:29 PM, Eric Blake wrote:
> Because:
> 
> #if MIN(...)
> 
> now fails to compile (you can't have { in a preprocessor expression), and:
> 
> #if MIN_CONST(...)
> 
> fails to compile (__builtin_constant_p() is not a preprocessor macro, so it
> warns that it is being treated as 0).  The only fix is to move the MIN() out of
> the #if and into the #define.

Ah, right.  Thanks.

>> Is it possible to use qemu_build_not_reached?
> 
> Possibly.
> 
> /me goes and recompiles; touching osdep.h recompiles the world...
> 
> No, it blows up hard, because qemu_build_not_reached() is not embeddable in an
> expression:

Ah, right, because without -O, qemu_build_not_reached expands to
g_assert_not_reached and not to a symbol marked with QEMU_ERROR.

>> I'd prefer we generate a compile-time error than a runtime trap (or nothing,
>> depending on compiler flags controlling __builtin_unreachable).
> 
> What we have DOES produce a compile-time error.  If either expression to
> MIN_CONST() is not actually const, the fact that __builtin_unreachable()
> returns void causes a compilation failure because a value is expected.

Ah!  Well, that's good and certainly sufficient for my needs.

I do now wonder if it wouldn't be clearer to use "(void)0"
instead of __builtin_unreachable, and add a note to the comment just above.


r~


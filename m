Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F400D3EFF89
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:50:04 +0200 (CEST)
Received: from localhost ([::1]:41398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHGu-0004V1-0q
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHEw-0001gj-0Z
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:48:02 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHEu-0001LP-JF
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:48:01 -0400
Received: by mail-wr1-x431.google.com with SMTP id q10so2285353wro.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 01:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BZnf8WnecQy+K41nGHsWH+o5JHHbAOIDethQldJWp8w=;
 b=IfWZmvdLg+ZTjt0HzpT5qAAb0rEm3fG0r3MIlMuGcPEFgEst9v/61FZORHhbpyLyjg
 9T2MedqoQuGosoqYQeVOryRJGUGyc4CMGCrz+BNN1R5e22ZvwRT1M9EoaGV6Q2RI2wKD
 RxzLi2Y8FMCdyaaUdAFnrNeDZsIh9LsZnkf2RsRLRxwRUvgJNmX6FIvcUUj5IbOfTkDq
 jixJURD2durktpEj+THJc96icuq0BTMe6puxEliyyhYepsXl5ucBnn/eoKpBn5MnEj/y
 S+7Y/NOegCJ/gi6ZYh7x+WvuvSg7w4ETO8Ur1E/1cKcj6GoZqyhAd0BhlnnPe0Y0m7Nv
 RhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BZnf8WnecQy+K41nGHsWH+o5JHHbAOIDethQldJWp8w=;
 b=Hn6m8VzNKjvi8uZBDVvpkaWQDzYohjwwft2CHha0E+Jt/xHJdXjAfl33IAYz8fvF8y
 cwx57CSjwhYGl6XCINHwtkoe5aeLmTyAmZdIRS1KNLu+f2zWrOnhBc0gX0EUDexg7PEb
 cJlq4LyBZOlPVVxqKaXcxm0OhEkSlIJu1PoyHyQsvb5R+5M0/ElnK+tR3Lk2ztsDilKJ
 fg2Y+pipUKTn8ZIP/R4C7/hvUniMOld8ZneWg9UBTvtAysE04fUZTRKUtTg9khbmdar0
 /Kb7+SGDdUSncdoQb64NtnyukbSSjfLRLFePNzcmv0qA/ESg6iFaMOG0fh9SRqpjck64
 IM8w==
X-Gm-Message-State: AOAM530ax9CdRsCUQ8mTZDysfQND6YSZfqBPxzJXib3Cs1mTaPeukwBA
 kyZ5nwASqENWwrv4NUhrMxI=
X-Google-Smtp-Source: ABdhPJxcpOUOGArdGGhtbyb/XgoodriTSpRqtKTRi3fjJb5MsHQY0FVXvrYTWG4Xcl8JoXoHi/57uw==
X-Received: by 2002:adf:b357:: with SMTP id k23mr9284703wrd.94.1629276479044; 
 Wed, 18 Aug 2021 01:47:59 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g11sm5244264wrd.97.2021.08.18.01.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 01:47:58 -0700 (PDT)
Subject: Re: [PATCH v2 12/55] target/s390x: Implement do_unaligned_access for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <576bfe41-241e-3fa7-d03c-d9a06df8c197@amsat.org>
Date: Wed, 18 Aug 2021 10:47:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 6:14 AM, Richard Henderson wrote:
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/cpu.c             |  2 +-
>  target/s390x/tcg/excp_helper.c | 28 +++++++++++++++-------------
>  2 files changed, 16 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


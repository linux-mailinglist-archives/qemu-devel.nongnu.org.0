Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C604326D5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:47:32 +0200 (CEST)
Received: from localhost ([::1]:32774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXfX-00054V-H1
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcXe0-0004Ha-0d
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:45:56 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcXdx-0005tv-9N
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:45:55 -0400
Received: by mail-pf1-x436.google.com with SMTP id y7so15423843pfg.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 11:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FOr5kh2A4kGl1+rHndxsak5dUkXWm9rnmzIl+egbX2I=;
 b=fwBotZljMwUnSRBoM91vBlEE4hHeow+ruoc30oXJvxN2ZJXAW5xcGJR4R6+1XkUSFG
 ln1ezOo0LG27v6WVpDwQJXGmnFJwbWsBUn/+HMW+a78oLgmrIgdg5d40brfgLduJZODf
 IxkMHTxH/2s23hYvVm16mVebzrgi4IThMAq7RjTBWzN4ULlW2XY77VKvX+oB+28jVSiS
 F7yYQM+75ZaQmBivjZ8/s2zCiZzIx8QnJxxrRe98YHbLemX1aYZsexaat1wlnvBSz+9f
 2YdrpQ1dO0glULax981sXRS/mtQ1qcfRnoDkfh9YzP0hI/cNZb/JlgzOCDsjV27mjAF6
 +OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FOr5kh2A4kGl1+rHndxsak5dUkXWm9rnmzIl+egbX2I=;
 b=Ukm4z2gI/YLl45M4OCYJDzFt/KQBPP7mgHM6+GLp/V4olXqAQ4KcebX3jGQvYk+Hug
 6QM2vYQR29bT9fkRWgeYLUS7iTWPxA25TW9CDA2A262Yoeck+gR1EkfoZNlrx7qkP5vA
 GRuCnxNg72qeVzliZdVplFFio0d+BZwnd4HLGTj8WV8CkviLQgGghLfvd7qHHfWJoOkv
 rY6sSckw7My0ST5vDA7qEJYQZ09J0p1I+wTwSO0EQMWuMMOZFo58uGDvGxeG6vnZn814
 5mnh6foVo2JMZQm6eId3JGrJjUCXtw3eDjvA9VL32qHng+jVIqufkW5GVbZ7TJ9mLMIK
 uoCg==
X-Gm-Message-State: AOAM533eb5vJFR49TXLaFFb34gf/emClMnJ3K74juysFL8XIlHRGU9ol
 72cnVHSDqSV2+VDVDO3pA1k/O1EJ+g6zeg==
X-Google-Smtp-Source: ABdhPJwnms9PWEZJ1nlfBNrykb1c4HnETKz7LjiIuAkjJvNrVv3/R+dYb2lo1bi75axMmX2SLfGnUg==
X-Received: by 2002:a05:6a00:888:b0:44c:c00e:189c with SMTP id
 q8-20020a056a00088800b0044cc00e189cmr30588888pfj.79.1634582751780; 
 Mon, 18 Oct 2021 11:45:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a12sm167450pjq.16.2021.10.18.11.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 11:45:51 -0700 (PDT)
Subject: Re: [PULL 07/23] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211018160458.1976-1-imp@bsdimp.com>
 <20211018160458.1976-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d4a243a-de20-8ea4-fe00-6b84b6ee865d@linaro.org>
Date: Mon, 18 Oct 2021 11:45:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018160458.1976-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: kevans@freebsd.org, Guy Yur <guyyur@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 9:04 AM, Warner Losh wrote:
> diff --git a/roms/seabios-hppa b/roms/seabios-hppa
> index b12acac4be..73b740f771 160000
> --- a/roms/seabios-hppa
> +++ b/roms/seabios-hppa
> @@ -1 +1 @@
> -Subproject commit b12acac4be27b6d5d9fbe48c4be1286dcc245fbb
> +Subproject commit 73b740f77190643b2ada5ee97a9a108c6ef2a37b

You rebased with a stale submodule.
You'll need to fix that and recreate the pull request.



r~


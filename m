Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9417939D176
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 22:32:41 +0200 (CEST)
Received: from localhost ([::1]:38272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpzRo-0002p2-Lk
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 16:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpzMw-00064E-ST
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 16:27:38 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpzMt-0002ID-PI
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 16:27:38 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so9101656pjq.3
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 13:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Ag/C7/Qgfc8c5BgpDwEKx7aFgI3YMAtpI4HyOexZ5tE=;
 b=CV/ijTM/vCcxg19GR2aRBY4lSQQPRlih54B4DCBHnDwM/N2G+YE9Gikv+uZKgFamlM
 mMy1wW5/cioeP3WoqcOuy06SZFnYgbfXFC6wqDE6mtvwLY/2TsH/U1uvDWwfExGrwOyk
 kbj+rXzuaG8K7jxk824UuvAsR6ipX9B8IqyFauaWlILQp2QgHyE/3KRKuMhK2zM9eaXv
 QMxA4QL9rJecqpxxUv8MoJGLteGnFs45Clco+YHvHS+irvQzuqXWXWjQ+uyBGjRftrOC
 dd4ROYS42LZBTZU/2u8KqoRJNP8Ia7nj5rHvRJkJkTrk1HgZRt6mkqRZkjwUSjrmrgdn
 Id5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ag/C7/Qgfc8c5BgpDwEKx7aFgI3YMAtpI4HyOexZ5tE=;
 b=aajIkKdQ8+J6EJ6E+ZDwuOlFqH3/muaKR3XwKXvwXl9iA7sYtQizlbMmstcpBFPeyj
 0rYi3ZkLuKLYjzqSplDKvNFh4RD6X+6FG6IcEfyDKo5Jvx2U5pPaOqg+iYq4BMU7EIUC
 kyCXf6z69IHWD5AbuaRrtPx9j689kdz32i7HpCBRadE6yqXhqeIe0oyX4iLbT57UUqDt
 WGA99keXO33vHwv1g84zb3NB9uo1xDNq5GxaURXNh4R2bprNb0LZDhOD6gYSC6x4wj/1
 aAmI9N4v68s6ScNiCHL8ppy+qdnIK1nBxueu6dQ09aXQWZgy3YpuyJOUzzAAt2pZdHFr
 Mcmg==
X-Gm-Message-State: AOAM530HZ4HgCHCwhxQ50yvCS7BQAzsfV8+Pts68tlekgwrEQxLPs12O
 runMsULFeHBondvQiI5BJrmEpZGVJDGELA==
X-Google-Smtp-Source: ABdhPJxCG16ioUsp+ieNIyMg52Tk5i7b2nsVyykESNTSf+fWBfs2XxbrOOIXy9l00im64/Su3c3I/w==
X-Received: by 2002:a17:90a:a592:: with SMTP id
 b18mr114685pjq.178.1623011253822; 
 Sun, 06 Jun 2021 13:27:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b1sm2629621pgb.91.2021.06.06.13.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 13:27:33 -0700 (PDT)
Subject: Re: [PATCH 8/8] Fixes for seconday CPU start-up.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210603035317.6814-1-thorpej@me.com>
 <20210603035317.6814-9-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1839415a-fdb3-7a8e-f53e-77bc2ad286a1@linaro.org>
Date: Sun, 6 Jun 2021 13:27:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603035317.6814-9-thorpej@me.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 8:53 PM, Jason Thorpe wrote:
> Changes to make secondary CPU start-up work on NetBSD, which depends
> on some specific behavior in the architecture specification:
> 
> - Change the internal swppal() function to take the new VPTPTR and
>    Procedure Value as explicit arguments.  Adapt do_start() to the
>    new the new swppal() signature.
> 
> - In do_start_wait(), extract the new VPTPTR and PV from the relevant
>    HWRPB fields, which will have been initialized by the OS, and pass
>    them to swppal().
> 
> - In the SWPPAL PAL call, get the value to stuff into PV (r27) from
>    a4 (r20), and add a comment describing why this implementation detail
>    is allowed by the architecture specification.
> 
> Signed-off-by: Jason Thorpe<thorpej@me.com>
> ---
>   init.c | 25 ++++++++++++++++---------
>   pal.S  | 13 ++++++++++---
>   2 files changed, 26 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


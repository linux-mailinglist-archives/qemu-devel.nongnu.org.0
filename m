Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92AE660981
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 23:30:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDvCl-0004LP-Na; Fri, 06 Jan 2023 17:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvCd-0004L8-M2
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:28:43 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvCc-00054f-1e
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:28:43 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so6692680pjj.2
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 14:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lf+kgIU/jt0UtT9Vx7FpwiYB+K4LKLKS3ZuPu9aEqYE=;
 b=r1WcJnBYQN3FFr+Deda0yuAoiBMzhAqQkNBEFC/HIuqqk1KCcKS8guHQC9gW/okuAC
 uTSuQxgRqQISj1acdKyv/GpvR9rt5LvBl02ng3D4TnRlBzC3HRGHKInpgcFw4YxF8NZw
 CBJEwkXALxcAqWLhMj+AxX8l029JibYKierhGPL6Psj23zFN9RlSRavb5JNTNKaFFHxw
 Rpry0GhXv3XDEDNQZDFy5avKIbcWDXOKcisG9cYEJtRz/Cu9a7dHllMad/CTYDuF7PTU
 GWPj3E2b4cXFDpJpMoAiWXB8iqlZp9o6C74uNygshJZg45mi9mrHoCMHQzfpKoiIoIvF
 0vQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lf+kgIU/jt0UtT9Vx7FpwiYB+K4LKLKS3ZuPu9aEqYE=;
 b=zDGQ4x0cxwxd5KlzxyNnrzVCGceKcIgux57WjXKkfotd4tE9gAay0gjKbtNylgjoN5
 YL9Pw4gS6vPXfikM6uuQMJS3OlUiIwEzk9KMVenl0C7ZULVBl+pomDZF7UC0nIxLyNYL
 OKjJ4mDkuFy/LAi4A9jTwV6M63rEnINrFiqAp7igZDYTUkgwwR7kl5ZTMcEuZlkfLP3o
 K5kwA/0+x+N5MSkgtZ64bzR7b2POjFueBYsLcZbdJrRgZZRqgbLvb+1YhS/8XA/8Z6V7
 yWfTGOWmN/m3X7OFX+TR08iDivnDLwI40Y9aR6FQm1VoqFZB4IAEvTGxs2ETfF8751GO
 n8ug==
X-Gm-Message-State: AFqh2krCZzcIlpGe0Jz7EyIj/Jrvph9SafJGCOFazQsNPE24AkDELWQ/
 3oincx1biHS0JoBhzMbg5jeaIA==
X-Google-Smtp-Source: AMrXdXtTre4W3nF3E8C/43zmaRgAOja6Tlk2rbzzppYY6A/TGvI+dJabzzH4tWui+7Dsh2mNCSHNlw==
X-Received: by 2002:a17:902:aa85:b0:189:894c:6b48 with SMTP id
 d5-20020a170902aa8500b00189894c6b48mr61161671plr.59.1673044120426; 
 Fri, 06 Jan 2023 14:28:40 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170903120900b00188a908cbddsm1331289plh.302.2023.01.06.14.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 14:28:39 -0800 (PST)
Message-ID: <b3dd666e-582b-e9d4-6dee-364b9dd6d00c@linaro.org>
Date: Fri, 6 Jan 2023 14:28:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 00/40] Toward class init of cpu features
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, armbru@redhat.com, ajones@ventanamicro.com,
 alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <CAFEAcA8K=1CNZfDG8i3bSXXSWT7D2oWg4jyupwYmw8oR7MJVsQ@mail.gmail.com>
 <9f9a6c22-315b-de1e-958e-89963c5e7e90@linaro.org>
 <CAFEAcA8cxJFpB9V826DjSsFOy7VYh5TWXb4vRYDUeOMjQgk-eQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8cxJFpB9V826DjSsFOy7VYh5TWXb4vRYDUeOMjQgk-eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/6/23 13:59, Peter Maydell wrote:
> We also set some properties in code -- eg aspeed_ast2600.c clears
> the 'neon' property on its CPUs, lots of the boards clear
> has_el3 and has_el2, etc.

Yes indeed, but in all of those cases we want all of the cpus to act identically.  Those 
are all easily handled (patches 35, 36, 38).

> I hadn't got as far as patch 29, but
> looking at it now that looks like a pretty strong indication
> that this is the wrong way to go. It creates 3 extra
> cortex-m33 CPU classes, and if we find another thing that
> ought to be a CPU property then we'll be up to 8;

If we find another thing that needs to be different between cpus, you mean?

> and it becomes visible in user-facing command line stuff.

No it doesn't -- command line is *not* affected, because both before and after, all 
properties are applied identically to all objects.

QMP is affected, which is where I stopped and started asking questions about what QMP is 
actually trying to do.


> I think our object model pretty strongly wants "create object;
> set properties on it that only affect this object you created;
> realize it", and having one particular subset of objects that
> doesn't work the same way is going to be very confusing.

Eh, I didn't think it's particularly confusing as a concept.
The code is rough, buy what one might expect from an RFC.

We really ought to have *some* solution to not repeating property + feature + isar 
interpretation on a per-cpu basis.  I'd be delighted to hear alternatives.


r~


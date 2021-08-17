Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210FD3EEF4B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 17:40:12 +0200 (CEST)
Received: from localhost ([::1]:42776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1CF-0006wZ-6S
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 11:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG1BD-0006Gq-15
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:39:07 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG1BB-00077e-F4
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:39:06 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so5906613pjr.1
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=49k5lNuKi0C/FVQyAAPuKSHr9GpSHr5Y39UmzA5YGiQ=;
 b=VkIkBU8hSYbnSewRJockkpyeZMUgW7mIu61deizqviF9TFZN1tcp2pCS30BcRedpcV
 n3F8uMc3e2R39trxqU1kDHDCVEhtFek2UXzeT71Xx4hELuDSCKZexLoiRdTY/reZTha5
 0Kg+EiRrGDZaCPId1oxicK5nW4JD55W+yInmgxAh9xAr1+Mq0mdelftrS8UuUsXx1ccj
 VfyMiJokrYjdrQIcGmz/uTDUGeRgVsDHzKOoZl5Fjv/MCpW61FMzObHO2eunwA5zjxsq
 jBoWRh96HaA6C+GEZ7yMbATQIWZGrOlmcrIB6MIsYT6EOLTHccPon4mg/zAy7P/jOCYw
 3Veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=49k5lNuKi0C/FVQyAAPuKSHr9GpSHr5Y39UmzA5YGiQ=;
 b=P/l82DgtnoMte7PrAXpTU2+uamjfimFPszxo92vjylGE65McgqG4hJlWpijvDYOrn/
 vGEb56016C7c9f55UstAYuECKIQmaXTk05od3VY3ygywf2L4KikzJcCTknsgha7rWHCv
 JqYlYrXrHcwiJVf75wsNYVBAvLh5GldmNmG4OTDkoNV5UrPtxtFdUbFcBqZDjqhvSso6
 uJO6nh6fMfKHdlVprtMLOxzE2+iKdGExWBh7+ZbXq2cplp+TH0fULwWIHO4UPL/hLSkI
 qT/d/bca8pkAEuEpvAwdeCxXqpKhf2x5aJ+xeqpO2rGPMBu+Ml6jAby674eoWOxMnzik
 OcTA==
X-Gm-Message-State: AOAM533Z212aYx4SPQZW4G+1/5MpKzFSVe8uj5qPO2rR3dHfWSBnewzg
 Ols4FUvaE7sWs2lgEdyWbinCKA==
X-Google-Smtp-Source: ABdhPJwgEtPCFD7oKNuEtQcXhAy1ygDQtYummVFy9+HoeZ8zhMBhHanqOYcn1XzWf+q4A9QknRqp2Q==
X-Received: by 2002:a17:902:da8a:b029:12c:6f0:fe3c with SMTP id
 j10-20020a170902da8ab029012c06f0fe3cmr3237521plx.41.1629214744007; 
 Tue, 17 Aug 2021 08:39:04 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id nr6sm2537820pjb.39.2021.08.17.08.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:39:03 -0700 (PDT)
Subject: Re: [PULL 24/27] accel/tcg: Move breakpoint recognition outside
 translation
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
 <20210721195954.879535-25-richard.henderson@linaro.org>
 <CAFEAcA-nH4xYDG4wh_jYcSZt9ahNrt3WK453tqwD-0mqYekzeg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00aaafa2-74dd-3c19-1d47-93bc2fc0d83c@linaro.org>
Date: Tue, 17 Aug 2021 05:39:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-nH4xYDG4wh_jYcSZt9ahNrt3WK453tqwD-0mqYekzeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 3:33 AM, Peter Maydell wrote:
> On Wed, 21 Jul 2021 at 21:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Trigger breakpoints before beginning translation of a TB
>> that would begin with a BP.  Thus we never generate code
>> for the BP at all.
> 
> I happened to notice in the Arm ARM today a corner case that this
> implementation approach I think gets wrong: the priority ordering
> of exceptions is supposed to be (among others)
>   * (architectural) software step
>   * instruction abort
>   * (architectural) breakpoints
> 
> I think that doing the bp check here means it is incorrectly
> hoisted up the priority order above both swstep and insn
> abort.

Hmm, you're correct that we get this wrong.

> We probably didn't do these in the right priority
> order before this series, though, and I dunno whether
> we get the insn-abort vs swstep ordering right either...

And you're correct that we got it wrong beforehand.  The reorg did not alter the 
recognized ordering of the exceptions.

I'm a bit surprised that insn-abort comes higher than breakpoint.  Fixing this would mean 
performing the insn decode and only then recognizing the breakpoint.  One of the 
intermediate versions of the patch set would have allowed this sort of thing, but I didn't 
realize it was necessary.  And it would be a huge job to alter all of the trans_* functions.

Fixing the order of swstep and bp can be done via the arm_debug_check_breakpoint hook. 
Just return false if swstep is enabled.


r~


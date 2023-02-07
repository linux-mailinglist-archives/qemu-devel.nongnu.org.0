Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD368CC83
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 03:18:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPDXk-0005Wh-0a; Mon, 06 Feb 2023 21:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pPDXh-0005WL-Tg
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 21:17:09 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pPDXf-0001mu-KM
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 21:17:09 -0500
Received: by mail-pf1-x429.google.com with SMTP id 203so9771595pfx.6
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 18:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y69QCZx6QV1++3xpManZ1oRAYSi3hpAvSHoTAJ193+w=;
 b=XB8gcb5ffSGVT+CFTO0XV/WpI//H70Vyez4kfz4hmra+Iq1UX0h5RSkUAVPUgvBFol
 6sk9qwPDZ+0ZzvcZ+zttZ0bqTzPUBFLHTiJgt7PLByMkOXYi2DFUaHJfKzhFEkWudn+5
 TirU/ZWMmqgkErP70UryFa/+pIdTwudpA5oncgLZJMp1QdSfzmmC4aO56ML3x7wsIoFI
 XFgTq9u6iPYUMnZThXxPBPj8ZvQFDcJEXsW8/sLXkw/XHg1O+hpMGM+VvMLwyGLN1ktb
 jn8agHjLduBpKog1chEZGelvUzKQDzNFEo/Y8XSsdSaG/oOa2Po2HMYEntCtt0Gh/+Y2
 yEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y69QCZx6QV1++3xpManZ1oRAYSi3hpAvSHoTAJ193+w=;
 b=kqwuGrZJeF4ffgJRMB3TOdPgPLWRyvNDd1VK8BmP81R6rNFpGSUP09/NTnQtOG0GfQ
 zDPmrOhC8FZcSbrJMnevXav02eH1v4QXyIEG9vGh6vFRML69wqgDLPFwv45qqpYUVdRo
 sK2S1kUlxL8fKkg04Ny5p7LlBYQDCds5kCCgEuqTPCLW9SX41plOaKERf6v87u9pgdJf
 dBn9uRQJxZJqR5N+zkphnNNIAy8Knp+qyT8XiKw3RWrp8scGvfsVljVnZskaFRQi+CEs
 HQa9bCcQcA2YSVao4QodD839ZUlhVELp1MrhQXca1BMxnP/RNY3cJKL8MacChjeA00xD
 qWuQ==
X-Gm-Message-State: AO0yUKWLREbacke43afr1Ctn6x4K7IF/DZc2BGm4vaozsrZYNWdmtrE8
 JTJGpdZ9KK2prg2yMKEgRy4=
X-Google-Smtp-Source: AK7set8r+0EPGikWBZK+M14ONLNVzGn5Pk8EFpKTJdEx0Lb/d5uepiX6oyuL4S1NdZ9SeKtQfBxKxw==
X-Received: by 2002:aa7:9599:0:b0:5a7:a075:febc with SMTP id
 z25-20020aa79599000000b005a7a075febcmr483671pfj.17.1675736225756; 
 Mon, 06 Feb 2023 18:17:05 -0800 (PST)
Received: from [10.213.26.147] ([157.82.194.13])
 by smtp.gmail.com with ESMTPSA id
 p128-20020a625b86000000b005939fe1719fsm7872018pfb.39.2023.02.06.18.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 18:17:05 -0800 (PST)
Message-ID: <8c33a708-9805-b6c8-70e8-9ee0dfb73ee6@gmail.com>
Date: Tue, 7 Feb 2023 11:17:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: pixman_blt on aarch64
To: Richard Henderson <richard.henderson@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <4b519268-f8e8-6542-9d1b-34054879eec0@eik.bme.hu>
 <a7866129-9f7a-02d6-1e58-bf05e1bf89e4@eik.bme.hu>
 <410c3da9-9be5-a715-7b7a-48bd67355c9c@linaro.org>
 <e615e033-a3f6-083f-5f0f-eb506c3c5b4c@eik.bme.hu>
 <a8ca919f-c6fc-70cf-0574-261fdad81d96@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <a8ca919f-c6fc-70cf-0574-261fdad81d96@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2023/02/06 4:16, Richard Henderson wrote:
> On 2/5/23 08:44, BALATON Zoltan wrote:
>> On Sun, 5 Feb 2023, Richard Henderson wrote:
>>> On 2/4/23 06:57, BALATON Zoltan wrote:
>>>> This has just bounced, I hoped to still be able to post after 
>>>> moderation but now I'm resending it after subscribing to the pixman 
>>>> list. Meanwhile I've found this ticket as well: 
>>>> https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71
>>>> See the rest of the message below. Looks like this is being worked 
>>>> on but I'm not sure how far is it from getting resolved. Any info on 
>>>> that?
>>>
>>> Please try this:
>>>
>>> https://gitlab.freedesktop.org/rth7680/pixman/-/tree/general
>>>
>>> It provides a pure C version for ultimate fallback.
>>> Unfortunately, there are no test cases for this, nor documentation.

It can share the implementation with fast_composite_src_memcpy(). 
fast_composite_src_memcpy() should be well-tested with the tests for 
pixman_image_composite(). arm-neon does similar so we can trust 
fast_composite_src_memcpy() functions as blt.

>>
>> Thanks, I don't have hardware to test this but maybe Akihiko or 
>> somebody else here cam try. Do you think pixman_fill won't have the 
>> same problem? It seems to have at least a fast_path implementation but 
>> I'm not sure how pixman selects these.
> 
> For fill, I think the fast_path implementation should work, so long as 
> it isn't disabled via environment variable.  I'm not sure why that is, 
> and why _fast_path isn't part of _general.

The implementation of fill should be moved to pixman-general.c but the 
other part of pixman-fast-path.c shouldn't be.

By isolating the non-essential fast-path code to pixman-fast-path.c, you 
can disable it with the environment variable when you are not confident 
with the implementation, and that may help debugging. However, if 
pixman-fast-path.c has some essential code like the implementation of 
fill, the utility of the environment variable will be impaired as 
setting the environment variable may break things.

> 
> Indeed, the fast_path implementation of fill should be easily vectorized 
> by the compiler. I would expect it to be competitive with an assembly 
> implementation.  I would expect the implementation chain design to only 
> be useful when multiple vector implementations are supported and 
> selected at runtime -- e.g. the x86 SSE2 vs SSSE3 stuff.
> 
> 
> r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA2065E4EB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 05:59:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDILD-000361-Fl; Wed, 04 Jan 2023 23:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDILC-00035k-1a
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 23:58:58 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDILA-0002ue-Bd
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 23:58:57 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so916101pjj.2
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 20:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cSQYyO0J5jDt1kMA4Vqftdcrd+GYsrnUON288QLbQT0=;
 b=tJMwj8CIbDP+ReB7sc7ttfaspWDsfFRhVG4zFyhXmZsvWQyesOF7CBDPcNGhYVh2yd
 qnUVHIg5iiLxkQEx/4bbPgPYMeFF0Ovrw/iVVvuBGH0J2XMsh6lwtUHTq+Fx8/0IcF74
 GQXSevSeAPF1ZezzUUU3MuS4HiVaSYJ9e6LPoOYMEPgb2M2DSdeZOJfzy/WEYSJjFvhm
 Aasw8aL6pZYLsC64Ay2fTCRHGLWvFq/PaTF2Ih6ihIW+amYLcYT4MOGVscNkmqQd3Crw
 yq1+rN4qm0GmCrDJXFpE0UCVKR++/Zk6boSFRECpZyCSTXITJH65Ji0WvquVX89l0MrM
 I7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cSQYyO0J5jDt1kMA4Vqftdcrd+GYsrnUON288QLbQT0=;
 b=zk26wUlgJ8FdSLSurLvvTp9ZnhKlKiCyvoCWMipKV/iSOC/b6jiFXS5REOPaL8jKAx
 SbJCFFu03t4e5mlRDGtYHNs+9ouxItmiv8+J1p36p8GWgOBTojipBga1nC0EQ102E5aK
 M3Whp1OI37v6g7Tg1KbE7FPSsKTK0MWCD6R2/zR9TtoN/QBAAK4zab9dds0K9fe+5SHB
 OuTWCug9AMbR4z3ZoSoIe4HPFMaQ0LpOyS0PlIC75h2MRK+KfYlVrMdA5oVtXX7YBUc9
 U/v/6rCCq1M4BmGd1eHHF6cZ8CruNJgqHhIEtvKn0snlMarHTexu6z/0+Sxiu9yv97Pw
 SVAA==
X-Gm-Message-State: AFqh2kpY5TcPaww7Te+yMs7+hxRl4JYprK5q+o8Gzvxy6LYbS2Yw+t9W
 0N3rXblhszzCC6Th0PL8ny74Cg==
X-Google-Smtp-Source: AMrXdXsbfvCR0b+lvDUD8kQMsH/0Lu9tWBfqmj1CiJfDpt/1dH3jfEnDwqSEAnTJhJ78re23y7+Wsg==
X-Received: by 2002:a17:90a:917:b0:219:49c6:5385 with SMTP id
 n23-20020a17090a091700b0021949c65385mr52495672pjn.45.1672894734032; 
 Wed, 04 Jan 2023 20:58:54 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a17090a8b9500b00223f495dc28sm415467pjn.14.2023.01.04.20.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 20:58:53 -0800 (PST)
Message-ID: <2b66b91d-aae1-a94a-053b-05af0d5d59a7@linaro.org>
Date: Wed, 4 Jan 2023 20:58:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 19/27] target/arm: Move common cpregs code into a
 separate file
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-20-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-20-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 13:58, Fabiano Rosas wrote:
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Extracted from:
> https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
> [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
> ---
>   target/arm/cpregs.c    | 482 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/helper.c    | 472 ----------------------------------------
>   target/arm/meson.build |   1 +
>   3 files changed, 483 insertions(+), 472 deletions(-)
>   create mode 100644 target/arm/cpregs.c

Ok, now I'd like to know what the intended difference between cpregs.c and 
cpustate-list.c.  If it were only write_cpustate_to_list and write_list_to_cpustate in the 
latter file, that might be one thing.  But get_arm_cp_reginfo definitely belongs in cpregs.c.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA64F4EA309
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:37:50 +0200 (CEST)
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxzh-0008U2-Ss
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:37:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxxx-0006ZT-OL
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:36:01 -0400
Received: from [2607:f8b0:4864:20::1035] (port=56192
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxxw-0007DG-8f
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:36:01 -0400
Received: by mail-pj1-x1035.google.com with SMTP id jx9so15598091pjb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=F4T4RN83CgCi1SS+ch9bm4LABcHjyFKSZJT/7SvpXN8=;
 b=H09alWDPpZbwF6G7VN+0muKCo5R3O5nfGvONNTxy9kjYU/eqaM4C451jsjh7wS3ulQ
 nPkC19ohrsDmF1QmdZwTZB5I3o8dgejmsFSKFNPUR/XeoakqMPW3npmrM12V125Av/1Q
 y4I9PPIQv7j6aMkryIAh6+aNFugQ2GWU+4Oe7RhP7+yDLLXy0RiiyuEGGOK54wz0Ervg
 czXRRZ2k0SbhFTUhEcvMka3cp0P4+mn6/MyjVUb0cBHjP23I7HUztdq/qUxsN17OI2uK
 O0tDH81Id9VaTeT0yYjtb4b/mhSf0PNeL/k8U3aUF1Ss3lBd+Ir8pTVAXZb8J2cmallX
 JCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F4T4RN83CgCi1SS+ch9bm4LABcHjyFKSZJT/7SvpXN8=;
 b=1dj8DRwUlGMJUWfD/tR88KyRg5qKj6zF5xbh6lweHKzpsoD1acwo96ihyrYC+Zo2p/
 0ZBSKbwOobeGQD4CzY6CSZ4u+UKOeqDpnlnP3Y5oU9QiW/43iqwn64keiUTHwebDofzv
 /yh56x4Ap+o3+oRkeBf4jkWlxo5MoWICKLA0XhLuQTEFAUMCfKYL8yg6q9l9nKfJHrOV
 t6WSeAg4g3N8pBajYpjrT6xu5yJS2q+t6I8efkcsxdA847bWaLXw5fywHenBR0/GDCCU
 J+IBUSv8Ra1hlLxxkUVbvDDHMrOPBP8mUav6ox1bKUl3AYD9PIaI00ElV5Pbl11oySdb
 +P2w==
X-Gm-Message-State: AOAM532xyqVFDrTtIAScxJPvPelQaoyryMwqjMG+I2kH3VKH24rmZ8EQ
 Z+XD7/PCowT4yGq76UTKsUA=
X-Google-Smtp-Source: ABdhPJzeunkDSXKT/Yd6VxV+A2oGoDmNBQinOSAn2jNDc0ZSosekRE7S3Wi3b7NkJ82ASKL/lRMg3Q==
X-Received: by 2002:a17:903:28e:b0:156:1b99:f9d5 with SMTP id
 j14-20020a170903028e00b001561b99f9d5mr4107019plr.75.1648506959034; 
 Mon, 28 Mar 2022 15:35:59 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056a000c8700b004fb55798f64sm5998353pfv.90.2022.03.28.15.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:35:58 -0700 (PDT)
Message-ID: <faea0e0e-3659-6a6b-39d4-e77294a7a178@gmail.com>
Date: Tue, 29 Mar 2022 00:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 09/15] tests/tcg: remove CONFIG_LINUX_USER from
 config-target.mak
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220328140240.40798-1-pbonzini@redhat.com>
 <20220328140240.40798-10-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220328140240.40798-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/3/22 16:02, Paolo Bonzini wrote:
> Just check the target name instead.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/tcg/configure.sh              | 2 --
>   tests/tcg/multiarch/Makefile.target | 2 +-
>   tests/tcg/x86_64/Makefile.target    | 2 +-
>   3 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


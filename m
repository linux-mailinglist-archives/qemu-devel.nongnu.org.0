Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F271A3551D2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 13:19:00 +0200 (CEST)
Received: from localhost ([::1]:50830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTjjY-0003Ue-2N
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 07:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lTjhG-0002e2-KS
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 07:16:39 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lTjhF-0007H1-8I
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 07:16:38 -0400
Received: by mail-ed1-x533.google.com with SMTP id w18so16140264edc.0
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CKvLgXraYd2O5txHvk2oaszbCny5pzDW7ilHQb74JmY=;
 b=WXPfdodVuU0PxpCYWmhEQKC3DUoUzlP+e30ua84Ek2YsHksw79wlFMT/Pql4cn4/oN
 W+D4Ajbxbnovu2aL5sK2nH1rtH9uoJQfMWo6o/FWBRY/DzWpVj7PUY7JKNyIvWBX0xWM
 G96xT6LCKqJLezEV613oehabwOVc8m9pEAEfQXuL8+UDUHYDC2Am6BbnKxMs01Mw745U
 BtZkuq+IYn1bI+8nN9A74wq9HNKbd5kfUoO1zWiaeD1DL7we9jsvomRoIlhGvuiTQSW/
 oZE9VAOX9kiQ2ZHdJoIvIn7QyBzhYK18zZAiJAIt8uJD7E+KQ0qpdtkXZALhMs1OSDBe
 AMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CKvLgXraYd2O5txHvk2oaszbCny5pzDW7ilHQb74JmY=;
 b=WRR2F0LqH1BJcRG/tfRtKG+c0Bro89lB6Vrnh8k5dAelIjDtW5o1Q1G6kuiV6LCM3a
 9Mzzpeq7W7GKid0kgrXmpYz4DeDUPgPDANKf6u8I6FMPcVGgkLlK6NJ/mirG1SbXkyuD
 3nkPP4Nw0NNnsb0VUsABTeBdEpiZBeWeP8PAqxhlYDyDcFQr6jklDUyHAyf0kF9IjWXP
 yEwKxehYoBpzIBYsTqVRRl4V5ikoPgvtCJNYmL0NSDSkFghK0ykr5lj1W61H82+m/xt3
 ISVRqN2F5DmwoEbEd1hy3RoHpaJZDz902GTUUdW6/aYrTUeSod4ZzHh83ghkoDKPMV57
 WQEw==
X-Gm-Message-State: AOAM531TnGdvW0hI6ueq347IBgyS1ctaKCriexqgzlqw3bPKAXEYJUx/
 a3e5pbJu75CKzyvTxjiFYoE=
X-Google-Smtp-Source: ABdhPJygaMwBeF9BO8oHk4AAEh/qEyOwGem/iLrxtVk+gK2A0QoapJ6OkK7fNwH/VKV+7EDtpvy9ww==
X-Received: by 2002:a05:6402:17af:: with SMTP id
 j15mr37574814edy.50.1617707795915; 
 Tue, 06 Apr 2021 04:16:35 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id dj8sm6650049edb.86.2021.04.06.04.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 04:16:35 -0700 (PDT)
Subject: Re: [PATCH v2 03/11] tests/tcg: add concept of container_hosts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210401102530.12030-1-alex.bennee@linaro.org>
 <20210401102530.12030-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <664ed8dc-5b6f-8f75-f4c0-0720fe5c2b22@amsat.org>
Date: Tue, 6 Apr 2021 13:16:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210401102530.12030-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 12:25 PM, Alex Bennée wrote:
> While docker is nominally multarch these days it doesn't mean our

Typo "multiarch"

> distros actually package all cross compilers for all architectures.
> The upcoming Debian bullseye release will improve things further. At
> least for now we can get things like the 32 bit ARM compiler on it's
> 64 bit cousin.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configure              |  2 +-
>  tests/tcg/configure.sh | 27 +++++++++++++++++++++++++--
>  2 files changed, 26 insertions(+), 3 deletions(-)


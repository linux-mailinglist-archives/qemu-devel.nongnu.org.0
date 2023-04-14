Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132086E2574
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:18:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKF9-0000yN-2m; Fri, 14 Apr 2023 10:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKF6-0000yE-RF
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:17:37 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKF3-0000Rv-Kv
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:17:36 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l10-20020a05600c1d0a00b003f04bd3691eso20857327wms.5
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 07:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681481851; x=1684073851;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yzl5VY9wS48oTS/ZJUt5hlNf2gyi5s7DwZSp8jRY1l4=;
 b=aZGV8pAYq+Y0Pp2l4V1k4f8zGroLmV+kE0hTFBtPsgQRUeaw61YUSBvjDYWj730fzg
 RxbLAg9U9K36KYmEkIxAUIeQStavZiBzkpCMo0uckKI7JVlJxnh0dx330Dm3Xz+4U19J
 jjigUGZbb4jvV7bUonBpaW8WHVTwxwZvINWXhXWhjbX1xGerqQEf+2hNOdSdzNoivuvv
 MVMGq2etjRvJFX7d4UEOKSm+d/Z494+PdMuRjSXhAgSO13aZlaiD7EePsCYf0Iq3JgpM
 8liJdfxdAMDdQoFGPUS9dlHCAndpk5Y5GqDp/guUYvjSzVXwc6QEcllvU/3UPkg7ru/8
 uLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681481851; x=1684073851;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yzl5VY9wS48oTS/ZJUt5hlNf2gyi5s7DwZSp8jRY1l4=;
 b=ZbeO82YaONs10Wg202vm1kTpGF5Xkui+dyum8JxD9CJaaf6oIMjDCM4O+IkY0Wd+aP
 VTGAoiKkZMMWctS58p/aSX/4gR2EILUQvUXPjs4hS/yDNCN5MSUtmbfBLihdhDJ1oNd0
 hte47fTaeyIFexs20RhOz3pTGRF3MrsMPWpreb5/SikbA2ZacfIP+1FdSVl9C1TJdK3/
 M33aNTdBUXmDyj0bnLSng3vZYaL+tWg5vD90PTlM7XfyowjDywU2nmQEp4j32/Gblbkp
 FCM1MzLS/bHAkvXHk2XKdERa4nMreCvmmv3WjzZPFhP+bkwzRKDi5cu2FR4tXAimLNnW
 uxZA==
X-Gm-Message-State: AAQBX9foZ9tfvhEKC4qfdPZm4sNeMCU8TZNuIzYNFtEfPZRwAQIHfgqs
 HaPGJfx9vRHRRHZw8B1pY/hktQ==
X-Google-Smtp-Source: AKy350aLfm8GfGIVyqn42+sNIDJ0X9CsiXBrznJAWhCVLA2yLEyf1UlnILTzkaJ7hwL8GJR/FScJpg==
X-Received: by 2002:a1c:7c1a:0:b0:3ee:4bd1:39ca with SMTP id
 x26-20020a1c7c1a000000b003ee4bd139camr4853359wmc.13.1681481851143; 
 Fri, 14 Apr 2023 07:17:31 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a1c7213000000b003ee58e8c971sm4413119wmc.14.2023.04.14.07.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 07:17:30 -0700 (PDT)
Message-ID: <79c081b9-cb92-b2aa-2ae8-1ec4824cdcf5@linaro.org>
Date: Fri, 14 Apr 2023 16:17:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [RFC PATCH v2 02/10] tests: add python3-venv dependency
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230414055449.4028284-1-jsnow@redhat.com>
 <20230414055449.4028284-3-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414055449.4028284-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 14/4/23 07:54, John Snow wrote:
> Several debian-based tests need the python3-venv dependency as a
> consequence of Debian debundling the "ensurepip" module normally
> included with Python.
> 
> As mkvenv.py stands as of this commit, Debian requires EITHER:
> 
> (A) setuptools and pip, or
> (B) ensurepip
> 
> mkvenv is a few seconds faster if you have setuptools and pip, so
> developers should prefer the first requirement. For the purposes of CI,
> the time-save is a wash; it's only a matter of who is responsible for
> installing pip and when; the timing is about the same.
> 
> Arbitrarily, I chose adding ensurepip to the test configuration because
> it is normally part of the Python stdlib, and always having it allows us
> a more consistent cross-platform environment.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/docker/dockerfiles/debian-all-test-cross.docker | 3 ++-
>   tests/docker/dockerfiles/debian-hexagon-cross.docker  | 3 ++-
>   tests/docker/dockerfiles/debian-riscv64-cross.docker  | 3 ++-
>   tests/docker/dockerfiles/debian-tricore-cross.docker  | 3 ++-
>   4 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



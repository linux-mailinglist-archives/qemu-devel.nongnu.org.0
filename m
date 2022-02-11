Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD0A4B2F1E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 22:11:11 +0100 (CET)
Received: from localhost ([::1]:37596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIdCA-0001Dy-2f
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 16:11:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIdA1-0007zU-OW
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 16:08:58 -0500
Received: from [2607:f8b0:4864:20::42e] (port=40778
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nId9v-0001aJ-7k
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 16:08:56 -0500
Received: by mail-pf1-x42e.google.com with SMTP id a39so17538999pfx.7
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 13:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KvBmh/CZ/sWwt72gvRM5m4DRUd8nt0syzXPJsN+auJ8=;
 b=AOs/PwuRLawJZ+D4XIJnBJHG9YUlqHod8Qk4EoWV7iJauIS9PRyz97NrfhB7bp+DhM
 Xm3NpNN91Fn+touE8m8MgoRGZki4zTtwjl8KHxPSNzUFOaZXr7waVv03OQQTMpMU+Xd3
 K7K36PYTx3zWdABj1bTrdJ55J1sgRPVgZou0BJR3KDsQnIMXAaMwYFqrk2lTk/M6bUI2
 9Xik+e35PGVogtjXB4aG63d2vEaBADbQaoRJeRyAiFfXP9pOZ/Xpzc/l+k1j5ZiBw3jB
 RmJmY89LJZXLW3ugdk7BvoBRYxX2VWOjs/TLDm0Pv+Oba1uoqIUHbUz9oxqudENw7Jdm
 f4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KvBmh/CZ/sWwt72gvRM5m4DRUd8nt0syzXPJsN+auJ8=;
 b=qGaARRIsFtxqQ0Y8vHI6VY2Rq9RS04sFy3O8i3+waVSQ+ppBciASCSNa+x2OFvrW+J
 FzLLKeeolo6Hvlxk+d/17LkxpkWXmOU13jMhMhZGR2/kKrPlGSdTVssGunfaW/M5grwq
 jNUyoCjNzUIamBaSLfIgXQ88GYwJ61DfC1u6lrjPVSjMFaFQzhCbjgrCe6OiiL7JJaPZ
 XnoyyS35E4n/6O+k9PFzS26GQR+sH8MaPH/rS5QJ1CzkbrPLU0ExWGPP2ttK4EMixlrx
 ks+n8GHDtdR8mImlpDUcmJtrGTezuxq410GvX4+tQ2aytXdM770/y9oh52qqOeX+GhAU
 oIUw==
X-Gm-Message-State: AOAM532H6oQe58kEh7wQVZInDktkOBH9DbH8GaSzXyVCSyJhy/J+u8Pb
 hZ6PqmZNDqTD8ZU5ffJB4LuqIA==
X-Google-Smtp-Source: ABdhPJweSddqvOBLG7DbRTZePJO2Msv0n/5fqZ6ytcxNkJw5D9VNmTrBA3RyJLmW4N4g4lQosygGdA==
X-Received: by 2002:a63:69c1:: with SMTP id e184mr2829747pgc.495.1644613729695; 
 Fri, 11 Feb 2022 13:08:49 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h10sm29238609pfc.103.2022.02.11.13.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 13:08:48 -0800 (PST)
Message-ID: <f89c70d5-6159-9dd0-0bd2-00efdca12b3c@linaro.org>
Date: Sat, 12 Feb 2022 08:08:36 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 04/11] tests/docker: update debian-arm64-cross with
 lci-tool
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220211160309.335014-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/22 03:03, Alex Bennée wrote:
> Using lci-tool update debian-arm64-cross to a Debian 11 based system.
> As a result we can drop debian-arm64-test-cross just for building
> tests.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/container-cross.yml              |  10 +-
>   tests/docker/Makefile.include                 |   3 -
>   .../dockerfiles/debian-arm64-cross.docker     | 186 +++++++++++++++---
>   .../debian-arm64-test-cross.docker            |  13 --
>   tests/lcitool/refresh                         |  11 ++
>   tests/tcg/configure.sh                        |   2 +-
>   6 files changed, 173 insertions(+), 52 deletions(-)
>   delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.docker

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


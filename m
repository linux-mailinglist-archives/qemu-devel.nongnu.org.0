Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A06F038C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 11:43:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pry9a-0000cL-Gl; Thu, 27 Apr 2023 05:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pry9V-0000bs-3G
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:43:01 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pry9T-0006lE-Ib
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:43:00 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50a145a0957so4922305a12.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682588577; x=1685180577;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UjuGkTdjn1BEI/rogFw66bE622CeRZElOUK2WYq7fLE=;
 b=GElwfaXuDk9GTxKxaM/ehAX2Ii6g7SOJkIkWyBELgoplxQAWaRU4xdIdB/C9QU7/XL
 1vyfosNrZo4GLAiAt4zpi7Cf1fI/0NQ2HYwElSOufLf80iJO9PYQgleHLKCvtnE+ZqTv
 q31eRAqBLn+WNSeuBh7ZtrrzNJdTokmU68sdpVoA5LKBa3QADZEqDPsAbVQPcoT0E49E
 sZ2SiaWE2o1UjHlZcPfdG7b79UjSTPo/fD9StghHYfF2sJGUVH8IYQ72A/O20roxydD/
 tywG0xd6ubpKNtrM34V7fwoa2BrSg4n7AHiDpoGAe9kz73uYZk1EUooEaVkis0rbozNw
 C5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682588577; x=1685180577;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UjuGkTdjn1BEI/rogFw66bE622CeRZElOUK2WYq7fLE=;
 b=A0f9vGAdEU8ndsl+REk5WEk2FirlY3SkOpMhcpXV3M/LXrmX/nlWo12v3FJK3WcoBf
 maChGn2epLWP6QWm8/ENuE6eFcqkqE/eztY4D4azQcptpKb5/lrtDCg7odGkJZtVMU8p
 xOI3453tcWIIN2sDwVU3LUvPEB1cA7l30HgbH0V6QhjeDiU0A4rPZpHLkKKV9lgndSzf
 6gXUVsPUP6CiXu4+cfyZ1T+eAonfMC4LQj+zzlEE/RJar/1Ewi73rV9wVmV1Iq7XLMGO
 0HpFkHRyaQoBjH+shX9emmdNuBRl9FNO8bwr1HcwpZqPw7AuLVgTy1Wk2IGEPalZDzII
 pcSw==
X-Gm-Message-State: AC+VfDwbCtyBVdJfhfj+ID+4Q0ZbMHaNa/RyAl38Px6dpSzQ3ugfnlAv
 ddmieypMDI3y7i5QoKkqLSd7kQ==
X-Google-Smtp-Source: ACHHUZ4cQDp2fgrLlcEt7ZEw38ItNhVsGf1nIL+RTlSNR2QbHaBDou2b2ngfz57LKXPsNM9GUG247Q==
X-Received: by 2002:a05:6402:26c8:b0:4ea:a9b0:a518 with SMTP id
 x8-20020a05640226c800b004eaa9b0a518mr4495085edd.17.1682588576789; 
 Thu, 27 Apr 2023 02:42:56 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a50ee8c000000b00504ae3a5adfsm7801757edr.2.2023.04.27.02.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 02:42:56 -0700 (PDT)
Message-ID: <e96ac25e-0a1b-942f-4103-8aaab51c745a@linaro.org>
Date: Thu, 27 Apr 2023 10:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 08/13] tests/qtest: Fix tests when no KVM or TCG are
 present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-9-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426180013.14814-9-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/26/23 19:00, Fabiano Rosas wrote:
> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.
> 
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
> 
> Skip tests that crash or hang in the above scenario. Do not include
> any test cases if TCG and KVM are missing.
> 
> Make sure that calls to qtest_has_accel are placed after g_test_init
> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
> printed before other messages") to avoid TAP parsing errors.
> 
> Reviewed-by: Juan Quintela<quintela@redhat.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/bios-tables-test.c | 11 +++++++++--
>   tests/qtest/boot-serial-test.c |  5 +++++
>   tests/qtest/migration-test.c   |  9 ++++++++-
>   tests/qtest/pxe-test.c         |  8 +++++++-
>   tests/qtest/vmgenid-test.c     |  9 +++++++--
>   5 files changed, 36 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F08E673F13
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 17:40:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIXwR-0007eg-MX; Thu, 19 Jan 2023 11:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIXwP-0007eP-BH
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:39:05 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIXwN-00070P-No
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:39:05 -0500
Received: by mail-wr1-x434.google.com with SMTP id r9so2434932wrw.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 08:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0fA3/xSo97EG6W+vqxsCOkb3TOwJgKJLILKWNMQHOs=;
 b=NlImp0KkjmI2qhtpGCvEYRkNPmwhbHGffmNHqGe57x9PN9bzRNP7ahjR90fT+8GO9z
 dAMfIMshWbeC4cIBxyqjSLypVNHwp6RL44N7q+dIbTdNC8tw8MqfpvGVyoP/ay14pbW7
 E890Strx6V/6vWYCbA1+wpBJxB6mSEkMoydblWg09oDiqZI4Yr4Erk+uIWHfWU7p30fa
 YHQNvw3gpILwUjiplSmpRcTFPGM1dlUyfpY43XOipI93dsVj3qpN3zW0zLc992aaBzBh
 dFn3B7C1j5iwLKLUvlbHAEphJne1kya9O6RXp0dXQoIto/gV28/MdzojP26f62yyiWNp
 kzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=d0fA3/xSo97EG6W+vqxsCOkb3TOwJgKJLILKWNMQHOs=;
 b=2NHm3gk46ebkHBo9HNBHAxvp96Ir14+p1AjzQHE4vryrjxzy4EX7zdgg1xFy2NBimj
 /0+1FJbMSr1Qkkp9pMZwTsMR+SJzAw0B+qRX1herST0OduG+MTwGzImFhi3Ji/ilQLF0
 EtuRUmCvsh4egEfsu4bY4o0hp0WmrAZJxT+EDkNSv1C3bx6G1jnRdsp1KdXojvc8rFOi
 9vYG6T8hnq+VEE44eaXQKkG9aU+X1uPpv4uOAxA5o1A65b11Zhlo9ZZVi/zS/ZfXwoas
 Y8+F0WSjQa16MGKoCvcpnDsiYHDKC3cA66AQTCc45ETkFdyt/BEKek7R6Ik8YhC/Tpxr
 A+pQ==
X-Gm-Message-State: AFqh2kpIXsX5QnGyAjWHzjaBjsZ1+iz5b0vHryOJzPB3hIyJtHAgURTb
 Bt4jPejsZQi99fPqA5dPE6uTVQ==
X-Google-Smtp-Source: AMrXdXuXvuiNQJhh/4dqFWEoLDo94FM/tAZrBFtqhjAC/tX7hnxN+VMcEfN41iBhfXaVFU6IBtaixA==
X-Received: by 2002:a5d:6e82:0:b0:242:5563:c3b with SMTP id
 k2-20020a5d6e82000000b0024255630c3bmr10249612wrz.59.1674146341704; 
 Thu, 19 Jan 2023 08:39:01 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a5d4148000000b002bdd21f25ebsm19504595wrq.71.2023.01.19.08.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 08:39:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D04B91FFB7;
 Thu, 19 Jan 2023 16:39:00 +0000 (GMT)
References: <20230119155646.50503-1-philmd@linaro.org>
 <1c54e0ce-31ef-ada7-269b-9d3ee09a7b6a@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] gitlab-ci: Check building KVM-only aarch64 target
Date: Thu, 19 Jan 2023 16:38:31 +0000
In-reply-to: <1c54e0ce-31ef-ada7-269b-9d3ee09a7b6a@linaro.org>
Message-ID: <87wn5ixyvv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/1/23 16:56, Philippe Mathieu-Daud=C3=A9 wrote:
>> gitlab-ci: Add KVM-only aarch64 cross-build job
>> Add a new job to cross-build the aarch64 target with
>> only the KVM accelerator enabled (in particular, no TCG).
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>> Based-on: <20230118193518.26433-1-farosas@suse.de>
>>            target/arm: CONFIG_TCG=3Dn part 1
>> Successful job:
>>    https://gitlab.com/philmd/qemu/-/jobs/3630178191
>>    Duration: 15 minutes 25 seconds
>
> Alternatively we could move it to the custom aarch64 runner
> in the qemu-project namespace...

Lets do that because we are under utilisied on that beefy box anyway and
it will save us shared CI minutes.

>
>> ---
>>   .gitlab-ci.d/crossbuilds.yml | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>> diff --git a/.gitlab-ci.d/crossbuilds.yml
>> b/.gitlab-ci.d/crossbuilds.yml
>> index 8dbbb8f881..fc78d36b31 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -210,3 +210,12 @@ cross-arm64-xen-only:
>>       IMAGE: debian-arm64-cross
>>       ACCEL: xen
>>       EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>> +
>> +cross-arm64-kvm-only:
>> +  extends: .cross_accel_build_job
>> +  needs:
>> +    job: arm64-debian-cross-container
>> +  variables:
>> +    IMAGE: debian-arm64-cross
>> +    ACCEL: kvm
>> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-xen --without-default=
-devices

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


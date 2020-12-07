Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F14E2D0DB1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:02:37 +0100 (CET)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDLo-0008Sm-Fn
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDJb-0007kB-FE
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:00:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDJW-0003RB-5h
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:00:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607335212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkvd7LrgfbA/3UaWz+BLuo3xobAs3RImgpzqIL+38Gs=;
 b=QfJL7SrLO/7J5nZCqRP99ADVzZgu9TrDtsm2xGg0/N/fDS4ZCMTZO3bcceBzx9R9tY32lE
 uMRSeGXM4ToCfnx8EMiLG0iMBqE94IRNy2X+oLzvhAPGfrjfcjreZY7+PuUr16R6yI3EB/
 7wonqoTO6kYgQdCW5DvBE7BeULRYVn8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318--YUbS6YDPdKf26y07RdezA-1; Mon, 07 Dec 2020 05:00:09 -0500
X-MC-Unique: -YUbS6YDPdKf26y07RdezA-1
Received: by mail-wm1-f70.google.com with SMTP id a205so3897522wme.9
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 02:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jkvd7LrgfbA/3UaWz+BLuo3xobAs3RImgpzqIL+38Gs=;
 b=J+JyU9SCu0UuoiKZ43/MEVph2szKOtcaxp7KAJj6QDi7RiMHGMgaVSIW35V3gi1iTR
 qWhJZcze2PoYy9IhJoc8JWMYCjnsr9i8Yc38lgfzZ5tMvYYY8x1V/Ggpo49KUy2IN4Mu
 IaluveVUPOmF20wST3XOgfzbu61fvaAFWd7D31NVwdhiwQGUZyAC6bBXv3ZZtshNZKVI
 8ISxTuDdE7ADidjrY4SHkuK0muCTtg76eby73iWsudrzI14ynbcZ8uh5kn0jpchAipsl
 km5cPXOMKZByEw5ZPiA9Qk6MIOJV/8Jw9yFIbL6yTF9RFnstIKhIAWyvIcZ4dZFh5AgD
 3kIA==
X-Gm-Message-State: AOAM532O9BSiR/BjY65hrJTxg0UhxsUhij7/j2lnyNOSlw7RtGAaCaqb
 2FNQ7eRQOq5e40Ug9aYOhMHLGyb6nUOV4l+3ULRyRnK1DKcXEBzLf2EivrmlIYlkT0vRyo6Kfh/
 vJsPeCrPmFiK15BY=
X-Received: by 2002:a1c:6208:: with SMTP id w8mr17496932wmb.96.1607335207967; 
 Mon, 07 Dec 2020 02:00:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3EYRHSI+t9NVpsM0Mrbn468kurkRbJwfsRKh9URZe4lUy/zhC9c0UawCuc4XOtBW1JeEjjA==
X-Received: by 2002:a1c:6208:: with SMTP id w8mr17496881wmb.96.1607335207639; 
 Mon, 07 Dec 2020 02:00:07 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c1sm13112995wml.8.2020.12.07.02.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 02:00:06 -0800 (PST)
Subject: Re: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-6-philmd@redhat.com>
 <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2352c04c-829e-ea1d-0894-15fc1d06697a@redhat.com>
Date: Mon, 7 Dec 2020 11:00:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Cornelia Huck <cohuck@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 6:46 AM, Thomas Huth wrote:
> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>> Cross-build s390x target with only KVM accelerator enabled.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
>>  .gitlab-ci.yml                         | 1 +
>>  MAINTAINERS                            | 1 +
>>  3 files changed, 8 insertions(+)
>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>
>> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>> new file mode 100644
>> index 00000000000..1731af62056
>> --- /dev/null
>> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>> @@ -0,0 +1,6 @@
>> +cross-s390x-kvm:
>> +  extends: .cross_accel_build_job
>> +  variables:
>> +    IMAGE: debian-s390x-cross
>> +    TARGETS: s390x-softmmu
>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 573afceb3c7..a69619d7319 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -14,6 +14,7 @@ include:
>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
> 
> KVM code is already covered by the "cross-s390x-system" job, but an
> additional compilation test with --disable-tcg makes sense here. I'd then
> rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".

As you wish. What I want is to let Gitlab users be able to build the
equivalent "[s390x] Clang (disable-tcg)" from Travis.

I keep using GCC toolchain because managing job coverage duplication
is an unresolved problem.

> 
> And while you're at it, I'd maybe rather name the new file just
> crossbuilds-s390x.yml and also move the other s390x related jobs into it?

OK will do.

Thanks,

Phil.



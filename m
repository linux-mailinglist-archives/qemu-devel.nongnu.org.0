Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C553A95B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 16:46:57 +0200 (CEST)
Received: from localhost ([::1]:58032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwPce-0004oV-LW
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 10:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwPaU-0003CR-6r
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 10:44:43 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwPaQ-0004SZ-53
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 10:44:41 -0400
Received: by mail-ej1-x62b.google.com with SMTP id q1so4231682ejz.9
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6H43hb5mpxnnUqjJY0zb4QOeFabfLkmVAXt1ZXBua88=;
 b=OOC7ssWcVvaBvpnm/rKpjzZ79WuadnNExOKhkb2q4KD/nlmDeUYpGNodLSDULnPY47
 BGTBJZjw5PBGDV+3pwOJYYUI0eLkRlluBJyllm/8r5jProuDsO0ZTzpfg7Yyj5TH0sNE
 NC3e26PT2lQaRjvf2L3ACbIJ23889tlyc1JjqNm03tkKM1RfBFKnO3LPfd729Fepcns7
 t35/g11iYhUf8S6Xb9jikaki1S2XTRFL+cdhcrsOs4H1U3JBDuhOJtZlZ52mmU8ne651
 +lJ8jwZWZMP3IuW6t40OyUl0Yq5HhFS/jNaCoOG5CC9kJW0dbYpqTGWjNjLkfhbgwM2j
 Eoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6H43hb5mpxnnUqjJY0zb4QOeFabfLkmVAXt1ZXBua88=;
 b=w1Hrv4uNfqEQXUHOMHwbbgwCUGCGvDnjt1W1YboEjFytYFRyZyjlbgfAZPPmhOIBL2
 /kkNOlKaZVgW4OVMr/HDt27KTBf1URPdPUXBQhOAU3LSyjYUhJGSlRSQl+jmDG4f0Q2V
 cHNm3gMmueJ8gJaavFItQUnwF3JLDYDobe2peG/u1Ii5Is7ytz0AsPdxqbVP5ljuPj8Q
 9D1y0QTL/Pw1iWqSVuu09b+iYcngjasUaJvEftiG+ztCVLH/331MRmq69Ku1IyfW9Wtc
 TQKTTd7jIe1cOHjgdGQh3lmZ2MIWMxW7J+T9QuTWgaaJuNd1PMRYNYTb1tH7OUMWkyIo
 MwnA==
X-Gm-Message-State: AOAM531GBo6sNAnEkKt9v+qqmPZxxdIAUo9fzG2MvKXcupyBNAngaGM0
 BqKznYxpK1CNbStc+3D+M9t7pg==
X-Google-Smtp-Source: ABdhPJxSljkS/oot7jSn2Q9lTR8flCRco9FeAxSpWX5hqPNUV4FVglM5v1O/my9D6Pone2iCWi50cg==
X-Received: by 2002:a17:907:3e15:b0:6fe:f10e:6337 with SMTP id
 hp21-20020a1709073e1500b006fef10e6337mr209650ejc.209.1654094675806; 
 Wed, 01 Jun 2022 07:44:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a170906430f00b006f3ef214dc7sm839892ejm.45.2022.06.01.07.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 07:44:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 37EE51FFB7;
 Wed,  1 Jun 2022 15:44:34 +0100 (BST)
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-32-alex.bennee@linaro.org>
 <0b1b41d8-d8f9-1b5a-bc3c-67557ecbdde7@redhat.com>
User-agent: mu4e 1.7.25; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v1 31/33] gitlab: convert build/container jobs to
 .base_job_template
Date: Wed, 01 Jun 2022 15:43:46 +0100
In-reply-to: <0b1b41d8-d8f9-1b5a-bc3c-67557ecbdde7@redhat.com>
Message-ID: <87y1ygv3xp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 27/05/2022 17.36, Alex Benn=C3=A9e wrote:
>> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> This converts the main build and container jobs to use the
>> base job rules, defining the following new variables
>>   - QEMU_JOB_SKIPPED - jobs that are known to be currently
>>     broken and should not be run. Can still be manually
>>     launched if desired.
>>   - QEMU_JOB_AVOCADO - jobs that run the Avocado integration
>>     test harness.
>>   - QEMU_JOB_PUBLISH - jobs that publish content after the
>>     branch is merged upstream
>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Message-Id: <20220526110705.59952-5-berrange@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
> ...
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index e9620c3074..ecac3ec50c 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -360,12 +360,11 @@ build-cfi-aarch64:
>>       expire_in: 2 days
>>       paths:
>>         - build
>> -  rules:
>> +  variables:
>>       # FIXME: This job is often failing, likely due to out-of-memory pr=
oblems in
>>       # the constrained containers of the shared runners. Thus this is m=
arked as
>> -    # manual until the situation has been solved.
>> -    - when: manual
>> -      allow_failure: true
>> +    # skipped until the situation has been solved.
>> +    QEMU_JOB_SKIPPED: 1
>>     check-cfi-aarch64:
>>     extends: .native_test_job_template
>> @@ -402,12 +401,11 @@ build-cfi-ppc64-s390x:
>>       expire_in: 2 days
>>       paths:
>>         - build
>> -  rules:
>> +  variables:
>>       # FIXME: This job is often failing, likely due to out-of-memory pr=
oblems in
>>       # the constrained containers of the shared runners. Thus this is m=
arked as
>> -    # manual until the situation has been solved.
>> -    - when: manual
>> -      allow_failure: true
>> +    # skipped until the situation has been solved.
>> +    QEMU_JOB_SKIPPED: 1
>>     check-cfi-ppc64-s390x:
>>     extends: .native_test_job_template
>> @@ -579,6 +577,7 @@ build-without-default-features:
>>       MAKE_CHECK_ARGS: check-unit check-qtest SPEED=3Dslow
>>     build-libvhost-user:
>> +  extends: .base_job_template
>>     stage: build
>>     image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
>>     needs:
>> @@ -595,10 +594,13 @@ build-tools-and-docs-debian:
>>     extends: .native_build_job_template
>>     needs:
>>       job: amd64-debian-container
>> +    # when running on 'master' we use pre-existing container
>> +    optional: true
>
> This change doesn't look like it's related to the other changes in
> here? Maybe mention it in the patch description at least?

It is because the QEMU_JOB_PUBLISH stage is run on master so we don't
really need to rebuild the container from staging to run it. I've
mentioned it in the commit.

>
> Apart from that:
> Reviewed-by: Thomas Huth <thuth@redhat.com>


--=20
Alex Benn=C3=A9e


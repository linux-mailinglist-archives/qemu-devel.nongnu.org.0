Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDD35A315F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 23:50:44 +0200 (CEST)
Received: from localhost ([::1]:60106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRhDt-00070K-V7
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 17:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRhBi-0005SQ-MS
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 17:48:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRhBh-0003UE-1G
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 17:48:26 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bu22so2899850wrb.3
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 14:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=0a30XM62Mh5A+82mfA74gQPx506RqpRI6F9PziL1DpY=;
 b=ZsIKw11RlJh1ldXiKDmMQFV12hJQ8UK/U/tdByrD3vXLFY/GqbkTODQl9pZk9iyZsM
 sUKnXuFLGlneKplxnqhz21xkK3xaceRkE24MvEw9rsQ0ZabDhBYt+SBgH9goqmagBSf9
 fDnbpBZWYaxfCaGPmyJPytsdfDe6rj5yWvi4j3tT9Ty1CPfWCOkXqxOqfVP0fY50175h
 pDT9AxpCvvT20OPbUl0Mkv+crdxki55myuXMUSj4JJBqEte0jYYIo9a03FtoY3STWaJU
 oQN+AsM0OaXm5hIQnhM49UkFN4r5ZWtpE86ZNm6mW87rDBg4dSxpG3s4Fg2j7arq6ncj
 0/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=0a30XM62Mh5A+82mfA74gQPx506RqpRI6F9PziL1DpY=;
 b=bzCUUyDgV8UH2Z2bsKtufBRoKG+j24+NOSlfSJkhsbz/WJ4aCUErZFE+7P5aoVB5Py
 mWCiSmD7uDTIsmZ+gdPXa2RsxAYcghG5bSXh6eK//YWsePcDhQeSqihSijK1qyknmhaH
 nk8vpXkKidS/Mj/sItjnJhojs53pjs8PWnnJ1pmFGB0R79sELPDBJG0bRCub49Z0fDYv
 2UPHWIpu9dcEe9gxsmDd6UwP7QUxOBAyXsOOX0qiLB/FJbkscaPoJ5qnawD5JYrKLzzA
 4JWd5pficWd3JMIHqIZyE4kvuHq7n2L7fGQ9k4TG5nW5cgsog6r9s8U6oA938dWwEpRo
 oo3g==
X-Gm-Message-State: ACgBeo3+MevM7RsH5kh9iWQbNWeSUf4+kmMvKVULa0mT15yIp1YK8Ar5
 qLzhmjuC3IzxTbdZg7Cbs39zlA==
X-Google-Smtp-Source: AA6agR4CjM6LiZccUhwB8J2oO0hrI56V0hZYCrgVVTS4OkV8bBC0NVXhpVTXjcjSb/HYIerUSxHaPA==
X-Received: by 2002:adf:eb01:0:b0:225:294d:c9c6 with SMTP id
 s1-20020adfeb01000000b00225294dc9c6mr772626wrn.285.1661550503332; 
 Fri, 26 Aug 2022 14:48:23 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g13-20020adfe40d000000b002252751629dsm738718wrm.24.2022.08.26.14.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 14:48:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E0EA1FFB7;
 Fri, 26 Aug 2022 22:48:22 +0100 (BST)
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-12-alex.bennee@linaro.org>
 <1c34e1b4-118a-29f1-d3c3-b62343d136f3@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v1 11/25] tests/docker: remove amd64 qemu/debian10
 dependency
Date: Fri, 26 Aug 2022 22:47:06 +0100
In-reply-to: <1c34e1b4-118a-29f1-d3c3-b62343d136f3@redhat.com>
Message-ID: <87ilmeptga.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

> On 26/08/2022 19.21, Alex Benn=C3=A9e wrote:
>> We missed removing this dependency when we flattened the build.
>> Fixes 9e19fd7d4a (tests/docker: update debian-amd64 with lcitool)
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/docker/Makefile.include | 1 -
>>   1 file changed, 1 deletion(-)
>> diff --git a/tests/docker/Makefile.include
>> b/tests/docker/Makefile.include
>> index 5c9398bbc9..c3375f89c5 100644
>> --- a/tests/docker/Makefile.include
>> +++ b/tests/docker/Makefile.include
>> @@ -73,7 +73,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debi=
an-bootstrap.docker
>>   # we don't run tests on intermediate images (used as base by another i=
mage)
>>   DOCKER_PARTIAL_IMAGES :=3D debian10 debian11
>>   ifeq ($(HOST_ARCH),x86_64)
>> -docker-image-debian-amd64: docker-image-debian10
>>   DOCKER_PARTIAL_IMAGES +=3D debian-amd64-cross
>>   else
>>   docker-image-debian-amd64-cross: docker-image-debian10
>
> What about the "DOCKER_PARTIAL_IMAGES +=3D debian-amd64" that comes
> later in this file? Do we still need that line?

Yes because this stops us using the image on non-x86 hosts. It's poorly
named but I don't want to further complicate the Makefile while trying
to simplify it ;-)

>
>  Thomas


--=20
Alex Benn=C3=A9e


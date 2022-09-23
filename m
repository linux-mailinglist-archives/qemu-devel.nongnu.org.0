Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512C5E7834
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 12:23:43 +0200 (CEST)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obfqP-00059b-9w
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 06:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obfmJ-0003QJ-Ef
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:19:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obfmH-0006LF-Vq
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:19:27 -0400
Received: by mail-wr1-x436.google.com with SMTP id cc5so19707453wrb.6
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 03:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=ae7KulH6SjZTp1z2IkD2Y8juN/k4Hp2V4FLOBnOq6ew=;
 b=COt1dtupYehHCMZaTbyATR9aDqGJcWa5UwZnq+Ea7xhEtm+JjoMOuKG2GPshFKUXBR
 2od+nrrS7VdqaBMJmnbpySDeLJcF2wHMuvysXLbjQjVCW9GZC26i6aMiUbX/CTZfkvBS
 cylMgTB2cJX3wz0oec4v8gqU9bWlTA9mmPmpnodbdStPRFg30vGfmU9lx9fddZdct+aF
 26M9mfWBmevPj55a8tTOufXQ9QaEBlWFGizC+PuAcR5kQ2gbSILQG1EbonpCC1+OL9Oc
 yYr4Ez7YIfXEQuk/GdPRjNZmfPc9PUrkdwqpGqLeZiOIivstGKfNa/DcooEyPXM3GEsZ
 FL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=ae7KulH6SjZTp1z2IkD2Y8juN/k4Hp2V4FLOBnOq6ew=;
 b=jq98g2BSHQKc++fVEeoLlgAEPQXB4V2Nuko4EU3non852GPH3aZ0cMX+d+9kd3wQ6f
 XSpHi4eENSFJEMRllsUvzR1JFONRqZOctiK28lkNEdlJsrMsluuNcg8zz7IaezFdIETZ
 2ucd2KniBSrFyHf1qnqa1fjjkGW1lQS5iIUyAF9Fv6BzpDkwiR0yczmvULcDBqHaKcuC
 yltTrk8VKCyrVYZtXExOITPUCpLpsZgORlyGg+EHAXc0v+GaoKfs6YqpkAV+3gKW0qLg
 taJbBKXgiXOG2MlubovVecqV6aVJoQAuyVRbsKmffFuQ/ErBz+yYyivKPUrgGzoIKeiq
 Kfxg==
X-Gm-Message-State: ACrzQf2hsc6upz46BQiYXkuJvm8jZhCLN9uNVM3LEbWaGJnCcAA6ZEuI
 kcszYD33D+MsQ3kaoZ612JlKvQ==
X-Google-Smtp-Source: AMsMyM6hhKxK9vPe/A9L87DBkcTkZQ8qyOHUGG5imPwvSdgQaYIbavOqawQgvrCKWFnvz+hFlS3rrQ==
X-Received: by 2002:adf:e7c2:0:b0:228:8733:3a6d with SMTP id
 e2-20020adfe7c2000000b0022887333a6dmr4627458wrn.215.1663928363086; 
 Fri, 23 Sep 2022 03:19:23 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c481000b003a6125562e1sm1913466wmo.46.2022.09.23.03.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 03:19:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9592D1FFB7;
 Fri, 23 Sep 2022 11:19:21 +0100 (BST)
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <793e6018-da21-2247-1348-ad0e62030e25@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Hildenbrand <david@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-s390x@nongnu.org, Thomas
 Huth <thuth@redhat.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, Cornelia Huck <cohuck@redhat.com>, Harald
 Freudenberger <freude@linux.ibm.com>, Holger Dengler
 <dengler@linux.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v8 1/2] target/s390x: support SHA-512 extensions
Date: Fri, 23 Sep 2022 11:14:34 +0100
In-reply-to: <793e6018-da21-2247-1348-ad0e62030e25@redhat.com>
Message-ID: <87o7v6wfyu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


David Hildenbrand <david@redhat.com> writes:

> On 21.09.22 12:07, Jason A. Donenfeld wrote:
>> In order to fully support MSA_EXT_5, we have to support the SHA-512
>> special instructions. So implement those.
>> The implementation began as something TweetNacl-like, and then was
>> adjusted to be useful here. It's not very beautiful, but it is quite
>> short and compact, which is what we're going for.
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: Harald Freudenberger <freude@linux.ibm.com>
>> Cc: Holger Dengler <dengler@linux.ibm.com>
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>> ---
>
<snip>
>
> This passes the Linux boot test, but I'm pretty sure I messed up some
> corner case.
>
>
> Interestingly, I discovered tests/tcg/multiarch/sha512.c.

I added that because I wanted to further exercise the vector code and
it is a nice test because it verifies its own results. It gets rebuilt
with various flavours to exercise different sets of instructions e.g.:

  # MVX versions of sha512
  sha512-mvx: CFLAGS=3D-march=3Dz13 -mvx -O3
  sha512-mvx: sha512.c
          $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)

so it might be worth enabling the SHA512 instructions and building
another variant of the binary. That does depend on the compiler
recognising whats going on and using the appropriate instructions
instead. Alternatively we could extend the test to use compiler
intrinsics if available although I suspect that will get messy quick.

--=20
Alex Benn=C3=A9e


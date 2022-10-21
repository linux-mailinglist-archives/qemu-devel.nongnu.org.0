Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C8D607E77
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 20:57:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olx8o-00051X-2i; Fri, 21 Oct 2022 14:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olubS-0004W6-Kk
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:10:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oluXl-0006Ww-Qx
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:06:50 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bk15so5565377wrb.13
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIZKXHxA73MDXL7dz61qekBO3giBzqElfNjwe7ffrPk=;
 b=rfMa5/3L0wqLV73jh4SABV/c4HMZpCeQlkDKJZJhZEkCURsn0IqMsUU8M9BdAOBe7Q
 qS7u+QyuP5Rt5JVXXYL2hXZ72Wt8rASOgVFfdPq/85LB/3psY69zfLU9YskJ3he6cGLr
 46kOXRPUNg+tIYxH/w6O2bdsXKrYMSQx5VX1PWlx4TIWy5MI0jWddAoMkiUR4rEFy/oC
 dnk/9B0dsaAPxThP8qyjVM9fikqpz9PF6PjKSW0knYDp3uMSHOoyo2P7MLDf53evdNFc
 7R4MJ3P8K/ZAec+WbkSiTp16CwjAJEm8a1ohPCTV8H++5tIX9OvLtd5U19L38M2+1aJp
 mmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jIZKXHxA73MDXL7dz61qekBO3giBzqElfNjwe7ffrPk=;
 b=4xEFTq49J62eN9K+esteZ0/qFPi/P8OFSWAtrIkBUG80S74u7Uv29C2QEyefs9Cw0O
 CDAtBaBLXWNtVBqg1sC2dCpgAP5W1HiEnDwuvd4x0rsqR5ReQ3HAj1dgSaNWa+YkXRcw
 PRmgRuqJK1gVs1ykCY8uNgdO5C5qG2B1426+iX8Vg6UW/WVEyoU1Vdz7lyh2tUARq+ZK
 KuaZFsRPR9smyYGq6UMPcYCMEX1+lxrfYqA1+m/1MMz+R9uGFR7MiWOQQn4B5nFdCkPP
 ie0+oVLjgGWz5NfXzOmIY1qBdNiMYlYi7EATdUUsh39DwRRTX1vI7Rr8IekJ2//vZ879
 wjFA==
X-Gm-Message-State: ACrzQf3sEE146ysAFlml7QxYgsBpMXgVt2RrCu0VFP7GcdYXczwYv2q4
 yy4xl079zsuZ3h25mwUdki4zJg==
X-Google-Smtp-Source: AMsMyM4/aoeYz8EuyJUJFowwD+GrsBZnldXxTBDwtVErNTbSUt44Oc6y+4Lddai7cS9g3t5dKHGphw==
X-Received: by 2002:adf:e350:0:b0:232:b8fe:ba9 with SMTP id
 n16-20020adfe350000000b00232b8fe0ba9mr12736351wrj.590.1666368403857; 
 Fri, 21 Oct 2022 09:06:43 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b003a682354f63sm33780wmp.11.2022.10.21.09.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:06:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C54A1FFB7;
 Fri, 21 Oct 2022 17:06:42 +0100 (BST)
References: <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
 <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
 <87k04t7ca6.fsf@linaro.org>
 <20221021053828-mutt-send-email-mst@kernel.org>
 <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
 <87bkq575m8.fsf@linaro.org>
 <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Igor Mammedov <imammedo@redhat.com>, John Snow
 <jsnow@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Date: Fri, 21 Oct 2022 17:03:00 +0100
In-reply-to: <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
Message-ID: <87lep95ffx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Ani Sinha <ani@anisinha.ca> writes:

<snip>
>
>  We have added a mirror of biosbits to the QEMU project so there is no
>  reason why we can't track changes and modifications there (we do this
>  for TestFloat which is forked from the upstream SoftFloat code).
>
> The whole idea was that say an acpi developer added support for a new tab=
le in QEMU, he should write a corresponding
> test for bits so that the same table is exercised during run time. Making=
 those changes from a single repo (either directly
> or through a submodule)  makes things lit simpler and also keeps things i=
n sync with each other. If we use separate
> repos for acpi bits test, it will be another mess when comes to developer=
s adding changes and keeping things in sync.=20
>
> Anyways these things should have been brought up earlier. I'm out of the =
debate.=20
>
> I've sent v7 , incremental work over the last 6 months in my spare time w=
ithout getting any pay. So take it or scrap it.=20
>
> =F0=9F=98=8A

I'm sorry you feel that way but you asked for people to spend their time
reviewing your code and giving feedback. If you don't have time to take
it forward then fine but I'm afraid a "take it or leave it" attitude
will just result in it not getting merged.

Hopefully someone else who has the time to look into it will be able to
pick it up later.

--=20
Alex Benn=C3=A9e


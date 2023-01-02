Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E66465B748
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 21:53:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCRmQ-0001hq-Dl; Mon, 02 Jan 2023 15:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pCRmD-0001hc-6G
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 15:51:21 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pCRmA-0007Bw-Nm
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 15:51:20 -0500
Received: by mail-wr1-x433.google.com with SMTP id co23so27390702wrb.4
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 12:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5iJQz33XGKt2koTVliUM43LQ0JhUIoHwy34X3K5WN2I=;
 b=c/unFYZkiJhvHT9gY4FS/KjvHU9NQ2BdKmdHck13KkpiotzjiXv5qCuUckXdtXJTbG
 aKAsQMF59PK8ijOdNMzaceXHevEMNbLaPgrWa6kiKjyy8QKDOeULzRvq3ateVw5pFY20
 r6Bct9MjttBwxKaIiULOviknBv/kJEtZbozRmk9UkJpccIc80R2M4TxRvR91ekJqG/R6
 9B46q6eSIcBaS7T4J5DrCbZKgTaT57kZIMs/ZznwY+7NOv42lPCbchXSsbPihW1csUU7
 kX6ejnXdlmaTkvcqJrEvKuGSxAHhCRYmwrqSoGoFSjx0+rrng+qja2Q4eN83sdP+FnWf
 ZleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5iJQz33XGKt2koTVliUM43LQ0JhUIoHwy34X3K5WN2I=;
 b=CAV5NUBw3xnX+Z498woiqkzX/ZZriPux2HcSufxndcRWJgJHVHkqpIjx+SDkO/Kw3J
 /mYTseYeY+sFU/cs9afRwqkpzHkNyQLob9fHVPgTitvs0xQMeXiVf+dKv8CMMzxIyRPG
 uL77jC2WfUiptY3hE/FGd27Z8Ot5IvxKHSQre7dUZueMXlRUSLkVLL36j5ENQJnKY4lb
 QdxwYJ7i3UXn0fCnIo6onyQdTqrDEyuu2ZJPub1pjAtgNj8sBG1gnm4uSokgh7Qve81L
 2HF4QE1YipUxydrNT79bp+y6gVbJ2M7lJA4tH3EM1SEgDTKPOQCSfQwLXuLCvc7kBh28
 tBzQ==
X-Gm-Message-State: AFqh2koSDZq7g3yzIAYS3bhniXqxHR+/LeEKyWWeWQeuSwbejKBxbzTH
 2U5OMihEbCT66RR6V8xPT2L04w==
X-Google-Smtp-Source: AMrXdXvsu5D7NT+h6QNufsW/hAYzLJvyQl5zukud7On2sFrLA4l/Sw5jdBvR1vLnVF6VN6tgTi6F/Q==
X-Received: by 2002:adf:fa84:0:b0:28b:ca44:6458 with SMTP id
 h4-20020adffa84000000b0028bca446458mr10096205wrr.2.1672692675286; 
 Mon, 02 Jan 2023 12:51:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l25-20020adfa399000000b002421ed1d8c8sm29761929wrb.103.2023.01.02.12.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 12:51:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3F9521FFB7;
 Mon,  2 Jan 2023 20:51:14 +0000 (GMT)
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-5-alex.bennee@linaro.org>
 <bc7775b6-7a7f-a932-cf3b-61c667e83c8d@linaro.org>
 <f8bee089-c072-869e-0ff7-a27a16f58ee6@weilnetz.de>
User-agent: mu4e 1.9.10; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
Subject: Re: [PATCH v3 04/26] configure: don't enable cross compilers unless
 in target_list
Date: Mon, 02 Jan 2023 20:50:56 +0000
In-reply-to: <f8bee089-c072-869e-0ff7-a27a16f58ee6@weilnetz.de>
Message-ID: <87fscsace6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Stefan Weil <sw@weilnetz.de> writes:

> Am 21.10.22 um 00:10 schrieb Richard Henderson:
>> On 10/20/22 21:51, Alex Benn=C3=A9e wrote:
>>> This avoids the unfortunate effect of always builds the pc-bios blobs
>>> for targets the user isn't interested in.
>>>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> ---
>>> =C2=A0 configure | 9 +++++++++
>>> =C2=A0 1 file changed, 9 insertions(+)
>>>
>>> diff --git a/configure b/configure
>>> index 81561be7c1..dd6f58dcde 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -1877,6 +1877,15 @@ probe_target_compiler() {
>>> =C2=A0=C2=A0=C2=A0 container_cross_ranlib=3D
>>> =C2=A0=C2=A0=C2=A0 container_cross_strip=3D
>>> +=C2=A0 # We shall skip configuring the target compiler if the user did=
n't
>>> +=C2=A0 # bother enabling an appropriate guest. This avoids building
>>> +=C2=A0 # extraneous firmware images and tests.
>>> +=C2=A0 if test "${target_list#*$1}" !=3D "$1"; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>
>
> Isn't break limited for exiting from for, while, or until loop? (*)
> If yes, it's wrongly used here. sh does not complain, but other
> shells do.

There is already a fix waiting in the PR:

  20221223172135.3450109-1-alex.bennee@linaro.org
=20=20
>
> Stefan
>
> *) https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.h=
tml


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


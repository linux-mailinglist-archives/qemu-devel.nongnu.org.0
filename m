Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B66D9229
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 10:58:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkLR9-0001HZ-Gh; Thu, 06 Apr 2023 04:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkLR7-0001H9-89
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:57:41 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkLR5-0004dm-L0
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:57:41 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 d11-20020a05600c3acb00b003ef6e6754c5so19698421wms.5
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 01:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680771457;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23+JA5FlEZCg1D64QOnQdOwDxYykg/lmXxygdJKaZZA=;
 b=VnpgcH6HY+GW51/aS4vxzm8kXxK+wGTShFnc0u2zL59zFjHKVcChsAU7siD6qaLwAM
 4u6Iq5eJw+UlrtqhrhFNDz0z432Ufg2zXUZwm7jrGFJv2a+FjLn8X/8q87RsPyfkAazk
 /fOByH74i3aucbPGo3avUWx3ViHt0xjwrWV+vx0A11bRVOkl5OcB2oma7b05ZKRv6SMI
 sQLQB9shWz08wZCgKMFDTbojMiw72k/4VP+z32P7zxV86m5qet8XE4AebFn219g8pazh
 EXXVaKnoueTJ9fDomRP9q5hOcJ8aaqtfF8K9dJ/JNsbtzBYcf2mjcRA3z0j9fugwOwmb
 zpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680771457;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=23+JA5FlEZCg1D64QOnQdOwDxYykg/lmXxygdJKaZZA=;
 b=7hq2DOcO28FIUWcj1kzmWgD+0c1vpHZBzi2S4UQA5OLnDvTzzT+/9YfKdq9rTErYd5
 P8auQx3ZtV2amPoBE9SuWOpBvmlPrsGFdhVeaGNaMXplUQBD4uDonB7wInajFjt4W3Io
 MATVvGhb+/1hjU4gOXl2Qm64gKfFFH8X+sLHj+MrBKKbVFbu6sJ+Hn5vPhKGI07mmtnk
 U/mL7Wm+P7y9uZWOwd38FczyTHmV6bJC1KkKedSQM/Y4ila8eh8Tuycsvrr1naBlW45n
 +F6aHDZF2dWOJBN+Yg4lr8YyYfhzUDXzPR+kFdE4nm7VOamE/yROvr8vKrJIl1Be4jfj
 jkRg==
X-Gm-Message-State: AAQBX9dNuXha9ynoKpyAOQwZPaFE2KzJGFhZt7dSTiG2lgTo73m8YuDc
 pSjn8YrwyO82BU+aGyBwmkcc1l62s4U4h0/ZBeE=
X-Google-Smtp-Source: AKy350YWCoGsGxX7aKZcNN0SmYkJXPKQ8SudsQszOYbiNz/NsNc0jOlGYIoMeVpTC5pfqZtSniSN3Q==
X-Received: by 2002:a05:600c:22d6:b0:3eb:2da5:e19 with SMTP id
 22-20020a05600c22d600b003eb2da50e19mr6798850wmg.27.1680771457201; 
 Thu, 06 Apr 2023 01:57:37 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b003f046ad52efsm4704170wmb.31.2023.04.06.01.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:57:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5339C1FFB7;
 Thu,  6 Apr 2023 09:57:36 +0100 (BST)
References: <TYZPR06MB5418D71BB6F2BBFD80C01E559D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
 <TYZPR06MB5418A6BDB94FB0D97ABA31299D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
 <87edp6oy7g.fsf@pond.sub.org>
 <TYZPR06MB5418A3EB07F30B8AEC1A28229D8F9@TYZPR06MB5418.apcprd06.prod.outlook.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yohei Kojima <y-koj@outlook.jp>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 1/4] util: Add thread-safe qemu_strerror() function
Date: Thu, 06 Apr 2023 09:57:07 +0100
In-reply-to: <TYZPR06MB5418A3EB07F30B8AEC1A28229D8F9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Message-ID: <87mt3ljslb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


Yohei Kojima <y-koj@outlook.jp> writes:

> On 2023/03/31 4:06, Markus Armbruster wrote:
>> Yohei Kojima <y-koj@outlook.jp> writes:
>>=20
>>> Add qemu_strerror() which follows the POSIX specification for
>>> strerror(). While strerror() is not guaranteed to be thread-safe, this
>>> function is thread-safe.
>>=20
>> Why not g_strerror()?
>>=20
>
> Because g_strerror() uses mutex in its implementation and there is a
> risk to occur the deadlock. If one thread enters g_strerror() (soon the
> mutex is locked), then another thread calls fork(), and the forked
> child process try to call g_strerror(), then deadlock occurs.

I think we should mention this avoids the deadlock in the commit
message. With that:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
>>> This function is added to solve the following issue:
>>> https://gitlab.com/qemu-project/qemu/-/issues/416
>>=20
>> The issue even asks for it...
>>=20
>
> Originally yes, but Daniel told the deadlock (or a mutex starvation)
> risk for g_strerror() in the later discussion of the issue. Probably I
> should have mention that in the commit message or the cover letter.
>
>>> Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
>>=20


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10E03CF9E5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:53:32 +0200 (CEST)
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pFb-0003cE-FM
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5pEE-0001r0-PN
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:52:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:44889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5pEC-0007vQ-TP
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:52:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 f10-20020a05600c4e8ab029023e8d74d693so1979603wmq.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 05:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jjTW7u+67xakjHBYpj14mgKc8xypzWkq+biQab200gs=;
 b=lgwN0fYWEiFuKcghR/u2/vec3/VaVM/HF6LG12vNkEJfWrOGa0CLuBmJREO+hA+c4w
 sxeWhT1s56DFc9+a2sfDxPThz/CbC8/jQcmDnf0XY5K5FJyOvgwoPivuqanzlRu3uAwD
 csKgxf7vaJXjfXyg6I0McAoKo1kcHMK6T6iQ3MbEIVy+zcGtQ05F3dxdll4MmjvgmyIG
 hxIUmbg5gWa278UX7ZrIelToUxfv46KnqtyA4f/3PVuFbaV0oLlmCNaMJD5VOHYAzupZ
 UnQdNsexAZ7VU4cmxLFswBoDkirPXC3pmj7D4eAAmHjTgNRmdcoMXD6uwAerG/vUfCRt
 ZBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jjTW7u+67xakjHBYpj14mgKc8xypzWkq+biQab200gs=;
 b=fulk17c8S4ve06FjzlUEHByOQSWADiPqgrGP8vHfOSDg06qTYKTnQb+UCApzFAXNda
 CInKleHWNAK2BMkxDNPr67l6UOBTqTs4ZwdDtQI9ut+BkpTCpsTK5qjWYiOx+4DQDLSo
 DoTZjrXq8205vmpjOyxirYHHrxqHBAPaLgAOKUS5j2kbTglC34cBI4sBjSDi2KD4l/ky
 OWzPPeJkNPzxe/ImMYbauPyBF2lRrdcNGfg4noVF7ekzOalkoq01+LXeB0Hx1hzms02+
 uHYTbAHPjnRdmW7uuUnMNE5DFvbPVvrOpKTQKaI1egJVBPVoZHkbWF38dDtE+HoTH7bQ
 FB5Q==
X-Gm-Message-State: AOAM531wj8Z11pLMHFto5dY7EeXpjmFUm3Ik9LrRS/mh2kuexznhRlAb
 9QwV8bw3cFFmfXjEPThRo484EQ==
X-Google-Smtp-Source: ABdhPJztk0DDvvEmAC6f2fb91fopsoS6CpfIMgQD7W5P9vIvXdfOoN8K728Ho31MuKf6MYjYn5FV9Q==
X-Received: by 2002:a05:600c:2101:: with SMTP id
 u1mr36883659wml.55.1626785523159; 
 Tue, 20 Jul 2021 05:52:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f130sm24096467wmf.23.2021.07.20.05.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 05:52:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12DCC1FF7E;
 Tue, 20 Jul 2021 13:52:01 +0100 (BST)
References: <B2112AF6-3E5E-4CF6-8714-C2DE109FD7E6@canishe.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gaelan Steele <gbs@canishe.com>
Subject: Re: [RFC] Rust vhost-user-scsi implementation
Date: Tue, 20 Jul 2021 13:49:17 +0100
In-reply-to: <B2112AF6-3E5E-4CF6-8714-C2DE109FD7E6@canishe.com>
Message-ID: <87im15m9la.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Gaelan Steele <gbs@canishe.com> writes:

> Hi all,
>
> I've been working as one of QEMU's Google Summer of Code interns to
> implement a vhost-user-scsi daemon in Rust. That work's now reached a
> point where it's usable to attach read-only raw disk images to a VM,
> and I'd like to get some feedback from the QEMU community, especially
> anyone with experience with the SCSI protocol.
>
> My code, and some further information, are available at
> https://github.com/rust-vmm/vhost-device/pull/4 or
> https://github.com/Gaelan/vhost-device.git#scsi-v1. Feedback is
> welcome either on GitHub or by email. If people here would prefer me
> to send the code as a patch to this list, I could do that as well.

I do find it easier to review a series of patches via email but I guess
this is a series of patches against a non-QEMU code base. I am also
interested in reading more Rust code as I learn it myself.

Would the wider list be happy with such a series being posted, perhaps
with a [PATCH for rust-vmm/vhost-devices] subject line so as not to
confuse people?

>
> Thanks!
> Gaelan Steele


--=20
Alex Benn=C3=A9e


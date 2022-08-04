Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F30589FB0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:07:19 +0200 (CEST)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJeJZ-0003Rg-Te
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oJeCn-0006ZS-20
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 13:00:19 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oJeCj-0005bz-Sb
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 13:00:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 186-20020a1c02c3000000b003a34ac64bdfso538296wmc.1
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=qR830kkiSEIw5ZiGLWIi165GDzFniRFm9XnjNqAu/IQ=;
 b=SzFJkGWfIhv7e5jvxkeZzCuKB90yd41Q0baB4/qfq9QKrzFd3ytOO1tOXUEEe7YoIe
 iGuzuoH3FEh9X59JGLJQYqmcpup/zxw3f3qJa4nmaVmmDlL6wVwIb2Kz//LMpEao4vgx
 DZ6TBH2DOGWTouei1JN5OVE34PfbsxvvfNOoelZSlCPi2Aw1rB8YFOsRV++UqXbuWnhg
 5J7l5JrmoGR+9OpdVsYhttwCkL/Wiex1b5u8880XUHMylNjeKwJc5hXnfOtxwWOKyfgP
 arPMkJe1U9PxUN3U8Cw2PzIWaZ9KBIstR/adop1PFlkSIGi/NhkXyGmIqhWo93QkDIJx
 k09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=qR830kkiSEIw5ZiGLWIi165GDzFniRFm9XnjNqAu/IQ=;
 b=OiHfMuYGgPp4U7L7BbM/DlbASDqhhP40shzlx5OlbAW8l+ZkzjlKDV07rTdIONdsk1
 RN7kiRJDb1TKE5fm48+IgGTesKfUDGEwKY7HetDLMDEWQnotOeXwow+8v9wFjxzhJ4j9
 W+XUfEaleB7wYh58mTrgRGYIz09Ba2tutANzEYoZ55eOjwVQzWtcBc+sg5qZ4bdEFrSi
 urZKGG0w/EPlWnYonTw45pi+OwnRrsZ2j892f7745DmCPD1XRkqITbTfWzy9nqgsVfU+
 ndwaHKgh1Wt5y+TblLBNH6uM3eudOftttVWlvp8hAtNjUQedSeR90ciS3dgR9yxkj11S
 C7uQ==
X-Gm-Message-State: ACgBeo078tXMr9KpAQ9OA+k3HOsiX9qrjhxycpfcGeC1MwzQJfJ7OKtF
 HTF/8dZtYrz2JMnEKoqNDw5wZw==
X-Google-Smtp-Source: AA6agR4CkNN+P2/Q+7PCvBwHnp/29lfghGSTzO4WGyU7hk9GNF0TIjjpMxV+XXHaktdzUbysGvP8cg==
X-Received: by 2002:a05:600c:1515:b0:3a5:1690:557b with SMTP id
 b21-20020a05600c151500b003a51690557bmr811589wmg.147.1659632410931; 
 Thu, 04 Aug 2022 10:00:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600001c900b0021eaf4138aesm1891684wrx.108.2022.08.04.10.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 10:00:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 445881FFB7;
 Thu,  4 Aug 2022 18:00:09 +0100 (BST)
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-10-pbonzini@redhat.com>
 <Yuu1Eod8rwKY3pIS@redhat.com>
User-agent: mu4e 1.7.27; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=83=C2=A9?= <f4bug@amsat.org>, Laurent Vivier
 <laurent@vivier.eu>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Date: Thu, 04 Aug 2022 17:56:09 +0100
In-reply-to: <Yuu1Eod8rwKY3pIS@redhat.com>
Message-ID: <87bkt0nduu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Jul 21, 2022 at 06:36:21PM +0200, Paolo Bonzini wrote:
>> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
>>=20
>> Tiny machines optimized for fast boot time generally don't use EFI,
>> which means a random seed has to be supplied some other way. For this
>> purpose, Linux (=C3=A2=E2=80=B0=C2=A55.20) supports passing a seed in th=
e setup_data table
>> with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
>> specialized bootloaders. The linked commit shows the upstream kernel
>> implementation.
>>=20
>> At Paolo's request, we don't pass these to versioned machine types =C3=
=A2=E2=80=B0=C2=A47.0.
>
>
> This change has also broken direct kernel measured boot with AMD SEV
> confidential virtualization.

FWIW this is why we had to introduce the dtb-randomness control knob for
ARM -M virt machines. Although we have deprecated the old dtb-kaslr-seed
knob and it has always enabled by default because the measured boot was
sufficiently new the few people working with it could just add it to
their command lines.

--=20
Alex Benn=C3=A9e


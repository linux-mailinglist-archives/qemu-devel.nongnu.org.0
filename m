Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12BE651C87
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 09:44:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7YCv-0003GU-Fv; Tue, 20 Dec 2022 03:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7YCl-0003G7-K2
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:42:31 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7YCf-0000aR-Ef
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:42:30 -0500
Received: by mail-wr1-x434.google.com with SMTP id y16so11047385wrm.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 00:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0SyJesiY1Fizk6KrolkEMKMs6v+xxCQCKJck/SiNplg=;
 b=nHkHa09PieEkPnKYx8BaJf7/1EoFdwo5M5Uf0yNAfKbwY/FD3+kMrlgB0X4TFmDWbc
 CCKemPReVq4MsvrK/V4ofp27zUv3S6oA366pykKGUH96pPaIJcI/d1s8d+H/Yjj4WOBS
 vrSC5jQ3vxvEZNc89Gx9FMflop9ym73bEIJbhmo5KBZEYP5/XiqwlksnDO514SGcU5/9
 LQVIIa+tKjklvS4UPmLyZTEIN7Lci5woRB8tuDiw/GvwrGwQkZUJb+A2K41tsKsMOpQA
 8oEXKygSRYW0COsthtnU7w7hO2oNVxoEIt4OsF3j+SQFjOynPCOyr3zT7Q8bB7B+4+su
 btIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0SyJesiY1Fizk6KrolkEMKMs6v+xxCQCKJck/SiNplg=;
 b=cKSBB3BipXawW4B1Z4F8UgKmdiDstg7F74pt4PAT1a/6bibnm3ogZLDdz1MN9wUOeD
 b6xAw4nkpE28+orMnUCDRDJFP04W6obkOWf+MjPbzwgL/7CySBbzu0GoOW9YscXfMhxG
 dIYjrlSxqoS65BW6oT+NjE78ysAGryihkPRBC/N/FsoWRbJbDZ1z+n3eydJRaaTBS4Ue
 yb3SW6mNmqLc2+gxuFKFgshbkuSmE3CwiMxEEqiipg+505rE53g6X9uiM+yxX2upanyw
 Q2VGqb1eoXBuyFP68HPwRi0jmok7ppD5pV4LeflMeGNzDBHiVUo8jcB7uNqJDSUDQnlL
 ubBA==
X-Gm-Message-State: AFqh2koO6jNQ39l3vc0S0DfvrKbbJfevu6jJ88+1LDz0aIj2FGhPk0Kh
 I3Vimh4Wq1WA150tTQNq6KL1rg==
X-Google-Smtp-Source: AMrXdXutMINjAyQvnA9lgzasAwcIasZ0vUPvqki3BBTNRLTFPrJiOgXWLewNSsIi7+ERXukQC+9J6g==
X-Received: by 2002:a05:6000:705:b0:265:faec:7077 with SMTP id
 bs5-20020a056000070500b00265faec7077mr1188378wrb.41.1671525743596; 
 Tue, 20 Dec 2022 00:42:23 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d400d000000b00242269c8b8esm12286080wrp.25.2022.12.20.00.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 00:42:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD85A1FFB7;
 Tue, 20 Dec 2022 08:42:22 +0000 (GMT)
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
 <20221116174749.65175-3-fcagnin@quarkslab.com>
 <CAFEAcA_QvfancWKj2hL3KxbyLm8FxkteSbgxvkF8QO119H7SNA@mail.gmail.com>
 <CAF8_6KkPDwe8-twtJEM3_HDuRVmxn25gJGDQVhRJF=DuA+fm3w@mail.gmail.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Francesco Cagnin <francesco.cagnin@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 mads@ynddal.dk, dirty@apple.com, qemu-arm@nongnu.org, agraf@csgraf.de,
 pbonzini@redhat.com, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: Re: [PATCH v2 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
Date: Tue, 20 Dec 2022 08:31:25 +0000
In-reply-to: <CAF8_6KkPDwe8-twtJEM3_HDuRVmxn25gJGDQVhRJF=DuA+fm3w@mail.gmail.com>
Message-ID: <871qouihzl.fsf@linaro.org>
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


Francesco Cagnin <francesco.cagnin@gmail.com> writes:

> Hi,
> indeed, the patch doesn't keep separate copies of debug registers and
> just directly sets cp15.* values, as I was not aware of the issue=E2=80=
=94thanks
> for the detailed explanation.
>
> I remain available to implement the required fixes, but I'd need
> some guidance on how to proceed. Thanks,

In the KVM world we put of the final setting of the registers until
right before the context switch. I guess the equivalent in HVF would be
to modify hvf_put_registers() and make the decision about if to use the
QEMU supplied debug registers or the env values there.

Something like:

    for (i =3D 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
        if (hvf_sreg_match[i].cp_idx =3D=3D -1) {
            continue;
        }
        if (hvf_sref_match[i].can_override && should_override) {
            val =3D get_from_debug(...)=20=20=20=20=20=20=20=20
        } else {
            val =3D arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx];
        }
        ret =3D hv_vcpu_set_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, va=
l);
        assert_hvf_ok(ret);
    }

You will of course have to ensure the get_registers doesn't
inadvertently splat the env values with what we have just written here.

I'm not super familiar with the HVF architecture but maybe its possible
to do directly call hv_vcpu_set_sys_reg steps in your current
update_guest_debug function instead of copying to env and then and just
skip setting/getting them again in the final put registers just before
you exec.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


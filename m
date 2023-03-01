Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84276A6CB1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:00:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXM2V-0005Ud-7U; Wed, 01 Mar 2023 07:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXM2K-0005Gy-NK
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:58:24 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXM2H-0005kT-US
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:58:23 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so11739818wmb.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 04:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQUjkR7e9OWO2hs8WPBUfm0SMDDvABGSCr0+jgFerLM=;
 b=z8UkJma/dHOeujfPeCYD2VzH/b5/oFLX6Y3jqxuQdZeY1EAeXgW6FBiPNL/ehWrgIg
 JnnMBKllxNdJ1fbYsKkQixVyj57Rz3fNSBFXr0HZsAO6N+SezN9vmy1Aul7e20YmjCo9
 2A5k6RIxr1jdGER7QkgWnUjLFa6blybHRA3QKyF1WaXPMib4rZckp9eX3RY5xe/8h/wT
 Au8A1d53d8tkcaxzJGXM2iUgisxkVn4y77EcS10laYqKWsXizSUrpeK3tdfarRORW+U7
 hwAN0exySvCbdxfW9vBxRWteCAmuNCSHZSnm2DwcCGGnkrrKDgPIeQiwtUPs+sXlOPen
 9SkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cQUjkR7e9OWO2hs8WPBUfm0SMDDvABGSCr0+jgFerLM=;
 b=txyi6fY8YLbIc4HU388eGWKFBG0dAhU/BEkAq1WARVxMC5WSLI9iQIaSRBXX1Imzdv
 5r13T5tvZqTiGOliKREe3gIWz3xqSsy4Lmy4euCO06LUFFjoc+AC6ZsTlDYgNh/14ImP
 tLBS6H3Bk5t4ReqQS1J1rmAA4O11KBCBArgBKB1Hxgugs74EA2q0t5QNdt47Z60hKwax
 X8ZPJxXr3kmEEZXzuR23Ap39Y9ZnWd94aZE7R0FieLky+S46tY+NtslDl8F0+dnHVKvn
 vRPkm4WRxtVIyp3eH/11F9bryT3mDWKvZZnB/XLNKFkx/DzpLpUdD06ldYK4DhjhbNrW
 WbBw==
X-Gm-Message-State: AO0yUKVY1OCgLi/mEEZ+kcpSRJi7UqlDYm6KuCltlbTDexnW7j1g5ot5
 BYKPm0IvmpYOCTz7G8CLvs6KeQ==
X-Google-Smtp-Source: AK7set+a+EVFkt++ywt9uyC4y1ofJRJW82+OXUA96PKYCYF5IqyEBPIvWZe8KkguwSDr4Qp/l/VP1w==
X-Received: by 2002:a05:600c:c06:b0:3e0:17d:aeaf with SMTP id
 fm6-20020a05600c0c0600b003e0017daeafmr4640306wmb.7.1677675498974; 
 Wed, 01 Mar 2023 04:58:18 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a7bc3d9000000b003e896d953a8sm19318702wmj.17.2023.03.01.04.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 04:58:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C67D1FFB7;
 Wed,  1 Mar 2023 12:58:18 +0000 (GMT)
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de> <87a60wk6st.fsf@secure.mitica>
 <87zg8wk69m.fsf@suse.de>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: quintela@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio  Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Thomas
 Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, "Dr. David
 Alan  Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
Date: Wed, 01 Mar 2023 12:57:33 +0000
In-reply-to: <87zg8wk69m.fsf@suse.de>
Message-ID: <87bklcd3x1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


Fabiano Rosas <farosas@suse.de> writes:

> Juan Quintela <quintela@redhat.com> writes:
>
>> Fabiano Rosas <farosas@suse.de> wrote:
>>> It is possible to have a build with both TCG and KVM disabled due to
>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>> host.
>>
>> Ouch.
>>
>> Just curious: why are they needed?
>>
>
> From https://wiki.xenproject.org/wiki/QEMU_Upstream:
>
>   Why is qemu-system-i386 used even on x86_64 and even non-x86?
>=20=20=20
>   QEMU in a Xen system only provides device model (DM) emulation and not
>   any CPU instruction emulation, so the nominal arch doesn't actually
>   matter and Xen builds i386 everywhere as a basically arbitrary choice.
>=20=20=20
>   It happens that the Xen DM part of QEMU is quite closely tied to the x86
>   scaffolding for various historical reasons, so we end up using
>   qemu-system-i386 even e.g. on ARM!  There is no practical difference
>   between qemu-system-i386 and qemu-system-x86_64, they should be
>   interchangeable. However only qemu-system-i386 is regularly tested by
>   Xen Project (via osstest).

That said with the xenpvh model that was added recently we should be
able to finally build a Xen only qemu-system-aarch64 which while
functionally the same will be less head scratching for users.

>
>>>
>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>
>>> Fix tests that crash or hang in the above scenario. Do not include any
>>> test cases if TCG and KVM are missing.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>>> This currently affects Arm, but will also affect x86 after the xenpvh
>>> series gets merged. This patch fixes both scenarios.
>>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> Thanks!


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


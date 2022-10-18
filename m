Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E74F602C02
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:45:16 +0200 (CEST)
Received: from localhost ([::1]:48440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okly7-00065f-AS
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oklUo-0002xQ-0R
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:14:58 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oklUk-00078g-TP
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:14:57 -0400
Received: by mail-wr1-x436.google.com with SMTP id b4so23175292wrs.1
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6v84I28y/QOmAsfIBlfdz3G3gOS+ZnDEc8BznmB3iEs=;
 b=R+zh/O6P5dRxje6JNj6hOcxsBMycwTVjDJjWQV0jg6I3HhRL+bZLSDsgzK2qOIN7Av
 o6HMCBLjmjtCwnPVCpbEZsAUk/8C/6s8HjZ2wG48TuOvBG9zI8a0uRc9DWdFbKP0g1HN
 vdoJm+GeVajNNGi90q+mJRsA7s9D2jIs7gOv7jGU+jw5reL3uCf51v6OJ5yMUqi5cIEH
 RTDBHWX1Kx47EH6CQKfYC+ZGYEXN7TSNHxI5wRZuA8tgkOxy+IXXH4Pi0Td5+yq/s/5T
 lmltDjKewQcjnyFvwfl29Yhxa+84qr3mvMVhC/Rz9ZIKuUxtezYBQqCBf5EEC332Zqu0
 X6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6v84I28y/QOmAsfIBlfdz3G3gOS+ZnDEc8BznmB3iEs=;
 b=H+QpBEXa/sqdCafml1qrEhWG/+LtnuNPgFwaMIB5nXPuoGo+JVTP5yUPGRPu5WsZDN
 W/J5E1PxJqM8TIBRalVaeorE586TmiHDuZr9GuAr35b6MDxdT1f/3Dd/r7JtUgBGVe3N
 DVOPW73WQV7SX4SiaXtSZeBARbyAJtnbJ48izHI1RzjIyu6SY6HgFrmCu7gSHxIsKE/Q
 2DXdfL4PXi+xmDuEILDPrjbVH12/r6+g1BfZJqol3F4hYrZeWnhlQiptb/NzsNS7IsBx
 DFXFBo0J+WwEI2/0C6DsrM791Jvn9fg4bzs37GMfLWxby0g8GMgonmAlpuM1iNwWy8ge
 zqYQ==
X-Gm-Message-State: ACrzQf2q2XcBTE+UmxU5IbPHkd6roQPwZ30478OgzSEvZC8A2/Fr4aGB
 +/ntssRQOrbfikJfC9Z0UfgjvT5xH0TdYg==
X-Google-Smtp-Source: AMsMyM7ufFWgZWxXEMOGEL9cD1qatrf7RdFhp2XSbsoHjhVk0Y4Y3T9bAudCa2bCV9G3JZ9unvsuMw==
X-Received: by 2002:a5d:598a:0:b0:22e:5503:9c42 with SMTP id
 n10-20020a5d598a000000b0022e55039c42mr1684332wri.551.1666095292278; 
 Tue, 18 Oct 2022 05:14:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a05600c2ed300b003b3365b38f9sm12780573wmn.10.2022.10.18.05.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 05:14:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21B9F1FFB7;
 Tue, 18 Oct 2022 13:14:51 +0100 (BST)
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
 <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
 <CAFEAcA8Cc+XtwcQz3bJom2=MgYZgLHw8SO6uqQQdVN4aqpq4Hg@mail.gmail.com>
 <380c1527-e664-f7c5-6d18-bf53d99aed33@kernel.org>
 <87zgdtcwrv.fsf@linaro.org>
 <CAFEAcA9ONenFfxz=78pMf8vXkHB+JwEORoMwhwEmbUTv_9Q7XA@mail.gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Alexander Bulekov <alxndr@bu.edu>,
 Chris Friedt <chrisfriedt@gmail.com>, cfriedt@meta.com,
 qemu-devel@nongnu.org
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
Date: Tue, 18 Oct 2022 13:11:20 +0100
In-reply-to: <CAFEAcA9ONenFfxz=78pMf8vXkHB+JwEORoMwhwEmbUTv_9Q7XA@mail.gmail.com>
Message-ID: <87a65tcoqs.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 18 Oct 2022 at 10:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Jiri Slaby <jirislaby@kernel.org> writes:
>>
>> > On 17. 10. 22, 16:13, Peter Maydell wrote:
>> >>   * for situations where the guest has misprogrammed the device,
>> >>     log that with qemu_log_mask(LOG_GUEST_ERROR, ...)
>> >>     and continue with whatever the real hardware would do, or
>> >>     some reasonable choice if the h/w spec is vague
>> >
>> > As I wrote in the previous mail, can we stop the machine after the
>> > print somehow, for example? So that the students have to "cont" in the
>> > qemu console as an acknowledgment when this happens.
>>
>> You can bring the system to a halt with vm_stop(RUN_STATE_PAUSED) or
>> possible RUN_STATE_DEBUG?
>
> No, please don't do anything like that. This should not be special.
> Just log a message if the guest does something bad. There are
> an absolute ton of things that the guest can do wrong, and
> in general QEMU does not attempt to be an "identify all the
> ways the guest does something wrong in a friendly way" system.

We should clean-up the other uses of vm_stop in hw/ then:

  ./hw/ppc/prep_systemio.c:78:        vm_stop(RUN_STATE_PAUSED);
  ./hw/ppc/vof.c:921:        vm_stop(RUN_STATE_PAUSED);
  ./hw/vfio/pci.c:2725:    vm_stop(RUN_STATE_INTERNAL_ERROR);


>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e


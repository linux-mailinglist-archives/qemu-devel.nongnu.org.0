Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DC76030D3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 18:34:59 +0200 (CEST)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okpYP-0002ZP-Rt
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 12:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okp0i-0000UP-88
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:00:08 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:56247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okp0g-0004tJ-2f
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:00:07 -0400
Received: by mail-wm1-x32b.google.com with SMTP id t4so11023314wmj.5
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9UToVPSSKmtqan7GCMpw7XovMI8kFOFB6owIEilzxfE=;
 b=ez09t9LkmgodxLmYSR/ymoc64rUcOP4REMAq0NPEYT2hk5qB7Mm7Wj+Y5xCd6ARBKf
 jktibjRS1kW8XNc08arIHJoHZ5nbIbdz6/FyzHL7s+3Sd5K2CM391eQ2/CYMAbG99c2R
 IPlJBKz47P7GQwLs/Gff8UE1Xljm2nWhrLFCIHVKVqTy7tTr0WSyG5P29iGrMKSOLtHH
 jVArRwRSSnukkkOCr6EcSE1sm4Ey+M63kTDlqwzzL8xNeLLkSVlX0jMkyZbuoPqLw5bb
 PfhFSdD6xvCZdz7833/gxN9PPmzu8E0jskxegWlNKHwFaL3a2gokd5Q58u0azSZrp8i/
 lS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9UToVPSSKmtqan7GCMpw7XovMI8kFOFB6owIEilzxfE=;
 b=HjXC1pLFUAow7itXryQaS1D5+ndxtK1srq/9uXB2LoV/DgiOVAUkKCDZVkyPVXdQv1
 moIW6A+E3w7nnXM06tc1c5940qz1StiM9HZ5QHL9YxPT5TkhQvyHYs6fgrvUJQyQiC9F
 ZCksBuqCKpOfwQ1X2JuB6qQGEDI52hsddOjhV2LwvJStcu8VG94DlLp/lWN5j68/XxqW
 /V/ThH/f5f4FjvoUz3znLPrDrdXcbCWtK3rL1JglnWgyPQaQ11q5k/6vq6x1HidYrsY1
 IvCTrgr4/fZE0apZQzGIDfSl9rNbdwRoVWzMcp6lTAJJ6tdF65m++Xka6oRBHbrQzoJ3
 yN3A==
X-Gm-Message-State: ACrzQf19clDNjr4dUE9rL5tyr/IGRlvANdUt1uB9/EtzeJUS/8M9ja8V
 QqZ6TDOsU+lHdVYnu1rHqhz1TA==
X-Google-Smtp-Source: AMsMyM7hKl9AnbRkFhBm6ObWMHtNv6ygpOYq9Ys/kT7IK0lDoNBy8hTfckcjS1KBJIh2v4+z+2g1Zg==
X-Received: by 2002:a05:600c:5024:b0:3c6:e25f:64be with SMTP id
 n36-20020a05600c502400b003c6e25f64bemr18493774wmr.55.1666108802940; 
 Tue, 18 Oct 2022 09:00:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056000129000b0022dc6e76bbdsm11426980wrx.46.2022.10.18.09.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 09:00:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D53581FFB7;
 Tue, 18 Oct 2022 17:00:01 +0100 (BST)
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <87ilkwitc6.fsf@linaro.org>
 <CAEUhbmUfm+V-pN5j17VxRvYd1RGJYa3KF=op9Z-nB5Xq4RhUmA@mail.gmail.com>
 <CAEUhbmXc+7s6udZTNE7AeY+YkNr42fQ2HNHpDufZKDhB5qfL6g@mail.gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz
 <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v5 00/18] tests/qtest: Enable running qtest on Windows
Date: Tue, 18 Oct 2022 16:59:27 +0100
In-reply-to: <CAEUhbmXc+7s6udZTNE7AeY+YkNr42fQ2HNHpDufZKDhB5qfL6g@mail.gmail.com>
Message-ID: <87sfjlazr2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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


Bin Meng <bmeng.cn@gmail.com> writes:

> Hi Alex,
>
> On Fri, Oct 7, 2022 at 1:31 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Fri, Oct 7, 2022 at 4:35 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> >
>> >
>> > Bin Meng <bmeng.cn@gmail.com> writes:
>> >
>> > > In preparation to adding virtio-9p support on Windows, this series
>> > > enables running qtest on Windows, so that we can run the virtio-9p
>> > > tests on Windows to make sure it does not break accidently.
>> >
>> > I'm happy to take this whole series through my testing/next however I
>> > don't have working CI for the month so need to wait for my minutes to
>> > reset. Have you done a full CI run* with this?
>> >
>>
>> Yes, gitlab CI passed.
>>
>> > (*make sure any CI run is only on a repo forked from
>> > https://gitlab.com/qemu-project as you won't get the discount cost
>> > factor otherwise)
>> >
>
> Patch 4 and 10 are already applied in the mainline by Thomas.
>
> Daniel will queue patch 14, 15, 16.
>
> Could you please help queue patch 1, 2, 3, 5, 6, 7, 9, 13 from this
> series?

I've queued those except 13 into my testing/next. There was a merge
failure so I guess a dependency on another patch?

>
> I will rework the rest of the patches.
>
> Regards,
> Bin


--=20
Alex Benn=C3=A9e


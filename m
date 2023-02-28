Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FA36A5C53
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 16:49:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX2DK-0008Gx-3C; Tue, 28 Feb 2023 10:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pX2D6-00081D-41
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:48:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pX2Cg-0004YV-ON
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677599265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEFcIdUByJi1VnJICaj1oCWQB0i+FBcThj291qs2ITw=;
 b=aJ5FASU9tklfRmrSXuLopcL4pna9Z9MvwIQ27Sps4Dsr7Q+189ybp/qknTPfuc0/4H804Q
 VJkScsb0zsq8Vr2pvG4Bjw8k5OMnCWLIy2h5iTCTfYCm4MtPcdjEpZ6l+2vca8T0q8sBoJ
 dicLT7YM0CdBYxN722P60Qcp1A4vREM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594--x52hdmVNced8cMHOSBQLA-1; Tue, 28 Feb 2023 10:47:36 -0500
X-MC-Unique: -x52hdmVNced8cMHOSBQLA-1
Received: by mail-qt1-f198.google.com with SMTP id
 x4-20020ac85384000000b003bfbb485e2dso4815444qtp.22
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 07:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yEFcIdUByJi1VnJICaj1oCWQB0i+FBcThj291qs2ITw=;
 b=6RFG74hL/d4zwdM87oaQk9smwvNv/+gEt1sx95KvFspq9hQi6C7e5Rl/w3gtraG/gZ
 +K7ES3ThelhRJtcoNoeOBug3BWJvd1CtM/bCTN6LyMnM+xgmHeNpuO3enpQUFcpgEipf
 JwX52oW4oSS6+ly2b1Rnat3/uQm2ZiIQA7uoS0IiRXauYH+DzUfA9oQZlRewAhr4JLhg
 XpVbsGMVdr1yO1imru7OUNzIWTqr1M6yF3M6moPSD+70lvQVhjIzaOZifjbONtS9aYRd
 W9D8/3laRFFtJIGiO1BVnuUW6EompHzWRP4Xk6tGfPf7oOKRurTLeZT2zw/Z6zKo/HaB
 QNCA==
X-Gm-Message-State: AO0yUKW1+BTwkdZrhC8GNKliGyU8cNF4qW/Aj4dC6I6nuHOVQD862PTt
 BUHNmvqO613E5sHcmvJxaC7rv/ubbX6A4JUzCue6A74IktRK2zQybKmqJd7GE3lpbEOZsBezI8X
 4d7NzCrO7t64lSuc=
X-Received: by 2002:a05:6214:c46:b0:56e:aa8b:90f1 with SMTP id
 r6-20020a0562140c4600b0056eaa8b90f1mr6013814qvj.44.1677599255974; 
 Tue, 28 Feb 2023 07:47:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+FJtaXTumeUnp75ikFpNrbgJaqwH4hfufKkLBxdkIhqNg3jVO0e5aUj9NtrNbb28ZozVsOOw==
X-Received: by 2002:a05:6214:c46:b0:56e:aa8b:90f1 with SMTP id
 r6-20020a0562140c4600b0056eaa8b90f1mr6013776qvj.44.1677599255679; 
 Tue, 28 Feb 2023 07:47:35 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a37420c000000b007426ec97253sm4562868qka.111.2023.02.28.07.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 07:47:34 -0800 (PST)
Date: Tue, 28 Feb 2023 16:47:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Markus
 Armbruster <armbru@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 0/3] hw/acpi/cpu_hotplug: Convert 'Object *device' ->
 'DeviceState *parent'
Message-ID: <20230228164731.38d77311@imammedo.users.ipa.redhat.com>
In-Reply-To: <e6f93935-70a1-a791-4026-c344e0fa95ca@linaro.org>
References: <20230203163021.35754-1-philmd@linaro.org>
 <00dd2e23-7b5c-272f-b8ea-f0d1677d18da@linaro.org>
 <e6f93935-70a1-a791-4026-c344e0fa95ca@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, 28 Feb 2023 14:36:43 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> ping^2

please use checkpatch before pasting series.

Object -> DeviceState is a nice cleanup,
the rest is just unnecessary churn in my opinion and a matter of taste,
but I fine with it if it makes code easier to read
for someone else.


>=20
> On 22/2/23 22:34, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 3/2/23 17:30, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >> To ease code review, rename ACPI CPU hotplug variables
> >> to more meaningful names.
> >>
> >> Since hotplug parent can't be any QOM object, and must be
> >> a QDev, convert AcpiCpuHotplug::device from Object* to
> >> DeviceState*.
> >>
> >> Philippe Mathieu-Daud=C3=A9 (3):
> >> =C2=A0=C2=A0 hw/acpi/cpu_hotplug: Rename gpe_cpu -> gpe
> >> =C2=A0=C2=A0 hw/acpi/cpu_hotplug: Rename 'parent' MemoryRegion as 'con=
tainer'
> >> =C2=A0=C2=A0 hw/acpi/cpu_hotplug: Convert 'Object *device' -> 'DeviceS=
tate *parent' =20
> >=20
> > ping =20
>=20



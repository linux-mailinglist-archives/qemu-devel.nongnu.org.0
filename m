Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B9F63D9BD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 16:45:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0PGX-0008Ig-O7; Wed, 30 Nov 2022 10:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0PGU-0008GV-0Y
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:44:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0PGR-0007Jb-Uq
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669823084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSoukEixR2wLKPWhlnUHUU2cfm8I1ig286I27LsArGs=;
 b=hMV+dMHmO+PMvpbgbcfpvGd7iRDBgk/soC04iVXX+L/csf/o+Nce3URS6DQ3oVZpezvd8w
 2ziemqd7RFfRuhvCqpYLRsCgnAq06uFO9l22OROJk1vUMT+dltbFjYwHWYh8FzChact3Cp
 5kp4fj8lehiE6u7tS9kUzm1wunuVwEI=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-mW-qociqPuKLqbRQgx8Yww-1; Wed, 30 Nov 2022 10:44:42 -0500
X-MC-Unique: mW-qociqPuKLqbRQgx8Yww-1
Received: by mail-vk1-f198.google.com with SMTP id
 r23-20020a1f2b17000000b003b89463c349so8505921vkr.0
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 07:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSoukEixR2wLKPWhlnUHUU2cfm8I1ig286I27LsArGs=;
 b=TDJOa4K0qqf+KrA5enB29ec71wFSdiq3t9PS2y3rx8yyyEIheJlcO/khp2/MmNTR6+
 MDH1isyyf2UCjVGUX2c8Z9kIjAkxto0qPBgV6EDF494wq3c0DY4ulhX+leIqn6Kxz7IV
 MwczP+662u0yRZAW1Ato0Y8zusfemHjYuOK6oUDl0mGGQX9zWRAWmwEy52syUdCUbTi1
 zyK5kTP/01YA+/gJV77vmv6Xy2qVBDiI2RtYUfxYF7iw91UPg1yHb0w5tD51EmJB/VfY
 YubgMoNTJmeJVshWShnKwKxIdG4MdAi7dPmi7Y5dDtT60m/2vPlqXe7a4KpJvYSYnJkk
 H81A==
X-Gm-Message-State: ANoB5pkH/2D1GF6OdLoqjCC44nOxodL9QyiTFEcZnCtVqp7Fbv1nXRLS
 WJgUhxKIx5K8nzlyGHYWc8s0JFEz3ZeQPq1pTirSo6XB+7IqwtYNU6fRPKICthXD/iqyVGag0Rh
 dsCbB1DotQey5ESbi4kIdv0KNBy91ICA=
X-Received: by 2002:a05:6102:2221:b0:3b0:4a83:954d with SMTP id
 d1-20020a056102222100b003b04a83954dmr26116167vsb.62.1669823082034; 
 Wed, 30 Nov 2022 07:44:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6l6quEMmKgFaJPdYrMg7oxCRffXOFkUsNEWwGtwRefZyvOY+DxjUri6P1T0GW6x+3VP/SddbVLafW3aBoffiY=
X-Received: by 2002:a05:6102:2221:b0:3b0:4a83:954d with SMTP id
 d1-20020a056102222100b003b04a83954dmr26116148vsb.62.1669823081788; Wed, 30
 Nov 2022 07:44:41 -0800 (PST)
MIME-Version: 1.0
References: <20221130135641.85328-1-philmd@linaro.org>
 <20221130135641.85328-3-philmd@linaro.org>
 <878rjs4glf.fsf@suse.de> <28a5cb7b-9aa6-ff77-1cff-1679c55068f2@linaro.org>
In-Reply-To: <28a5cb7b-9aa6-ff77-1cff-1679c55068f2@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 30 Nov 2022 16:44:13 +0100
Message-ID: <CABgObfZ_YMVqDFNP6S+9VXvW8bq+cDbevwoA3gWz2Y=5wggo5w@mail.gmail.com>
Subject: Re: [PATCH-for-8.0 2/2] hw: Reduce "qemu/accel.h" inclusion
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On Wed, Nov 30, 2022 at 4:43 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 30/11/22 16:17, Fabiano Rosas wrote:
> > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
> >
> >> Move "qemu/accel.h" include from the heavily included
> >> "hw/boards.h" to hw/core/machine.c, the single file using
> >> the AccelState definition.
> >
> > Do you mean accel_init_interfaces() and ACCEL_GET_CLASS? I don't see
> > AccelState explicitly.
>
> Paolo, do you mind fixing with:
>
>     Move "qemu/accel.h" include from the heavily included
>     "hw/boards.h" to hw/core/machine.c, the single file using
>     accel-related definitions.

Can do, thanks for the suggestion.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C52221A77F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 21:06:08 +0200 (CEST)
Received: from localhost ([::1]:56962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtbrz-0004hk-3u
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 15:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbqP-0003Zt-FK
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 15:04:30 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbqM-0003tH-7N
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 15:04:28 -0400
Received: by mail-ot1-x341.google.com with SMTP id t18so2447628otq.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jul 2020 12:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J2eeil11Dp8L21Nn5ph9GH8uW7TeEfvf8jiDfM/NIMY=;
 b=U03TCP4IQ2bidnA5mdFofgkt7yVuEnRY64FMdHQqsEuAz9WM87Nksbg1hveSfrREs6
 T79vSZyb/gvqcPYCDXbP/6LwB90Edy8AexZ9cUxxhnB0IBa5fFJ9V83XmLQ0mXHSPzC8
 a1utXvK0YvMgRBUUhVnSvBIn8kTUbo6ugpqwq18V/JMxgc+QGrcEob3uAnpld688NGLA
 AYM1JtjipQ22mTV0kguQAWii3PflVt5Assrge72J65/YGn6HBteNNnbl1F47i7eUjqzE
 xAL0EiK3VaVj5YZWjwLGvGkmF5TL9vW+xvs6huqu6aI8nLkEhqwb/PUTpvr6U/hZwWml
 nuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J2eeil11Dp8L21Nn5ph9GH8uW7TeEfvf8jiDfM/NIMY=;
 b=eKeWALiyyF13FnvBv6/WePt7TzBFQjTmZ6vW1wiruyY2MtOMbALNf3QnUyXXs9uANO
 XVaLuzhThczPuEHGjibiRrUMu6sI2LhjKPyPUxroJN2BIPH12JFYJ/cC3SHJ8FDXxzVa
 e/vAkj5no/2mYziwrsTRWCNRX/mOKbGTu0mMFFOVPoY0vvrlF2pCV0azYDKDgPf+LGK1
 qSLQg7hst5O6pzU4BnM1sUrIccRXh/W2NHwjUVtrPX6dS/mA8jKPe9NVEia55OcIgBSR
 JzRSFjlXzIVlKtwtr5/VfZ0eCrmLLW2lYu16HdZPxMQtDiz7QamfBNvSDzF7ofJKYMlz
 aiRw==
X-Gm-Message-State: AOAM530fcMy7H8mO5hyk13rMGoh09xxmZwf+fkkNpB9tdf9PWsgtIccH
 uPs+xI5zhD1DD+juGl/mzUbZmi02Khd1iPqaSWVBgg==
X-Google-Smtp-Source: ABdhPJxNuHhqbLFcA582VIiCiCQkkA3CfaZtL1TiHSl2POFsxnCghk7j4aM7IyMQGdhtaGoc4uyaRylyb+srfncNmd0=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr47557016otk.221.1594321464982; 
 Thu, 09 Jul 2020 12:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200703201911.26573-1-f4bug@amsat.org>
 <20200703201911.26573-9-f4bug@amsat.org>
In-Reply-To: <20200703201911.26573-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 20:04:14 +0100
Message-ID: <CAFEAcA_Eis4KXhM-ZKNUP+o0qLQM3Xsx9QWmnP4j0eX=Dj5ULg@mail.gmail.com>
Subject: Re: [PATCH 08/18] hw/core/split-irq: Mark the device with no
 migratable fields
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Jul 2020 at 21:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> This device doesn't have fields to migrate. Be explicit
> by using vmstate_qdev_no_state_to_migrate.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/core/split-irq.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


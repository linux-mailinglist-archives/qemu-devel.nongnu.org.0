Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6005E30A577
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:37:47 +0100 (CET)
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WaY-0005LK-Gg
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WSw-0005zl-QO
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:29:55 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WSt-0006Ce-3L
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:29:54 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l12so15987774wry.2
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 02:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NcECgKC4E5kMYzbX8u5Nyim/8yrZcGmkSkDVIhQvIjE=;
 b=vIGcD2D/kiaMjuW9MM+K3GzQm4VqHGXXaZeJmaubEIQ2FOTNDtEi3zZTVW26UpJKJo
 4u4KPimFxZq/BgtrLRSiVadMd13bhm80xx1R5j2lJaKbnbVB008z//bq/D/3tWD1vs1U
 Fb0xXKw9m+V0jZin0en2Yw0K5L+C03+X1etP582TJzwHy+ChE4CNouSUGRcXbGDgZ9nB
 ihMNz9KzX2shhbfY9bAcd7yCXDiPLN51XrBtljOuBFuqJ8T96CHpHCDrmbEM1Zy6bqRy
 fMR0iZ2vl+oDYNXiUfaqeb2rsGX4WCcIQZbmwe9W2Ouny1zirHG+vMfQBg/uPdEwY9qR
 co4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NcECgKC4E5kMYzbX8u5Nyim/8yrZcGmkSkDVIhQvIjE=;
 b=KgkgqIZTz3RGiTeZ8HD+vUK2n3LXPcbZ0PEyZYR02z7jKPLPiIXe6ciXnDe31ibcgZ
 OjBJFttKUycmm9GpWf/vtH+HuLScj3QoXwxflQd2sihr9isLYixfOEXkJ3qk8cPvJ1EY
 rB/PA/pPt4/P6GF56lXls0+J+nKBzdRPpzkci5uQw2kvOHGATjT+6gY7JavTF+zCA6+I
 spJlHbiLjjmZTi1M2F1cPl6Mg//7wQb/wiakbd0argzvcC10aHGSs+Xvly3s6FepjwuU
 Ob+oHKI0BP7aI52KrVjmDziyH3MF/XJ3YU28GRlNMbDHXsEO2noXgLQXDgcp68VjA/iZ
 euWw==
X-Gm-Message-State: AOAM533iB9hllew5S2zqRI7q9ITZd4RFYeFzwKYr8xy/yrgpANSkABUN
 PtHVkdvxIa0CKoOtt5or7Dei+A==
X-Google-Smtp-Source: ABdhPJzKOXOHkyoRivYEN8apkDCKIVhJ4BFOcTxTqqpRZBqiGpXaRZJFvFzdArasgPOeQ4REFOq8/Q==
X-Received: by 2002:adf:f743:: with SMTP id z3mr17577539wrp.165.1612175389584; 
 Mon, 01 Feb 2021 02:29:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f4sm26791911wrs.34.2021.02.01.02.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:29:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF20B1FF7E;
 Mon,  1 Feb 2021 10:29:47 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-4-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 03/10] hw/sh4/Kconfig: Rename CONFIG_LM32 ->
 CONFIG_LM32_PERIPHERALS
Date: Mon, 01 Feb 2021 10:29:28 +0000
In-reply-to: <20210131111316.232778-4-f4bug@amsat.org>
Message-ID: <87mtwow06c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Mar?= =?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We want to be able to use the 'LM32' config for architecture
> specific features. As CONFIG_LM32 is only used to select
> peripherals, rename it CONFIG_LM32_PERIPHERALS.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

_DEVICES if you want, either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


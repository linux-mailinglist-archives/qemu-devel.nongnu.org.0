Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F96B35C8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 05:57:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paUnd-0005WP-OM; Thu, 09 Mar 2023 23:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1paUnb-0005SW-Ar; Thu, 09 Mar 2023 23:56:11 -0500
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1paUnY-0004sH-Kc; Thu, 09 Mar 2023 23:56:10 -0500
Received: by mail-pj1-f42.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so8626520pjb.1; 
 Thu, 09 Mar 2023 20:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678424167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r7vU3otpW/t8/NYtcdnTGEl4pgANqkKmRggG9NUKpvA=;
 b=RDgqGfaWpvBWD0cYwH+/FTKZ6iR7CghcN0yuYiM70PmvWxDWnPUaczytnP95XdkNI8
 jQ1WRao42fCQNtWh+IRLcNhGqdZGUPYtCozaQ2KYyCAtpgYQwAl8x+sg1i8mHvDA9hZO
 E2uF7lwVz/ewD3mG/0l2rjdaPHEHXtkhM7sUENylREzjIa3GCjkA95d9w4t7ASds+4AC
 GQkHdVCM61zAH7cU6M+lPX/rz1ZOA6/JzIn9VCFXiGpLvaWWFt3NlpTj8RhoeIxl2g06
 WjsC81no1MWSOaNm/aO/lNAQO9N0AWBGN/N/VI3Yz+4Eq8mkoL3aXrAOo2Rr+Sr6jXBI
 3lEg==
X-Gm-Message-State: AO0yUKWAzvARfxMOkF0uQ8eXUcORo+m/fUf4Yz6e8EEktIaBdEKlTcGS
 5QMJuiNNRHmmvOwJF262EOMMFsGFOt8=
X-Google-Smtp-Source: AK7set8UpyF/XI25ExAUFPuwTpQOtXiVRfu7XzZao5EyBfg0fDmcQy5vRl49DW1uZN6cgBGOhyypEw==
X-Received: by 2002:a05:6a20:3d86:b0:c6:bf1d:9dc9 with SMTP id
 s6-20020a056a203d8600b000c6bf1d9dc9mr27858105pzi.56.1678424166748; 
 Thu, 09 Mar 2023 20:56:06 -0800 (PST)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com.
 [209.85.214.171]) by smtp.gmail.com with ESMTPSA id
 i35-20020a635423000000b0050362744b63sm404309pgb.90.2023.03.09.20.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 20:56:06 -0800 (PST)
Received: by mail-pl1-f171.google.com with SMTP id v11so4371298plz.8;
 Thu, 09 Mar 2023 20:56:06 -0800 (PST)
X-Received: by 2002:a17:90a:f8e:b0:234:1887:b46d with SMTP id
 14-20020a17090a0f8e00b002341887b46dmr9053810pjz.8.1678424166406; Thu, 09 Mar
 2023 20:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20221223085047.94832-1-agraf@csgraf.de>
 <20221223085047.94832-2-agraf@csgraf.de>
In-Reply-To: <20221223085047.94832-2-agraf@csgraf.de>
From: Joelle van Dyne <j@getutm.app>
Date: Thu, 9 Mar 2023 20:55:55 -0800
X-Gmail-Original-Message-ID: <CA+E+eSB0zJAzJ_ZEGbH00459nDGY+Fc0yMaUdodAYBM3vsUNQA@mail.gmail.com>
Message-ID: <CA+E+eSB0zJAzJ_ZEGbH00459nDGY+Fc0yMaUdodAYBM3vsUNQA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/intc/arm_gicv3: Make ITT entry size configurable
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Shashi Mallela <shashi.mallela@linaro.org>, Eric Auger <eric.auger@redhat.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.216.42; envelope-from=osy86dev@gmail.com;
 helo=mail-pj1-f42.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Fri, Dec 23, 2022 at 12:50=E2=80=AFAM Alexander Graf <agraf@csgraf.de> w=
rote:
>
> An ITT entry is opaque to the OS. The only thing it does get told by HW i=
s
> its size. In theory, that size can be any byte aligned number, in practic=
e
> HW will always use power of 2s to simplify offset calculation. We current=
ly
> expose the size as 12, which is not a power of 2.
>
> To prepare for a future where we expose power of 2 sized entry sizes, let=
's
> make the size itself configurable. We only need to watch out that we don'=
t
> have an entry be smaller than the fields we want to access inside. Bigger
> is always fine.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---

Tested-by: Joelle van Dyne <j@getutm.app>


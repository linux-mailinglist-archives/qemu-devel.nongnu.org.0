Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53484D8FED
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 23:56:55 +0100 (CET)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTtcU-00065o-9o
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 18:56:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nTtaz-0004lV-6J
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 18:55:21 -0400
Received: from [2a00:1450:4864:20::62e] (port=34496
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nTtaq-0004TZ-Vt
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 18:55:15 -0400
Received: by mail-ej1-x62e.google.com with SMTP id gb39so37023210ejc.1
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 15:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=y2Q/inabtnNQGMD1STwoVXN1cYBrHr5EEIPdNdUQA8M=;
 b=B3Ph160SYsccuR00NVF/PocSGd5KiKeGpNJQ+RhhnFCFJnM/0IodWWwadeJcwcmY+1
 p7mK/8zR77h4sFn6DIJS4jdi8ycIdBa6GBZQ6BXKTb3vVVmexiMZjgQShP38GekQRhLR
 OFFa1yqM6ceyWSEt+cqGDYutIRVgD92f7oipq5Mg9BeeGJDwvUB0CNZczv+2oAKHL7RU
 XtPyTH4G288CVUiVrITqt6JutYE0Qb0TgEX3xgugz+3QvZ9/Wgx/vbThbekaqzBLCdmr
 djWEZim/YuTV6z1bWLbTLYuLWSD1hi3Ql3isNXnEieORmw90FONvnt5WSh0jULarEWnD
 mY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=y2Q/inabtnNQGMD1STwoVXN1cYBrHr5EEIPdNdUQA8M=;
 b=i2o4ICJ6LnShykZPJiNMbMqAkgipCDJsLoT+QoAN3kTPy4Kw38it2HSydjH6T5eKfj
 1Y4slBrjBpc6s5iZNk6ZRoK8wNxmZdVM2SvPsE4Jy/TlMNeWiBCT/x7LvzSH/F+I1boO
 GsyaJSivo6s1vOaVirQRN5dSFCUYZ29rbUPPjRnKkqdHhPIqdQW4rdFGcZTyTpxEUJw8
 nSoniNZN+o90IQILKEp8ksNnccfKX8qqUaqcCBZ2x9R2SJuXodL351/Hb0tJcER0Qv2p
 TnozObhpndhE+ugHe1x5gSK0/wRHwXKBUnkp5E6F6dveMxO1uSqgS59BY/Q9rVBSYLDT
 r9UQ==
X-Gm-Message-State: AOAM530vuVnrrE1WiowI5Vzu3n3Qd7Pw3OIvb+Vlx0coOOkBnVCnj34z
 glxNKv8QK/8whxHTA5NeJZCEzA==
X-Google-Smtp-Source: ABdhPJwH8+Emwxdug9WRaA5Pn7fnzwuIyGSHomy+CWFwvXssMscVFR/0TRAwIvo8vB6/HLdlnvsYkw==
X-Received: by 2002:a17:907:3f9c:b0:6d8:116d:476b with SMTP id
 hr28-20020a1709073f9c00b006d8116d476bmr20220654ejc.432.1647298511045; 
 Mon, 14 Mar 2022 15:55:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a17090631c700b006b293ddbca1sm7314593ejf.35.2022.03.14.15.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 15:55:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 47A0E1FFB7;
 Mon, 14 Mar 2022 22:55:09 +0000 (GMT)
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Date: Mon, 14 Mar 2022 22:52:52 +0000
In-reply-to: <20220314160108.1440470-4-armbru@redhat.com>
Message-ID: <87y21c401e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Markus Armbruster <armbru@redhat.com> writes:

> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>
<snip>
> diff --git a/semihosting/config.c b/semihosting/config.c
> index 137171b717..6d48ec9566 100644
> --- a/semihosting/config.c
> +++ b/semihosting/config.c
> @@ -98,7 +98,7 @@ static int add_semihosting_arg(void *opaque,
>      if (strcmp(name, "arg") =3D=3D 0) {
>          s->argc++;
>          /* one extra element as g_strjoinv() expects NULL-terminated arr=
ay */
> -        s->argv =3D g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
> +        s->argv =3D g_renew(void *, s->argv, s->argc + 1);

This did indeed break CI because s->argv is an array of *char:

../semihosting/config.c:101:17: error: assignment to =E2=80=98const char **=
=E2=80=99 from incompatible pointer type =E2=80=98void **=E2=80=99 [-Werror=
=3Dincompatible-pointer-types]
  101 |         s->argv =3D g_renew(void *, s->argv, s->argc + 1);
      |                 ^
cc1: all warnings being treated as errors

So it did the job of type checking but failed to build ;-)


--=20
Alex Benn=C3=A9e


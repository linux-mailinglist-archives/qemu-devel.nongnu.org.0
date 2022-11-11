Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A60625C5C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:05:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otUdw-0004Vl-9H; Fri, 11 Nov 2022 09:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otUdR-0003uT-2M
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:04:03 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otUdL-0008Gv-OG
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:03:54 -0500
Received: by mail-wr1-x42d.google.com with SMTP id cl5so6591437wrb.9
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tO38agaHOvkPGRCJwImXCGEihKJqIsB1dmO3e2kiswE=;
 b=uHjojKkZz5U/dtGXlqeV0feMBfp5PRI1xZBYA56uwruVxoGoFvV55pvQZqNG695i1e
 NwnlOxSUqSuh2aQjv0SSytmbshynRP9GNF+FXxBLYX4bAR3i+LeN21OdDyDSOQxAfdzd
 PHvUb18BXp6oqHEeATkchG0yVovWfkYdIK2KGSAtbGKIe7XgFHjypY3H//wVA9tvFYK/
 PD2w8ntBcWFniT1hCuHiDggWdiTlEx+njZYhlUHKEO8UmgyahGyqJb+G3Q/hQl2lsywU
 ciGbqb5hOj1L/77gHTZiQcTC29GAZZqLYd11GMYIYF6UKx9TZGatqJwsY7hcU0CTxps7
 Pbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tO38agaHOvkPGRCJwImXCGEihKJqIsB1dmO3e2kiswE=;
 b=vSXud+SXXWlocbbhfCTlsDoJn/emPF/NR7gtW5vjBmPlC/+HWWsGrw94Uk7qWsLgZS
 aw8P6uiYyT+nTyWvgEuEbo3+OVBZJD6JWO2QA+Fi4ppdwgzoXq7HKZ3V1vWF5mKjNVlx
 gahMAZ0m+i0BJKiLkoJQz8G69v5Cl7KZGCtLbLEHPD3htPFxfIV9cqfoAJHg+Xyjs305
 sV2Fv2o0PcAu8Ig9RYQmcbY3i/I0Ijwqapnbxx51kpVJWNNbdyjeGmPeWEoId5sJkfR7
 PkMI1SltdEITdj1kWoDV5a5tJkaBb9asAAuTq8bzBJjJKuVjCKEAo2pFYroITZoKYrBh
 wrJQ==
X-Gm-Message-State: ANoB5pkSvMrzVeUT+CIZ3T3g6NrNrK1tAdiY+AIxiVpakStZHi3b4D6Z
 lTKQUVbn7WtQyqQIdke2bFkAFg==
X-Google-Smtp-Source: AA0mqf4/tBzhST5EzwHNojAZNyVlWQ6BY6fKGWzBClqFMw2YNJcMIouCFwtnOatCZNELz5Z8mhHfUg==
X-Received: by 2002:adf:de06:0:b0:236:6e2a:ac11 with SMTP id
 b6-20020adfde06000000b002366e2aac11mr1276438wrm.529.1668175427969; 
 Fri, 11 Nov 2022 06:03:47 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003cfa3a12660sm11948323wms.1.2022.11.11.06.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:03:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C39191FFB7;
 Fri, 11 Nov 2022 14:03:46 +0000 (GMT)
References: <874jv6enct.fsf@linaro.org> <87zgcyd70g.fsf@linaro.org>
 <Y21+VFqKpF6LGz2C@x1n> <87r0y9d623.fsf@linaro.org>
 <99a89e48-768c-4cc2-ead4-d2014aec7d44@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?= <philippe.mathieu-daude@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: should ioapic_service really be modelling cpu writes?
Date: Fri, 11 Nov 2022 14:00:28 +0000
In-reply-to: <99a89e48-768c-4cc2-ead4-d2014aec7d44@redhat.com>
Message-ID: <87iljld1vh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 11/11/22 13:26, Alex Benn=C3=A9e wrote:
>>       if (addr > 0xfff || !index) {
>>           switch (attrs.requester_type) {
>>           }
>>           MSIMessage msi =3D { .address =3D addr, .data =3D val };
>>           apic_send_msi(&msi);
>>           return MEMTX_OK;
>>       }
>
>
>> which at least gets things booting properly. Does this seem like a
>> better modelling of the APIC behaviour?
>
> Yes and you don't even need the "if", just do MTRT_CPU vs everything
> else.

Can the CPU trigger MSIs by writing to this area of memory? I went for
the explicit switch for clarity but are you saying:

        if (attrs.requester_type !=3D MTRT_CPU) {
            MSIMessage msi =3D { .address =3D addr, .data =3D val };
            apic_send_msi(&msi);
            return MEMTX_OK;
        } else {
            return MEMTX_ACESSS_ERROR;
        }

for the MSI range?


>
> Paolo


--=20
Alex Benn=C3=A9e


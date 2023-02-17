Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392E569B393
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 21:14:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT75z-0000g9-0b; Fri, 17 Feb 2023 15:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pT75q-0000fQ-Ps
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 15:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pT75p-0000Tn-AD
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 15:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676664745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uia+tHnxXF1Mxd7b2m+Kq0+7PoLy8W9C48q6jFmAAqA=;
 b=IzjDN1cT6toJ8o7hqoPucNjK5cKaCboijZmdgk4cqMqkGjvquA6HxY9KKOD+P6vP+DMdbf
 aibTQK04YOkLOqb6u1h/wiH35zhc3TZYQetLi/1iV6xmRUZUCXPXjEYJsSPCezVVIJv5iH
 P/9/cQ3Zue5kXze3RWRxaPW34+s1xlM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-117-oSoZYhQhOS6ZvmNHv9NCzA-1; Fri, 17 Feb 2023 15:12:23 -0500
X-MC-Unique: oSoZYhQhOS6ZvmNHv9NCzA-1
Received: by mail-pl1-f198.google.com with SMTP id
 d16-20020a170903231000b00198aa765a9dso1260280plh.6
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 12:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uia+tHnxXF1Mxd7b2m+Kq0+7PoLy8W9C48q6jFmAAqA=;
 b=xDuLns/4VIeTCQdALFkGGw0Z3vorjd+BkkU7kOCxPmcVKlpOrQLpHjLaE90OHmeAOt
 6lgjAAezsMiIeVlvpxzw//KASSY8aiq2u3i3M61Qju/M9NKoKhK09cAOCRajVVVG/mFH
 uTgRScsFasPLVbYKabw4Kr48X4mgrY/zMzsO5R+Us+Zw9/qvNlnyosODeTQrUlSdZO2c
 0WTJ2aVDTiqjxCFqHBWJYo4hRmBmSW5p0/Pe1mERX4Jo0xh+KcwxQAEA95D/Tf5RCh5P
 uDojZSrYYidweTPWHGeSD9lwDLSqdARRrquYZ1dRIAjIzHeAkjUdj872DVK5yDWiVQMl
 OM8w==
X-Gm-Message-State: AO0yUKX5eRkCWA4VTNMx84HU8i8gH0xSsfsy1eju5g/6gItaOIjsVlV4
 JRk1yY8X4pXrsGwAA3/R+N35uxzBqI9RPiLLggHpirJupsQTZVwoA3xr5RhFZWPg1hqjHX3Q5Gg
 FAZRWRDubT9ua3Tvu9hAeBjCKFWY14jc=
X-Received: by 2002:a17:90b:3906:b0:234:2592:efbe with SMTP id
 ob6-20020a17090b390600b002342592efbemr1602383pjb.131.1676664742881; 
 Fri, 17 Feb 2023 12:12:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8kuqx6XlQ3wrYDOhG78OgPeSL4m3pywNgX23wAZnpwqR+rxEjdtiseMPT6u9yfs0Y2lX8RX+DgmswWKhSfHGc=
X-Received: by 2002:a17:90b:3906:b0:234:2592:efbe with SMTP id
 ob6-20020a17090b390600b002342592efbemr1602380pjb.131.1676664742620; Fri, 17
 Feb 2023 12:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20230217103130.42077-1-f.ebner@proxmox.com>
 <3bfcd5cf-7564-6462-d1e6-65011e8bbe47@linaro.org>
In-Reply-To: <3bfcd5cf-7564-6462-d1e6-65011e8bbe47@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Feb 2023 15:12:11 -0500
Message-ID: <CAFn=p-Zx_mSWjiF_uCv5wztm8novucQn-F644wnNVBjxnMkiuA@mail.gmail.com>
Subject: Re: [PATCH] hw/ide/ahci: trace ncq write command as write instead of
 read
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Fri, Feb 17, 2023 at 7:27 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 17/2/23 11:31, Fiona Ebner wrote:
> > Fixes: e4baa9f00b ("AHCI: Replace DPRINTF with trace-events")
>
> Oops

Seconding the whoops.

>
> > Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> > ---
> >
> > Or should it be sorted alphabetically below execute_ncq_command_unsup?
>
> No, there is no convention...
>
> > I felt read and write belong close together and this reflects the
> > positions in the code.
>
> probably for this reason.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Thanks!
>

Reviewed-by: John Snow <jsnow@redhat.com>



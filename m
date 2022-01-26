Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E33449D662
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 00:52:54 +0100 (CET)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCs5t-0004eP-Fv
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 18:52:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nCs4v-0003yG-CV
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 18:51:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nCs4r-0002d6-QL
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 18:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643241107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9x0iHDfkSZ8HUM7aUGSF0Fwt9oAA2gaWd8CMkRkrC1c=;
 b=HWO5T0ggGeu6/QZWVPapnPedOWbwhKfl2qEysACeqW+E3qQ5pfBIiGnoWmNn8eiEmpp0pF
 h0zthQ4dSLkVAOPY/xxu4lPFGRGoh2/WLgtdnRWJtQjPVIYL5//NhDnfGRF6EH4MABk1S2
 P1dlsAMo9CcAXFYk7AJ/AMHTEe+vOxA=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-1YbgOYkWP4CxMksSnNwkgQ-1; Wed, 26 Jan 2022 18:51:46 -0500
X-MC-Unique: 1YbgOYkWP4CxMksSnNwkgQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 b26-20020a4ac29a000000b002dac1c5b232so675492ooq.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 15:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MBtStWo2wOoBG06q6JAsUAUSVBwPgVMHTXeyzhwVO3s=;
 b=3r/B82c+6J5ZhKLRbNC2aJ2M2Svi8WK56BPQW2JRnGKLO3yy1SQ4ygY20o7W3N4Y+B
 dWkSyAdcTji5KCS5mBn24rytB7SQbqUxjrvRA88tOJ/9cky9sqUynBycsYcNwWvXTKjS
 pMWtqM9ZgifUdhs8ATHhI003TftKYm44OpCm5rh8ZdD0bisDnMbhhRftp1SeMlwi6j62
 JUXpcD4FwktPFzSZcJAY+uH+KZZoRFevt960Ibu+euI1xufRyOAc2rx8t34pfS4dXgXa
 eOz99PokpIkj8TN2MRx5rXUyZIHwzMf+6Ee+Quof7JHXSDFwBGuBGdIhTN7E9SH8STJl
 2xWA==
X-Gm-Message-State: AOAM531BDN6sqJLlneJkVv0N76vftvCDb6qSg1KNwyXpmLt3KTD/wR7i
 trZ9V326yR0h4okG1OMb8uacSnCYVUa1YEDWZmJlgbafMA9u50O+/gBOMHt4RbqTEFo+5JDa8As
 kM43H1U2W6CW8BGI=
X-Received: by 2002:a05:6808:f0a:: with SMTP id
 m10mr669969oiw.65.1643241105773; 
 Wed, 26 Jan 2022 15:51:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7ichRm1sfpvh09AfnGMVZMjqN00T3qG9vExKkTi+zYaj6GTLP8jYKmZdL0UREnXJxHUe1ng==
X-Received: by 2002:a05:6808:f0a:: with SMTP id
 m10mr669959oiw.65.1643241105551; 
 Wed, 26 Jan 2022 15:51:45 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id o4sm10521301oiv.10.2022.01.26.15.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 15:51:45 -0800 (PST)
Date: Wed, 26 Jan 2022 16:51:43 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 0/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Message-ID: <20220126165143.29352fb4.alex.williamson@redhat.com>
In-Reply-To: <20220120001242.230082-1-f4bug@amsat.org>
References: <20220120001242.230082-1-f4bug@amsat.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Jan 2022 01:12:40 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> This is a respin of Eric's work, but not making tpm_crb.c target
> specific.
>=20
> Based-on: <20220120000836.229419-1-f4bug@amsat.org>
> "exec/cpu: Make host pages variables / macros 'target agnostic'"
> https://lore.kernel.org/qemu-devel/20220120000836.229419-1-f4bug@amsat.or=
g/
>=20
> --
>=20
> Eric's v2 cover:
>=20
> This series aims at removing a spurious error message we get when
> launching a guest with a TPM-CRB device and VFIO-PCI devices.
>=20
> The CRB command buffer currently is a RAM MemoryRegion and given
> its base address alignment, it causes an error report on
> vfio_listener_region_add(). This series proposes to use a ram-device
> region instead which helps in better assessing the dma map error
> failure on VFIO side.
>=20
> Eric Auger (2):
>   tpm: CRB: Use ram_device for "tpm-crb-cmd" region
>   hw/vfio/common: Silence ram device offset alignment error traces
>=20
>  hw/tpm/tpm_crb.c     | 22 ++++++++++++++++++++--
>  hw/vfio/common.c     | 15 ++++++++++++++-
>  hw/vfio/trace-events |  1 +
>  3 files changed, 35 insertions(+), 3 deletions(-)
>=20

Unfortunately, FTB:

../hw/tpm/tpm_crb.c: In function =E2=80=98tpm_crb_realize=E2=80=99:
../hw/tpm/tpm_crb.c:297:33: warning: implicit declaration of function =E2=
=80=98HOST_PAGE_ALIGN=E2=80=99 [-Wimplicit-function-declaration]
  297 |                                 HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE))=
;
      |                                 ^~~~~~~~~~~~~~~
../hw/tpm/tpm_crb.c:297:33: warning: nested extern declaration of =E2=80=98=
HOST_PAGE_ALIGN=E2=80=99 [-Wnested-externs]

This is a regression since Eric's v2.  Thanks,

Alex



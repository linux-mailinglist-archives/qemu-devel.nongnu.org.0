Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A858E6148FD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 12:31:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oppUH-0003RK-RS; Tue, 01 Nov 2022 07:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oppUF-0003Qu-HY
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:31:19 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oppU3-000726-H7
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:31:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso838136wmb.0
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0Gwj+KeVcMKcKQsIbe887gWwyMnAmJOUQ2Xug3392E=;
 b=P6PZjdiM+qVmj8ifokapnJ0O85Cpi0z8a3AnsFf/eXW7GRR4YEQg65+f6JuX9HqkTk
 rGxPOO7Bj3m3WLToJ5inAQKfzrLyS1yLrRw/zeRGFDHJB1xOM5zJT5x85gu3aHHSZZch
 utntvjrbRln7F5zcQofHW0BMSKRak1FAE0u9/duJxmjPtwbYWmwUkRSQ4OrkVOXWOesl
 Gj5bVA1jiABEnOB2+mg/XRPqAOcp2M+mXVZsl6FIIfgeXpeHxm7ziDOExU8yXhcxQqLg
 6z/sZyTNuc0f6YSFgp3zG0FEoCY+WkMpw+F93YzxCfAJvE1NgkEdYzjoOc1fpqds8eXe
 z15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=E0Gwj+KeVcMKcKQsIbe887gWwyMnAmJOUQ2Xug3392E=;
 b=2fCL/wPjACvaDb3KuaEl3CWbEU/3zbVNq/xKXJ7hLi28wikClyjpPKmClgETCb/+7v
 PAr+MJbl9OeVewdOnMuSMmjm17wjST8vAShS20FauZc++pMl5sOjY9+smBwoWyEV8BU/
 SKHbn25BxZuYKAucukYtHly1vOKqFa+RgemcGaokZSpI336NTYW12erIi5NfHBWZ1Eep
 CYOW7mCG/xZDs5FoPUnMPGA2KT9ZjV2kz4MNbG4oZN9O+/xtVULtQ+6Q/Hau+9bsfGRt
 LuGkCSuXNQ037EqkJ0CE1iUeNViLZIy57zjtvZ+nyb3sEcFCKUPUYG5Y2ReaT6467rS4
 wzKQ==
X-Gm-Message-State: ACrzQf2OROzkrjrA0AlmLWATzbZ5AToVhoAqbnryv6lL41e+elFDrK9L
 d+B7WQ6rhSU6ZPDXSNCceBUmBA==
X-Google-Smtp-Source: AMsMyM5o0tJvfqIBKDk20jbvxUN/qzPCBYCI8jWf41WcQUsgAdoz5Pi9lOd/2xFvWmS+JJHQAY5UNQ==
X-Received: by 2002:a1c:7207:0:b0:3cf:8115:b39a with SMTP id
 n7-20020a1c7207000000b003cf8115b39amr1287369wmc.80.1667302264398; 
 Tue, 01 Nov 2022 04:31:04 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003c6b7f5567csm1860167wmq.0.2022.11.01.04.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 04:31:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 29C4E1FFB7;
 Tue,  1 Nov 2022 11:31:03 +0000 (GMT)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-10-vikram.garhwal@amd.com>
 <87pmed1uww.fsf@linaro.org>
 <MW3PR12MB44094F971904ED24E1AC67939F359@MW3PR12MB4409.namprd12.prod.outlook.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Garhwal, Vikram" <vikram.garhwal@amd.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export
 xenstore_record_dm_state
Date: Tue, 01 Nov 2022 11:29:03 +0000
In-reply-to: <MW3PR12MB44094F971904ED24E1AC67939F359@MW3PR12MB4409.namprd12.prod.outlook.com>
Message-ID: <87iljylxmw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


"Garhwal, Vikram" <vikram.garhwal@amd.com> writes:

> Thanks, Alex, for reviewing this one. I built for all the archs and it wa=
s fine. Can you please share more about what
> environment builds are breaking? So, I can test the changes for v2.

My cross build environment failed:

  ../../configure' '--disable-docs' '--disable-tools' '--cross-prefix=3Daar=
ch64-linux-gnu-' '--enable-xen' '--target-list=3Di386-softmmu,x86_64-softmm=
u,arm-softmmu,aarch64-softmmu' '--disable-tpm'

On a Debian Bullseye with:

  11:30:20 [root@zen:~] # dpkg -l libxen\*
  Desired=3DUnknown/Install/Remove/Purge/Hold
  | Status=3DNot/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Tr=
ig-pend
  |/ Err?=3D(none)/Reinst-required (Status,Err: uppercase=3Dbad)
  ||/ Name                       Version                 Architecture Descr=
iption
  +++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  ii  libxen-dev:arm64           4.14.5+24-g87d90d511c-1 arm64        Publi=
c headers and libs for Xen
  ii  libxencall1:amd64          4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime library - libxencall
  ii  libxencall1:arm64          4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime library - libxencall
  ii  libxendevicemodel1:amd64   4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxendevicemodel
  ii  libxendevicemodel1:arm64   4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxendevicemodel
  ii  libxenevtchn1:amd64        4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxenevtchn
  ii  libxenevtchn1:arm64        4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxenevtchn
  ii  libxenforeignmemory1:amd64 4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxenforeignmemory
  ii  libxenforeignmemory1:arm64 4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxenforeignmemory
  ii  libxengnttab1:amd64        4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxengnttab
  ii  libxengnttab1:arm64        4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxengnttab
  ii  libxenhypfs1:amd64         4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime library - libxenhypfs
  ii  libxenhypfs1:arm64         4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime library - libxenhypfs
  ii  libxenmisc4.14:amd64       4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - miscellaneous, versioned ABI
  ii  libxenmisc4.14:arm64       4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - miscellaneous, versioned ABI
  ii  libxenstore3.0:amd64       4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxenstore
  ii  libxenstore3.0:arm64       4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxenstore
  ii  libxentoolcore1:amd64      4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxentoolcore
  ii  libxentoolcore1:arm64      4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxentoolcore
  ii  libxentoollog1:amd64       4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxentoollog
  ii  libxentoollog1:arm64       4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxentoollog

But also a bunch of cross builds on the CI system:

  https://gitlab.com/stsquad/qemu/-/pipelines/677956972/failures

>
>=20=20
>
> Regards,
>
> Vikram
>
>=20=20
>
> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Date: Thursday, October 27, 2022 at 2:24 AM
> To: Garhwal, Vikram <vikram.garhwal@amd.com>
> Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>, Stabellini, Stefano <s=
tefano.stabellini@amd.com>, Stefano
> Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citri=
x.com>, Paul Durrant <paul@xen.org>,
> xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
> Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export xenstore_record_d=
m_state
>
> Vikram Garhwal <vikram.garhwal@amd.com> writes:
>
>> xenstore_record_dm_state() will also be used in aarch64 xenpv machine.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>>  accel/xen/xen-all.c  | 2 +-
>>  include/hw/xen/xen.h | 2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
>> index 69aa7d018b..276625b78b 100644
>> --- a/accel/xen/xen-all.c
>> +++ b/accel/xen/xen-all.c
>> @@ -100,7 +100,7 @@ void xenstore_store_pv_console_info(int i, Chardev *=
chr)
>>  }
>>=20=20
>>=20=20
>> -static void xenstore_record_dm_state(struct xs_handle *xs, const char *=
state)
>> +void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
>>  {
>>      char path[50];
>>=20=20
>> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
>> index afdf9c436a..31e9538a5c 100644
>> --- a/include/hw/xen/xen.h
>> +++ b/include/hw/xen/xen.h
>> @@ -9,6 +9,7 @@
>>   */
>>=20=20
>>  #include "exec/cpu-common.h"
>> +#include <xenstore.h>
>
> This is breaking a bunch of the builds and generally we try and avoid
> adding system includes in headers (apart from osdep.h) for this reason.
> In fact there is a comment just above to that fact.
>
> I think you can just add struct xs_handle to typedefs.h (or maybe just
> xen.h) and directly include xenstore.h in xen-all.c following the usual
> rules:
>
>   https://qemu.readthedocs.io/en/latest/devel/style.html#include-directiv=
es
>
> It might be worth doing an audit to see what else is including xen.h
> needlessly or should be using sysemu/xen.h.=20
>
>>=20=20
>>  /* xen-machine.c */
>>  enum xen_mode {
>> @@ -31,5 +32,6 @@ qemu_irq *xen_interrupt_controller_init(void);
>>  void xenstore_store_pv_console_info(int i, Chardev *chr);
>>=20=20
>>  void xen_register_framebuffer(struct MemoryRegion *mr);
>> +void xenstore_record_dm_state(struct xs_handle *xs, const char *state);
>>=20=20
>>  #endif /* QEMU_HW_XEN_H */


--=20
Alex Benn=C3=A9e


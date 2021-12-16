Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4F0477B73
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 19:23:03 +0100 (CET)
Received: from localhost ([::1]:39066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxvPC-0000TG-HD
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 13:23:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1mxvNf-0007W3-5D
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:21:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1mxvNc-0005K0-2I
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639678883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+aq10VOb/+OYsNPJn8OeDGvt78tp66X5FV7Szzj95M=;
 b=dlwQKkunteJrKsK/ACaE3lBFpPF2V5ezO2YtP98+s92U6nhD/3tl+7klkT9Dq7YKGvD3SH
 b6EwNjCydsVe96qy/gbeGooD49PboXGBQtu3nPT1+XBcDpeBgeiDhWjhD0cSKmedNvifqA
 kz+Wh4xITOJ8CvjBBQUPjIzhCwk0ETU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-bzZHWQ8HO2qbikbPfdbk_A-1; Thu, 16 Dec 2021 13:21:22 -0500
X-MC-Unique: bzZHWQ8HO2qbikbPfdbk_A-1
Received: by mail-pf1-f197.google.com with SMTP id
 m16-20020a628c10000000b004a282d715b2so26562pfd.11
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 10:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N+aq10VOb/+OYsNPJn8OeDGvt78tp66X5FV7Szzj95M=;
 b=TOu6eQzjCurQ36KuAqfiP9Js5w9T3cAory8BVHuw4ccDI3ML9K+ZP6taneXSrGArY/
 DQbtP8ePQ93OzhsRXOrqJZvgMsHnQwi5IGmiAovhthyAv4ZBcj9FKfcn/6ItRcmgjbRh
 nQLkp2++fDhPtSsSI4FS/DzGSzYMzqSUtTqtmbD+9Wn5W5eVBgrdzuatPAJDGxj6/ogE
 2lk02CX6D/LDWNplLoRmVEro4haYuyaKaAinGfQjrR7KUFtQmPWGav+mz2/8v+pFCBkV
 D5BDpxevFs9xwLxRT0FFUvjB1NOi0ZdJ5XwmUmhqTkPQvUQbIAEw62J0KQZPdSQk0hZu
 t/tA==
X-Gm-Message-State: AOAM533t9F+AzKKRRs/XOVbykks50YbD8+UlKEwuZ9SD6uQ/Fp4aJ8xz
 085rZSxPYwB8iUEGB9xYvfDNUxclMEtspT15t69wa98g0HbmXkNWHw5Rp2fwczgWvyBpb/a4duk
 6828PlU4zlvY3sPfRzuf4SCeKCx+V/z8=
X-Received: by 2002:a05:6a00:26ca:b0:4a8:3129:84e with SMTP id
 p10-20020a056a0026ca00b004a83129084emr15306521pfw.74.1639678880680; 
 Thu, 16 Dec 2021 10:21:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyi9gDzIkBRtGlx+PsA6g1UoTBs4d/Qm8dkUUqQ0xIJtp/Mr4JGTD5Qa0fB4+shlYMZq23QPd4ig4slV6lc14=
X-Received: by 2002:a05:6a00:26ca:b0:4a8:3129:84e with SMTP id
 p10-20020a056a0026ca00b004a83129084emr15306499pfw.74.1639678880452; Thu, 16
 Dec 2021 10:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20211216175510.884749-1-philmd@redhat.com>
 <20211216175510.884749-3-philmd@redhat.com>
In-Reply-To: <20211216175510.884749-3-philmd@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Thu, 16 Dec 2021 19:21:09 +0100
Message-ID: <CAA8xKjWiei-2hU1XHpeaeePcRBOpqQUjW0UcNHHT8rTLUTewag@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/nvme/ctrl: Prohibit DMA accesses to devices
 (CVE-2021-3929)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Keith Busch <kbusch@kernel.org>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 6:55 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Fixes: CVE-2021-3929

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D2020298

> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/nvme/ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 604ed0aea0d..2be2c340b34 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1146,7 +1146,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, ui=
nt8_t *ptr, uint32_t len,
>      assert(sg->flags & NVME_SG_ALLOC);
>
>      if (sg->flags & NVME_SG_DMA) {
> -        const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> +        const MemTxAttrs attrs =3D { .memory =3D true };
>          MemTxResult res;
>          uint64_t residual;
>
> --
> 2.33.1
>

--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0



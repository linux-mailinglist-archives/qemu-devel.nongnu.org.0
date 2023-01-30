Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499A5680E0F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:52:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTdl-0006BQ-Fo; Mon, 30 Jan 2023 07:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMTdd-00067t-Ef
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:52:00 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMTdb-0008H8-Ms
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:51:57 -0500
Received: by mail-wm1-x32a.google.com with SMTP id q8so7907471wmo.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 04:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMaagSE3SE/FXhNP66mFIU372P/PDgh9Riid1tH4rgo=;
 b=GKp35J6GokNhJJ+t7n9VPcSiGXirBfBF14IFp/4CJ0qqhxA4RQP16Si5gULRsoUvzs
 Jc8uWWLQHA3Ilg/rWEi8+z7GzqozDyCRBgKPAfY5FNA8sIUYLAzvUkg9o16mHUt2T+Z1
 8OEx4dSrpdYBjyG944W8i8Bfwrn2gKi7zm91RSnBqtH+Pusq2K86BvV5Z8WdTHGFZsHc
 qZPs48kwtL+k7WV7NgldbD0V84lrWhp9A+2M+/4NQ/ollZpOUHqNAf4NpXf3tZtAqoni
 o011nX0/nCdrF86aHyWzxvkijp89hap94Le2bQet45P0yP3YcPEFwBblM4UBUwGeY6M4
 3uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kMaagSE3SE/FXhNP66mFIU372P/PDgh9Riid1tH4rgo=;
 b=1Z1202cZj/aqxmBOcbGV3lD/pR1kU6jbwDyTCEy3J/NamuZpdqRzQ7IjSjjpxL6hOp
 HsjsLFOAda0qe1YDksDhCEqkUvvRRa+PFf34mfW3osO2ONGHNxPt7DxUnaPDLpJlmP1X
 Qvn6sYIMSuKi68YdxrVPkgCojcZ0njD8bMyhhtHTSwBosB093bMczriiBnu14SwPitC4
 FNsXYA/8FhkjwChczxkorGx7Vm45rgv49iYAzkKiEKFvAeixzlps3Bu72PZtPXczKEHn
 fGuZ9Wbf3gTM4zwVHPAxmlnQAKpi8URf7EzCW8FEoJHcNfSzg0rQlLDzF8WM43mduvwk
 2iTg==
X-Gm-Message-State: AO0yUKXSVj+WaGRxyS7h4HXKd8nwOyd9q/SbvhFdh8RQxZPlUGO8zehl
 8iweEZb2r8PPE7J0neWY+XD8Cg==
X-Google-Smtp-Source: AK7set/0vskfkAQetD6bF8drXrvWme7DM23DSVbcPRrhQHfUiqMTzJw2x6lSR3lmLks8Cr2atZaLCg==
X-Received: by 2002:a05:600c:188a:b0:3dc:506e:6559 with SMTP id
 x10-20020a05600c188a00b003dc506e6559mr7114784wmp.37.1675083114034; 
 Mon, 30 Jan 2023 04:51:54 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e38-20020a05600c4ba600b003dc434900e1sm8289405wmp.34.2023.01.30.04.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 04:51:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0469B1FFB7;
 Mon, 30 Jan 2023 12:51:53 +0000 (GMT)
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <20220926142422.22325-2-antonio.caggiano@collabora.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/9] virtio: Add shared memory capability
Date: Mon, 30 Jan 2023 12:51:04 +0000
In-reply-to: <20220926142422.22325-2-antonio.caggiano@collabora.com>
Message-ID: <87v8ko6v87.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


Antonio Caggiano <antonio.caggiano@collabora.com> writes:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG' to allow
> defining shared memory regions with sizes and offsets of 2^32 and more.
> Multiple instances of the capability are allowed and distinguished
> by a device-specific 'id'.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
> v3:
>   - Remove virtio_pci_shm_cap as virtio_pci_cap64 is used instead.
>   - No need for mask32 as cpu_to_le32 truncates the value.
>
>  hw/virtio/virtio-pci.c         | 18 ++++++++++++++++++
>  include/hw/virtio/virtio-pci.h |  4 ++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index a50c5a57d7..377bb06fec 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1169,6 +1169,24 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *=
proxy,
>      return offset;
>  }
>=20=20
> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id)
> +{
> +    struct virtio_pci_cap64 cap =3D {
> +        .cap.cap_len =3D sizeof cap,
> +        .cap.cfg_type =3D VIRTIO_PCI_CAP_SHARED_MEMORY_CFG,
> +    };
> +
> +    cap.cap.bar =3D bar;
> +    cap.cap.length =3D cpu_to_le32(length);
> +    cap.length_hi =3D cpu_to_le32(length >> 32);
> +    cap.cap.offset =3D cpu_to_le32(offset);
> +    cap.offset_hi =3D cpu_to_le32(offset >> 32);
> +    cap.cap.id =3D id;
> +    return virtio_pci_add_mem_cap(proxy, &cap.cap);
> +}
> +
>  static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
>                                         unsigned size)
>  {
> diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pc=
i.h
> index 2446dcd9ae..5e5c4a4c6d 100644
> --- a/include/hw/virtio/virtio-pci.h
> +++ b/include/hw/virtio/virtio-pci.h
> @@ -252,4 +252,8 @@ void virtio_pci_types_register(const VirtioPCIDeviceT=
ypeInfo *t);
>   */
>  unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);

As this is adding to the internal API it would benefit from a kerneldoc
style comment block in the header.

> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id);
> +
>  #endif

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


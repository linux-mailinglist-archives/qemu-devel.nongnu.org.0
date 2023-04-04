Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3056D559B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 02:38:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjUg2-0000ed-5g; Mon, 03 Apr 2023 20:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pjUfz-0000eG-NN
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 20:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pjUfF-0004v7-5m
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 20:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680568603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WAnbz455ju5JtPpU1B/aelnT/VtDTfayKc9YAI8XtlY=;
 b=bH/bqWFu/yafQ6vFBDHgrHevs/88AryRQRfFmVOp1dYDFQ8QaZvHoEn2FcGu3SDlv3Aayc
 I/BxnyEc+94JEWTPUpRzk6Jp+MiAZDaNkpxpc2qS0wIEn1uizX30aRjBdMMToMf253i+rp
 JiDTjbLbVpi98lyl2cQHNSBKjWA/YrE=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-CNWW5NtKPNepxBFt4E7eQQ-1; Mon, 03 Apr 2023 20:36:42 -0400
X-MC-Unique: CNWW5NtKPNepxBFt4E7eQQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 t18-20020a4a7452000000b00525456d55f7so8106611ooe.14
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 17:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680568601; x=1683160601;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WAnbz455ju5JtPpU1B/aelnT/VtDTfayKc9YAI8XtlY=;
 b=NTFhzFvN6ITB+I0lioppJ0lvsyaWPtRjaF/5z5hJajT64F35QUBGzlvSPErNZ2cdUZ
 zxk8pSQSo/OaaypPCMC09m2vbZqMmmVERoxFjuoi6TDJFgrM1gp8zk2ZL7Q3gQN1LqcQ
 lpPWx9YpLZBw4SZkTSS6JkMIchwgEKuDRubkrgWewiw++ch+Wulz8J7f1o9xh4pNISTR
 xX8w4tRizM0Zztqo8hoJ//OOg5hGjWxMNbowbe80sBF/MZOk8I2NvdS7nfXymU91D0A7
 7wTfAqoVVdQh1ueCRGBRtq2RWMGyMfJNdmMM2KpSeC/P4N1bvtOQPObFElrZohHcFPh2
 fTPQ==
X-Gm-Message-State: AAQBX9eCKkpnJ1dAXM5FQ7Qt9ej2vbzBcW9JpUaUlBnlebxMs4dals21
 s0LOzW3lZrNWZ4ij3CqtxDuQqn/7VSyzPqXXO1mGxQEyQR0QwOsCuNHF32CpuMhJgUf3jTGScmi
 egmEMSGy/PyUUCMneU+SvIs/pJBuVHiU=
X-Received: by 2002:a4a:e6c1:0:b0:539:7cb5:7a0e with SMTP id
 v1-20020a4ae6c1000000b005397cb57a0emr543233oot.0.1680568601723; 
 Mon, 03 Apr 2023 17:36:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350YueUgtFKS/uYg3NfeTA+4Rhj2t3S25ehhD1UdZnHu05DSZxtjzcgOZ3cTjg2343+4y3KvD36AmE9mWoET0OCQ=
X-Received: by 2002:a4a:e6c1:0:b0:539:7cb5:7a0e with SMTP id
 v1-20020a4ae6c1000000b005397cb57a0emr543227oot.0.1680568601494; Mon, 03 Apr
 2023 17:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230331150410.2627214-1-eperezma@redhat.com>
In-Reply-To: <20230331150410.2627214-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 4 Apr 2023 08:36:30 +0800
Message-ID: <CACGkMEvneh-NF-LftBNpjBzvEfBzA0PVVoGkqqiJEkSZKV1NSg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_MAINTAINERS=3A_Add_Eugenio_P=C3=A9rez_as_vhost?=
 =?UTF-8?Q?=2Dshadow=2Dvirtqueue_reviewer?=
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Mar 31, 2023 at 11:04=E2=80=AFPM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
>
> I'd like to be notified on SVQ patches and review them.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef45b5e71e..986119e8ab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2061,6 +2061,10 @@ F: backends/vhost-user.c
>  F: include/sysemu/vhost-user-backend.h
>  F: subprojects/libvhost-user/
>
> +vhost-shadow-virtqueue
> +R: Eugenio P=C3=A9rez <eperezma@redhat.com>
> +F: hw/virtio/vhost-shadow-virtqueue.*
> +
>  virtio
>  M: Michael S. Tsirkin <mst@redhat.com>
>  S: Supported
> --
> 2.31.1
>



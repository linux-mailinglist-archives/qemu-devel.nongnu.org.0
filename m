Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7C6A6E1A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:15:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXND8-0003fK-Fn; Wed, 01 Mar 2023 09:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXNCw-0003dg-8W
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXNCu-0007DH-BN
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677680003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDqtituCa8SLMMVLNkoiTnXN8ZttmxIZVl20pm4bLU8=;
 b=LRXyf6KJRg38vgPTb10zLFcZlKV/Gvoa2DCxq7A/8aJOCxNzpYjkQlClbSjICwPKHZVAEK
 K87qi/v+mALB3sTVbY6091PiB+H1bTdiqbq41rJxX/Mi5+Og/IZOgWIuAB+vXTPJHfdju1
 ltvh5Zeh7U2+NYI2aIAL9V9HzbFbNLg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-rQgZzUTmN_q2zvdfQcWXgA-1; Wed, 01 Mar 2023 09:13:20 -0500
X-MC-Unique: rQgZzUTmN_q2zvdfQcWXgA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k6-20020adfc706000000b002c716981a1fso2580161wrg.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 06:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677679999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UDqtituCa8SLMMVLNkoiTnXN8ZttmxIZVl20pm4bLU8=;
 b=JjuCmf2sX0PSX6tEe2bs3m8r5Oh+/n5zM9KLYOmFpNqA+MbT4V98E94a8xp04QEJII
 pwy98rssoq5wrB7i8it+PJ9us24YUee4fo8whqBaXPNFCiQtgeLIBz1KCJIgsgbHQdQ4
 Bay3B3uA3aNFzGoc2dK8vhBToiwjNlx2JrqJ2pELEBPF76eTH1fCAIoXrKl+iVeIZOnD
 ZyFVvPSr1QpW4kxp1Mv2WTrBAwoot4DWSc/LRCsNOcdpFTTc6kouQrawvDDLU6T59b0u
 vBk9mbGrJIOsxGYuTn9rqqVOq/l3XiY/hPqQ67hR8G6Gz2Yt+4mycT8WpdssoGk2E6FD
 FdTg==
X-Gm-Message-State: AO0yUKWVJM2BktN7LzjITob2gdhk9mNfTV7CbXMIZlG4r6xlpZJQXzn+
 dtc+YSWviIzTqyfpvoSWl08yGbcVhzgJGVIkdFWtGSl2b4i8rptDxIAsCdtZ+94wZCUXCRaPAiE
 JC/sYa+2+JG79cQM=
X-Received: by 2002:a05:600c:4b30:b0:3df:fbc7:5b10 with SMTP id
 i48-20020a05600c4b3000b003dffbc75b10mr5018638wmp.0.1677679999035; 
 Wed, 01 Mar 2023 06:13:19 -0800 (PST)
X-Google-Smtp-Source: AK7set8Uid7YDAHSzrAB10bOQlNB5G07+icJVp4t+tNPjToATLMsRUgn1JSI1HzHSrYFGbC8tKlvMQ==
X-Received: by 2002:a05:600c:4b30:b0:3df:fbc7:5b10 with SMTP id
 i48-20020a05600c4b3000b003dffbc75b10mr5018619wmp.0.1677679998698; 
 Wed, 01 Mar 2023 06:13:18 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 fj10-20020a05600c0c8a00b003e7c89b3514sm20008881wmb.23.2023.03.01.06.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:13:18 -0800 (PST)
Date: Wed, 1 Mar 2023 15:13:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng
 <fam@euphon.net>
Subject: Re: [RFC PATCH 07/19] hw/scsi: Set QDev properties using QDev API
Message-ID: <20230301151317.0ab8b7f5@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230203180914.49112-8-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
 <20230203180914.49112-8-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri,  3 Feb 2023 19:09:02 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/scsi/scsi-bus.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index ceceafb2cd..a8003126c4 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -347,11 +347,7 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, =
BlockBackend *blk,
>          object_unparent(OBJECT(dev));
>          return NULL;
>      }
> -    if (!object_property_set_bool(OBJECT(dev), "share-rw", share_rw, err=
p)) {
> -        object_unparent(OBJECT(dev));
> -        return NULL;
> -    }
> -
> +    qdev_prop_set_bit(dev, "share-rw", share_rw);

likely broken, see cover letter reply
(I'm stopping here, series should be rewritten to drop unjustified conversi=
ons or commit message describe why it's safe)


>      qdev_prop_set_enum(dev, "rerror", rerror);
>      qdev_prop_set_enum(dev, "werror", werror);
> =20



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50BC45B56D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:34:09 +0100 (CET)
Received: from localhost ([::1]:52024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmnA-0006L0-WE
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:34:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mpmdx-0005tK-Dp
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mpmds-00049V-Ok
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637738670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jx5lDCRKdxggj6hK68GU3PcaDWGHBT1IKB8piOsKO9k=;
 b=OO5TISmO0QTrjJfBbbSTVTfIt/2LVMB+cLGk1ZjqEZT4GIpeVVIAp58AxkQKLfLfTEVHGi
 WxhFyNkAEP7O49HTSzpin6JYHrbn2Oe8rvgX2j7u5ADs/+mbEe3EHbGt6Vn01mhzjdXEJn
 LFZRgHhsBa3cmPZntl50mej+Qjjh7t8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-KWDhf-tWM76DziLx_GDuwg-1; Wed, 24 Nov 2021 02:24:29 -0500
X-MC-Unique: KWDhf-tWM76DziLx_GDuwg-1
Received: by mail-ed1-f70.google.com with SMTP id
 t9-20020aa7d709000000b003e83403a5cbso1361942edq.19
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:24:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jx5lDCRKdxggj6hK68GU3PcaDWGHBT1IKB8piOsKO9k=;
 b=8K3RwJJ7TB2AQcqdQFaDDmZYaXLy0mSWO0nGsP6s2UbIsRfd27SWcWOmiXvs0zyEw5
 FLD44wqR42s0xefy5IDcJ/7+Y5wdlNov4v8RwXfXi/QUm9FVfBF8fcTYepzaxUPFDimT
 z56a0k8ECdQCjEWCGlMIMLkiaq7BBc7ufZgauOeZhQLhdFLQVK2QJAbOe08ON2eY/iHq
 41QrHprrjDroEbyrSecRmxw6ZepnzlwbLl7lY8h5J+m9XUEG+reD9i/Zu1aF9acFdwGT
 m2dSDFJI2jIdtsP6XVQcQEixfLpiYXI9/tIMxguxm+FdmQSsLN2Vrr1VqHnNLOWKRZH5
 NkLg==
X-Gm-Message-State: AOAM530UQFKChFgTiYZlX2nIAS04my+m9H8r5oHSq2jPRL8Rmg26c2DT
 DJSceEeiPmJYF4O9BMF/5j11s8lM2lh1DxAeCT3yI29WcRjX/fg59nycRjOJUG6pU8JCh1+JJqU
 MD/4qUbQ3EyupZlc=
X-Received: by 2002:a50:c38c:: with SMTP id h12mr20583265edf.72.1637738668103; 
 Tue, 23 Nov 2021 23:24:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTnj7drnyfZ6HaxW8hozCUHYFquvaA1n2pEmoZRyk+RbnPfNtpLbMvWYRqWTIy6Mhk2+4u5A==
X-Received: by 2002:a50:c38c:: with SMTP id h12mr20583233edf.72.1637738667922; 
 Tue, 23 Nov 2021 23:24:27 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q7sm7136096edr.9.2021.11.23.23.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:24:27 -0800 (PST)
Date: Wed, 24 Nov 2021 08:24:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] microvm: use MachineState->dumpdtb
Message-ID: <20211124082426.329ca0d4@redhat.com>
In-Reply-To: <20211123091648.115334-1-kraxel@redhat.com>
References: <20211123091648.115334-1-kraxel@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Nov 2021 10:16:48 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> There already is a machine property to dumb the device tree for
s/dumb/dump/


> debugging purposes, and the helper function qemu_fdt_dumpdtb()
> implementing the dumbing.  Make microvm use it for consistency.
ditto

> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/i386/microvm-dt.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
> index 875ba9196394..e6f5a90209c5 100644
> --- a/hw/i386/microvm-dt.c
> +++ b/hw/i386/microvm-dt.c
> @@ -330,12 +330,5 @@ void dt_setup_microvm(MicrovmMachineState *mms)
>      fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
>      fw_cfg_add_file(x86ms->fw_cfg, "etc/fdt", mms->fdt, size);
>  
> -    if (debug) {
> -        fprintf(stderr, "%s: writing microvm.fdt\n", __func__);
> -        g_file_set_contents("microvm.fdt", mms->fdt, size, NULL);
> -        int ret = system("dtc -I dtb -O dts microvm.fdt");
> -        if (ret != 0) {
> -            fprintf(stderr, "%s: oops, dtc not installed?\n", __func__);
> -        }
> -    }
> +    qemu_fdt_dumpdtb(mms->fdt, size);
>  }



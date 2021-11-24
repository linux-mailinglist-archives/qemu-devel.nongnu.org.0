Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AB745B7C9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:49:33 +0100 (CET)
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpouC-0000rZ-82
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:49:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mpotF-0000Cp-4F
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:48:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mpotC-0003G8-76
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OvaTkZvRGUydUITfcQURRFV1NKG+AlafrsBPhrOnY+c=;
 b=EGcu9cehRRSojeCN0z1pIfyGgYB3lXVPyAyd/rwKmN08BgOffn9H6OtQ1BtHjJLhhKxC1d
 m2dYPHT7iMj9kKnXOqgHgT+puvfFD//oyJ7UoQQzragde97+SLxo1aLt90gattdzZ0MqjR
 oxhGG/fW0RdFQL1cma6XR5hBDuHyyzM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-tgEcsc8wMyeTguzAAVGdow-1; Wed, 24 Nov 2021 04:48:25 -0500
X-MC-Unique: tgEcsc8wMyeTguzAAVGdow-1
Received: by mail-ed1-f70.google.com with SMTP id
 w4-20020aa7cb44000000b003e7c0f7cfffso1806518edt.2
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OvaTkZvRGUydUITfcQURRFV1NKG+AlafrsBPhrOnY+c=;
 b=ihY4SSUAl/zYPMN5d8OidEBPppBcHayawRqtm7wgte6Q5bsOleW4aGltpN7Z3YOlZl
 4hPoTnfbk6iATZdCx3QPMuaHLUmvQPd8CiEKMec/9sjuIftw2CDupWZ+ycgq1eFnXuAT
 gLixdtf7K4UwNg6n2J44cnd99EK3AzOomjp1Hqtd+RKqTHmvLavK8DprztJEVk0bDPBF
 SkHbFe1deYBbBbc0V20CCSpemKaY2ajKc/tYipW0ufDwDPL6vUQzHm/X6y3tjK23rwIB
 mG2olNMDoAjMUCb6rp7jDPrTjG+eboPEONiJUI/I+vdFBhu2Klp4ftjfdPLZvR1hxf51
 MXZg==
X-Gm-Message-State: AOAM533skqhtFpZ7juEWrY4w27wWbnQKRLj9djriup0LFXjLhjx3F6yH
 y6aTlItxpNpa4wNOni0DViRJRpIWe/ChWp+mropBu76bdTYi5mFEn+KTWAFn+dFIpQceh7l42M0
 JkJbLDXFPzhr6MIk=
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr18800639ejj.113.1637747304313; 
 Wed, 24 Nov 2021 01:48:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3AiHgeoI0JJmVvQR0YbcVnfm2nJk53JpWkuoN+JPy7qRYA/M4BoFrZGcGtsQCp06CcFMUxg==
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr18800605ejj.113.1637747304138; 
 Wed, 24 Nov 2021 01:48:24 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id gz10sm6405777ejc.38.2021.11.24.01.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:48:23 -0800 (PST)
Date: Wed, 24 Nov 2021 10:48:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] microvm: use MachineState->dumpdtb
Message-ID: <20211124104822.0f87dff3@redhat.com>
In-Reply-To: <20211124081637.525180-1-kraxel@redhat.com>
References: <20211124081637.525180-1-kraxel@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Nov 2021 09:16:37 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> There already is a machine property to dump the device tree for
> debugging purposes, and the helper function qemu_fdt_dumpdtb()
> implementing the dumping.  Make microvm use it for consistency.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/microvm-dt.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
> index 875ba9196394..e6f5a90209c5 100644
> --- a/hw/i386/microvm-dt.c
> +++ b/hw/i386/microvm-dt.c
> @@ -330,12 +330,5 @@ void dt_setup_microvm(MicrovmMachineState *mms)
>      fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
>      fw_cfg_add_file(x86ms->fw_cfg, "etc/fdt", mms->fdt, size);
> =20
> -    if (debug) {
> -        fprintf(stderr, "%s: writing microvm.fdt\n", __func__);
> -        g_file_set_contents("microvm.fdt", mms->fdt, size, NULL);
> -        int ret =3D system("dtc -I dtb -O dts microvm.fdt");
> -        if (ret !=3D 0) {
> -            fprintf(stderr, "%s: oops, dtc not installed?\n", __func__);
> -        }
> -    }
> +    qemu_fdt_dumpdtb(mms->fdt, size);
>  }



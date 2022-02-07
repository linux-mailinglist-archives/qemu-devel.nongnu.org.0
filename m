Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4474AB7EF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:48:25 +0100 (CET)
Received: from localhost ([::1]:48974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0dE-0006TF-KO
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:48:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nGzBD-0004nx-SZ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:15:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nGzBA-0005I5-2k
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644221681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNENrEZi5JUr9526jG8sXSJtvoLgiV/9CEHeArPH6jg=;
 b=Hg59FLrlJCA33g/X+JXd2ycfo/R4NwtxLI9FOUfO1xINXq3xSFEtEQEQ/guhjLPcLEXcfp
 GrzvmI2b1GQ9yUoS+2GVaRyT+Hhc/mvLUPRrI0nAHt6QO+eEMnsp5MsRT0hFjlW8xIK5nw
 JkaGekuoVeFohPRvUBZtvIIq+gz4VHk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-2vuHqutvPG2ywzZ0CfBwFA-1; Mon, 07 Feb 2022 03:14:40 -0500
X-MC-Unique: 2vuHqutvPG2ywzZ0CfBwFA-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee7-20020a056402290700b0040f680071c9so1351151edb.9
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PNENrEZi5JUr9526jG8sXSJtvoLgiV/9CEHeArPH6jg=;
 b=18lpGnEd+RNYwUb+1xWp+gnJYtSIfFQvsX3vBnKfEy2VCMwQmV45PTsTK3C6HaMYNe
 QtQuAgYGeV1TqbeDoqWyyt6XHZ++xsdMJbsG+LkADvHhLGBli5EJJWs8arNMpxcxDKz7
 LvDHhSBGExVtlGT89k8PYfvyLJwyItCWSRP8aoXv0y29lfOtuE64+ahbQZXvNF4PvQbs
 3rG7twRObiqLuUmRmCFIxlCpj4LIVLjKB9C7nBptQd1JL1/DCOBKUpoS/kvoSekQx0b8
 ZwKJA7jgeUnaSe7X+6JtHQvC0fW9ma9iuyBOcQIZfdFkWEFhtjJ6dVyVTqPZd1rLwdCX
 d2cA==
X-Gm-Message-State: AOAM53123ki0tciFkahfbumXFTJED1rtfUVFWcBE6ijCRA8AyejjdNX/
 CCYPTCBmaWlnEqXYftbI9ZwZSf1l2mnQFlXjr/gejB4SDF+A7gDA1kNhscmuisH4RFzCCIZPKeH
 TkNuOXpagupecIyQ=
X-Received: by 2002:a17:907:7246:: with SMTP id
 ds6mr6034692ejc.762.1644221679104; 
 Mon, 07 Feb 2022 00:14:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgalLQczq61Or+umMNyvhu5G9qui74o1J1GVup2bWi8wbzxUV8ZPfDXqNKeyVBWdpnFKCmTQ==
X-Received: by 2002:a17:907:7246:: with SMTP id
 ds6mr6034675ejc.762.1644221678907; 
 Mon, 07 Feb 2022 00:14:38 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id y16sm576640ejd.72.2022.02.07.00.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 00:14:38 -0800 (PST)
Date: Mon, 7 Feb 2022 09:14:37 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
Message-ID: <20220207091437.52cf36b1@redhat.com>
In-Reply-To: <20220205124526.500158-3-f4bug@amsat.org>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, "Daniel P .
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat,  5 Feb 2022 13:45:24 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Previously CPUs were exposed in the QOM tree at a path
>=20
>   /machine/unattached/device[nn]
>=20
> where the 'nn' of the first CPU is usually zero, but can
> vary depending on what devices were already created.
>=20
> With this change the CPUs are now at
>=20
>   /machine/cpu[nn]
>=20
> where the 'nn' of the first CPU is always zero.

Could you add to commit message the reason behind the change?


> Note: This (intentionally) breaks compatibility with current
> libvirt code that looks for "/machine/unattached/device[0]"
> in the assumption it is the first CPU.
Why libvirt does this in the first place?

=20
> Cc: libvir-list@redhat.com
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/x86.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b84840a1bb9..50bf249c700 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -108,6 +108,7 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic=
_id, Error **errp)
>  {
>      Object *cpu =3D object_new(MACHINE(x86ms)->cpu_type);
> =20
> +    object_property_add_child(OBJECT(x86ms), "cpu[*]", OBJECT(cpu));

that will take in account only initial cpus, -device/device_add cpus
will still go to wherever device_add attaches them (see qdev_set_id)

>      if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
>          goto out;
>      }



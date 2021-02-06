Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562E2311F3C
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 18:59:15 +0100 (CET)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8RrV-0001CS-SU
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 12:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l8Rq5-0000gb-3n
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 12:57:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l8Rq0-0004ev-Mr
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 12:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612634256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fxq3c6rkh/W4qe9DOSGRD/nx7Ze2dDULgpMzZydYTb0=;
 b=D1QBPYy+qNAvYrlPrJFlJZQJ8qtvOvxbggAFE2MgM80apVymPRcBptS/Gk/t2N72SLEvr9
 tvshsecDkaaUCZfJGxN2AUw4F7zaF0qExIsKareneraDTh7JTtg9ugA1fEl9Cf/pPp1PH5
 vcuYKHz01m1uJsdCoyBxuT6apUmtd9g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-WGv5d1RQOWKL0AuvMRcH_A-1; Sat, 06 Feb 2021 12:57:35 -0500
X-MC-Unique: WGv5d1RQOWKL0AuvMRcH_A-1
Received: by mail-wr1-f70.google.com with SMTP id s18so8195113wrf.0
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 09:57:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fxq3c6rkh/W4qe9DOSGRD/nx7Ze2dDULgpMzZydYTb0=;
 b=Rwh2oSEuSrx2JX6jdUIdG2mUY4Gc39meYYu4u2gzOtqc7kJg0upuedzkROkgkwfFOc
 BnPT1TRzJn7/5TmqSp4Ggr7faBhBF0LeXp9iRjgX7pmMcNANAaOIR6o7PIWGzvfQLAWm
 usp7JsRnwTjcqPtbBwoLSnVaB+eCmwIPaY1uHGtkrQ44wBRUNZiIToTQgnl4EwYM5uEE
 JyJqMvwDYB4ZGm91uCVA7fIDosdOzxu6O5FEDBJG3Fd5Rtkn/Mq2Rdo6SQwjMP6aLSA3
 hGp3wapZALxqTT/zz90N8MQGcOMNwrOoY7ZKhFmPxSFRteaaeP5PAv1g0IZZZNuW+qBk
 SO+Q==
X-Gm-Message-State: AOAM533kxpPrW+CvPebxT4F5TKJSyZ+77AvA5DxzgpO59UVxOwgrEpgF
 J5pE2S2bLC2vWnJU1ex8i/eRaNPICyN3dhL2L1Z+jA5hRqcbtUVzmGo6Ts8dykmTZQdkxgrWMJF
 jFki8V9Cy+Y18MJo=
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr8370435wmc.168.1612634253839; 
 Sat, 06 Feb 2021 09:57:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJys+QaSaSqtH67gjZFYPEdlGVn+B4n5YpHys0rgQ6CDtfgzMOt9sVC/1SqvcKhVE9pSDu89dg==
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr8370420wmc.168.1612634253645; 
 Sat, 06 Feb 2021 09:57:33 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x13sm6958444wmc.27.2021.02.06.09.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Feb 2021 09:57:32 -0800 (PST)
Subject: Re: [PULL v3 11/27] multi-process: setup PCI host bridge for remote
 device
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210205164459.432714-1-stefanha@redhat.com>
 <20210205164459.432714-12-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <353e7615-4860-d0d0-1f52-b448559e7629@redhat.com>
Date: Sat, 6 Feb 2021 18:57:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205164459.432714-12-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.353,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.105, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 5:44 PM, Stefan Hajnoczi wrote:
> From: Jagannathan Raman <jag.raman@oracle.com>
> 
> PCI host bridge is setup for the remote device process. It is
> implemented using remote-pcihost object. It is an extension of the PCI
> host bridge setup by QEMU.
> Remote-pcihost configures a PCI bus which could be used by the remote
> PCI device to latch on to.
> 
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-id: 0871ba857abb2eafacde07e7fe66a3f12415bfb2.1611938319.git.jag.raman@oracle.com
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  MAINTAINERS                  |  2 +
>  include/hw/pci-host/remote.h | 29 ++++++++++++++
>  hw/pci-host/remote.c         | 75 ++++++++++++++++++++++++++++++++++++
>  hw/pci-host/Kconfig          |  3 ++
>  hw/pci-host/meson.build      |  1 +
>  hw/remote/Kconfig            |  1 +
>  6 files changed, 111 insertions(+)
>  create mode 100644 include/hw/pci-host/remote.h
>  create mode 100644 hw/pci-host/remote.c
...

> +static const TypeInfo remote_pcihost_info = {
> +    .name = TYPE_REMOTE_PCIHOST,
> +    .parent = TYPE_PCIE_HOST_BRIDGE,

                 ^^^^^^^^^^^^^^^^^^^^^

> +    .instance_size = sizeof(RemotePCIHost),
> +    .class_init = remote_pcihost_class_init,
> +};
> +
> +static void remote_pcihost_register(void)
> +{
> +    type_register_static(&remote_pcihost_info);
> +}
> +
> +type_init(remote_pcihost_register)
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index eb03f0489d..8b8c763c28 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -65,3 +65,6 @@ config PCI_POWERNV
>      select PCI_EXPRESS
>      select MSI_NONBROKEN
>      select PCIE_PORT
> +
> +config REMOTE_PCIHOST
> +    bool

       select CONFIG_PCI_EXPRESS ?

(Reported by Peter Maydell on s390x)

Side question, does it make sense to enable this feature by
default on all architectures?

Regards,

Phil.



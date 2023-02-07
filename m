Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD968DFCC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:19:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSZ1-0008Fv-5k; Tue, 07 Feb 2023 13:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSYz-0008F9-NU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:19:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSYy-0003sK-8g
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675793964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tlJvyIkHw+kEqypg/oUPCMuZ9Qrp54A/XQNKtZFujs=;
 b=Z83q7aLKtCf2N8eJEcbKxV103hDIBwPUt5JS6hcWFYyx2uF7ruu9AR3G6merPdXxwyDrWO
 TVnCcU5GZGQw/ILf9PobeR6ztZCMGBOtEIqxS0j4vAhfELBhx1Z07eUSk2bTD3kFcsJ/PQ
 H6BpDaGBJ0DzjHvQHaMl496Kqft7Pts=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-UyLy-51PMxaPg-30h23oKw-1; Tue, 07 Feb 2023 13:19:22 -0500
X-MC-Unique: UyLy-51PMxaPg-30h23oKw-1
Received: by mail-qt1-f199.google.com with SMTP id
 cr22-20020a05622a429600b003b694a9f291so9027420qtb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3tlJvyIkHw+kEqypg/oUPCMuZ9Qrp54A/XQNKtZFujs=;
 b=M0c769gamM4wHjbwScACRAVcIDsBBBQcl9lZ6VaOZHKBxHMEaezS9qJRN2D7VXPDnE
 +PZ2oEthRjCtwalOu9sI7FQf2CMLEWVhOAVoPCA5WACbqDx34J/DXQdzbiVLChsC09Mt
 eIHfNMAqS5vItJCSW0248hkRScdzpvKAgtLcxp/zZCWCC/WtkyQIoRcVGYimN8fudGpx
 mREFwvf/a7a+ABVnX0K7W5Sv6nSLfDKNmTXKiJxKrtkWkQqIdsNTM+I2jjP/wWky3ATZ
 lmWk5fZ5C6NXy1cBnkv2MLEyYzsla8TOLQEVYFPLH3aaLTCCRHppDKIIqbEpmINeYe5I
 O0uw==
X-Gm-Message-State: AO0yUKXpgHs5oq7RRFUVKxWCu/yGvXdtwl0GxRt4jwyLRfLyuurMWNeb
 0P2LLkbQaV3EpEIfo6u/nCkuh3lugA3QUGnaRJTGJAeEmHRf5E3MAd/lYpACC6MmBosAfO5I7Pm
 PUrzj+zl3WwYltV0=
X-Received: by 2002:ac8:5949:0:b0:3b8:41f4:94e7 with SMTP id
 9-20020ac85949000000b003b841f494e7mr6717850qtz.17.1675793962414; 
 Tue, 07 Feb 2023 10:19:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+dWkZol/kIpYW50sCKofOw6LibcxfL+GBEZ22FbNeKjulQ2k/PSz5b5xW4PkQpd7ZxoUn2Vw==
X-Received: by 2002:ac8:5949:0:b0:3b8:41f4:94e7 with SMTP id
 9-20020ac85949000000b003b841f494e7mr6717828qtz.17.1675793962204; 
 Tue, 07 Feb 2023 10:19:22 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 m3-20020ac807c3000000b003b848759ed8sm9799703qth.47.2023.02.07.10.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 10:19:21 -0800 (PST)
Message-ID: <6c5029a9-4832-fb7f-7dd4-eab81fe50a4b@redhat.com>
Date: Tue, 7 Feb 2023 19:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 05/10] hw/arm: Select VIRTIO_NET for virt machine
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-6-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206140809.26028-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/02/2023 15.08, Fabiano Rosas wrote:
> The 'virt' machine uses virtio-net-pci as a fallback when no other
> network driver has been selected via command line. Select VIRTIO_NET
> and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=n
> (due to e.g. --without-default-devices):
> 
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
> qemu-system-aarch64: Unsupported NIC model: virtio-net-pci
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   hw/arm/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2d157de9b8..8dcc08b7ec 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -31,6 +31,8 @@ config ARM_VIRT
>       select VIRTIO_MEM_SUPPORTED
>       select ACPI_CXL
>       select ACPI_HMAT
> +    select VIRTIO_PCI
> +    select VIRTIO_NET

Reviewed-by: Thomas Huth <thuth@redhat.com>



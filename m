Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88886F5CED
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:21:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puG9k-0005Hw-Iq; Wed, 03 May 2023 13:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG9h-0005GN-Eh
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:20:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG9e-0004Ka-QY
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DhLIT1hQ9NQ6tiRlnPdNFDA5BItQ+3X/+2t9eJvI9TU=;
 b=OxyKB5YzbuOEt1zAeNg8fqt9caXRagdL1FmGxAFf2FzrCwwj/QQXqsHYSY4gLo7W2UcPLj
 No/sQ/1lAJbGOPIYBXa9d2Ktst35GGBgdTgfiM8cXO0xfUdSW+anQjUud3YkPIhGf5MIpc
 ywDxZcqVcgXPJVzexhu0bArZdUJJpfM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-mI8QX8GEMp2jUAKavQhogQ-1; Wed, 03 May 2023 13:20:36 -0400
X-MC-Unique: mI8QX8GEMp2jUAKavQhogQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a341efd9aso660874766b.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683134435; x=1685726435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DhLIT1hQ9NQ6tiRlnPdNFDA5BItQ+3X/+2t9eJvI9TU=;
 b=YDSNtdU1VK1vuSuhSUoPNP0bjSAuWQr5RJaapqDvUdvuV1sr+jTcOHpI4DWVDdzJ/u
 n2RqDLSyh2GlvptK/rScWT5pgdLoBTvbb7dcdUfzgnCJ3xPDOSNVN2NgGxoLOm+qHcju
 MDhWoAqgthzmppHudw1b46+tjmP4WskIllbTnI3lErevQmfkNqui+zdx8wqdppku3gwc
 ayBGqc0ciGjmjELPAifYa54Lko0hQmEyGldqGy3EXwGb4cKuBlgbKFo9it82zoLzDGp0
 3z2XpVc3wyoJxHY5YBb+wY4xCy9nh1J0Ip/WOfMPVoDFYwz6NW2IB2Q/0wXlKyfOGFx1
 Y2Og==
X-Gm-Message-State: AC+VfDxWnpEmLINu++gDB/9ifGNlcBpDkYRgOaMd3w9uBD4OYTHXhQFD
 Nw0A3vhHM9rYmcudOBAZVbDqjf+5AxFN9qnXOQRynWrIa3YyXpYVhKyOZMb6S1MdIZfcylVI7ze
 TpgFWjnIzH4AeHVE=
X-Received: by 2002:a17:907:1b08:b0:959:bbda:fa51 with SMTP id
 mp8-20020a1709071b0800b00959bbdafa51mr3881773ejc.41.1683134435748; 
 Wed, 03 May 2023 10:20:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ72rNjGQfpO2b+MKi/Dr/hzIBWei4aq1FDuY0Ka6s0bnIB1oGGmvX7SRW1K0jgS5F+Y5XRhng==
X-Received: by 2002:a17:907:1b08:b0:959:bbda:fa51 with SMTP id
 mp8-20020a1709071b0800b00959bbdafa51mr3881749ejc.41.1683134435409; 
 Wed, 03 May 2023 10:20:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 s17-20020a170906285100b0094e597f0e4dsm17389590ejc.121.2023.05.03.10.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:20:34 -0700 (PDT)
Message-ID: <56e55af9-2c84-2975-d564-c79c7197b03e@redhat.com>
Date: Wed, 3 May 2023 19:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 16/22] hw/mips: add VIRTIO and USB dependencies for
 LOONGSON3V
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-17-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 11:12, Alex Bennée wrote:
> These are hardwired into the board so must be selected. This shows up
> as a "make check" failure with a --without-default-devices build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/mips/Kconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
> index da3a37e215..0fcc3da41c 100644
> --- a/hw/mips/Kconfig
> +++ b/hw/mips/Kconfig
> @@ -45,6 +45,9 @@ config LOONGSON3V
>       select PCI_EXPRESS_GENERIC_BRIDGE
>       select MSI_NONBROKEN
>       select FW_CFG_MIPS
> +    select VIRTIO_PCI
> +    select VIRTIO_NET
> +    select USB_OHCI_PCI

Neither is needed by -nodefaults.

Paolo



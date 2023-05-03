Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166696F5CE1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:18:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puG6l-00023r-Ur; Wed, 03 May 2023 13:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG6j-00023Y-Fo
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:17:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG6h-0003eL-Td
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=npURnzto/8Qutnc+kFrsIYo0shCoZdo7jKvoQ2Z/Kg0=;
 b=GrBI+iq5C2mrylKXhIN84dRTzofEaR9vg+LstRsn61p7IBWIDD9l0mhXknZJeXJoZed3RD
 /JAwCrk+2rOn78c+EMh8L1ykDXtv4PGAqE/XUmXfETSA3GpOz351sJzb3HecZki8LxvnCS
 eMFFx2ilDiwEbxMQEFNwrJCFYXWTTfM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-HBuDk76_OX-fG9UQ6FEpLw-1; Wed, 03 May 2023 13:17:34 -0400
X-MC-Unique: HBuDk76_OX-fG9UQ6FEpLw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-509f56de80fso6304233a12.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683134253; x=1685726253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=npURnzto/8Qutnc+kFrsIYo0shCoZdo7jKvoQ2Z/Kg0=;
 b=XpOEkyfYjBCopxS2SqeIuBZ4pYjG8sgEmMkTpoPYqNB+Ei1F/2O+CYCsWlRnUM4Lxh
 xvl8j2zwodGgomXrebgefaypW0SQTE7s2Cop4aKOJKWme0t0rLPQd0dIvbZxmXvOOoxK
 j7g2Tib7TXIB3PoDrq+mXn3rJ4KHi/9DNWCa+sLOCvmrzhGB4+Vd7wH54fHIbie6MWc1
 bAp4u0Lkyqz0wjmedIntDZpozLq12UxXAawcJfRA52Wsqml3ree0OhtCy7jS5XW1BiO8
 JxlEB5OSGzGjQnuOsqQOPU6ahWr74wS+JL7FLrMmqM2qg1NywYJyR5oVH3Y8N/PMoAXS
 2gHA==
X-Gm-Message-State: AC+VfDxvTVLN7zBhb7mCxvmOCdGmb5ODbp8wkzm/AAABnKHFx0ESYNP5
 N6LM7F4pCYOhH6/n65LKx8rqCJ1h4ObFE8Fg0l2tDi26OAoffcBxdCvbKcqRHuOIbXRE3ITIjkN
 +qX/yjTalrHDDRKE=
X-Received: by 2002:a17:907:a0d:b0:94f:2c22:a7a2 with SMTP id
 bb13-20020a1709070a0d00b0094f2c22a7a2mr3401373ejc.68.1683134252878; 
 Wed, 03 May 2023 10:17:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5T/GZWAmJzz104VyNMVKAdVOUw9DiYMxoElhSp5AKFqCaopkVr+7ZsRuljzn+doqzM4Qz0xQ==
X-Received: by 2002:a17:907:a0d:b0:94f:2c22:a7a2 with SMTP id
 bb13-20020a1709070a0d00b0094f2c22a7a2mr3401333ejc.68.1683134252545; 
 Wed, 03 May 2023 10:17:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 g11-20020a170906394b00b0094f4f2db7e0sm17808191eje.143.2023.05.03.10.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:17:31 -0700 (PDT)
Message-ID: <1ea33ebd-06d4-f621-b159-468a9011ceb0@redhat.com>
Date: Wed, 3 May 2023 19:17:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 13/22] hw/sparc: add a TCX dependency for SUN4M machines
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
 <20230503091244.1450613-14-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
> This is the fallback VGA devices needed for board creation so will
> otherwise fail under "make check" with a --without-default-devices
> build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>

Not needed:

info qtree
bus: main-system-bus
   dev: apc, id ""
   dev: empty_slot, id ""
   dev: escc, id ""
   dev: fw_cfg_mem, id ""
   dev: lance, id ""
   dev: macio_idreg, id ""
   dev: memory, id ""
   dev: openprom, id ""
   dev: slavio_intctl, id ""
   dev: slavio_misc, id ""
   dev: slavio_timer, id ""
   dev: sparc32-dma, id ""
   dev: sparc32-espdma, id ""
   dev: sparc32-ledma, id ""
   dev: sun4m-iommu, id ""
   dev: sun-CS4231, id ""
   dev: sun-fdtwo, id ""
   dev: sysbus-esp, id ""
   dev: sysbus-m48t08, id ""
   dev: tcx_afx, id ""

Paolo

> ---
>   hw/sparc/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
> index 79d58beb7a..721b37a9ca 100644
> --- a/hw/sparc/Kconfig
> +++ b/hw/sparc/Kconfig
> @@ -15,6 +15,7 @@ config SUN4M
>       select STP2000
>       select CHRP_NVRAM
>       select OR_IRQ
> +    select TCX



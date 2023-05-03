Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B245E6F5CFF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:22:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puGBn-0000uu-2H; Wed, 03 May 2023 13:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puGBh-0000eV-8Y
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:22:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puGBf-0004jQ-Or
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hs1yjJSCdyJm4DTRmtArWRYOwu9w0s2fIa5hcOdg6M8=;
 b=K2f+24sd6t5ieeWe6njRoG+RJ+KBQw0lsylUKgezX4Q9jxJvBDfrjd/fIxxCm4LrJkWDYa
 At/0TwNWXvHer5cRIRH7bwVU3UDK7n4IvWiyzvc0mdiQaLYFLU1BUwxXm1cP+HinT4DYsO
 oi20cmsYyCQwQO/txCt4YpLZDkCtXAU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-Peh2QeKiP9yoN2JzW2wXZw-1; Wed, 03 May 2023 13:22:42 -0400
X-MC-Unique: Peh2QeKiP9yoN2JzW2wXZw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94f5a1fa123so666988966b.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683134561; x=1685726561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hs1yjJSCdyJm4DTRmtArWRYOwu9w0s2fIa5hcOdg6M8=;
 b=BAfYIrAdPH8b8W927YXY0F/gd2/EvbXdqESk9MnMWUQ4R94uTMe6CDsfUAoXtH583k
 exzoc4aD6baiIfBMzeIZBmiqIEjyRRO3Knihlsap24OpbAJ9zrqIZWbu8O9ksFwOOU0c
 GWgk7CvHYa7W8kTRi2EH2moR8PU6RZ7kiOLGqy0www1XblCNGbwTvyxl/tQQMVyGlgXp
 ru2sZOMyBI+c/Zeaz5Yz+ZL0V2pQFZNxuSovZo2ru3L3dNXbxuY8anZ6nMTJXcl2vhfb
 VVGIc2a8v6xWxQZrvJS8lsqBI5Q8ssniVRZjjnwu/wMccOouvslIMeosVFwCbr8vQEpG
 zMBg==
X-Gm-Message-State: AC+VfDw226IiJ/eRO8fstZSaxRZP7q4PQxcPV8/KFSDBg6Phq8NbX9q3
 w1P8SwvITuQqompe0pxI3qOMj3ewYT0jrtGs1SzcCF0BAuj1+GKbjQd6jW3K9pMuNBLV58UDb0d
 dXHn6EDt8LaI3hgs=
X-Received: by 2002:a17:907:3684:b0:94e:547b:6301 with SMTP id
 bi4-20020a170907368400b0094e547b6301mr3715770ejc.8.1683134560941; 
 Wed, 03 May 2023 10:22:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7MgLzhxGD/2TJB6Vc5oysftZ2vWL3pmrJ/ID00m38whoQahY54gx2y6hGqOuC5TBmJGsqYng==
X-Received: by 2002:a17:907:3684:b0:94e:547b:6301 with SMTP id
 bi4-20020a170907368400b0094e547b6301mr3715731ejc.8.1683134560532; 
 Wed, 03 May 2023 10:22:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 oq27-20020a170906cc9b00b0094f410225c7sm17415001ejb.169.2023.05.03.10.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:22:40 -0700 (PDT)
Message-ID: <436a1596-fc40-0ee3-0505-c7f12ded8275@redhat.com>
Date: Wed, 3 May 2023 19:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 08/22] hw/arm: Select GICV3_TCG for sbsa-ref machine
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-9-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-9-alex.bennee@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> From: Fabiano Rosas<farosas@suse.de>
> 
> This machine hardcodes the creation of the interrupt controller, so
> make sure the dependency is explicitly described in the Kconfig.

gicv3_init_cpuif is used unconditionally by arm_gic_realize in 
hw/intc/arm_gicv3.c, so right now the separation between GICV3 and 
GICV3_TCG is useless.

That said, using "default y" is wrong.  The correct definition in 
hw/intc/Kconfig for these should be:

config ARM_GIC
     bool
     select MSI_NONBROKEN
     select ARM_GICV3_TCG # if TCG
     select ARM_GIC_KVM if KVM

config ARM_GICV3_TCG
     bool

config ARM_GIC_KVM
     bool

(where the "if TCG" is incorrect right now as explained above).

Paolo

> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20230208192654.8854-9-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index cec7898bb7..0cce0b8d5b 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -252,6 +252,7 @@ config SBSA_REF
>       select PL061 # GPIO
>       select USB_EHCI_SYSBUS
>       select WDT_SBSA
> +    select ARM_GICV3_TCG
>   



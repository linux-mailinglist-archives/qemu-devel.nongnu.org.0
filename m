Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9566F5978
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:01:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puD21-0000jv-BN; Wed, 03 May 2023 10:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puD1r-0000e2-3Q
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:00:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puD1o-0002sh-EM
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683122419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOBbTf1/8uzx6hsI22/vF2PdNdjNeNEmYqHVxNPekFo=;
 b=ULhJMU9bUQ1Oh1L3UyePI/ZU68k/KWD2jOiexhCfff8MqUX41qdxTKs2TY0YAA2ZXjsoUh
 z81zzAEGdaBlRR8H3PCX63KavOvk87mY3V7w6e7XVKURGpBDSW4RPoKJgq1hUkklT3BC9T
 lDtIbOiBJZTCvKB2eyzOJSjc5ULHG0w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-1FiHyzaJOHCuR4TWH8BJyg-1; Wed, 03 May 2023 10:00:09 -0400
X-MC-Unique: 1FiHyzaJOHCuR4TWH8BJyg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50bd07fbd97so3030316a12.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 07:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683122406; x=1685714406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HOBbTf1/8uzx6hsI22/vF2PdNdjNeNEmYqHVxNPekFo=;
 b=juHxlypdX2pk5eRfmZXpR6WhLbwiN/+LbdOjoQvxuDhBTBhQq38hZ1kvHc32tAP2Tg
 4UU5SsCliSY/2VIPBOrDuytVqR2DJDOSNIVrs93NYgNm9yPFbZbTcpUWz0H41jQiePSL
 LhAmEw1kwp7kWQRzhslyQ9K6I3LmKdmsswG7DY3ynx89obiALAeURvAD8ysG/+J7NYc6
 3RfGP5oOfyXqrWvbLH5bgr9snASzmHVAxLjDtGx88rXgwJ8AZe2nf3ldlHtxyh3w9SOV
 bkcIbtBZgi8FrVNt3vlaxSLbIxCQj2gd9O0GGNZBTxfYFjzFCEma/adtKVhC8wcM3E4g
 nBAg==
X-Gm-Message-State: AC+VfDyyVBWLQNcDLKl1tP5NAzHEnXg58HRuG4uc2gqZ85NM/3uug4GK
 5NWphgzZBSoU8GrR52k+QG5ZLX8PdZ4OY8vpl9MjV9xXgVa+JTFKDRdL9F3Ooeh9gjXIZgdR+ZF
 7DBarAJxlatgbNFY=
X-Received: by 2002:aa7:db9a:0:b0:506:9984:9236 with SMTP id
 u26-20020aa7db9a000000b0050699849236mr10267819edt.15.1683122405939; 
 Wed, 03 May 2023 07:00:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6AT/X9L5MeQBX5xW3f2+Rp4LKGq8XHv/6RKpzTPazaym+xwcyWIA2KthJf3N9AkunZPkRqYg==
X-Received: by 2002:aa7:db9a:0:b0:506:9984:9236 with SMTP id
 u26-20020aa7db9a000000b0050699849236mr10267790edt.15.1683122405611; 
 Wed, 03 May 2023 07:00:05 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 j14-20020a50ed0e000000b0050bc4600d38sm727153eds.79.2023.05.03.07.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 07:00:04 -0700 (PDT)
Message-ID: <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
Date: Wed, 3 May 2023 16:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
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
 <20230503091244.1450613-6-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-6-alex.bennee@linaro.org>
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
> From: Fabiano Rosas <farosas@suse.de>
> 
> The 'virt' machine uses virtio-net-pci as a fallback when no other
> network driver has been selected via command line. Select VIRTIO_NET
> and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=n
> (due to e.g. --without-default-devices):
> 
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
> qemu-system-aarch64: Unsupported NIC model: virtio-net-pci

With respect to patches 5-17, very few devices need to be present when 
configuring --without-default-devices, and thus need to be "select"ed by 
Kconfig.  You should select a device only if you cannot even start the 
machine without --nodefaults.

Anything else should be added by hand to configs/ if you use 
--nodefaults.  In particular, failures of "make check" when configured 
--without-default-devices are *test* bugs, not configuration bugs.

I didn't check if _all_ of the patches in this set should be dropped, 
but most probably do.

Paolo



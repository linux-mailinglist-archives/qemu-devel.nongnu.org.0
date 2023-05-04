Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851906F6599
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:16:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTCQ-0005jJ-FE; Thu, 04 May 2023 03:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puTCO-0005ih-HK
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:16:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puTCN-0006wF-2U
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683184578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9IE1q/qdi2W7aX8zN3wPgjgug9AB/qfuBhcQe+kXfo0=;
 b=LYZ9Ks19jiR0iCvEfLQ3Z6MdpdMO4k1PidaoPYdwucGfV9KBiQOpiv2+JgtvlRcY4PPUmA
 glvJwqLeA5g1uHcf95Hxj7LZszOt0sfahrY4PHuNi3ry0oF7vEeJr23aL2TQjBAQoN8aU/
 Flk36jdaPw41R6cfxUJyiRGnX4TvFtQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-pPVdYO7JPm6mb5AA314BTA-1; Thu, 04 May 2023 03:16:15 -0400
X-MC-Unique: pPVdYO7JPm6mb5AA314BTA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a355c9028so13064166b.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 00:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683184574; x=1685776574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9IE1q/qdi2W7aX8zN3wPgjgug9AB/qfuBhcQe+kXfo0=;
 b=Cp+GtUAlM7BGasdC7bLj7/SslX41RkSckOmWxhz2EFYB/Lh/wjcpQbHKnMoXAwjCKS
 qjVUSBTvk7Jd9INAn7COEdkSwQ0t9Hk7XUZozU7XXDx7atOSROzJK0NZx/Fbl7dujeE5
 3QkD5iV1DJHCl+n+xM9Q/KISjI1FDxM6dCWn/aYBwHtcNHBXJzJl+48zcX3yj+i5zYFb
 1I0Tpm4fixtAfQosLjhaRSFPFhRbvpdj0/Tz0texGBdfyf5BFxTzaL+GKp5lCd2H+0ks
 bK1vYPrz/+dZmRMQY+zk7eVWgl3I9qtpp9cHuWP0V7boxukEAp3UpOPcJ44jmNYDNwgn
 VkEQ==
X-Gm-Message-State: AC+VfDwUMF7xQW4fTUj59uCGamTAVgkKxcksDp4pz+1UK5CXOfg+IxAx
 ZFXja2mGr0d5WauApyMEXV5K5MqBvOytoTTK6bhHDT16ybpmTdxt+M6JkKnFIJQctKdA7AenFU6
 8OwFIxXCcTzDIuzg=
X-Received: by 2002:a17:907:6e19:b0:94e:8cdb:bcee with SMTP id
 sd25-20020a1709076e1900b0094e8cdbbceemr6269387ejc.70.1683184574068; 
 Thu, 04 May 2023 00:16:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4XCgjoRhPNNt4H8wAIjb1jJ941n8JiJdaDDTuhWeQUrmpd1QnBWwEs74ku1gRC8NWWVU3iNQ==
X-Received: by 2002:a17:907:6e19:b0:94e:8cdb:bcee with SMTP id
 sd25-20020a1709076e1900b0094e8cdbbceemr6269360ejc.70.1683184573677; 
 Thu, 04 May 2023 00:16:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 w17-20020aa7dcd1000000b004ad601533a3sm1547080edu.55.2023.05.04.00.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 00:16:13 -0700 (PDT)
Message-ID: <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com>
Date: Thu, 4 May 2023 09:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
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
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com> <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/3/23 20:32, Peter Maydell wrote:
> Do we really want to build a QEMU that then barfs unless
> you pass -nodefaults, though ? That doesn't seem very useful.
> Something somewhere ought to be saying "if you want the
> virt board then you almost certainly want these".

Well, the point is that --without-default-devices is intended to be for 
people that write their device config by hand.

However, perhaps we can add to configs/devices/ enough lines that a 
--without-default-devices configuration is moderately useful.  For 
example, some of the changes in this series could be rewritten as:

diff --git a/configs/devices/aarch64-softmmu/default.mak 
b/configs/devices/aarch64-softmmu/default.mak
index cf43ac8da116..3aaca2770590 100644
--- a/configs/devices/aarch64-softmmu/default.mak
+++ b/configs/devices/aarch64-softmmu/default.mak
@@ -3,6 +3,20 @@
  # We support all the 32 bit boards so need all their config
  include ../arm-softmmu/default.mak

+# ------
+# Boards
+# ------
+
  CONFIG_XLNX_ZYNQMP_ARM=y
  CONFIG_XLNX_VERSAL=y
  CONFIG_SBSA_REF=y
+
+# ---------------------------------------------------------------------
+# Sample configuration for a --without-default-devices build.  These
+# devices already default to enabled; they are listed here so that
+# building without default devices 1) still results in a somewhat
+# useful emulator 2) does not fail "make check".
+# ---------------------------------------------------------------------
+
+# For CONFIG_SBSA_REF:
+CONFIG_VIRTIO_NET=y
diff --git a/configs/devices/arm-softmmu/default.mak 
b/configs/devices/arm-softmmu/default.mak
index 1b49a7830c7e..81057d146d1b 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -3,6 +3,10 @@
  # CONFIG_PCI_DEVICES=n
  # CONFIG_TEST_DEVICES=n

+# ------
+# Boards
+# ------
+
  CONFIG_ARM_VIRT=y
  CONFIG_CUBIEBOARD=y
  CONFIG_EXYNOS4=y
@@ -43,3 +47,13 @@ CONFIG_FSL_IMX6UL=y
  CONFIG_SEMIHOSTING=y
  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
  CONFIG_ALLWINNER_H3=y
+
+# ---------------------------------------------------------------------
+# Sample configuration for a --without-default-devices build.  These
+# devices already default to enabled; they are listed here so that
+# building without default devices 1) still results in a somewhat
+# useful emulator 2) does not fail "make check".
+# ---------------------------------------------------------------------
+
+# For CONFIG_ARM_VIRT:
+CONFIG_VIRTIO_NET=y


And then we can progressively work towards removing "2) does not fail 
make check".

Paolo



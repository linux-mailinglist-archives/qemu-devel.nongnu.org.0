Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647CD6F5CF9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:22:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puGBG-0007k2-44; Wed, 03 May 2023 13:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puGB1-0007UK-Vo
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:22:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puGAz-0004XF-Hk
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s66Bb5ELOpK+MSwQW0k0s761R0QO/f/gLY8F728xksA=;
 b=NecwCBk5kFLaBkSEldxVxDs4ee9q76ibkEa3hZd1hqWQYmMZsIZbhClCByRTyzG3KjkDTM
 JrmHhrkwtLXA9cHktgmdZZwb0kq2CQpOrxJU19ohNZsIRnANqjrLs4ijsN/59BgVBP1SBz
 qTiH6WSPVfNs1LfA3or3qXmVVbrykrA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-ljObMQOqMO6i-EKJgbt6rA-1; Wed, 03 May 2023 13:21:59 -0400
X-MC-Unique: ljObMQOqMO6i-EKJgbt6rA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94f271ebbc2so663301566b.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683134517; x=1685726517;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s66Bb5ELOpK+MSwQW0k0s761R0QO/f/gLY8F728xksA=;
 b=R3R5R0mqD+hMO62cs1RLtkTvRp8mvwm5d+8eLFpKesMuwed04B+Pia0v2fthJDxXWF
 R+y9sCytWbdiER2HmO30sSHp+in5uWiMDm/kxyI5lLDanpIRfyPBUbeWWKAAIRBNgOfh
 kqAwEw8VDJzCkU7s08ZSSmY9YR+q0oAk7TlcsRnQQ66Yewxd+tsGwex/kYuif2h5pQO2
 6H3s1mkoK+2TgQmrAhz31+tpHc2iwhgCNHBvPmA2g/Yz1+9ZOwcMbcp8XGm8Tz5mOFiN
 /vYeH5xBrTpbb0WoVM3M4Fdtvm3zOUnnI2LLXjAmnvmQdElN0vsyfxbXvG1mOxTFc63m
 h89Q==
X-Gm-Message-State: AC+VfDyM5Fonh23oI5WjG7xW/flHJiIJUNheDHKQeRWOaT2zpKkFxwfx
 dXzyhiyM7uut2bedI3id9UN8yCWY1efHzSuuDzzeQsvcpK4HDLyt1MePlvi9mzxmcziJxPLn6X/
 QLpiRBGhaQ8xhbxaz92AEgro=
X-Received: by 2002:a17:906:c155:b0:94a:5d16:a280 with SMTP id
 dp21-20020a170906c15500b0094a5d16a280mr4002227ejc.9.1683134517438; 
 Wed, 03 May 2023 10:21:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JJz6UAv9eVVafrFrnuJwApyBWDvVLGserdRUB3V6PYYPfs02G+nrdlnVlZFsGqKLaJ2jSBA==
X-Received: by 2002:a17:906:c155:b0:94a:5d16:a280 with SMTP id
 dp21-20020a170906c15500b0094a5d16a280mr4002209ejc.9.1683134517040; 
 Wed, 03 May 2023 10:21:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 q19-20020a1709060f9300b0094f1fe1696bsm17577296ejj.216.2023.05.03.10.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:21:56 -0700 (PDT)
Message-ID: <c6e7be44-eb95-56d8-c716-3983233a27b9@redhat.com>
Date: Wed, 3 May 2023 19:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 06/22] hw/arm: Select VIRTIO_BLK for virt machine
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
 <20230503091244.1450613-7-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-7-alex.bennee@linaro.org>
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
> The virt machine has IF_VIRTIO as block_default_type, which causes the
> generic code to try to create a virtio-blk-pci device pair at
> configure_blockdev()/qemu_create_cli_devices().
> 
> Select VIRTIO_BLK and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors
> when PCI_DEVICES=n (due to e.g. --without-default-devices):
> 
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max -nodefaults -cdrom foo.qcow2
> qemu-system-aarch64: -cdrom foo.qcow2: 'virtio-blk' (alias
> 'virtio-blk-pci') is not a valid device model name

This is also not needed.  It doesn't matter what's the default - it's 
possible to create a machine without block devices at all, therefore 
VIRTIO_BLK should not be selected.

Paolo



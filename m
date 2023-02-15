Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA304698040
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:13:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKNV-0005BQ-R4; Wed, 15 Feb 2023 11:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pSKNU-00058V-3m
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:11:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pSKNR-000404-GH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676477483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCtJhJaPny5LFl6XKZ4Jz8aVEHADIcHBPxFFGiJDJu8=;
 b=Zad4Z7XtaRrTus50nRM6/uSm8StaZlliWOJaM4QDcalRANhRFquxMG9o1GQkPTd/dn2PT/
 RQtclqFRVnaBa40dNUoLR3Q7M1nA+OgysupFPjFGo+anTQomXqiWX5BMzERhBXu79/Gz4v
 v1CjVmIe3NKtAG0GbKf72Xt6gQWsvME=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-Xj2dp2WdP-GAXRWFzrhvMw-1; Wed, 15 Feb 2023 11:11:11 -0500
X-MC-Unique: Xj2dp2WdP-GAXRWFzrhvMw-1
Received: by mail-qt1-f197.google.com with SMTP id
 x16-20020ac87ed0000000b003b82d873b38so11502937qtj.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tCtJhJaPny5LFl6XKZ4Jz8aVEHADIcHBPxFFGiJDJu8=;
 b=eBo0FkXFzU8aACcHI51GM5aSUa9RcoaThXluOYS42ELbpqPyEOp4OGR9H+CbPBPqD0
 CC9OWjizHZd9QgY8xcjo4SE+sQuMbfTRXPUcVBR7KybtWmPP8j/SQ3FIrt8yqE23LFL6
 EKl2jpUBmBBkZK9YKgQVs6/NOsMcxwt2aqN8QAS37Ygh3ZHDBtuUpvTCk75LQMJRcxDJ
 OrX3/IkS2ebBDIu3EMmFFt5SjimxsdmaPYs86Fiu2DIZc6HUIxx9kR8Z24ERIdp8J1po
 rE6WMfItNS5X7yWVTEPvgcuzf7m7xNbUyckNH2KdKjBCuxZYetKvRa1I4t5SU9aO0ggt
 IMPw==
X-Gm-Message-State: AO0yUKXvjEe/vOHyc5EheWe2BwLH3dZQis5Vw4BEbrlBDkEy+rNQDDw+
 PqEk9FeIzidojSt8+UiaOcQmlUFk1VIFx5N09trfXk5AR7x4sy/s6lm9g5ncQtsK0XuJgE4sjsk
 P4L/Tk82urvqNf1w=
X-Received: by 2002:a05:6214:2a88:b0:56e:a84c:ceb7 with SMTP id
 jr8-20020a0562142a8800b0056ea84cceb7mr4558786qvb.17.1676477461494; 
 Wed, 15 Feb 2023 08:11:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8qiLKzX/j/6jnlYta4G1k1B/WMFvFKwXtuxjj2DYB5N/XRcgJshfWnhHqsiCTndWal5giRfA==
X-Received: by 2002:a05:6214:2a88:b0:56e:a84c:ceb7 with SMTP id
 jr8-20020a0562142a8800b0056ea84cceb7mr4558736qvb.17.1676477461135; 
 Wed, 15 Feb 2023 08:11:01 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a37b603000000b00739e7e10b71sm10003525qkf.114.2023.02.15.08.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 08:11:00 -0800 (PST)
Message-ID: <bffb4b50-eb59-5b59-9735-19a70bae20d6@redhat.com>
Date: Wed, 15 Feb 2023 17:10:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PULL 13/25] hcd-ohci: Fix inconsistency when resetting ohci root
 hubs
Content-Language: en-US
To: Qiang Liu <cyruscyliu@gmail.com>, Stefan Hajnoczi <stefanha@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
 <20220926095509.3759409-14-kraxel@redhat.com>
 <CAJSP0QVoLf_v2xP6GwDzbFg_RDnP5ppM3UZwTN3XAWPcv6cFCQ@mail.gmail.com>
 <CAAKa2j=2cdYxBFZO1pTJLFcPVb-6R4gnB9zad3rdptfuuo0ixw@mail.gmail.com>
 <CAAKa2jmkjPuTouvk3qRvuFiS7RtTSQ8vC=m_eDYLyV7tUxAkiA@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CAAKa2jmkjPuTouvk3qRvuFiS7RtTSQ8vC=m_eDYLyV7tUxAkiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/15/23 14:45, Qiang Liu wrote:
> Hi,
> 
>         This commit breaks boot-serial-test on ppc64-softmmu.
> 
>            $ ./configure --enable-tcg-interpreter
>         '--target-list=aarch64-softmmu alpha-softmmu arm-softmmu hppa-softmmu
>         m68k-softmmu microblaze-softmmu ppc64-softmmu s390x-softmmu
>         x86_64-softmmu'
>            $ make && cd build && QTEST_QEMU_BINARY=./qemu-system-ppc64
>         ./tests/qtest/boot-serial-test; cd -
> 
>         (Yes, the full --target-list is needed because boot-serial-test isn't
>         built when only ppc64-softmmu is selected.)
> 

I think we need something like this :

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e97616d327c0..8203f6a71ad0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -149,8 +149,8 @@ qtests_ppc = \
    qtests_filter + \
    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) + 
     \
    (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) + 
     \
-  (config_all_devices.has_key('CONFIG_TCG') ? ['prom-env-test'] : []) + 
    \
-  (config_all_devices.has_key('CONFIG_TCG') ? ['boot-serial-test'] : []) + 
    \
+  (config_host.has_key('CONFIG_TCG') ? ['prom-env-test'] : []) +                      \
+  (config_host.has_key('CONFIG_TCG') ? ['boot-serial-test'] : []) +                   \
    ['boot-order-test']

  qtests_ppc64 = \

Thanks,
Laurent



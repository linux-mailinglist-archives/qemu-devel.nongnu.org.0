Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6866530C711
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:10:13 +0100 (CET)
Received: from localhost ([::1]:55430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zBs-0005nK-7l
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:10:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6yjE-0007gj-D6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:40:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6yj8-0005Sk-G5
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612284027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kX/o+MkxhSaNNepe8N2ejVm2CAGwRyysIGuKN2uEQG4=;
 b=KhgMqKhr8kGQpy8KpLcvsBhv3HU5MF7BTYeMRb1UbvO/a3vEZ2KF22cH/FbssjHdlwsHwc
 FM6H3B+qR6exThZeH7Gjoos1JYojymm2IX9UNai1EL7NfVjBQt7ytGx6CZg4VCGtx5c5XG
 vEp2DHQykK2SVDlE9Lmq3UqMRq5d7+w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-iw9te6-RNWuahiXTx07hvQ-1; Tue, 02 Feb 2021 11:40:25 -0500
X-MC-Unique: iw9te6-RNWuahiXTx07hvQ-1
Received: by mail-ej1-f69.google.com with SMTP id ar27so9173428ejc.22
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 08:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kX/o+MkxhSaNNepe8N2ejVm2CAGwRyysIGuKN2uEQG4=;
 b=GHNc950Wimd+cngcsFS+LIy3pGliW7Pl73xbruSC+uMPCqr9QmbalpilSScaMnIISA
 Q8zaxrmBEHxQ+0rzAJ3dJzOPJjE0YTswHp/ox1z73bS1EroM61xd+HRU4wEsQSMHb1OZ
 rw7DYg1dAGyWmhDsjRrtA59aKenb5rlHCBzskZdlzgpNjHKQyGdNOYUPjFcGdGYr2abn
 SnPLZOpvFQvz4twTqGxE1LBItI2zDXzSGiGfuxcnnKCf1R18OwhwTck5ps5bpuDIu3Ru
 ZozopBvT24/Aby4Y0wPgDB8Fv+/DvRoRGFqpko5PB4Tz1YVirKIhANNP5YfoVvhdegNe
 zmZg==
X-Gm-Message-State: AOAM533aJDiviwfQPjtZpwLHdAI4JAizVLYh78jAvObiVsQcTh79HOd+
 OIs1hNB3tlXiNAg388HxXwmVetxnER0iEomEtifyIaN0FrBDT0FaHQhusC9iTjxeIA+a6jh04Qs
 Uw3DnPOtLkYbLcLI=
X-Received: by 2002:a50:b742:: with SMTP id g60mr24113600ede.113.1612284023490; 
 Tue, 02 Feb 2021 08:40:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgjbyBhoL1Jren/OSVDdes621/QUD5IJ6MnI8jf0bZpYLBqAicQC5/q0lvH9VyWfKAfaZWig==
X-Received: by 2002:a50:b742:: with SMTP id g60mr24113583ede.113.1612284023316; 
 Tue, 02 Feb 2021 08:40:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y8sm9989725edd.97.2021.02.02.08.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 08:40:22 -0800 (PST)
Subject: Re: [PATCH v4 0/9] memory: assert and define MemoryRegionOps callbacks
To: P J P <ppandit@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20200811114133.672647-1-ppandit@redhat.com>
 <nycvar.YSQ.7.78.906.2009151842200.10832@xnncv>
 <n4q317q1-1542-rrss-1033-n23qpsr0q8p2@erqung.pbz>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a7a792f6-4594-1da8-221e-a30d9efdec1f@redhat.com>
Date: Tue, 2 Feb 2021 17:40:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <n4q317q1-1542-rrss-1033-n23qpsr0q8p2@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Lei Sun <slei.casper@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/11/20 14:50, P J P wrote:
> +-- On Tue, 15 Sep 2020, P J P wrote --+
> | +-- On Tue, 11 Aug 2020, P J P wrote --+
> | | * This series asserts that MemoryRegionOps objects define read/write
> | |   callback methods. Thus avoids potential NULL pointer dereference.
> | |   ex. -> https://git.qemu.org/?p=qemu.git;a=commit;h=bb15013ef34617eb1344f5276292cadd326c21b2
> | |
> | | * Also adds various undefined MemoryRegionOps read/write functions
> | |   to avoid potential assert failure.
> | |
> | | Thank you.
> | | --
> | | Prasad J Pandit (9):
> | |   hw/pci-host: add pci-intack write method
> | |   pci-host: designware: add pcie-msi read method
> | |   vfio: add quirk device write method
> | |   prep: add ppc-parity write method
> | |   nvram: add nrf51_soc flash read method
> | |   spapr_pci: add spapr msi read method
> | |   tz-ppc: add dummy read/write methods
> | |   imx7-ccm: add digprog mmio write method
> | |   memory: assert MemoryRegionOps callbacks are defined
> | |
> | |  hw/misc/imx7_ccm.c       |  8 ++++++++
> | |  hw/misc/tz-ppc.c         | 14 ++++++++++++++
> | |  hw/nvram/nrf51_nvm.c     | 10 ++++++++++
> | |  hw/pci-host/designware.c | 19 +++++++++++++++++++
> | |  hw/pci-host/prep.c       |  8 ++++++++
> | |  hw/ppc/prep_systemio.c   |  8 ++++++++
> | |  hw/ppc/spapr_pci.c       | 14 ++++++++++++--
> | |  hw/vfio/pci-quirks.c     |  8 ++++++++
> | |  softmmu/memory.c         | 10 +++++++++-
> | |  9 files changed, 96 insertions(+), 3 deletions(-)
> |
> | Ping...@Peter, @David, @Paolo, @Herve, @Alex,
> |
> | * This patch series is not pulled/merged yet, could you please help with it?
> 
> 
> Ping..!
> --
> Prasad J Pandit / Red Hat Product Security Team
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
> 

Queued, thanks!

Paolo



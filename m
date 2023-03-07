Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05C66AD928
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 09:22:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZSZI-0005JA-Ba; Tue, 07 Mar 2023 03:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZSZF-0005Ik-Bf
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:21:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZSZD-0008RN-3Y
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:21:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678177262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/pUDYu+eJJ2TamVhsHY282TxwmLn4vhDXhSxHnUpOA=;
 b=QTMHPth74Wvw77XRe4ltwOyiG+kDv7xJKDS1Z+FAesnx2cZlGzTA10XL0fC6UTJmwwFiJe
 RYsk5DhJnRTAddc0bo+/JWGvfFmwv0NYTewmALo8JwmxIdrqWSl1VPerP/ZJC/HSXg83Nd
 9FcjUsWC0OT5heXza6IDtjwSSFwP6RM=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-Cvf8OTp3MOOkYRymEABPMA-1; Tue, 07 Mar 2023 03:21:00 -0500
X-MC-Unique: Cvf8OTp3MOOkYRymEABPMA-1
Received: by mail-oo1-f71.google.com with SMTP id
 l11-20020a4a350b000000b0052522596fe5so3741053ooa.17
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 00:21:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678177260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/pUDYu+eJJ2TamVhsHY282TxwmLn4vhDXhSxHnUpOA=;
 b=Jrq3Qu6kksDZxMlqvWDRuJhrEmXt5GEGW427Yu/XFPZi/n+Xi9c1uXHKpcDvN/nclN
 n6c1TYH9HYoxpSSDpqRFgxS5WfNLlhNSotdRR0m0hZWewQHG6ous1UlSxDWu4XXYcXVI
 AhrCYgQrubWz+fZE9Erj48KUctTed9xaPQ9Qvp5YM08pUrjoQjtH4n5VlYeQF9bhfIkd
 N3/Ty3H2TQz1qRMM3GkYpl9UtPZ+bloNHfJ0aYbchbCEtoDbaJhTVQz3dHle3uY2B7gM
 VodVKOhcTgHRPebTQN3Q8BsrCzHuCtPy9CSnQqpLATa6tPGvDx9k4y7dKRojCHxSWnRK
 Ob0g==
X-Gm-Message-State: AO0yUKV9184gqpYnIo+QD1BVRxGq3eTwY7qzTCRiyKqwnTMKoIlLpNPB
 bijuV0Z48gYp833zpEgwZGTRvTFo55fEhHO1vYeu1mPTR2Kb9/H0wdAyRJrl+ReqwR5dffrhduG
 HYLwcAvB+Syq2REA6ZfAAUgZDkTuDDAQ=
X-Received: by 2002:a05:6808:143:b0:383:fef9:6cac with SMTP id
 h3-20020a056808014300b00383fef96cacmr4526854oie.9.1678177260182; 
 Tue, 07 Mar 2023 00:21:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/uRoKlpdIpx5PmVJh6dOdx9AxApr/ULUNZ9glHo/5d8zDqyjWqpiFaL5g6DBQtTXNM/UtV8u9f54BaGJ0cNGg=
X-Received: by 2002:a05:6808:143:b0:383:fef9:6cac with SMTP id
 h3-20020a056808014300b00383fef96cacmr4526825oie.9.1678177259885; Tue, 07 Mar
 2023 00:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20230223105057.144309-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230223105057.144309-1-akihiko.odaki@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 7 Mar 2023 16:20:48 +0800
Message-ID: <CACGkMEtg=+fG1A6gVodO8M4BYH3aMa0a89smsRw9epyYVygS-g@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] Introduce igb
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny <darren.kenny@oracle.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 devel@daynix.com, Yan Vugenfirer <yvugenfi@redhat.com>, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>, Gal Hammer <gal.hammer@sap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Feb 23, 2023 at 6:51=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> Based-on: <20230223102018.141748-1-akihiko.odaki@daynix.com>
> ([PATCH v6 00/34] e1000x cleanups (preliminary for IGB))
>
> igb is a family of Intel's gigabit ethernet controllers. This series impl=
ements
> 82576 emulation in particular. You can see the last patch for the documen=
tation.
>
> Note that there is another effort to bring 82576 emulation. This series w=
as
> developed independently by Sriram Yagnaraman.
> https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

I've queued this series with some fixes about the compiler warnings
about the end of statement just after "default:"

It mainly the user of

commit 5bf7f8430247e7bff7e2010de25556aeb6adb548
Author: Akihiko Odaki <akihiko.odaki@daynix.com>
Date:   Thu Feb 23 19:50:49 2023 +0900

    net/eth: Introduce EthL4HdrProto

That changes virtio-net, e1000e, and igb. Please check the changes and
post patches on top if I was wrong.

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 239875dd89..4d9679ca0b 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1275,6 +1275,7 @@ e1000e_build_rx_metadata(E1000ECore *core,
             break;

         default:
+            break;
         }
     } else {
         trace_e1000e_rx_metadata_l4_cso_disabled();
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index d779c3dc14..a7c7bfdc75 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1239,6 +1239,7 @@ igb_build_rx_metadata(IGBCore *core,
             break;

         default:
+            goto func_exit;
         }
     } else {
         trace_e1000e_rx_metadata_l4_cso_disabled();
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 4b1d387356..3524f02f2e 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1751,6 +1751,7 @@ static uint8_t virtio_net_get_hash_type(bool hasip4,
             break;

         default:
+            break;
         }

         if (types & VIRTIO_NET_RSS_HASH_TYPE_IPv4) {
@@ -1777,6 +1778,7 @@ static uint8_t virtio_net_get_hash_type(bool hasip4,
             break;

         default:
+            break;
         }

         if (types & VIRTIO_NET_RSS_HASH_TYPE_IP_EX) {


>
> - V8 -> V9:
> - Rebased.
> - Added patch "net/eth: Introduce EthL4HdrProto". This is not strictly ne=
cessary
>   yet but I'm still adding it because it will be necessary soon and it to=
uches
>   some code common for igb and e1000e.
> - Replaced Linux internal types in hw/net/igb_regs.h with standard ones.
>
> V7 -> V8:
> - Removed obsolete patch
>   "hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr" (C=C3=A9dric Le G=
oater)
>
> V6 -> V7:
> - Reordered statements in igb_receive_internal() so that checksum will be
>   calculated only once and it will be more close to e1000e_receive_intern=
al().
>
> V5 -> V6:
> - Rebased.
> - Renamed "test" to "packet" in tests/qtest/e1000e-test.c.
> - Fixed Rx logic so that a Rx pool without enough space won't prevent oth=
er
>   pools from receiving, based on Sriram Yagnaraman's work.
>
> V4 -> V5:
> - Rebased.
> - Squashed patches to copy from e1000e code and modify it.
> - Listed the implemented features.
> - Added a check for interrupts availablity on PF.
> - Fixed the declaration of igb_receive_internal(). (Sriram Yagnaraman)
>
> V3 -> V4:
> - Rebased.
> - Corrected PCIDevice specified for DMA.
>
> V2 -> V3:
> - Rebased.
> - Fixed PCIDevice reference in hw/net/igbvf.c.
> - Fixed TX packet switching when VM loopback is enabled.
> - Fixed VMDq enablement check.
> - Fixed RX descriptor length parser.
> - Fixed the definitions of RQDPC readers.
> - Implemented VLAN VM filter.
> - Implemented VT_CTL.Def_PL.
> - Implemented the combination of VMDq and RSS.
> - Noted that igb is tested with Windows HLK.
>
> V1 -> V2:
> - Spun off e1000e general improvements to a distinct series.
> - Restored vnet_hdr offload as there seems nothing preventing from that.
>
> Akihiko Odaki (9):
>   net/eth: Introduce EthL4HdrProto
>   pcie: Introduce pcie_sriov_num_vfs
>   e1000: Split header files
>   Intrdocue igb device emulation
>   tests/qtest/e1000e-test: Fabricate ethernet header
>   tests/qtest/libqos/e1000e: Export macreg functions
>   igb: Introduce qtest for igb device
>   tests/avocado: Add igb test
>   docs/system/devices/igb: Add igb documentation
>
>  MAINTAINERS                                   |    9 +
>  docs/system/device-emulation.rst              |    1 +
>  docs/system/devices/igb.rst                   |   71 +
>  hw/net/Kconfig                                |    5 +
>  hw/net/e1000.c                                |    1 +
>  hw/net/e1000_common.h                         |  102 +
>  hw/net/e1000_regs.h                           |  954 +---
>  hw/net/e1000e.c                               |    3 +-
>  hw/net/e1000e_core.c                          |   60 +-
>  hw/net/e1000x_common.c                        |    1 +
>  hw/net/e1000x_common.h                        |   74 -
>  hw/net/e1000x_regs.h                          |  967 ++++
>  hw/net/igb.c                                  |  615 +++
>  hw/net/igb_common.h                           |  146 +
>  hw/net/igb_core.c                             | 4076 +++++++++++++++++
>  hw/net/igb_core.h                             |  146 +
>  hw/net/igb_regs.h                             |  648 +++
>  hw/net/igbvf.c                                |  327 ++
>  hw/net/meson.build                            |    2 +
>  hw/net/net_rx_pkt.c                           |   48 +-
>  hw/net/net_rx_pkt.h                           |    5 +-
>  hw/net/trace-events                           |   40 +-
>  hw/net/virtio-net.c                           |   67 +-
>  hw/net/vmxnet3.c                              |   22 +-
>  hw/pci/pcie_sriov.c                           |    5 +
>  include/hw/pci/pcie_sriov.h                   |    3 +
>  include/net/eth.h                             |    8 +-
>  net/eth.c                                     |   26 +-
>  .../org.centos/stream/8/x86_64/test-avocado   |    1 +
>  tests/avocado/igb.py                          |   38 +
>  tests/qtest/e1000e-test.c                     |   25 +-
>  tests/qtest/fuzz/generic_fuzz_configs.h       |    5 +
>  tests/qtest/igb-test.c                        |  243 +
>  tests/qtest/libqos/e1000e.c                   |   12 -
>  tests/qtest/libqos/e1000e.h                   |   14 +
>  tests/qtest/libqos/igb.c                      |  185 +
>  tests/qtest/libqos/meson.build                |    1 +
>  tests/qtest/meson.build                       |    1 +
>  38 files changed, 7809 insertions(+), 1148 deletions(-)
>  create mode 100644 docs/system/devices/igb.rst
>  create mode 100644 hw/net/e1000_common.h
>  create mode 100644 hw/net/e1000x_regs.h
>  create mode 100644 hw/net/igb.c
>  create mode 100644 hw/net/igb_common.h
>  create mode 100644 hw/net/igb_core.c
>  create mode 100644 hw/net/igb_core.h
>  create mode 100644 hw/net/igb_regs.h
>  create mode 100644 hw/net/igbvf.c
>  create mode 100644 tests/avocado/igb.py
>  create mode 100644 tests/qtest/igb-test.c
>  create mode 100644 tests/qtest/libqos/igb.c
>
> --
> 2.39.1
>



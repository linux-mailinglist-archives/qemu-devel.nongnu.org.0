Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083E466B8A4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHKQl-00060P-Nb; Mon, 16 Jan 2023 03:01:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHKQi-0005zu-FB
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:01:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHKQg-0003Xj-JG
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673856078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PPQYZaQlLznXXI0cvvc9TYXj+snG8BULlm08gm/lICA=;
 b=N6xTDaoP5OFfms1JA6/1HZN5sqCZiN9WQC/JSVyziIsfBsZdJvd8KZThvLqLIHdX9DIgu/
 9+BfhZ58k9d7RonVDOyIanT88bbrB9iSGxs57BBZhIaf9FXwMbbOYehEOPdej6Nnt1DL+g
 tQlNWxoXsXkejptt0f/08UmPuwpkbaI=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-3GBOcfZyOSqi7dXJ-Y8dAw-1; Mon, 16 Jan 2023 03:01:16 -0500
X-MC-Unique: 3GBOcfZyOSqi7dXJ-Y8dAw-1
Received: by mail-ot1-f69.google.com with SMTP id
 c7-20020a9d6c87000000b006834828052cso14453538otr.8
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PPQYZaQlLznXXI0cvvc9TYXj+snG8BULlm08gm/lICA=;
 b=qy5VIcfHAj0uYLZLAEuPAD3H88kHYKKZdJ2vA2ZH+N6bpHFXfThnDW2rUkxwnTTsMj
 CVV6uAtcXlsL67LG4nOzsLu7eW5Kg6YPDieRyt3Xa5Hk6JBqyxjvEZKv0f3+m+LS3L3q
 aLGea10sWCutJXGsletcR/MR5vMdvnIjfTqrxQhXcZ7a0A6Y9bwBu2ZKk7pozJXMc5ja
 kT3DTkGNVH/v7ZX2O0ToPuf/fHTdqdgfPEtnPCQ386B6nFtgmBsD+u95kZZ6rj0BXPPe
 AqzaI0epy//hJ1ky074mPtLo1xp0/Qj0RCKVJY4C01u4aURWSejjwMlNEvbZAOJPnbcs
 KZfQ==
X-Gm-Message-State: AFqh2koeiKOuWQ+87secVJ8swf+Ct+PUxuqj+4H/lLQrf9C8fMul44i1
 K689utqWBPv6e8Ef/u9b3bkhmBl8Lr8N+baoxYtM4PjWkZY6A/D1mw24UdAf6+srdKrUhNKfPkp
 mpPu1rqdY7TB0sQWDmwJl3vhzMz5Attw=
X-Received: by 2002:a54:4e89:0:b0:35c:303d:fe37 with SMTP id
 c9-20020a544e89000000b0035c303dfe37mr3908328oiy.35.1673856075939; 
 Mon, 16 Jan 2023 00:01:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtKtXWxZLc2hLKZq77tdEGrsaLGm4OG4tJ5h2aKEbcpNSoMqxhy0S9L8It+mU5t5D4As0qMrCO2UoNOsB4ZWeo=
X-Received: by 2002:a54:4e89:0:b0:35c:303d:fe37 with SMTP id
 c9-20020a544e89000000b0035c303dfe37mr3908320oiy.35.1673856075514; Mon, 16 Jan
 2023 00:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20230114041004.36459-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230114041004.36459-1-akihiko.odaki@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 16 Jan 2023 16:01:04 +0800
Message-ID: <CACGkMEvAwrfUwQVAj0qZFy+Wib5FSBwayyN_qGbZ8edNwB_18g@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Introduce igb
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
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
 Yuri Benditovich <yuri.benditovich@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, Jan 14, 2023 at 12:10 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> Based-on: <20230114035919.35251-1-akihiko.odaki@daynix.com>
> ([PATCH 00/19] e1000x cleanups (preliminary for IGB))
>
> igb is a family of Intel's gigabit ethernet controllers. This series implements
> 82576 emulation in particular. You can see the last patch for the documentation.
>
> Note that there is another effort to bring 82576 emulation. This series was
> developed independently by Sriram Yagnaraman.
> https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html
>
> It is possible to merge the work from Sriram Yagnaraman and to cherry-pick
> useful changes from this series later.
>
> I think there are several different ways to get the changes into the mainline.
> I'm open to any options.

I can only do reviews for the general networking part but not the
82576 specific part. It would be better if either of the series can
get some ACKs from some ones that they are familiar with 82576, then I
can try to merge.

Thanks

>
> V1 -> V2:
> - Spun off e1000e general improvements to a distinct series.
> - Restored vnet_hdr offload as there seems nothing preventing from that.
>
> Akihiko Odaki (13):
>   hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
>   pcie: Introduce pcie_sriov_num_vfs
>   e1000: Split header files
>   igb: Copy e1000e code
>   igb: Rename identifiers
>   igb: Build igb
>   igb: Transform to 82576 implementation
>   tests/qtest/e1000e-test: Fabricate ethernet header
>   tests/qtest/libqos/e1000e: Export macreg functions
>   tests/qtest/libqos/igb: Copy e1000e code
>   tests/qtest/libqos/igb: Transform to igb tests
>   tests/avocado: Add igb test
>   docs/system/devices/igb: Add igb documentation
>
>  MAINTAINERS                                   |    9 +
>  docs/system/device-emulation.rst              |    1 +
>  docs/system/devices/igb.rst                   |   70 +
>  hw/net/Kconfig                                |    5 +
>  hw/net/e1000.c                                |    1 +
>  hw/net/e1000_common.h                         |  102 +
>  hw/net/e1000_regs.h                           |  927 +---
>  hw/net/e1000e.c                               |    3 +-
>  hw/net/e1000e_core.c                          |    1 +
>  hw/net/e1000x_common.c                        |    1 +
>  hw/net/e1000x_common.h                        |   74 -
>  hw/net/e1000x_regs.h                          |  940 ++++
>  hw/net/igb.c                                  |  615 +++
>  hw/net/igb_common.h                           |  144 +
>  hw/net/igb_core.c                             | 3946 +++++++++++++++++
>  hw/net/igb_core.h                             |  147 +
>  hw/net/igb_regs.h                             |  624 +++
>  hw/net/igbvf.c                                |  327 ++
>  hw/net/meson.build                            |    2 +
>  hw/net/net_tx_pkt.c                           |    6 +
>  hw/net/net_tx_pkt.h                           |    8 +
>  hw/net/trace-events                           |   32 +
>  hw/pci/pcie_sriov.c                           |    5 +
>  include/hw/pci/pcie_sriov.h                   |    3 +
>  .../org.centos/stream/8/x86_64/test-avocado   |    1 +
>  tests/avocado/igb.py                          |   38 +
>  tests/qtest/e1000e-test.c                     |   17 +-
>  tests/qtest/fuzz/generic_fuzz_configs.h       |    5 +
>  tests/qtest/igb-test.c                        |  243 +
>  tests/qtest/libqos/e1000e.c                   |   12 -
>  tests/qtest/libqos/e1000e.h                   |   14 +
>  tests/qtest/libqos/igb.c                      |  185 +
>  tests/qtest/libqos/meson.build                |    1 +
>  tests/qtest/meson.build                       |    1 +
>  34 files changed, 7492 insertions(+), 1018 deletions(-)
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
> 2.39.0
>



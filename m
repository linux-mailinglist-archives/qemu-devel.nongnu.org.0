Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB355E54C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:22:50 +0200 (CEST)
Received: from localhost ([::1]:40014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6C77-00031r-A1
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6C5V-0001hM-Jk
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:21:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6C5T-0004KY-LE
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656426067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dxzrhKPejXSboS0/gDOn1fshmZMeCzqn6B2tXLsEVvc=;
 b=aQUZKcyKtUKviD2a2VycPlrMz8xRqMkCpctycM/LQHtuxhFpWvly6zWeAD31TALg5qJQjg
 cB6WEgaT1mn3jWw+T9BuPcfJFgY0VwsmE4EpoJ8AB2bZ4gT/C8KHvX3bYWnOJXeV597W4N
 /V4mwovk+68d6FeaLq38BbDWMKxvjCk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-ZRJK3c_2PmqtJ94ZjywnZw-1; Tue, 28 Jun 2022 10:21:04 -0400
X-MC-Unique: ZRJK3c_2PmqtJ94ZjywnZw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v184-20020a1cacc1000000b0039c7efa3e95so5159589wme.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dxzrhKPejXSboS0/gDOn1fshmZMeCzqn6B2tXLsEVvc=;
 b=4Bwji6KixSJ9beBWZwai1to0CXIqtbiOWRBegaeNxDWY/ZKpLZm94A4nsSvhzTghVo
 bxXC/chEpK6u7D9LaIvD6yagfQKW0FcFCumGAl1tsgqw0NTMYsoYAzzUaAXB6CmCAmUZ
 KQu95u79tQvILTPrZS0p40fQeExSPt11LjDP4JYG5RvQ9LgG0djX+rLzUMSU4FwfiYTX
 4EPRRkjt9sEnuSs63423XEw+vForHxkM/10CiKodO91JDDWk/ZAN9NM4LVsiUDS7fU23
 PdQ/2ZRVt/JDrFa++df8BRqOCESK2EesZTGovXwYlGS4D5rvxrOP5ST8nGIOtK9KqDCS
 XBcg==
X-Gm-Message-State: AJIora/j5MMQLLT+HnV4Lle1uWmqKPPae//Slc0/vPzG0ywZMHm+SzDP
 TGsmXKAG5t7mE74aoBNbJ/TCTWzbXT4nvgvc5GzXQjCpOSAI8Kqfl4eZnzxds/AZnOANKRRvl/l
 nT7WFfZ3cXczsvXk=
X-Received: by 2002:a5d:410f:0:b0:21b:90b7:9ca0 with SMTP id
 l15-20020a5d410f000000b0021b90b79ca0mr19099428wrp.54.1656426063376; 
 Tue, 28 Jun 2022 07:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u2eSM7Uf7Srk5WNZMSyQ1mBmgvK8RzEhj63j25849Xz2EpHyUbbocsn6AP7l41N8B4fFU1oQ==
X-Received: by 2002:a5d:410f:0:b0:21b:90b7:9ca0 with SMTP id
 l15-20020a5d410f000000b0021b90b79ca0mr19099410wrp.54.1656426063207; 
 Tue, 28 Jun 2022 07:21:03 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c441000b0039c4d022a44sm17940543wmn.1.2022.06.28.07.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 07:21:02 -0700 (PDT)
Date: Tue, 28 Jun 2022 16:21:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Brice Goglin <Brice.Goglin@inria.fr>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?UTF-8?B?TWF0aGlldS1E?=
 =?UTF-8?B?YXVkw6k=?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH 0/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220628162101.79c8aa27@redhat.com>
In-Reply-To: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jun 2022 16:56:58 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:


here should be a brief introduction to series
[and changelog if it's not the first revision]


> Brice Goglin (4):
>    hmat acpi: Don't require initiator value in -numa
>    tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
>    tests: acpi: q35: add test for hmat nodes without initiators
>    tests: acpi: q35: update expected blobs *.hmat-noinitiators
> 
>   hw/core/machine.c                             |   4 +-
>   tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
>   tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
>   tests/data/acpi/q35/FACP.acpihmat-noinitiator | Bin 0 -> 244 bytes
>   tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
>   tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
>   tests/qtest/bios-tables-test.c                |  45 ++++++++++++++++++
>   7 files changed, 46 insertions(+), 3 deletions(-)
>   create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/FACP.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
> 



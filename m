Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B93330A73
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 10:46:01 +0100 (CET)
Received: from localhost ([::1]:38876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJCSe-00080e-5n
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 04:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJCRC-0007Uy-Lc
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 04:44:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJCRA-0001SC-Td
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 04:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615196667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bcCFhumv+YzzNNn59iWurL/C3+oxKmEROOL0uQGci3E=;
 b=JhRbn4YfrBWudbv9PbkNST67UkSB/Zq5DPWUlba1zDtvrJTqYryNQ9PyYQ2yOQCwT4vL9q
 TgogNtogucd99pKyNR/g1km3IwjEcaYoIpgCeld4vZxzXuypE1YAWrugOn474mm94zFyr4
 gaN9U1/0Xx+Vmln8OUTuwRlmh8nSqQI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-t0lAb5mHPsirclPAekU1og-1; Mon, 08 Mar 2021 04:44:24 -0500
X-MC-Unique: t0lAb5mHPsirclPAekU1og-1
Received: by mail-wr1-f69.google.com with SMTP id e13so4573620wrg.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 01:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bcCFhumv+YzzNNn59iWurL/C3+oxKmEROOL0uQGci3E=;
 b=Hwxvf3MDpM4Fwr8KMThSTcVizGXGxskidleZeqEHUNOgBBntJPO9dD+jfuXBQ8greG
 IniU/k38ns3YsdTkL4PpZRRRyKVMtqfGJd6f3q0Rqe1NSCt/oDNhrAtIUY81uhQRgCrN
 oI8/NwVxiLsyMtQjkaWmzqrk/xZL5GDfQ4u5YCeaiI/VMyI1wCo0JmDx/Eg7ZKH0G8Jj
 1rzMOT6Q9s4nW16VGolyOsxLXGgjaZ8/ddiJITLHVX+QL5NRUCGz14WZBA38CQX/38Xg
 9JgeQa9vCymGg6UWHrhVFATy6UezcV6xZndt/TTLVflpavaDS/l2Yo+R/6G38WKbWFhg
 UwlA==
X-Gm-Message-State: AOAM533UDA5rQEGx+V42vVbNLP3IFGKnD6zJDAQXVFfp455iPoYUX2+X
 veXmtWF0b9WjmBznmq9F3+BAkp+WFDs01cj2eVeN6DpuusOLHMi4K4+U4QLP49hi0w0EiKANfxH
 nt++YOoHvqnQaHC4=
X-Received: by 2002:a05:600c:409:: with SMTP id
 q9mr21626405wmb.105.1615196663218; 
 Mon, 08 Mar 2021 01:44:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIa/3wPqEDIJexMqKyANXIthFy4nm37u4GgwwFJfw9j0FFv3ujqhiWuh2I9wq5ue8D3g7zXw==
X-Received: by 2002:a05:600c:409:: with SMTP id
 q9mr21626370wmb.105.1615196662728; 
 Mon, 08 Mar 2021 01:44:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y205sm18604342wmc.18.2021.03.08.01.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 01:44:21 -0800 (PST)
Subject: Re: [PATCH v2] hw/nvme: move nvme emulation out of hw/block
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210301113509.79706-1-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bc248cb6-f8e4-8d6e-82df-9fe914779995@redhat.com>
Date: Mon, 8 Mar 2021 10:44:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301113509.79706-1-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Klaus,

On 3/1/21 12:35 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> With the introduction of the nvme-subsystem device we are really
> cluttering up the hw/block directory.
> 
> As suggested by Philippe previously, move the nvme emulation to
> hw/nvme.

Maybe type "NVMe" when talking about the technology and keep
lowercase "nvme" only in paths?

> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
> v2:
>   * rebased on nvme-next
>   * got rid of the second patch (Minwoo)
> 
>  meson.build                               |   1 +
>  hw/block/nvme-ns.h                        | 193 ---------------------
>  hw/block/nvme-subsys.h                    |  32 ----
>  hw/{block => nvme}/nvme.h                 | 198 +++++++++++++++++++++-

I'd split this patch in 3:

1: Add missing license in hw/block/nvme.h header

>  hw/nvme/trace.h                           |   1 +
>  hw/{block/nvme.c => nvme/ctrl.c}          |   1 -
>  hw/{block/nvme-ns.c => nvme/ns.c}         |   1 -
>  hw/{block/nvme-subsys.c => nvme/subsys.c} |   2 +-
>  MAINTAINERS                               |   2 +-
>  hw/Kconfig                                |   1 +
>  hw/block/Kconfig                          |   5 -
>  hw/block/meson.build                      |   1 -
>  hw/block/trace-events                     | 182 --------------------
>  hw/meson.build                            |   1 +
>  hw/nvme/Kconfig                           |   4 +
>  hw/nvme/meson.build                       |   1 +
>  hw/nvme/trace-events                      | 180 ++++++++++++++++++++
>  17 files changed, 387 insertions(+), 419 deletions(-)
>  delete mode 100644 hw/block/nvme-ns.h
>  delete mode 100644 hw/block/nvme-subsys.h

2: Merge nvme-ns.h & nvme-subsys.h to hw/block/nvme.h, adding
   Minwoo Im (c).

>  rename hw/{block => nvme}/nvme.h (55%)
>  create mode 100644 hw/nvme/trace.h
>  rename hw/{block/nvme.c => nvme/ctrl.c} (99%)
>  rename hw/{block/nvme-ns.c => nvme/ns.c} (99%)
>  rename hw/{block/nvme-subsys.c => nvme/subsys.c} (98%)
>  create mode 100644 hw/nvme/Kconfig
>  create mode 100644 hw/nvme/meson.build
>  create mode 100644 hw/nvme/trace-events

3: The rest (basically this patch).

Regards,

Phil.



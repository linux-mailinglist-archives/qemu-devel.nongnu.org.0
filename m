Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8F8612127
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 09:54:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oogfS-0002zo-Rq; Sat, 29 Oct 2022 03:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oogfI-0002dC-2n
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 03:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oogfF-0006GK-Js
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 03:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667030036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tJ+V8E5DywwV/+mzfESNeJjuoMrtdLGpuFMKJe2wW6o=;
 b=Trp/XDSShuvmedlgRN4I+uwXQGYtp6MFWoGgPWlVx5XSgB/nhTAaTYH1jh+ryn2aqyqtum
 6vMbFr5n9AeyGNuH1bakC7xuZC3ZtBddzIrOBm0J2XEPJdWjLBQyFNgOsUEn+yJZ9RS9kp
 5FL7MQClsY/mUbZ9MhnNgzC05XvlkYk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-XeS4PXNnPb6wkNqcLFlaqw-1; Sat, 29 Oct 2022 03:53:49 -0400
X-MC-Unique: XeS4PXNnPb6wkNqcLFlaqw-1
Received: by mail-wm1-f70.google.com with SMTP id
 x10-20020a05600c420a00b003cf4dbff2e4so3142109wmh.8
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 00:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJ+V8E5DywwV/+mzfESNeJjuoMrtdLGpuFMKJe2wW6o=;
 b=hzuecdfYbF5ool6LzTlMpMKq1mDtF19+EGNHtGavj/M9txG4e78acD/Zzn/RGyBf9V
 s8PmFXeRXVT/7+zV033smZVHe2JdJYoXTV3sP5IzJt5zHFlyXEETJ0w3RzzMu7/TYW+d
 tReqvWSxRU8YfWOP+Kk9P0QzCJe0w3gbFutINmPvN1ahV0YLbg6eBzaxGHLDnjl/etU6
 wv4D9ej8gh2KC70dJZSZUpxV++X+AacGKBHw17f1NLfipx7+DBkvDIJY/pJe/RLemVuk
 CnbpvzCPAeUpS0q32v20Hsyi+Lwd3aIvK063RJI/IsKPv31/edxUfoLHRCfV/JSHSHMO
 tyVQ==
X-Gm-Message-State: ACrzQf3lllPGa5Ophtxe4mBbECOduGraUi1bpaBNfp/9kS3ZS7OiKvia
 ocIdbO33tpEdOAT7299YArlXjWH4s9CR2NPI+ZPnEMUt1JU5MiqMvAvKLULY0CpQQyakcx8Yln+
 9rGialnYueLSaoWg=
X-Received: by 2002:adf:f482:0:b0:236:7a2f:69f with SMTP id
 l2-20020adff482000000b002367a2f069fmr1750335wro.115.1667030028179; 
 Sat, 29 Oct 2022 00:53:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XB/VrB1OYJEp4mJEhgMKdmrK+7fAoFp27IXPz3l5OzHSePedLIF/WamH4UG7MGp8aW6DTUw==
X-Received: by 2002:adf:f482:0:b0:236:7a2f:69f with SMTP id
 l2-20020adff482000000b002367a2f069fmr1750312wro.115.1667030027954; 
 Sat, 29 Oct 2022 00:53:47 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 w12-20020a5d404c000000b002365254ea42sm866633wrp.1.2022.10.29.00.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 00:53:47 -0700 (PDT)
Date: Sat, 29 Oct 2022 03:53:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: peter.maydell@linaro.org, imammedo@redhat.com, ani@anisinha.ca,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org,
 jonathan.cameron@huawei.com, linuxarm@huawei.com,
 yangyicong@hisilicon.com, prime.zeng@huawei.com,
 hesham.almatary@huawei.com, ionela.voinescu@arm.com,
 darren@os.amperecomputing.com
Subject: Re: [PATCH v2 2/4] tests: virt: update expected ACPI tables for virt
 test
Message-ID: <20221029035311-mutt-send-email-mst@kernel.org>
References: <20221027032613.18377-1-yangyicong@huawei.com>
 <20221027032613.18377-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027032613.18377-3-yangyicong@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 11:26:11AM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Update the ACPI tables according to the acpi aml_build change.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

OK nice but if patch 1 is applied alone that will break make check
won't it? And this means the patchset breaks git bisect.
Pls look at top of tests/qtest/bios-tables-test.c to see
how to organize a patchset changing expected tables.



> ---
>  tests/data/acpi/virt/PPTT | Bin 96 -> 76 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
> index f56ea63b369a604877374ad696c396e796ab1c83..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
> GIT binary patch
> delta 32
> fcmYfB;R*-{3GrcIU|?D?k;`ae01J-_kOKn%ZFdCM
> 
> delta 53
> pcmeZC;0g!`2}xjJU|{l?$YrDgWH5jU5Ca567#O&Klm(arApowi1QY-O
> 
> -- 
> 2.24.0



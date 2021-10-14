Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1195442D916
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:13:18 +0200 (CEST)
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazbp-0004ri-5W
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazVt-0005Bq-2l
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:07:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazVp-0002hb-F2
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634213224;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwW6grCDLqkcnD5nmFsNz1BTPRT85AQGIbFaUZd3cJ0=;
 b=BK/oWYwG8AMEpVZWwR/guG388xBlVgM8ANnhoZ1vKU+2iaerN0RMtPEv3279hqb8gERvKK
 lYP/l+hRk3GfgWMNlq1mBZpyxrj+shUV/i0KrC0ikGZzJQWKmtbpq7tmEgJxoAVSMIsliK
 2awHE4/7+XL7vgQv8kZnmzsGSVRPv44=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-nCMtFbh2P5O3Ssfy0XZpfw-1; Thu, 14 Oct 2021 08:07:03 -0400
X-MC-Unique: nCMtFbh2P5O3Ssfy0XZpfw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so4361076wrv.19
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 05:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=lwW6grCDLqkcnD5nmFsNz1BTPRT85AQGIbFaUZd3cJ0=;
 b=FjEgYBBxbxvil6J6fXTkA4o5bpDI+5uiLPC7GpNNKO8a8vMfuk/vS5GLtjXdnDnDnc
 k2NDiJAxWl+wbqSxXLI+HOdJgWwbjrfO++VSOuM2pGIxuPUccArsl8O7vESFinRK7kjd
 HA7YZlfiUc/y1jY5V4cwcheXjfdnRhpuWc4jdKAQFfQ/wh8shxajqzRKnR7pF41wdJBd
 HE7YR2AfvRCNC9cNL7szRWyi26CnNLZpXUNRgB9YETQdvi71fF1NfA+IKBWchxEc5IRf
 uhJdcxGIa9gt1z/EkwMYrap0qBxxBVUWNtXGAC0RfdYCRJOVoAQd88yhXdqUn8cAgKiF
 0cdw==
X-Gm-Message-State: AOAM531w2uJkkuFK3a+InnNltV4DsY37DoP9oGMiCRy+S65IqzJ5q8iA
 UvneEDj8VtD9ohNP4XZoDzi/n7ytFlxeQX4bnzA30PLlk4xgwW4Fd4lShWdl8ExnaeQayRVukwY
 Or9yB7WfD3AzG5Zg=
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr19546432wms.157.1634213221570; 
 Thu, 14 Oct 2021 05:07:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUqfy1Nu6qG7DL9ZIwuzDuwIUTZw6xsVu2ucB8BbSWEHJXt619yI/l2xDRFcfEYfEyc92zfg==
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr19546402wms.157.1634213221331; 
 Thu, 14 Oct 2021 05:07:01 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q204sm8100587wme.10.2021.10.14.05.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 05:07:00 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up
 to revision E.b
To: eric.auger.pro@gmail.com, imammedo@redhat.com, mst@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 shameerali.kolothum.thodi@huawei.com, ardb@kernel.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
References: <20211014115643.756977-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <bd50e8e9-e1ed-cd28-5259-1369a3d21399@redhat.com>
Date: Thu, 14 Oct 2021 14:06:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211014115643.756977-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 10/14/21 1:56 PM, Eric Auger wrote:
> This series upgrades the ACPI IORT table up to the E.b
> specification revision. One of the goal of this upgrade
> is to allow the addition of RMR nodes along with the SMMUv3.

while I have sent a separate RFC to expose RMR nodes along with SMMUv3 I
must aknowledge this will take time to be upstreamed (SMMUv3 nested
stage thingy), if ever, and this anyway requires additional time to mature:
- there is one problem with the IORT spec which mandates 1 RMR node per
BDF and also
- there is the issue of the boot preserve_config which was known to
introduce some regressions and which is also mandated by the IORT spec.

So I wanted to emphasize that this IORT upgrade does not come at the
moment with any new feature. My understanding is old guests should work
fine with this new revision but if you feel that's a bad thing, please
raise your voice.

Thanks

Eric
>
> The latest IORT specification (ARM DEN 0049E.b) can be found at
> IO Remapping Table - Platform Design Document
> https://developer.arm.com/documentation/den0049/latest/
>
> This series can be found at
> https://github.com/eauger/qemu.git
> branch: iort_Eb_v3
>
> History:
> v2 -> v3:
> - comment on IORT node ID (Igor)
> - single mapping disabled comment
> - Added Jean and Igor's R-b
> - added diff to patvch 3/3
>
> v1 -> v2:
> - fix Revision value in ITS and SMMUv3 nodes (Phil)
> - Increment an identifier (Phil)
>
> Eric Auger (3):
>   tests/acpi: Get prepared for IORT E.b revision upgrade
>   hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
>   tests/acpi: Generate reference blob for IORT rev E.b
>
>  hw/arm/virt-acpi-build.c          |  48 ++++++++++++++++++------------
>  tests/data/acpi/virt/IORT         | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.memhp   | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.numamem | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.pxb     | Bin 124 -> 128 bytes
>  5 files changed, 29 insertions(+), 19 deletions(-)
>



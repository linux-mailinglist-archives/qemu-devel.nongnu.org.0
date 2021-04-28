Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3079A36D5E3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:43:00 +0200 (CEST)
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhel-0001bf-2p
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhdZ-0000qR-U5
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhdV-0001hF-7Y
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619606495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wVr1BRcenpjzOiZ9xw/vOlWRBXUlFYm0CmJkb4xTAB0=;
 b=V5f6zAO4HA8n6KWEI1qKZQ9nI3vDtVh/ztvZIj9m7hqKV4lY4Wqn3HGfFgC2r6ahJ9deoo
 sIVkhbQKMSDnyvcB3uklRmWYPqoS+bwmt2tPJuzKcfIItXPP6qZyHq3tjrzoaFAuNKQzmz
 83hmasI/XDr8G1thBECt+pI9ThNgN+4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-nQSB69FrPYSCJTWvQVx6zw-1; Wed, 28 Apr 2021 06:41:33 -0400
X-MC-Unique: nQSB69FrPYSCJTWvQVx6zw-1
Received: by mail-ed1-f72.google.com with SMTP id
 k10-20020a50cb8a0000b0290387e0173bf7so2540590edi.8
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wVr1BRcenpjzOiZ9xw/vOlWRBXUlFYm0CmJkb4xTAB0=;
 b=E+nJJQNuEXbOGp1T2wx3tEF8B1lhCW40UJTx0tEqRNc2F0+1NGTU0XZicpnxtHvVdO
 S8Io4hOaXUrBfivLXnC16Y7c0G0YifYNj4P1uQmOfONcYTLwtWaeT0tHGca7MBwn4YNw
 NDJUlIBnZkG3A4oFoERMr4B7TUImn34A+NPQr2RT31m6gPD5qby9Rho/I/wMt0Zg9dzs
 /r/GqDhCEtLV/ts5P1BWznpgu0ETS6dR0SwVGPOmodeemgYxb0y4mJb9TaYwSAqNlgz/
 7jUPcmJHC6sI7QvY6bNQRGRrnXLdgrn9gLVkMCel2andq1fPUuNXChlRBQDqUPoKNOUM
 3sEw==
X-Gm-Message-State: AOAM533NYjb9+TEeKsGN3lBUCnpmxn+xjQBJVjfjpRYWed5971WML4Nj
 Km7sjAbSy7tdPgXOyXtIX/6BU83qGX8AAn9B3S9sozCIYnAKFi+MwJSQQlRHmD/CeS6i6g52GiR
 pzn3LjSBq3lVjYeA=
X-Received: by 2002:a17:907:a044:: with SMTP id
 gz4mr12244790ejc.55.1619606492601; 
 Wed, 28 Apr 2021 03:41:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ9HsxigrS85iAvwPLKO6tLVrDxU1OCPu9BKboBPyR9eT4ofylpeMDUDV01uWQUtKkeOWodQ==
X-Received: by 2002:a17:907:a044:: with SMTP id
 gz4mr12244762ejc.55.1619606492392; 
 Wed, 28 Apr 2021 03:41:32 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id i19sm1651706ejd.114.2021.04.28.03.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:41:32 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:41:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 3/4] hw/arm/virt-acpi-build: Add cluster level for
 PPTT table
Message-ID: <20210428104125.tnj53dpohoffdjmu@gator>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413083147.34236-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 04:31:46PM +0800, Yanan Wang wrote:
> Add a Processor Hierarchy Node of cluster level between core level
> and package level for ARM PPTT table.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 55 ++++++++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 22 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>



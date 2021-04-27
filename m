Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96A036C838
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:03:03 +0200 (CEST)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPEs-0004RI-Ic
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbPB8-0003ZC-AY
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:59:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbPB6-00050Q-JL
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619535548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EhUkYjt0LtSFMJINx2E4g+oaWJ6/xMmr7jMwwUmpL1Q=;
 b=IEyA6OA+LOrOldyhp0Ucn3iXsJHmKs7GT29mTs31MkSlopi1lv9ak9s24Dgryuv7UWkm6C
 tmwXoHcrRfH5GadIsD+meYP2pIFzg12mroyeUyzzmpx8m6g2Qgo4nqqlOL3Y2aOE2FHSMX
 5apMwxhwHe2GvFJCBKl/vaBzej1QpF0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-mSPsA1NzMJu45ZSbJzuSbA-1; Tue, 27 Apr 2021 10:59:05 -0400
X-MC-Unique: mSPsA1NzMJu45ZSbJzuSbA-1
Received: by mail-ej1-f69.google.com with SMTP id
 n10-20020a1709061d0ab029037caa96b8c5so11407652ejh.23
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EhUkYjt0LtSFMJINx2E4g+oaWJ6/xMmr7jMwwUmpL1Q=;
 b=sVO/XIuijkqfeN9zpfoIOK4GY1jD0hnOVFyAtnOR991K/b83v9QhxN8ensKOPHSBLm
 g3E3pWWrDsVKO4THAJg0hd/0QmSjx7vBpthV3mOPLDEOD55wH0ZvWi9wMs0emv9gDmcR
 hvW/x/MV+//CPleFgd7Nq3vytDxrjpELlE2lDYMtgzrXMCALrNndu7CbZe39u+iiZtl2
 jGzqi1w/0RuslOSNdEoJBcQpU19nVL/hLp6haIfGNsTdChVLAznHlsPnU3IAXAeRW4h0
 o+dfMpJkqRc0IrLJRq7wgmHSxeOl+YghRa9LuzR1P+57rConCsx9dXyjSkZy02CAXVRS
 NrUQ==
X-Gm-Message-State: AOAM5331G4uV9HQ2c4N5eBJD590YOJtDPD3pR7dxnHaMIOJn44lY9AZe
 8pBxsfsIwtH5ytT8zY9hzo7a/U/pBDavR/7JWTxMHIuKCKgBddd2+rUoCdbHmbhkKpU5jVSzVAw
 +w1zTUw6iztWCKLg=
X-Received: by 2002:a17:907:2623:: with SMTP id
 aq3mr15394205ejc.262.1619535544059; 
 Tue, 27 Apr 2021 07:59:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTP1i0dQY0ScGhuiZYqT2fDP8amFv5oSaRyzM4feYS3pvPDDmVYwE7fLvJGMmA882sAYis2g==
X-Received: by 2002:a17:907:2623:: with SMTP id
 aq3mr15394178ejc.262.1619535543794; 
 Tue, 27 Apr 2021 07:59:03 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id u1sm2515691edv.90.2021.04.27.07.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 07:59:03 -0700 (PDT)
Date: Tue, 27 Apr 2021 16:58:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 6/6] hw/arm/virt: Replace smp_parse with one that
 prefers cores
Message-ID: <20210427145856.5qaetgzdl6ovnoni@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-7-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-7-wangyanan55@huawei.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 04:07:45PM +0800, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> The virt machine type has never used the CPU topology parameters, other
> than number of online CPUs and max CPUs. When choosing how to allocate
> those CPUs the default has been to assume cores. In preparation for
> using the other CPU topology parameters let's use an smp_parse that
> prefers cores over sockets. We can also enforce the topology matches
> max_cpus check because we have no legacy to preserve.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)

Thanks, this patch matches [1]. Of course, I've always considered this
patch to be something of an RFC, though. Is there any harm in defaulting
to sockets over cores? If not, I wonder if we shouldn't just leave the
default as it is to avoid a mach-virt specific smp parser. The "no
topology" compat variable will keep existing machine types from switching
from cores to sockets, so we don't need to worry about that.

[1] https://github.com/rhdrjones/qemu/commit/c0670b1bccb4d08c7cf7c6957cc8878a2af131dd

Thanks,
drew



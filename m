Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5636C803
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:52:24 +0200 (CEST)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbP4Z-0001Gi-7l
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbP30-0000AV-GD
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbP2x-0008CU-G9
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619535042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9wrnID7hPwAUdcpkdIi3VMq8TEWSL+xoPsMVyx+6eA=;
 b=eEa6dDtat1xFNRlcluY8QA7VM5++QmMI3XEzzZTptKUZMFc3+BUcH497b2luLG/r4fO1jW
 MoiDKwWoSClEDyo0BoM/NeU+xZPtfCn2uRcoUbebFi7eGIiW6QNmGjK7mzTjd1NC3+9iAm
 q+thphUejzZMJ8VRGueLjxhXdyDG2y4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-4_Vv2tKiOlaPAD3Rk6gAKw-1; Tue, 27 Apr 2021 10:50:40 -0400
X-MC-Unique: 4_Vv2tKiOlaPAD3Rk6gAKw-1
Received: by mail-ej1-f72.google.com with SMTP id
 r14-20020a1709062cceb0290373a80b4002so11304131ejr.20
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/9wrnID7hPwAUdcpkdIi3VMq8TEWSL+xoPsMVyx+6eA=;
 b=VG+aWA/jIxIaoXmm798wqBMfhwGwMX5cHR00lIV7g4AxhZ3pkvZVf9uyW11/zwPOIj
 4PPCEFKLuV12ie32eVJB3mlbCjh8Lzgyudu9oG3oTrO8FInyhrmlAdgODQeh7gImWih8
 x1a6URalpBrn1HxbqlTdBmkhr9K/q9sBlKQzSYGiSUxB2Y1suHIx/PEKhJ9SdQ+cHrLr
 NsQULFw0MZzy1BEvgkrV85Eq27ss/HkZgtttja/bIL+eiZexsOFqW7WxpGhbOibkBaiP
 GQiGIeTrq8wAcrjqc6/wFWE+BRKV8M1TueSjXKZuFqCpgUpYYRr4KZTB1X87IFoFsbvc
 LRVA==
X-Gm-Message-State: AOAM531s6yGDDJ+PRbHHK4yPe46H08FXbf53bDABizHIl9HYSudgxyRZ
 mutD3T8v3nc8FovBNpgdu/ihG5dAI51ocK9khEum0PDwo2C4Kz7EMISicz2VcIQM5azlqaKKkrW
 amKPJth0sgav8uGQ=
X-Received: by 2002:a50:c44f:: with SMTP id w15mr4853260edf.79.1619535039078; 
 Tue, 27 Apr 2021 07:50:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA8Q2T76c4MJNqOIDvJbsYQHUzKvrSnKqxxhT/CgGKK96KrLDLoXGMa3oqEE5kN7Wr5Rnc/w==
X-Received: by 2002:a50:c44f:: with SMTP id w15mr4853229edf.79.1619535038906; 
 Tue, 27 Apr 2021 07:50:38 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id o6sm2540424edw.24.2021.04.27.07.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 07:50:38 -0700 (PDT)
Date: Tue, 27 Apr 2021 16:50:36 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 3/6] hw/arm/virt-acpi-build: Distinguish possible
 and present cpus
Message-ID: <20210427145036.snne6xunr6cnyxln@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Igor Mammedov <imammedo@redhat.com>, Ying Fang <fangying1@huawei.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 04:07:42PM +0800, Yanan Wang wrote:
> From: Ying Fang <fangying1@huawei.com>
> 
> When building ACPI tables regarding CPUs we should always build
> them for the number of possible CPUs, not the number of present
> CPUs. We then ensure only the present CPUs are enabled in MADT.
> Furthermore, it is also needed if we are going to support CPU
> hotplug in the future.
> 
> This patch is a rework based on Andrew Jones's contribution at
> https://lists.gnu.org/archive/html/qemu-arm/2018-07/msg00076.html

Thank you for this credit, but I think I'd prefer a Co-developed-by
tag instead, if you don't mind.

Thanks,
drew



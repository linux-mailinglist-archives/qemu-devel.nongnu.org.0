Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3CD4036C5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 11:18:29 +0200 (CEST)
Received: from localhost ([::1]:56724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNtit-0006Ky-Kk
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 05:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mNtgl-0004e0-IA
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mNtgi-0003xj-8e
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631092570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YAZtghhghlq89lbfSShBZZ/ZsCtccFU+0KD5qQVQlIo=;
 b=IvrvzJ5cQIhGX5cFW63iK6EVheSzhRWAK4ooHSi1un/Q04OFjf9g1eLxt318aI3yLqJj0c
 vLRwNwusa0SQRyc+FrmQiBWCCxyK6sgro1vAWuEDIUFT3fui04Q5ubKNQYP6bO9IsLuUJ9
 1BOsgk8DrDf3Bmyw1DKEf4pXc59xtmo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-zIKuvctJMY-3cDg-ZtPFPw-1; Wed, 08 Sep 2021 05:16:07 -0400
X-MC-Unique: zIKuvctJMY-3cDg-ZtPFPw-1
Received: by mail-ej1-f71.google.com with SMTP id
 bx10-20020a170906a1ca00b005c341820edeso692052ejb.10
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 02:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YAZtghhghlq89lbfSShBZZ/ZsCtccFU+0KD5qQVQlIo=;
 b=FBf/S8wgUkPKvkY+LnjRyUq/GsqrvX96UqxYz96V1pCkHYRFuf2MSFev/04r7PuwkN
 NHQwEzWC6zcu/xKY4mWUH2LF6gEU11wC8I7TszNyX/aC6KfE0M/5IRnpo8q6Vr0V75rR
 6lStbihSF8EOMnEKATzJ0NCRJ3dyVQ7Y3BIygwJhvyNvpvEC3FZlvMhCS12Z9NpKvgd8
 leBK0YMx3N54yiMy3e6PoKAVCic26V8Jb2Y9QleZplNiI1tFumuLwguuPjuhp4bSsnJt
 0jIYJf2nPBbZEK0lzhkzWBNgzQ7AQAc5Exyc1YYgy8K9vfp1Vom5f85/7bUNkiqdRajr
 qmdQ==
X-Gm-Message-State: AOAM532+TcI5Vn6DR8nyb3fFg8AwKtrxEIjlWd1EWEeSlYMaycusfwWe
 2FWO7YN9y6QEh9bA7+jKmAOoOO8awA4nX+ptj6gE/bIDGs6kh/51rmZOxegdEGJuZ++mHE/5TNx
 IDXGTi/lkRd/tHFQ=
X-Received: by 2002:a05:6402:cab:: with SMTP id
 cn11mr2816077edb.293.1631092566698; 
 Wed, 08 Sep 2021 02:16:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxtjyCBmKIGg7+AGk0rRlIXv/TvvC4mfYF02bEHvBlwNiM23ZenD9iEye0SHycCCxWioVPcA==
X-Received: by 2002:a05:6402:cab:: with SMTP id
 cn11mr2816045edb.293.1631092566377; 
 Wed, 08 Sep 2021 02:16:06 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id r6sm672700ejb.119.2021.09.08.02.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 02:14:40 -0700 (PDT)
Date: Wed, 8 Sep 2021 11:14:04 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20210908091404.ov2ku6t3dl6s2ui3@gator>
References: <20210906123139.93593-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210906123139.93593-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, gshan@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06, 2021 at 02:31:36PM +0200, Eric Auger wrote:
> This series generates the ACPI DBG2 table along with machvirt.
> It applies on top of Igor's
> [PATCH v2 00/35] acpi: refactor error prone build_header() and
> packed structures usage in ACPI tables
> 
> The DBG2 specification can be found at
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.
> 
> DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
> behind is Windows requires it on all systems).
> 
> The DBG2 is used to describe a debug port, used by the kernel debugger.

Hi Eric,

Did you test this in some way with a Linux guest?

Thanks,
drew

> 
> This series and its dependency can be found at
> https://github.com/eauger/qemu.git
> branch: dbg2-v2-igor-v2-fix
> 
> History:
> v1 -> v2:
> - rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
>   and build_append_int_noprefix()
> 
> Eric Auger (3):
>   tests/acpi: Add void table for virt/DBG2 bios-tables-test
>   bios-tables-test: Generate reference table for virt/DBG2
>   hw/arm/virt_acpi_build: Generate DBG2 table
> 
>  hw/arm/virt-acpi-build.c  |  64 +++++++++++++++++++++++++++++++++++++-
>  tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 tests/data/acpi/virt/DBG2
> 
> -- 
> 2.26.3
> 



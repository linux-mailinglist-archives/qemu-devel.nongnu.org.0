Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA6C422C91
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:33:44 +0200 (CEST)
Received: from localhost ([::1]:59866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmRq-0003XT-Ow
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXm3v-0001Hf-2M
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXm3t-0005Xe-Bd
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633446536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E7ckrzHsn4jfi18xHbyGJ35f/6LWrfmPSLonsi9z9PA=;
 b=KhMxrDNNsngcywl0HzcmxFrWHHclhiy53JoTpKMSC7BduL4QgqfFzGN7aRAtZLr+0ZYYGz
 BjQdT4OKfjmZKtQZ/DeH+4GwaJ+KoecQuw6Zneba5P2zk4QEwvepHB6dZPJktKCwH/kDVI
 Ori6Zks+azqceF3+l+lRBHfFmuw7Zl0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-n8xnMVCcN9CkE3q6qB5ebg-1; Tue, 05 Oct 2021 11:08:53 -0400
X-MC-Unique: n8xnMVCcN9CkE3q6qB5ebg-1
Received: by mail-ed1-f72.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so20628099edj.21
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 08:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E7ckrzHsn4jfi18xHbyGJ35f/6LWrfmPSLonsi9z9PA=;
 b=oQjSDcBZIP2kgIlOMVW97V3+QSV5o5QtMraT9i5svFxQ7Z1Qm3W6jXKLct4gZJ+EZ0
 56Ekk5dqOjmHIOPk5uzFz1vFb/1vSLeqQ0Ys7BWyU0+KJBIZvbYrMGCf3lZl1YMjfRLb
 Mxq91Lpm49tSK+XjWWxyJj9AqoKuyJH9s1KiT723wWTIACcSaKGs6QzR9ZvqMXAfW24M
 rnVNgi1PriXPP/BOKjokQuhNUHM//YZ6KeUGNPCECDVpB8f7owRqh+ODrYCEM8DJiokk
 FVTJmuGWfbfpGlC8aaSSVhdyoA6bs/sycSeQJIDXjz5w/x7rZvMZA5/83CkzwzqJjTgy
 Fp/A==
X-Gm-Message-State: AOAM533CJx+aYppd1YcwWZHmi0LBFGVPvYT/FfBKZhDRtPR7+P9Iq8Bc
 GjEJ21w1B2zcKgMtJh16xVKpqW+Wgfi2O0gI5VOKTrWW+jyDOPz3bYG5oL52+oOh71qZM5tTaoZ
 v74/4E7XODH75n30=
X-Received: by 2002:a17:906:354a:: with SMTP id
 s10mr26628385eja.475.1633446532360; 
 Tue, 05 Oct 2021 08:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+0IG4DO6rBfGkxrIf5KpBkslje0qSDbPsfUo/KO+sDR/WJmqPA5FWphKk/4/53Bioy3uIIw==
X-Received: by 2002:a17:906:354a:: with SMTP id
 s10mr26628356eja.475.1633446532148; 
 Tue, 05 Oct 2021 08:08:52 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id d18sm3769781ejo.80.2021.10.05.08.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 08:08:51 -0700 (PDT)
Date: Tue, 5 Oct 2021 11:08:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20211005110838-mutt-send-email-mst@kernel.org>
References: <20210927131732.63801-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210927131732.63801-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 03:17:29PM +0200, Eric Auger wrote:
> This series generates the ACPI DBG2 table along with machvirt.
> It applies on top of Igor's
> [PATCH v4 00/35] acpi: refactor error prone build_header() and
> packed structures usage in ACPI tables
> 
> The DBG2 specification can be found at
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.
> 
> DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
> behind is Windows requires it on all systems).
> 
> The DBG2 is used to describe a debug port, used by the kernel debugger.
> 
> This series and its dependency can be found at
> https://github.com/eauger/qemu.git
> branch: igor_acpi_refactoring_v4_dbg2_v3


Acked-by: Michael S. Tsirkin <mst@redhat.com>


> History:
> v2 -> v3:
> - addressed all comments from Igor on v2:
>   patches 2/3 swapped
>   style adjustments in "hw/arm/virt_acpi_build: Generate DBG2 table"
>   + more precision on spec references
> 
> v1 -> v2:
> - rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
>   and build_append_int_noprefix()
> 
> 
> Eric Auger (3):
>   tests/acpi: Add void table for virt/DBG2 bios-tables-test
>   hw/arm/virt_acpi_build: Generate DBG2 table
>   bios-tables-test: Generate reference table for virt/DBG2
> 
>  hw/arm/virt-acpi-build.c  |  62 +++++++++++++++++++++++++++++++++++++-
>  tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
>  2 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 tests/data/acpi/virt/DBG2
> 
> -- 
> 2.26.3



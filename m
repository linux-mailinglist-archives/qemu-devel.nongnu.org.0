Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F6310C26
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 14:50:09 +0100 (CET)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81Uu-00065J-Jf
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 08:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l81Tt-0005Ks-Gg
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:49:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l81Tr-0002uP-TO
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612532942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=joK+FAL6GjE8yaKgiMntTmakeVv7Fu91l3U8zFqK+bM=;
 b=SsFbShhjuouLrspMCDA3d4JPKG7vwClCtw9QiHo9DVRFnFFMyvDMarvKmQ+ZOIJyF904//
 5GD6dDm9J4cD/b9sKpdk8sXNoj8Zr+WcpLzh5sJ+rNNnsWhONiJCGfonSmMRGlz18OcPY/
 VoS7m/eUic99xKUio4nporPxllp5AKg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-20P7V1TmMJKS999oAEq88w-1; Fri, 05 Feb 2021 08:49:01 -0500
X-MC-Unique: 20P7V1TmMJKS999oAEq88w-1
Received: by mail-wm1-f72.google.com with SMTP id z67so3824263wme.3
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 05:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=joK+FAL6GjE8yaKgiMntTmakeVv7Fu91l3U8zFqK+bM=;
 b=H1aH3OaTyZbuRsLW1HOH4H89tnW50d9/2V21VhVzqhVx0I33xJyKm8elTQZdoxrooA
 pJlpBgvID0WLOF+DLa189zWINMDTzq3GssOfhj4ufjX4Kdr6rG0DgRvFhuLX26Vw0UgZ
 uACuBxcqjcBASSmdraON88EhT+L8FEXArDqYp/Alt2cJLPNv3D5WODWkImje2sJmBPT5
 Neb4XV1mcbmaZDDf/FGHctJBtII8wQapSilByYraKH6DsN7JfREWamjSPEVGqi01vcIB
 8YIQs6yAcS4Djw2OLu/aQD0X9nl0w6pJ4dwqjPTM+fe+QL3ppkyP8fj58TDJAF7Svgnn
 0fWA==
X-Gm-Message-State: AOAM532CFPCdIF9/v7A+ixuwHFmXEnJ6mJNXLJtAeLakRf2NFXuteqht
 vulWIAPPgB57zTq1CRhcJGQ28kSc4qDq37XGfOG8X+L/OcLx7D1esinrPQzdqyv8xpw8Za0d3il
 TWzFCPHxrL0yyaLk=
X-Received: by 2002:adf:f750:: with SMTP id z16mr5179320wrp.243.1612532939888; 
 Fri, 05 Feb 2021 05:48:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNbx423HqPzn6TZnVX8pxwCyROcgSFp+wm6vfqCbq7lJgOiXYpBxnajHbnMb1j/ga20LpNiA==
X-Received: by 2002:adf:f750:: with SMTP id z16mr5179305wrp.243.1612532939720; 
 Fri, 05 Feb 2021 05:48:59 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id k6sm12861573wro.27.2021.02.05.05.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 05:48:58 -0800 (PST)
Date: Fri, 5 Feb 2021 08:48:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH 0/4] ACPI related fixes
Message-ID: <20210205084711-mutt-send-email-mst@kernel.org>
References: <cover.1612424814.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1612424814.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 12:04:07AM -0800, isaku.yamahata@gmail.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Miscellaneous bug fixes related to ACPI to play nice with guest BIOSes/OSes
> by conforming to ACPI spec better.
> 
> Isaku Yamahata (3):
>   acpi/core: always set SCI_EN when SMM isn't supported
>   acpi: set fadt.smi_cmd to zero when SMM is not supported
>   hw/i386: declare ACPI mother board resource for MMCONFIG region

These all look good, but break make check:

acpi-test: Warning! DSDT binary file mismatch. Actual [aml:/tmp/aml-YLJ7X0], Expected [aml:tests/data/acpi/q35/DSDT].
See source file tests/qtest/bios-tables-test.c for instructions on how to update expected files.
acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-2KJ7X0.dsl, aml:/tmp/aml-YLJ7X0], Expected [asl:/tmp/asl-U2R7X0.dsl, aml:tests/data/acpi/q35/DSDT].
**
ERROR:../qemu/tests/qtest/bios-tables-test.c:509:test_acpi_asl: assertion failed: (all_tables_match)
ERROR qtest-i386/bios-tables-test - Bail out! ERROR:../qemu/tests/qtest/bios-tables-test.c:509:test_acpi_asl: assertion failed: (all_tables_match)
make: *** [Makefile.mtest:1713: run-test-212] Error 1

Probably because you didn't update the expected files.
Pls follow the process at the top of tests/qtest/bios-tables-test.c

and make sure all tests pass.


> Sean Christopherson (1):
>   i386: acpi: Don't build HPET ACPI entry if HPET is disabled
> 
>  hw/acpi/core.c         |  11 ++-
>  hw/acpi/ich9.c         |   2 +-
>  hw/acpi/piix4.c        |   3 +-
>  hw/i386/acpi-build.c   | 188 +++++++++++++++++++++++++++++++++++++++--
>  hw/isa/vt82c686.c      |   2 +-
>  include/hw/acpi/acpi.h |   4 +-
>  6 files changed, 200 insertions(+), 10 deletions(-)
> 
> -- 
> 2.17.1



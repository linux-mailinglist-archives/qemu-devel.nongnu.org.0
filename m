Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4BB23C0CB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 22:35:54 +0200 (CEST)
Received: from localhost ([::1]:51690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k33f6-000618-UH
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 16:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1k33eD-0005Dt-5F
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 16:34:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58284
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1k33eB-0006SJ-7Q
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 16:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596573294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KvFiWTcx/PztuGZ6oyBwBRqmh1IacgjA5vXW8dVipE0=;
 b=c7i1Z7DzmfJU7FdVFI+B7DNeHAxlxIWpYxUFoV+6ujO8XAPdewENO0NWA/WnBAGhNdEI0i
 ifWD26OAw42xpePbeH/bFaEQJN1DZr4CljOGzcB+Bj/DaM5M+gVKz4Pd36QR03gANg/+Fo
 B+KJdxejm5WGu8g04cD9+gtTraRNlYg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-4I8Xk_V2PQiR210O4INbZA-1; Tue, 04 Aug 2020 16:34:52 -0400
X-MC-Unique: 4I8Xk_V2PQiR210O4INbZA-1
Received: by mail-qk1-f200.google.com with SMTP id k142so29281507qke.7
 for <qemu-devel@nongnu.org>; Tue, 04 Aug 2020 13:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KvFiWTcx/PztuGZ6oyBwBRqmh1IacgjA5vXW8dVipE0=;
 b=FA3EdtDn8yYrUfr+53DF1QuuqWJ5Hr0YMzam4SAGSKKfN0Ul/uH2/uhGjawAkH2c5L
 YTG9X0p1awMG6m2XZoPmF34XTNNHyozk9VthhKCgL0snTMqeBWgMyPQuFaudF8P9EAky
 UV2HoPVFyzQMsuYa4LUikBte3OSx1VGvE92oV6+dLAIX9PobDgFRGb+nVDfpQyPOacor
 jiU09WJrbEpiEuY9KU41hFd+VqAvfebMrx+qF+DWf4kXxnpYM1juon9jt1/4QIuJiZ1q
 FhD9oWoUNyre8wOGEy29rGFBIjaDXCrm9ZDccftTCUAbv5oAmLpdgg0tfey3L6QKe3BN
 yabQ==
X-Gm-Message-State: AOAM531j8JB8OebtfcXfrDD5QFoIu5lqfcNJJSpbLxj9oCbb4OtUtN8F
 7PwrmSDXXM858Om7rhBe/yXwHdEbMh5D861yTWTCrP4jYEGKCqdNZ6AS7JPbPZHB/+vtFoNkYwG
 gxZq6wPEeD8f4IHY=
X-Received: by 2002:a37:34f:: with SMTP id 76mr82547qkd.68.1596573292231;
 Tue, 04 Aug 2020 13:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf1LEoEzwZM3OVwXOTibLVBYn53kDFNWyidxiA0Z59ypG8R0Uew7PMWD78mt51ejHLb4n/YQ==
X-Received: by 2002:a37:34f:: with SMTP id 76mr82532qkd.68.1596573291906;
 Tue, 04 Aug 2020 13:34:51 -0700 (PDT)
Received: from redhat.com (bzq-79-177-102-128.red.bezeqint.net.
 [79.177.102.128])
 by smtp.gmail.com with ESMTPSA id a21sm20667765qkg.54.2020.08.04.13.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 13:34:50 -0700 (PDT)
Date: Tue, 4 Aug 2020 16:34:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PULL 0/3] virtio,acpi: bugfixes
Message-ID: <20200804163421-mutt-send-email-mst@kernel.org>
References: <20200804141640.591031-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200804141640.591031-1-mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:28:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 04, 2020 at 10:17:01AM -0400, Michael S. Tsirkin wrote:
> The following changes since commit 5c1c3e4f02e458cf280c677c817ae4fd1ed9bf10:
> 
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200803' into staging (2020-08-03 20:34:26 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 5957b49b423fe456896e10f7e4a6c69be07f9407:
> 
>   virtio-mem: Correct format specifier mismatch for RISC-V (2020-08-04 09:13:34 -0400)


I dropped patches 1-2 and pushed a new tag.
Pls apply, sorry about the noise!

> ----------------------------------------------------------------
> virtio,acpi: bugfixes
> 
> A couple of last minute bugfixes.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Bruce Rogers (1):
>       virtio-mem: Correct format specifier mismatch for RISC-V
> 
> Michael S. Tsirkin (2):
>       i386/acpi: fix inconsistent QEMU/OVMF device paths
>       arm/acpi: fix an out of spec _UID for PCI root
> 
>  hw/arm/virt-acpi-build.c | 2 +-
>  hw/i386/acpi-build.c     | 4 ++--
>  hw/virtio/virtio-mem.c   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 



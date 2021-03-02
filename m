Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10632A1A7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:56:47 +0100 (CET)
Received: from localhost ([::1]:45572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5W2-0004zK-WE
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lH5UO-0003wA-1v
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lH5UM-0005HW-Cg
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:55:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614693301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T49AvpVkcwscP9E51Qkrm7RFm2oIDmDwc1lF5scwqdU=;
 b=PcA5UINDqWGZ5DMmwq9+ptmfFqiHV4z2CRu+/ll+kYsnk5gYQG3Vozf+RViOSqrlMfogKq
 xTPEOmfsSuGZEIgcd5mGaRP2/SHlvpXKVHTo8O1ZhkWDlfG9ZTm4LMIUVc+nWrgre7m47Y
 EJC4F7fyQVOltFekJeBWewdkXw9e8T8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-NK3vW1BdOo6-C8wQtPpyzw-1; Tue, 02 Mar 2021 08:54:58 -0500
X-MC-Unique: NK3vW1BdOo6-C8wQtPpyzw-1
Received: by mail-wm1-f69.google.com with SMTP id q24so1217029wmc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 05:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T49AvpVkcwscP9E51Qkrm7RFm2oIDmDwc1lF5scwqdU=;
 b=HAJFF6ayPM3U6yOeGeWbwj7/PdCs5ihihdVbmCZioavwaBBpO+SySEGBoqgCU1BHkI
 gV42Vzxb1tcAxur93KK+X6uGlBP0Hlv5lVBvorkSs3PBTxirMqwEQVV96xfyWAY8wkZh
 pWgCCpumt4m+JGGdfF3SJOSkBGPpAxqd1KNUC5HGgSv8mQ1qAMuzO/64j9NRnJnUTshW
 97Zk4f/vQQSoTXsKdlVDgliw3WRa54TwWqkYdZSslJgeVNyHVOycsCN/1Cs/p4hyOoVw
 b73HRDX+VRct4Y6w2rGYkkJHU6K4bOEnkgtbtZBlsve0UbPfeJmHuQYf+7NWv5ux+tMn
 iCCA==
X-Gm-Message-State: AOAM533yAJAGqYSpLSYRC4Kwbc4FOtnCW9LHuvHaii/4ZN29t63y4gWX
 2jJAy4+oYOKloKZvwvgSoiIZdAYOdo1Euks1tsV6YfId4jIwTC6/8EsbKCGBL/AB2M2Psi6/Kq1
 e32rtetuX0+C1iK4=
X-Received: by 2002:adf:fa8d:: with SMTP id h13mr13044840wrr.331.1614693296487; 
 Tue, 02 Mar 2021 05:54:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztGsfeBj96AOOsZRKkUtbg2QiFEdg3gj3EDCrYn62/5CItBoGrFaWkRzujswdgdor/UOH+sg==
X-Received: by 2002:adf:fa8d:: with SMTP id h13mr13044819wrr.331.1614693296275; 
 Tue, 02 Mar 2021 05:54:56 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id g11sm16996482wrw.89.2021.03.02.05.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:54:55 -0800 (PST)
Date: Tue, 2 Mar 2021 14:54:53 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH 2/2] x86/pvh: extract only 4 bytes of start address for
 32 bit kernels
Message-ID: <20210302135453.5ijlf3idwxn2q3rd@steredhat>
References: <20210302090315.3031492-1-david.edmondson@oracle.com>
 <20210302090315.3031492-3-david.edmondson@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20210302090315.3031492-3-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 09:03:15AM +0000, David Edmondson wrote:
>When loading the PVH start address from a 32 bit ELF note, extract
>only the appropriate number of bytes.
>
>Fixes: ab969087da65 ("pvh: Boot uncompressed kernel using direct boot ABI")
>Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>---
> hw/i386/x86.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>index 6329f90ef9..7865660e2c 100644
>--- a/hw/i386/x86.c
>+++ b/hw/i386/x86.c
>@@ -690,6 +690,8 @@ static uint64_t read_pvh_start_addr(void *arg1, void *arg2, bool is64)
>         elf_note_data_addr =
>             ((void *)nhdr64) + nhdr_size64 +
>             QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
>+
>+        pvh_start_addr = *elf_note_data_addr;
>     } else {
>         struct elf32_note *nhdr32 = (struct elf32_note *)arg1;
>         uint32_t nhdr_size32 = sizeof(struct elf32_note);
>@@ -699,9 +701,9 @@ static uint64_t read_pvh_start_addr(void *arg1, void *arg2, bool is64)
>         elf_note_data_addr =
>             ((void *)nhdr32) + nhdr_size32 +
>             QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
>-    }
>
>-    pvh_start_addr = *elf_note_data_addr;
>+        pvh_start_addr = *(uint32_t *)elf_note_data_addr;
>+    }
>
>     return pvh_start_addr;
> }
>-- 
>2.30.0
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>



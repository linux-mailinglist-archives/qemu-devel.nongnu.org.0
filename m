Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9D9411104
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 10:33:00 +0200 (CEST)
Received: from localhost ([::1]:42786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSEjT-0001OR-9n
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 04:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEg9-00071i-2T
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEg6-0003Hg-Vu
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632126570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jh/MU81q/jyB0+20rg1zsWsPTIHt+f2fW4TlT/4m5Ec=;
 b=ZaFj56jaz1hV8Ar9zrfh/9UaKmW8BDLgInbBbi5XsQLwWuvdLqhkjXqwXa243zkgpSRzeK
 LgIw2CGk17z/mOYeanyPmB8518D/fNZlCHFBAFXcg1cjkKrKEG8LJvULyyPKB8DlLbNbe1
 OoYdA/iyfrmpqhEf4FgSWKUl+dZPB4Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-KSclJ_S3OnWJrTjOU3gVeQ-1; Mon, 20 Sep 2021 04:29:29 -0400
X-MC-Unique: KSclJ_S3OnWJrTjOU3gVeQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 m30-20020a50999e000000b003cdd7680c8cso14898703edb.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 01:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jh/MU81q/jyB0+20rg1zsWsPTIHt+f2fW4TlT/4m5Ec=;
 b=A1swVk1sHy8BTvvDfeyCzJPitzNAKBMz7x7VH0BvHEozYM0HAzzLVUgJJ9/IGs5Mu3
 JXQO+R3imFx5LSymTPpp2aKlM+Ave3rybFt6T+FKXopG7WKrdu7X799NYzc+L1WnjRqR
 IkroIgMOVMK3Gk9x7CKP4ZHi7f8ba6DnuIbiqMBZElg74GflCoI6b1MRPI6MHzQ9duw0
 3YgqKr8civuxiq/+QesLPobiklZCoVZOL7rjo1E1HOSwSH+orSK2IFoFVwOHC4NZ5N7j
 dXTFLNKG6wmXYs0U1X1iWaaEQaU9o3+uYl/5/j88lZkwO0ZamxvVZcL9YGJyNfpblCSm
 AKxg==
X-Gm-Message-State: AOAM531KJfEK8vTlF4LCjP/euibKcWMpOimydyzFpyZP57h5+wktcvDy
 fQGUu0k1xUujiM1K27vCRjDWQVy8MQXiE05pxgSFd1/us/VzyE1K97wiGCVD5dlm708TJ6qM4G5
 9/pgVvJ4yU0GSu3I=
X-Received: by 2002:a17:906:7256:: with SMTP id
 n22mr27799340ejk.173.1632126566403; 
 Mon, 20 Sep 2021 01:29:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt8bsHQzYYjcE8BUP6lozWIWc4AfI9siw+hZvYoyirbtWyFtXblFP8+qupb4KJs8oOm8NWbw==
X-Received: by 2002:a17:906:7256:: with SMTP id
 n22mr27799312ejk.173.1632126566131; 
 Mon, 20 Sep 2021 01:29:26 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id bm26sm5920811ejb.16.2021.09.20.01.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:29:25 -0700 (PDT)
Date: Mon, 20 Sep 2021 10:29:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v3 10/10] tests/acpi: add expected VIOT blob for q35
 machine
Message-ID: <20210920102924.5e2c417e@redhat.com>
In-Reply-To: <20210914142004.2433568-11-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-11-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sep 2021 15:20:05 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> The VIOT table generated for the q35 test is:

I'd squash this into previous patch


> [000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
> [004h 0004   4]                 Table Length : 00000070
> [008h 0008   1]                     Revision : 00
> [009h 0009   1]                     Checksum : 3D
> [00Ah 0010   6]                       Oem ID : "BOCHS "
> [010h 0016   8]                 Oem Table ID : "BXPC    "
> [018h 0024   4]                 Oem Revision : 00000001
> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> [020h 0032   4]        Asl Compiler Revision : 00000001
> 
> [024h 0036   2]                   Node count : 0003
> [026h 0038   2]                  Node offset : 0030
> [028h 0040   8]                     Reserved : 0000000000000000
> 
> [030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
> [031h 0049   1]                     Reserved : 00
> [032h 0050   2]                       Length : 0010
> 
> [034h 0052   2]                  PCI Segment : 0000
> [036h 0054   2]               PCI BDF number : 0010
> [038h 0056   8]                     Reserved : 0000000000000000
> 
> [040h 0064   1]                         Type : 01 [PCI Range]
> [041h 0065   1]                     Reserved : 00
> [042h 0066   2]                       Length : 0018
> 
> [044h 0068   4]               Endpoint start : 00001000
> [048h 0072   2]            PCI Segment start : 0000
> [04Ah 0074   2]              PCI Segment end : 0000
> [04Ch 0076   2]                PCI BDF start : 1000
> [04Eh 0078   2]                  PCI BDF end : 10FF
> [050h 0080   2]                  Output node : 0030
> [052h 0082   6]                     Reserved : 000000000000
> 
> [058h 0088   1]                         Type : 01 [PCI Range]
> [059h 0089   1]                     Reserved : 00
> [05Ah 0090   2]                       Length : 0018
> 
> [05Ch 0092   4]               Endpoint start : 00003000
> [060h 0096   2]            PCI Segment start : 0000
> [062h 0098   2]              PCI Segment end : 0000
> [064h 0100   2]                PCI BDF start : 3000
> [066h 0102   2]                  PCI BDF end : 30FF
> [068h 0104   2]                  Output node : 0030
> [06Ah 0106   6]                     Reserved : 000000000000
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  tests/data/acpi/q35/VIOT.viot               | Bin 0 -> 112 bytes
>  2 files changed, 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 27ab8d3ba8..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/VIOT.viot",
> diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..275c78fbe8e93190321d957c91c3f17551f865d4 100644
> GIT binary patch
> literal 112
> zcmWIZ^baXu00LVle`k+i1*eDrX9XZ&1PX!JAex!M0Hgv8m>C3sGzdcgBZCBjEAU?c  
> OrV=a;;~4xmfH48g0SW;C
> 
> literal 0
> HcmV?d00001
> 



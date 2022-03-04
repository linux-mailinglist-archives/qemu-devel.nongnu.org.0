Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AE84CD538
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:33:42 +0100 (CET)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ83x-0007Rx-Fx
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:33:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ7qh-0004MJ-J2
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:20:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ7qb-0001AS-4M
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646399991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzLfrEn3uUc6jWUP7OwcVztSj1iGKe00nLD9hRhKedY=;
 b=Zb6zoB8IOd/0NZjBSMozJhbIzRtsaT/IAb4y8EQpy2l2Op6unbYSd3m+z8V1XBTsW3USME
 XxOSwJgX+MHwW1g6urw56o9oSgKXEAykSg9F5DkQJW2rwWqTIfrTATvebs5CRSTdV5CwX0
 18oqINwf3ERmKDijCy4lcr/PKlm45ro=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-B4VUYyyHO7GhOsXYVfUw0g-1; Fri, 04 Mar 2022 08:19:50 -0500
X-MC-Unique: B4VUYyyHO7GhOsXYVfUw0g-1
Received: by mail-wm1-f71.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so2354995wmj.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AzLfrEn3uUc6jWUP7OwcVztSj1iGKe00nLD9hRhKedY=;
 b=tFSv4x+gqJtY1C057YxPzg1uNyGftbu7uVfORsSr8V6Qj37j4yJUJx+9HwKS9MAqCP
 G/RckOk2sXmFuggP22f0GmVZs5UOHW8z5sXR0V4L89oQPwyunTraN05aHKaIEhqLNH76
 bYW4rGLMgqrKExOh97Uk0ahz/ajX+VHIKEv2Lv3OZ2xTuJCtFA5iU6aUPeivl14lJ258
 KNq5XXtTxwp86iUSBjoRcAyIJaFXMX9SEFR+JnWq1SIV7Wt3ugLAxhzu2BChjrY/s+lJ
 YBiiEL2rxhDXAgn8N0V6stAdWaOlqYNDIfms2Zm2IowtWWDdFAPEvSbJOfEwAQjA+yBv
 n7xQ==
X-Gm-Message-State: AOAM530VN59Lck54Qos3Corl0ik5n+3HppfBsDUivzkhyqf6Zi8Ts9gz
 5+YqOTPxim3jpINkHI0+uu+QC3guqb8uxrSl2bIEw267mNaHcXTdWCODjjxFUPhp2laR++e+5Lk
 2RQH609NEo40P9KM=
X-Received: by 2002:adf:cd02:0:b0:1f0:767d:b39a with SMTP id
 w2-20020adfcd02000000b001f0767db39amr2282571wrm.529.1646399989160; 
 Fri, 04 Mar 2022 05:19:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDHQaJ57z/j++NnRcCGlY3P6jXW43ioVhQZmaEUoQfJ6yCq89CV4Qmtyz2RdrufuWedT+NHw==
X-Received: by 2002:adf:cd02:0:b0:1f0:767d:b39a with SMTP id
 w2-20020adfcd02000000b001f0767db39amr2282554wrm.529.1646399988906; 
 Fri, 04 Mar 2022 05:19:48 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm15294288wmp.13.2022.03.04.05.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:19:48 -0800 (PST)
Date: Fri, 4 Mar 2022 08:19:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v5 3/3] tests/acpi: i386: update FACP table differences
Message-ID: <20220304081931-mutt-send-email-mst@kernel.org>
References: <20220304115257.1816983-1-ani@anisinha.ca>
 <20220304115257.1816983-4-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20220304115257.1816983-4-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 05:22:57PM +0530, Ani Sinha wrote:
> From: Liav Albani <liavalb@gmail.com>
> 
> After changing the IAPC boot flags register to indicate support of i8042
> in the machine chipset to help the guest OS to determine its existence
> "faster", we need to have the updated FACP ACPI binary images in tree.
> 
> The ASL changes introduced are shown by the following diff:
> 
> @@ -42,35 +42,35 @@
>  [059h 0089   1]     PM1 Control Block Length : 02
>  [05Ah 0090   1]     PM2 Control Block Length : 00
>  [05Bh 0091   1]        PM Timer Block Length : 04
>  [05Ch 0092   1]            GPE0 Block Length : 10
>  [05Dh 0093   1]            GPE1 Block Length : 00
>  [05Eh 0094   1]             GPE1 Base Offset : 00
>  [05Fh 0095   1]                 _CST Support : 00
>  [060h 0096   2]                   C2 Latency : 0FFF
>  [062h 0098   2]                   C3 Latency : 0FFF
>  [064h 0100   2]               CPU Cache Size : 0000
>  [066h 0102   2]           Cache Flush Stride : 0000
>  [068h 0104   1]            Duty Cycle Offset : 00
>  [069h 0105   1]             Duty Cycle Width : 00
>  [06Ah 0106   1]          RTC Day Alarm Index : 00
>  [06Bh 0107   1]        RTC Month Alarm Index : 00
>  [06Ch 0108   1]            RTC Century Index : 32
> -[06Dh 0109   2]   Boot Flags (decoded below) : 0000
> +[06Dh 0109   2]   Boot Flags (decoded below) : 0002
>                 Legacy Devices Supported (V2) : 0
> -            8042 Present on ports 60/64 (V2) : 0
> +            8042 Present on ports 60/64 (V2) : 1
>                          VGA Not Present (V4) : 0
>                        MSI Not Supported (V4) : 0
>                  PCIe ASPM Not Supported (V4) : 0
>                     CMOS RTC Not Present (V5) : 0
>  [06Fh 0111   1]                     Reserved : 00
>  [070h 0112   4]        Flags (decoded below) : 000084A5
>        WBINVD instruction is operational (V1) : 1
>                WBINVD flushes all caches (V1) : 0
>                      All CPUs support C1 (V1) : 1
>                    C2 works on MP system (V1) : 0
>              Control Method Power Button (V1) : 0
>              Control Method Sleep Button (V1) : 1
>          RTC wake not in fixed reg space (V1) : 0
>              RTC can wake system from S4 (V1) : 1
>                          32-bit PM Timer (V1) : 0
>                        Docking Supported (V1) : 0
> 
> Signed-off-by: Liav Albani <liavalb@gmail.com>
> Acked-by: Ani Sinha <ani@anisinha.ca>

Fails make check:
▶  3/60 ERROR:../tests/qtest/bios-tables-test.c:532:test_acpi_asl: assertion failed: (all_tables_match) ERROR         


> ---
>  tests/data/acpi/q35/FACP                    | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.nosmm              | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.slic               | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.xapic              | Bin 244 -> 244 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
>  5 files changed, 4 deletions(-)
> 
> diff --git a/tests/data/acpi/q35/FACP b/tests/data/acpi/q35/FACP
> index f6a864cc863c7763f6c09d3814ad184a658fa0a0..a8f6a8961109d01059aceef9f1869cde09a2f10c 100644
> GIT binary patch
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^Y)2c$&5@B^V$GgGY3Ne
> 
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^UjG}$&3sW^V$GgJqJSo
> 
> diff --git a/tests/data/acpi/q35/FACP.nosmm b/tests/data/acpi/q35/FACP.nosmm
> index 6a9aa5f370eb9af6a03dc739d8a159be58fdee01..c4e6d18ee5fc64159160d4589aa96b4d648c913a 100644
> GIT binary patch
> delta 23
> ecmeyu_=S<n&CxmF3j+fKbKXR*WJacmd2Ik#q6Yc^
> 
> delta 23
> ecmeyu_=S<n&CxmF3j+fKbHPNeWJZRGd2Ik#tOoi3
> 
> diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
> index 15986e095cf2db7ee92f7ce113c1d46d54018c62..48bbb1cf5ad0ceda1d2f6d56edf5c1e207bd1a04 100644
> GIT binary patch
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^M#3A$&5@B^V$Gh6bD=Y
> 
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^QDPg$&3sW^V$Gh9tT_i
> 
> diff --git a/tests/data/acpi/q35/FACP.xapic b/tests/data/acpi/q35/FACP.xapic
> index 2d3659c9c6753d07c3d48742343cb8e8cc034de7..31fa5dd19c213034eef4eeefa6a04e61dadd8a2a 100644
> GIT binary patch
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^X7?M$&5@B^V$Gg4+lR0
> 
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^VW%6$&3sW^V$Gg83#WA
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 7570e39369..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,5 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/FACP",
> -"tests/data/acpi/q35/FACP.nosmm",
> -"tests/data/acpi/q35/FACP.slic",
> -"tests/data/acpi/q35/FACP.xapic",
> -- 
> 2.25.1



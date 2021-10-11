Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EFE42924D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 16:42:22 +0200 (CEST)
Received: from localhost ([::1]:47134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZwVR-0006e6-M4
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 10:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZwTn-0005ES-Af
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 10:40:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZwTk-0003Gd-NC
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 10:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633963235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/cG52eUfC2yHg7ry4MRG9pUHfjEckgwLM5wHmFfLbg=;
 b=NyjjXfKZbWZWUwv/nNjpH5teaQhjxy8zxeDE1ly+DHQW84Z9gMkzkdrvZQCu8ljXFfTroF
 htKlzGJ9Fes4lEHMMKBnZVFlRkC0BPa9KpolJPB3BLM26hELYHZOaP8I4TlqFHv1n0sjyE
 ejVAAdzzt3OrTV7TPaffwzSYUECC9wM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-vWBtMj0uN6yhgiDXB4EiaQ-1; Mon, 11 Oct 2021 10:40:33 -0400
X-MC-Unique: vWBtMj0uN6yhgiDXB4EiaQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so16113715edi.19
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 07:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/cG52eUfC2yHg7ry4MRG9pUHfjEckgwLM5wHmFfLbg=;
 b=bXwqUTTspCwizO6mfxvmQhfVSiFz6h0N15FsurKnwJ1VX/GWy4m0sfbDO8qgLXYsEg
 7rebJgoHiQleSlYSczv8YbdqnmXgibmi95G2zbpQ7b/A3CgoHBsV3ux9oo1S3V5wIBfn
 kiqky4dBt/UL5hIdEo/FewU8nsSvvS7Ffr9M1PSovQlfG1KKFNbw4llfRDOfPsNGHIT6
 hrXrULTxS7Yw0Vn+20MaBEusvQBb3p4Y8hLfpp6DE8KAf9CEGNGGopVwoEEPXJ+H2VVr
 ny2ymm9h12i0yHW/p4UJZZ1C56HEVDnapc9fPYgnO8ElZssRcetiU95roZ0w16Ii24iv
 t3Ng==
X-Gm-Message-State: AOAM532hAJLi4E6P0+dHUBBxw9aafPBJYPQRyZo5AT/KZ1L/MAfacQX9
 1MUyQcB0F63h+Hg6VaxWKeU+uVx/OL8iB6oiALJc+z1bcx6zQChFjHRU7FWUvQ2I/zhfNvG2mVW
 nLl+n/iYr8X2OU1k=
X-Received: by 2002:a17:906:38ce:: with SMTP id
 r14mr25429591ejd.268.1633963232798; 
 Mon, 11 Oct 2021 07:40:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdHYHyOA7gJJbgtixUwlluQbF1XebrU8j7TcA/+QZ8kYLVw4CMA8jU/J0iTotzZxoRPDpkQA==
X-Received: by 2002:a17:906:38ce:: with SMTP id
 r14mr25429561ejd.268.1633963232605; 
 Mon, 11 Oct 2021 07:40:32 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id lb12sm3709190ejc.28.2021.10.11.07.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 07:40:32 -0700 (PDT)
Date: Mon, 11 Oct 2021 16:40:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 3/3] tests/acpi: Generate reference blob for IORT rev
 E.b
Message-ID: <20211011164031.0db6bdce@redhat.com>
In-Reply-To: <20211005083805.493456-4-eric.auger@redhat.com>
References: <20211005083805.493456-1-eric.auger@redhat.com>
 <20211005083805.493456-4-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 philmd@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  5 Oct 2021 10:38:05 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Re-generate reference blobs with rebuild-expected-aml.sh.

commit message should have diff old vs new,
if dis is the same/similar for various variants,
it's fine to provide only one variant  diff here.

> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  tests/data/acpi/virt/IORT                   | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.memhp             | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.numamem           | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.pxb               | Bin 124 -> 128 bytes
>  5 files changed, 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 9a5a923d6b..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/IORT",
> diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
> index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
> GIT binary patch
> literal 128
> zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
> VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB
> 
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 
> diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
> index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
> GIT binary patch
> literal 128
> zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
> VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB
> 
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 
> diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
> index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
> GIT binary patch
> literal 128
> zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
> VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB
> 
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 
> diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
> index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
> GIT binary patch
> literal 128
> zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
> VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB
> 
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 



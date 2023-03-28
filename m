Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323976CBE6B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:04:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph83M-0006yG-5c; Tue, 28 Mar 2023 08:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ph83J-0006xb-VA
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ph83H-0000Ks-BG
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680005024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FW54xF2Ivs1BtX/hHXzGBfwaFk/awgbs9sfS83/RLM=;
 b=htlvWifviYUBVsDIfoUzbaGzqHigI/B9Tmmj8VCRvVAV9zHJd/ePm3SR3zNXh9CRguzFDf
 +VY/a4HgkOflJz7f6LQkYTBYqHdKrK7t4G/iYozlLh0LxkuRwJ5mKCqfAIXS2fOh6yY170
 XZKlnFMgw2rza86Ku0U55ip/KzwBcfE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-Etn0izUNM_iMYUeTtl-nNg-1; Tue, 28 Mar 2023 08:03:42 -0400
X-MC-Unique: Etn0izUNM_iMYUeTtl-nNg-1
Received: by mail-ed1-f71.google.com with SMTP id
 x35-20020a50baa6000000b005021d1b1e9eso17338498ede.13
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 05:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680005020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+FW54xF2Ivs1BtX/hHXzGBfwaFk/awgbs9sfS83/RLM=;
 b=zV6TY7lPAIYok1/1f1YBYAAEfGfb80QAj6zkX5wBOMfT9lsA3GY7Y+Re2H3qgXjxKO
 FAokax4521AvRlyfOICw5bOZhfvLmhhKLCmTgzzALM7TmDfdsEX3d5Wjj/u/oujFQc9j
 L3Tk+l+oysS2WlfSead4oCSun3LR7WfsA3MDknR7p5VMq3SqmqPz6X1wNznmtmpdX/JJ
 Vl+aVb0odvq9NKk/ttWWBm4Wr9EQyD1gGBsjZ82JBSbnQsPDwKFqtcI6IdXbzJaxcdCR
 vpOk6jwovy4b/rRzW+3nxxVxQfJ66Zwcw3Hesa1PDB0/Hym3vloUOj7x6HAGwadt2V2g
 Dapg==
X-Gm-Message-State: AAQBX9dVzKFApWHIIdwkCtqp48FLipLWQ41dez7shigB7ENlKk0QYax3
 iewX9g03fs1L/NAWucfcP1P3k6p8sJeNCWU3wTnNGbeflgYxYaEH1gRFJsEf1EFxJiMNOBEdTRL
 Z3Q/SnLX8Cj5gr5Q=
X-Received: by 2002:a17:906:5a94:b0:931:6f5b:d284 with SMTP id
 l20-20020a1709065a9400b009316f5bd284mr17074212ejq.57.1680005020291; 
 Tue, 28 Mar 2023 05:03:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350bn940/8mZqEpDr5jnpAkVHVYsY3bstrvlvAQn+RQvMSkdI6xkiNiN7+eOdJi2gurOhlxN41w==
X-Received: by 2002:a17:906:5a94:b0:931:6f5b:d284 with SMTP id
 l20-20020a1709065a9400b009316f5bd284mr17074193ejq.57.1680005020045; 
 Tue, 28 Mar 2023 05:03:40 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 n7-20020a509347000000b005023ddb37eesm3497794eda.8.2023.03.28.05.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 05:03:39 -0700 (PDT)
Date: Tue, 28 Mar 2023 14:03:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: Re: [PATCH 2/6] bios-tables-test: use 128M numa nodes on aarch64
Message-ID: <20230328140338.7afa05e3@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230316095432.1514080-3-kraxel@redhat.com>
References: <20230316095432.1514080-1-kraxel@redhat.com>
 <20230316095432.1514080-3-kraxel@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Mar 2023 10:54:28 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Recent edk2 versions don't boot with very small numa nodes.
> Bump the size from 64M to 128M.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c         |   6 +++---

>  tests/data/acpi/virt/SRAT.acpihmatvirt | Bin 240 -> 240 bytes
>  tests/data/acpi/virt/SSDT.memhp        | Bin 1817 -> 1817 bytes
binary blob updates should be in a separate patch

with this fixed:
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
 

>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 76d510091177..873358943784 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1679,9 +1679,9 @@ static void test_acpi_virt_tcg_acpi_hmat(void)
>      test_acpi_one(" -machine hmat=on"
>                    " -cpu cortex-a57"
>                    " -smp 4,sockets=2"
> -                  " -m 256M"
> -                  " -object memory-backend-ram,size=64M,id=ram0"
> -                  " -object memory-backend-ram,size=64M,id=ram1"
> +                  " -m 384M"
> +                  " -object memory-backend-ram,size=128M,id=ram0"
> +                  " -object memory-backend-ram,size=128M,id=ram1"
>                    " -object memory-backend-ram,size=128M,id=ram2"
>                    " -numa node,nodeid=0,memdev=ram0"
>                    " -numa node,nodeid=1,memdev=ram1"
> diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
> index 691ef56e34bc84509270db316d908f5979c209bb..6fe55dd7d07fef0f8fe16a209e96a89dd48ca240 100644
> GIT binary patch
> delta 67
> zcmeys_<@ltILI;N0|NsC^R$Uvjf@-<d*mlxmepX?U;>JPK>(EIfYJ<%Fb0qY0P4I6
> AJ^%m!
> 
> delta 59
> zcmeys_<@ltILI;N0|NsC^Qwtljf^Z4d*l^dfLst@flv$#j4%d}X4GJsxL6ecZ+{66
> 
> diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
> index 2fcfc5fda955dc4ba78a5f4116eed99ec7202fbd..ef93c44464f1fe38f7e5babd5d67f345cc6363a6 100644
> GIT binary patch
> delta 22
> dcmbQqH<OPmIM^jblAVEpap^`bUUsI7&Hz1t1wsG-
> 
> delta 22
> dcmbQqH<OPmIM^jblAVEpv2i08FFVs$X8=5?1wsG-
> 



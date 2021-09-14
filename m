Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6246040AE73
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:58:47 +0200 (CEST)
Received: from localhost ([::1]:43240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ81O-0001wc-CX
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mQ7xx-0008Q8-TL
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:55:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mQ7xw-0004n5-65
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631624110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uk0m/lh9jm6u5zBqWwIxddoq1ZetEM74UxE71qeouxY=;
 b=DtvLHW2M7CcD+zkT62tcwxcVrq+xtgD2+XObKsagLBUFeKnQFCWBh2JJsMzLu9gWjTD9pT
 VKCU0JSeEL17JkGdo8opaCXm6IsX5+0SALpK6S5YdugYJD/T+EfFFUiISSqbW14r8BNJWp
 0ym/JPsu3KdyzN/p50uZ70nB6/oCPuo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-QzSpiT78PKmpjDMvKMgYxg-1; Tue, 14 Sep 2021 08:55:09 -0400
X-MC-Unique: QzSpiT78PKmpjDMvKMgYxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j193-20020a1c23ca000000b00306cd53b671so2914956wmj.1
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uk0m/lh9jm6u5zBqWwIxddoq1ZetEM74UxE71qeouxY=;
 b=v6RbxeSc68KlGmyW8mWB6NMNmNT7z44jJ0qSuwWBgurhQ5ZIsQUISWvD+S6UPchj0c
 VX0PmNbIHTxS4HlMd6IvsjPKn2ns87XGengPxKEjl0+XI3nHgq3Bf5Z1gm2/fUKLhYMt
 hPvhan3kfrPscUThD0QFrIqnGqzrSEJ6yqg3AWM2uTq6dSqZ3D5Gk+kYjEI/4oD87Jvq
 P7fOeA3Rg6umKEQR247N0vjAUapyRqUAsOYtv+XwyIoeC98PM1IpGU4hw+9sjG1sUb2r
 tMvi3FxiKDdZeSwzY4wX4fqj6k/FU5IoF0Xms2cvHQ1XezPTeYn2VDXINOOltAS77mmE
 J03g==
X-Gm-Message-State: AOAM530xjPRCpaLni6Euo0bOjpmB2QUTRRoyvfdJ5cbfnqm0bs9+OSbK
 AQTfCbAwc2J0wsjRswfq9R7k9MWexto0e5HHUhe/MWzIxMSStKbOHgr04D10AIvIG7onlg/Z/UI
 Z196uhCrjS2Jm8AQ=
X-Received: by 2002:adf:c550:: with SMTP id s16mr18773151wrf.25.1631624107851; 
 Tue, 14 Sep 2021 05:55:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy62wLr73k0M+Fh7m32jN5mxAXVYPTY5kJrQIJjorVY4Zj5TWlDwZpfy8dNPiCq7MPdugREAw==
X-Received: by 2002:adf:c550:: with SMTP id s16mr18773133wrf.25.1631624107652; 
 Tue, 14 Sep 2021 05:55:07 -0700 (PDT)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id m29sm11039694wrb.89.2021.09.14.05.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:55:07 -0700 (PDT)
Date: Tue, 14 Sep 2021 14:55:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 1/3] bios-tables-test: allow changes in DSDT ACPI tables
 for q35
Message-ID: <20210914145505.4c19645d@redhat.com>
In-Reply-To: <20210914045410.3380946-2-ani@anisinha.ca>
References: <20210914045410.3380946-1-ani@anisinha.ca>
 <20210914045410.3380946-2-ani@anisinha.ca>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: jusual@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sep 2021 10:24:08 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> We are going to commit a change to fix IO address range allocated for acpi pci
> hotplug in q35. This affects DSDT tables. This change allows DSDT table
> modification so that unit tests are not broken.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..a02b88305c 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,12 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT",
> +"tests/data/acpi/q35/DSDT.tis",
> +"tests/data/acpi/q35/DSDT.bridge",
> +"tests/data/acpi/q35/DSDT.mmio64",
> +"tests/data/acpi/q35/DSDT.ipmibt",
> +"tests/data/acpi/q35/DSDT.cphp",
> +"tests/data/acpi/q35/DSDT.memhp",
> +"tests/data/acpi/q35/DSDT.numamem",
> +"tests/data/acpi/q35/DSDT.nohpet",
> +"tests/data/acpi/q35/DSDT.dimmpxm",
> +"tests/data/acpi/q35/DSDT.acpihmat",



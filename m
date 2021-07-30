Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6E73DB8ED
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 14:57:37 +0200 (CEST)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9S52-0003MB-8X
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 08:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m9S3e-0002Xm-Ib
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 08:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m9S3Z-0004aA-VL
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 08:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627649764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kH82O3eYsG9zTNkuMxdxyq4D1Y+XruXn40SjQZNHKw=;
 b=fj8e29Tdgq7C6poimVf2oA45DsAC/WveB/HvwAfl2toRYi4D26sIYWodWHMrhGVPrAnhF7
 tWsEQt00oNbsK2RFso7P6LrNQ1L8rwcQMF5CeauDlwnItj0XnCOKzgNhaqQwkC5xPOWmeF
 XucdSXW0aCIkLnElW/PqCSqjeZncyT0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-pyiPesf6PdqYaAvcgFWahw-1; Fri, 30 Jul 2021 08:56:02 -0400
X-MC-Unique: pyiPesf6PdqYaAvcgFWahw-1
Received: by mail-wm1-f71.google.com with SMTP id
 t20-20020a05600c1994b029025886e547cdso927924wmq.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 05:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9kH82O3eYsG9zTNkuMxdxyq4D1Y+XruXn40SjQZNHKw=;
 b=WrNQUC18USMkTLLj7qqlEt7K31mzNAfjsI+oKGaA6lUxBDLk8o2vDJeM5Z5cvzWUQW
 X1uANq3T0t8kDuutA8wqpRo4tX++xgKcQuklIjuqBVwFz7ipMQn9SX4hadzP5Nv4Q+qo
 pBaeQR9ej3mpn+Yl/mIrWvb38xQ4AB8c0EOwiVKeVKl5JydW1xzxunIlylo2qoK1RABU
 BKCOCVjY/WKikl9FxEhFTipnBXuv9m78ZsXSond5QuREvcocyHnrYFZssU3peFT4IWsn
 k4UJutSC6EmeqgyFToNek61nzJUCI/RUhWuzTKXcq6xoebHznAwJnM/B/EFalQ0N65IY
 IDZw==
X-Gm-Message-State: AOAM533OWgq7kGjBZx2jDwoyKyQL+4mx7HRdS09ynudmRQSdU9VvjUwU
 4SsjD48k4RF4H7hc/eNItiuif15PnuV5+AKljDYG4d0LDVQelwD34hsIKLEwvdZot+TH+wJe4J/
 d0AKM7wT1uwScKqg=
X-Received: by 2002:a05:600c:4101:: with SMTP id
 j1mr2743841wmi.110.1627649761509; 
 Fri, 30 Jul 2021 05:56:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz4lRrPaoNBlqrigwzj15rsjkn7eT4gbWzOSv7QE+ocSkMjW+dXRToHqqDgoTAolc2PaZVpw==
X-Received: by 2002:a05:600c:4101:: with SMTP id
 j1mr2743826wmi.110.1627649761327; 
 Fri, 30 Jul 2021 05:56:01 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id y24sm1453527wmo.12.2021.07.30.05.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 05:56:00 -0700 (PDT)
Date: Fri, 30 Jul 2021 14:55:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/5] docs/specs: Convert various ACPI docs to rST
Message-ID: <20210730145558.6b3d67e9@redhat.com>
In-Reply-To: <20210727170414.3368-1-peter.maydell@linaro.org>
References: <20210727170414.3368-1-peter.maydell@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Jul 2021 18:04:09 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> This patchset does a basic conversion of four ACPI related files in
> docs/specs from plain text to rST format.  The aim of the conversion
> is not to produce a maximally pretty result, but simply to do a
> low-effort conversion that at least results in this documentation
> appearing in our manuals rather than merely lying around in the
> source tree.
> 
> Patch 4 adds the documentation files to MAINTAINERS file
> blocks; feel free to suggest I've picked the wrong ones.

compiled, and checked end result (html docs) which looks fine to me,
so

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> thanks
> -- PMM
> 
> Peter Maydell (5):
>   docs/specs/acpu_cpu_hotplug: Convert to rST
>   docs/specs/acpi_mem_hotplug: Convert to rST
>   docs/specs/acpi_pci_hotplug: Convert to rST
>   docs/specs/acpi_nvdimm: Convert to rST
>   MAINTAINERS: Add ACPI specs documents to ACPI and NVDIMM sections
> 
>  docs/specs/acpi_cpu_hotplug.rst               | 235 ++++++++++++++++++
>  docs/specs/acpi_cpu_hotplug.txt               | 160 ------------
>  docs/specs/acpi_mem_hotplug.rst               | 128 ++++++++++
>  docs/specs/acpi_mem_hotplug.txt               |  94 -------
>  docs/specs/acpi_nvdimm.rst                    | 228 +++++++++++++++++
>  docs/specs/acpi_nvdimm.txt                    | 188 --------------
>  ...i_pci_hotplug.txt => acpi_pci_hotplug.rst} |  37 +--
>  docs/specs/index.rst                          |   4 +
>  MAINTAINERS                                   |   5 +
>  9 files changed, 620 insertions(+), 459 deletions(-)
>  create mode 100644 docs/specs/acpi_cpu_hotplug.rst
>  delete mode 100644 docs/specs/acpi_cpu_hotplug.txt
>  create mode 100644 docs/specs/acpi_mem_hotplug.rst
>  delete mode 100644 docs/specs/acpi_mem_hotplug.txt
>  create mode 100644 docs/specs/acpi_nvdimm.rst
>  delete mode 100644 docs/specs/acpi_nvdimm.txt
>  rename docs/specs/{acpi_pci_hotplug.txt => acpi_pci_hotplug.rst} (51%)
> 



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D3316918
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:27:27 +0100 (CET)
Received: from localhost ([::1]:43294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qSk-0008Sa-F9
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9qQb-0007rC-If
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:25:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9qQZ-0007X1-TD
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612967110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jG+UDUJWH2GZEASc7UVBgMtaehnb8WyPb/BeJIp0uMA=;
 b=PosC1wwlv49uXTZpW78ZKvtUGpNJuDh7HQ/AmtQRZoSTqpE6hRvrhFEz+N3aKmpbLoQ/MQ
 lwScye+6jpTpRUqzWWP0j45ja6UjTEatIfaIM/MxBMnWNdKlDOiudpcNyJBczqvwbrvC1M
 mVBmjymJgPEfgWulk+ZzgoR0pVo7mf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-MagqsxttOTa9eaK_kL24kQ-1; Wed, 10 Feb 2021 09:25:08 -0500
X-MC-Unique: MagqsxttOTa9eaK_kL24kQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14B1A835E25;
 Wed, 10 Feb 2021 14:25:07 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBEE862688;
 Wed, 10 Feb 2021 14:25:01 +0000 (UTC)
Date: Wed, 10 Feb 2021 15:24:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wang Xingang <wangxingang5@huawei.com>
Subject: Re: [PATCH 2/3] acpi/gpex: Fix cca attribute check for pxb device
Message-ID: <20210210152459.39b08d34@redhat.com>
In-Reply-To: <1612490205-48788-3-git-send-email-wangxingang5@huawei.com>
References: <1612490205-48788-1-git-send-email-wangxingang5@huawei.com>
 <1612490205-48788-3-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: xieyingtai@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 cenjiahui@huawei.com, mst@redhat.com, Drew <drjones@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 01:56:44 +0000
Wang Xingang <wangxingang5@huawei.com> wrote:

> From: Xingang Wang <wangxingang5@huawei.com>
> 
> When check DMA support for device attached to pxb,
> the cache coherency attribute need to be set.
> This add _CCA attribute for pxb DSDT.
> 
> Fixes: 6f9765fbad ("acpi/gpex: Build tables for pxb")
> 
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

I'm not sure about if ARM side if fine with the change, CCed.

> ---
>  hw/pci-host/gpex-acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 446912d771..0f01f13a6e 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -175,6 +175,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>              aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
>              aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
>              aml_append(dev, aml_name_decl("_STR", aml_unicode("pxb Device")));
> +            aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>              if (numa_node != NUMA_NODE_UNASSIGNED) {
>                  aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
>              }



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC604207E1F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 23:09:08 +0200 (CEST)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joCdn-0001cm-RW
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 17:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1joCcd-0000YZ-Sl
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 17:07:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55137
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1joCcc-0006o1-8T
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 17:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593032873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iOwh2eQCHyUuay/2WvRUP1ThY4cvlI9TA0bg7s+a8so=;
 b=f6WLUZEfu2tqV5SuqshEdug0iODEsTWQcEPcC49lui8arxvJ2sRNatWEvocdq1QZPRXE0l
 cMZKsrAHHiqRl+eCReu244cJBJ7URUaktzdNWitcJCIGUExk1f2u5s2ZEKJ8JQVAfKo00M
 Wu37axn8Uqmn5UXR8AoFMQPxalY8Aq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-AM7zDpMONWuNx9FQ0ZHg2g-1; Wed, 24 Jun 2020 17:07:49 -0400
X-MC-Unique: AM7zDpMONWuNx9FQ0ZHg2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F93C18FF661;
 Wed, 24 Jun 2020 21:07:48 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A7937FEA8;
 Wed, 24 Jun 2020 21:07:47 +0000 (UTC)
Subject: Re: [PATCH 33/46] qom: Crash more nicely on
 object_property_get_link() failure
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200624164344.3778251-1-armbru@redhat.com>
 <20200624164344.3778251-34-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4e9b4972-b34e-2576-2a45-56e572c64293@redhat.com>
Date: Wed, 24 Jun 2020 16:07:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624164344.3778251-34-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/20 11:43 AM, Markus Armbruster wrote:
> Pass &error_abort instead of NULL where the returned value is
> dereferenced or asserted to be non-null.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> @@ -63,8 +64,8 @@ hwaddr platform_bus_get_mmio_addr(PlatformBusDevice *pbus, SysBusDevice *sbdev,
>           return -1;
>       }
>   
> -    parent_mr = object_property_get_link(OBJECT(sbdev_mr), "container", NULL);
> -
> +    parent_mr = object_property_get_link(OBJECT(sbdev_mr), "container",
> +                                         &error_abort);
>       assert(parent_mr);

Do we still need to keep the assert?

> +++ b/hw/ppc/spapr_pci_nvlink2.c
> @@ -141,9 +141,10 @@ static void spapr_phb_pci_collect_nvgpu(PCIBus *bus, PCIDevice *pdev,
>       if (tgt) {
>           Error *local_err = NULL;
>           SpaprPhbPciNvGpuConfig *nvgpus = opaque;
> -        Object *mr_gpu = object_property_get_link(po, "nvlink2-mr[0]", NULL);
> +        Object *mr_gpu = object_property_get_link(po, "nvlink2-mr[0]",
> +                                                  &error_abort);
>           Object *mr_npu = object_property_get_link(po, "nvlink2-atsd-mr[0]",
> -                                                  NULL);
> +                                                  &error_abort);
>   
>           g_assert(mr_gpu || mr_npu);

Likewise.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



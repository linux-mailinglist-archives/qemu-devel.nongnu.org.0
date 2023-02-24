Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120266A189D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:19:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUED-0006Py-Qn; Fri, 24 Feb 2023 04:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pVUE3-0006MO-7g
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:18:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pVUE1-0006LQ-S4
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677230321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=btuJ/RGk+07rfSEA0SiZJEsycJzIHCuO4c+68JvOOzE=;
 b=PwoY0RKMnz4aB1S0vssM/QCWejQi021ExA2/NiNeRlhH0nQlh3qzVJ4D07LnEaVS57dbow
 8aeeDSmJTWOEsImvNQ75ZBcqzlVPQLlMxftA+HUg+gY0QHkpbwvF9e5it/fVVTZ1xyI7R2
 kBejFUZRfDW6otlYJ1FlQDZBlwkTlAI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-nkK_7ZBtMEi3dnnMA9iF9g-1; Fri, 24 Feb 2023 04:18:40 -0500
X-MC-Unique: nkK_7ZBtMEi3dnnMA9iF9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77E4785CCE2;
 Fri, 24 Feb 2023 09:18:39 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.45.242.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D779E140EBF6;
 Fri, 24 Feb 2023 09:18:36 +0000 (UTC)
Date: Fri, 24 Feb 2023 10:18:33 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2] Deprecate the "-no-acpi" command line switch
Message-ID: <Y/iA6YXi5TD1MQxG@angien.pipo.sk>
References: <20230224090543.1129677-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224090543.1129677-1-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
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

On Fri, Feb 24, 2023 at 10:05:43 +0100, Thomas Huth wrote:
> Similar to "-no-hpet", the "-no-acpi" switch is a legacy command
> line option that should be replaced with the "acpi" machine parameter
> nowadays.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Fixed stypid copy-n-paste bug (Thanks to Sunil for spotting it!)
> 
>  docs/about/deprecated.rst | 6 ++++++
>  softmmu/vl.c              | 1 +
>  2 files changed, 7 insertions(+)

For now libvirt is still using '-no-acpi' but it will be an easy fix.
I'll send patches on monday. On behalf of libvirt:

Reviewed-by: Peter Krempa <pkrempa@redhat.com>



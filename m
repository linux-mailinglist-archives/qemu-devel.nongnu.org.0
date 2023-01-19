Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AD26734E2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 10:57:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRJW-0008Az-4K; Thu, 19 Jan 2023 04:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIRJN-0008AD-Jt
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:34:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIRJL-0007uE-CE
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674120858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oZLLlV4BGDvm510wcGYESS9p0wICXiApD4Uvqj34INw=;
 b=J+vqrplwfz+PxwzMAr4Qf3D6poddBg7o8PJ9PD24TCaMiFXd40Pc3tfvYagleWizIzVcFZ
 2+ImTwBBb3bSCjX5wCkCX6vYhrf6SUXskUww0Z+BcBGgGAbjsjuMfizOstuNqwmdEJiwtO
 o+0SfUrAMKK7NDPdWtn6yAgWAqCfUBI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-vnCmkhNiOG-m3273JG6Xog-1; Thu, 19 Jan 2023 04:34:11 -0500
X-MC-Unique: vnCmkhNiOG-m3273JG6Xog-1
Received: by mail-wm1-f71.google.com with SMTP id
 l31-20020a05600c1d1f00b003da8b330db2so1792131wms.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 01:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZLLlV4BGDvm510wcGYESS9p0wICXiApD4Uvqj34INw=;
 b=wEtdiblKgFjtmR5lF+BPZGN/+idbjIPPyX3REy/Q9djdvrJXKGsPKErIebQHUapgRq
 KfSsL3jUt1jEsFJzCH2cUNJwSGhMC4ba85Zvk60a3gggnNuxLcqRILL8tpfp8cvZ+5O8
 rJVz2hZNOGeo84PJn4GD7HyYrbiulFtGRiK4CF9HDb9K8ufbrswcXQ9UYxmKLKWMBbAG
 ATBAaxRPZydfPoywS/c7JSAKlcuKcA3vOF3CI8SMhEfK5REj9BS1Kc63f+Na62xa8Mx2
 ABOIASRT2Bzm+WXnpezS0sP9clehQozmWhg4hkrPTfeKgP9gL9hBlqazvD/wQQcnyCwX
 DcQg==
X-Gm-Message-State: AFqh2ko8mqLuVa7SIY99ASUttnK9ESQIxZceB9oCTINFEbF96Ml9jrwu
 3Z3CKx4EWMBONfoTMPZ7y1MuCROcSw2XjT/p5qwwhkjelXre+M/k4YmVjlyzaxSKFiB2Fn3wMqs
 VbriYwDBQ3/4Ru90=
X-Received: by 2002:a05:600c:4f86:b0:3db:15b1:fb28 with SMTP id
 n6-20020a05600c4f8600b003db15b1fb28mr4970003wmq.19.1674120850116; 
 Thu, 19 Jan 2023 01:34:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtACPYeEtXsWD3i8FPBn/RtzVqsOWE4KGdrLkI5m0zB+5vU5TS/iPFcqUFkLzM5CEzrV9UtVw==
X-Received: by 2002:a05:600c:4f86:b0:3db:15b1:fb28 with SMTP id
 n6-20020a05600c4f8600b003db15b1fb28mr4969967wmq.19.1674120849904; 
 Thu, 19 Jan 2023 01:34:09 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 bd24-20020a05600c1f1800b003db122d5ac2sm4430267wmb.15.2023.01.19.01.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 01:34:09 -0800 (PST)
Date: Thu, 19 Jan 2023 09:34:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com, tsimpson@quicinc.com,
 palmer@dabbelt.com, bin.meng@windriver.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 10/19] migration: Clean up includes
Message-ID: <Y8kOj6m4jhtUVg+A@work-vm>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-11-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119065959.3104012-11-armbru@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

* Markus Armbruster (armbru@redhat.com) wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.

That change doesn't seem to match the message; the patch is removing the
osdep.h include.

Dave

> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qemu/userfaultfd.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
> index 6b74f92792..55c95998e8 100644
> --- a/include/qemu/userfaultfd.h
> +++ b/include/qemu/userfaultfd.h
> @@ -13,7 +13,6 @@
>  #ifndef USERFAULTFD_H
>  #define USERFAULTFD_H
>  
> -#include "qemu/osdep.h"
>  #include "exec/hwaddr.h"
>  #include <linux/userfaultfd.h>
>  
> -- 
> 2.39.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



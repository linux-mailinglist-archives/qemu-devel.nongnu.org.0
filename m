Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1AC3DE855
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:24:25 +0200 (CEST)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApir-0001Fg-1c
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mApi7-0000a3-3b
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mApi4-0002Ca-UK
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627979016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q06gg5YgTefsidPdNxgPB/5OODqdKdiwgG+Mdn6CTJU=;
 b=ge1oTlNvlvIjElinQpLFfx9Q5ng4VbruIErEhtnisiQzcHmdxqefJws92kz3Mricx9Aw5u
 VxMR7oX9LNu3tvWO+TlHOnfYYZeUBeHVdekLaGLPZyl5VVEzACu4RtRxwYG2+pxaiFJI9f
 w8c7umfThtz9OpNvi8uFPbfK+BZYHe4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-ThkCNnXcPDaYctsvEPEjtQ-1; Tue, 03 Aug 2021 04:23:35 -0400
X-MC-Unique: ThkCNnXcPDaYctsvEPEjtQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 l3-20020aa7c3030000b02903bccf1897f9so6497428edq.19
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 01:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q06gg5YgTefsidPdNxgPB/5OODqdKdiwgG+Mdn6CTJU=;
 b=HYfW6wK+xcyADqrZdVb/vOsWNQPZhVgnCj17KYMadfDDu5UZpuhvlC0wpASia3cWxI
 4AXxPYvyyXoWQEtPtugGt8dI6jQGcuDn50ERR7EVvJ0m71rCCwUpdCbtGGxeziQdtCLy
 OdShWd/rDBIt+4eaVur8RYclS1WnxUC/ls9srA4GhTN+pspZ3yg6NWprsVgBH5CQC9cK
 VmVFRQHDhlb9+x43NaNnfh9QuKlAXszA1w1iu2xx5+JDFLa4I9WwIriQCbyUuu/QiTD5
 vMKbOXlGpeUgLPN340pl8gHHeW81h82kTrw6R8Z3I2uUa37NLRYt+CRcjKx8eFEoR4Bi
 w13A==
X-Gm-Message-State: AOAM530Q5gMv6yCR1SlEq2R6mnkm63wfSc0KF4JHQB2qbAiT1DZi9eVc
 oMG0/dPm59WsGXuX2AlrPIwke19zJIhFEbo6EJU/Kd0/RUQDU2wJk5ocsbWQIwms80hbtLiIuXT
 B6BvvdTB/gDY6MwA=
X-Received: by 2002:a17:906:1f54:: with SMTP id
 d20mr11233424ejk.48.1627979014003; 
 Tue, 03 Aug 2021 01:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyviClyWDj+FiuOzr1OCd+Ht6z2rBG7MR8ig3D0K0G+vAzQtPmSnEoZlFyPl0uYkeTRhHyb8g==
X-Received: by 2002:a17:906:1f54:: with SMTP id
 d20mr11233406ejk.48.1627979013865; 
 Tue, 03 Aug 2021 01:23:33 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id dg20sm7532962edb.13.2021.08.03.01.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 01:23:33 -0700 (PDT)
Date: Tue, 3 Aug 2021 10:23:31 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v4 12/14] machine: Put all sanity-check in the
 generic SMP parser
Message-ID: <20210803082331.wuqylgzbovxf647l@gator.home>
References: <20210803080527.156556-1-wangyanan55@huawei.com>
 <20210803080527.156556-13-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210803080527.156556-13-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 04:05:25PM +0800, Yanan Wang wrote:
> Put both sanity-check of the input SMP configuration and sanity-check
> of the output SMP configuration uniformly in the generic parser. Then
> machine_set_smp() will become cleaner, also all the invalid scenarios
> can be tested only by calling the parser.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 63 +++++++++++++++++++++++------------------------
>  1 file changed, 31 insertions(+), 32 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>



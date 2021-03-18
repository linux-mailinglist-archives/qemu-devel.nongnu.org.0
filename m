Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5E23400AF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 09:12:41 +0100 (CET)
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMnlo-0006Bx-TY
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 04:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lMnkL-0005TY-Af
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 04:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lMnkJ-0007ml-JV
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 04:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616055066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NbkmUpCHt0hSsNWVi6Gqkg6gp4W267zZZI7A/On0Lnk=;
 b=Wk7rGcNzHNBzjeZnXi3bN4OUkE5L04pgWiPNE0xddGYbdArREr4PAH1URoRpNdOZFFdd3s
 oZDpjMjxirCIYbnOYIhMbjfm8kr6ttg/aat7YYQYnA+YEFQeJzhu5Su+bq249Jd3WIWfhQ
 VP6nrerXGAb4nKLnMi1CxbYf4xrVd8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-fPQsulVwP56kRzDEezHTzQ-1; Thu, 18 Mar 2021 04:09:57 -0400
X-MC-Unique: fPQsulVwP56kRzDEezHTzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E8028030D1;
 Thu, 18 Mar 2021 08:09:56 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.196.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A1CF503EF;
 Thu, 18 Mar 2021 08:09:41 +0000 (UTC)
Date: Thu, 18 Mar 2021 09:09:38 +0100
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Disable pl011 clock migration if needed
Message-ID: <20210318080938.cmo4r5vkluvmdeiv@kamzik.brq.redhat.com>
References: <20210318023801.18287-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210318023801.18287-1-gshan@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: peter.maydell@linaro.org, luc@lmichel.fr, ehabkost@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 18, 2021 at 10:38:01AM +0800, Gavin Shan wrote:
> A clock is added by commit aac63e0e6ea3 ("hw/char/pl011: add a clock
> input") since v5.2.0 which corresponds to virt-5.2 machine type. It
> causes backwards migration failure from upstream to downstream (v5.1.0)
> when the machine type is specified with virt-5.1.
> 
> This fixes the issue by following instructions from section "Connecting
> subsections to properties" in docs/devel/migration.rst. With this applied,
> the PL011 clock is migrated based on the machine type.
> 
>    virt-5.2 or newer:  migration
>    virt-5.1 or older:  non-migration
> 
> Cc: qemu-stable@nongnu.org # v5.2.0+
> Fixes: aac63e0e6ea3 ("hw/char/pl011: add a clock input")
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/char/pl011.c         | 9 +++++++++
>  hw/core/machine.c       | 1 +
>  include/hw/char/pl011.h | 1 +
>  3 files changed, 11 insertions(+)

Reviewed-by: Andrew Jones <drjones@redhat.com>

And I agree with applying to 5.2 stable.

Thanks,
drew



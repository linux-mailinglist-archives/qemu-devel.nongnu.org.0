Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E724C8B12
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 12:45:18 +0100 (CET)
Received: from localhost ([::1]:53430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP0wO-00083W-Ga
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 06:45:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nP0uQ-0006sn-1N
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:43:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nP0uN-0002lh-6e
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646134990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T8qUw0aZc89WB3HLkLrOvKMzHeBgIYFfgkgMCMIafM4=;
 b=Ts8HOah3a7lMO4/y7vA+DDR0Xhl5hJDVU/d4wDw/CjrC0/mXJ66Q3GftBnXtHavVLFj7S7
 AwFTpxKgxDfq7ofnsT6PrlDlpBghd69SJHpT/0z3EdY/IrKqx6ciInNuPsbyYK8XrgsSCQ
 RLdxS1qu6gmLbffvukuo9RaDLGoi8jM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-fq1kLM9KNcGWB1r-tMRKzQ-1; Tue, 01 Mar 2022 06:43:07 -0500
X-MC-Unique: fq1kLM9KNcGWB1r-tMRKzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3316A1854E21;
 Tue,  1 Mar 2022 11:43:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5A291053B1A;
 Tue,  1 Mar 2022 11:42:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EE344180039D; Tue,  1 Mar 2022 12:42:57 +0100 (CET)
Date: Tue, 1 Mar 2022 12:42:57 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
Message-ID: <20220301114257.2bppjnjqj7dgxztc@sirius.home.kraxel.org>
References: <20220228075203.60064-1-gshan@redhat.com>
 <20220228100820.477e2311@redhat.com>
 <41eb791c-a74a-7ed6-df05-cd1867ecbb5f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <41eb791c-a74a-7ed6-df05-cd1867ecbb5f@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Shan Gavin <shan.gavin@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Unless it architecturally wrong thing i.e. (node size less than 128Mb)
> > ,in which case limiting it in QEMU would be justified, I'd prefer
> > firmware being fixed or it reporting more useful for user error message.
> 
> [include EDK2 developers]
> 
> I don't think 128MB node memory size is architecturally required.
> I also thought EDK2 would be better place to provide a precise error
> mesage and discussed it through with EDK2 developers. Lets see what
> are their thoughts this time.

Useful error reporting that early in the firmware initialization is a
rather hard problem, it's much easier for qemu to catch those problems
and print a useful error message.

Fixing the firmware would be possible.  The firmware simply uses the
memory of the first numa note in the early initialization phase, which
could be changed to look for additional numa nodes.  It's IMHO simply
not worth the trouble though.  numa nodes with less memory than 128M
simply doesn't happen in practice, except when QE does questionable
scaleability testing (scale up the number of numa nodes without also
scaling up the total amount of memory, ending up with rather tiny
numa nodes and a configuration nobody actually uses in practice).

take care,
  Gerd



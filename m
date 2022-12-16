Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73D764E9D3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 11:57:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68Nv-0001sT-1J; Fri, 16 Dec 2022 05:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p68Ns-0001ru-Sy
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:56:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p68Nq-00078x-0K
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671188164;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=So1p5OZDyth9DOZWmbRX6byh2/fjxPrrkqCjdDaAC2w=;
 b=HeNTRQPwiMZvJoFi0syQJucWGCX9ItXf5J9I8DSojn2WUi6fydeBtCHYzoWZr7K3h8TAol
 NnlBxQE3HC/so8MMxqDNEMUB+yJADQBBV2kyGh2QFSJvp1186SNC3AwlPjdVwlb8NQQbXo
 jIADhQi/2BqIXWtuWg9+94ZzMqJDNig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-PRjU0itiOGqqXCxzkM-bTg-1; Fri, 16 Dec 2022 05:56:00 -0500
X-MC-Unique: PRjU0itiOGqqXCxzkM-bTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5311D858F09;
 Fri, 16 Dec 2022 10:56:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1A36C15BA0;
 Fri, 16 Dec 2022 10:55:58 +0000 (UTC)
Date: Fri, 16 Dec 2022 10:55:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Antoine Damhet <antoine.damhet@shadow.tech>
Cc: qemu-devel@nongnu.org, vm@shadow.tech,
 Charles Frey <charles.frey@shadow.tech>
Subject: Re: [PATCH 2/2] io/channel-tls: fix handling of bigger read buffers
Message-ID: <Y5xOu/GNQd6llXBt@redhat.com>
References: <20221115142329.92524-1-antoine.damhet@shadow.tech>
 <20221115142329.92524-3-antoine.damhet@shadow.tech>
 <Y3TA5LLIZFVHrNBM@redhat.com>
 <20221216103803.y3xse3axbqdfl7r7@cole.xdbob.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221216103803.y3xse3axbqdfl7r7@cole.xdbob.net>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 16, 2022 at 11:38:03AM +0100, Antoine Damhet wrote:
> On Wed, Nov 16, 2022 at 10:52:20AM +0000, Daniel P. Berrangé wrote:
> > On Tue, Nov 15, 2022 at 03:23:29PM +0100, antoine.damhet@shadow.tech wrote:
> > > From: Antoine Damhet <antoine.damhet@shadow.tech>
> > > 
> > > Since the TLS backend can read more data from the underlying QIOChannel
> > > we introduce a minimal child GSource to notify if we still have more
> > > data available to be read.
> > > 
> > > Signed-off-by: Antoine Damhet <antoine.damhet@shadow.tech>
> > > Signed-off-by: Charles Frey <charles.frey@shadow.tech>
> > > ---
> > >  io/channel-tls.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 65 insertions(+), 1 deletion(-)
> > 
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Thanks,
> 
> Now that the 7.2.0 is released, can we hope to get this queued ? If not
> what should I do ?

Yes, I have this queued already for my next pull req.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



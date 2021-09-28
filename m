Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACACF41B4A8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:02:23 +0200 (CEST)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGUm-0003ZC-Ud
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGTY-0002sP-Dj
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:01:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGTW-0001yv-Nk
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632848462;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tinLxczNR91Xlr/32tL5UyyhLGSqkE2+F/buIFw5pXQ=;
 b=ah2zMHSDKgq1CVToi+7kMZIPGrCBP4xRbBJXQjCyjdzjEJMTch4NGHrmHpB5sWsj96vHDi
 YyJ1imhqqiT20mNRcU9BX27YU+ey3+OAObWeIh3gBNez/DiC+waK/TS32DYIOm8DdN6BR7
 vV8FO1SEF8FHWtBFGCLs4SFKN/Qv2DI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-YxcHKk5DOD2kMtun9W5b_Q-1; Tue, 28 Sep 2021 13:01:00 -0400
X-MC-Unique: YxcHKk5DOD2kMtun9W5b_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75BC0824FA6;
 Tue, 28 Sep 2021 17:00:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5473D109B6E6;
 Tue, 28 Sep 2021 16:59:56 +0000 (UTC)
Date: Tue, 28 Sep 2021 17:59:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 7/7] util/oslib-posix: Forward SIGBUS to MCE handler
 under Linux
Message-ID: <YVNKCkH1azn1iMH5@redhat.com>
References: <20210816094739.21970-1-david@redhat.com>
 <20210816094739.21970-8-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210816094739.21970-8-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 11:47:39AM +0200, David Hildenbrand wrote:
> Temporarily modifying the SIGBUS handler is really nasty, as we might be
> unlucky and receive an MCE SIGBUS while having our handler registered.
> Unfortunately, there is no way around messing with SIGBUS when
> MADV_POPULATE_WRITE is not applicable or not around.
> 
> Let's forward SIGBUS that don't belong to us to the already registered
> handler and document the situation.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  softmmu/cpus.c     |  4 ++++
>  util/oslib-posix.c | 36 +++++++++++++++++++++++++++++++++---
>  2 files changed, 37 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



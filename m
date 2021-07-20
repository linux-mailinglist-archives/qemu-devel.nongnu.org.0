Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4423CFC4B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:29:03 +0200 (CEST)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qk2-0004qy-GE
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5qil-0003Tp-5e
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5qij-00054D-KB
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626791261;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4LtT2rIQriiat1z0+Aj2ykZEQRxs5qRmPTENlcOC+U=;
 b=StaAddPp9wUXdaW5eaOMP7nVS03sgOWa6kWgRQCDi5f9gj2B+8eizqF7QhMB2tQBaLHspo
 j7wYoBhmDwcBYKmmVylKwtk34ZHsXlpR28LptQ5SNJ+r5TPbze+SMLXH4ggfEJlQ8AF6IM
 9ujU4Mjghc4lye4fVYQ22X/21kB3VHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-3ixLHBipOZmKTTlNwWcCSg-1; Tue, 20 Jul 2021 10:27:39 -0400
X-MC-Unique: 3ixLHBipOZmKTTlNwWcCSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8B63100C609;
 Tue, 20 Jul 2021 14:27:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-31.ams2.redhat.com [10.36.113.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F90760877;
 Tue, 20 Jul 2021 14:27:29 +0000 (UTC)
Date: Tue, 20 Jul 2021 15:27:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/3] util/oslib-posix: Introduce and use MemsetContext
 for touch_all_pages()
Message-ID: <YPbdTmddRpjY+iXi@redhat.com>
References: <20210714112306.67793-1-david@redhat.com>
 <20210714112306.67793-3-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210714112306.67793-3-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 01:23:05PM +0200, David Hildenbrand wrote:
> Let's minimize the number of global variables to prepare for
> os_mem_prealloc() getting called concurrently and make the code a bit
> easier to read.
> 
> The only consumer that really needs a global variable is the sigbus
> handler, which will require protection via a mutex in the future either way
> as we cannot concurrently mess with the SIGBUS handler.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  util/oslib-posix.c | 81 ++++++++++++++++++++++++++++------------------
>  1 file changed, 50 insertions(+), 31 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



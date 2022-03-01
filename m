Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC874C9292
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 19:08:29 +0100 (CET)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP6vE-0001jh-Dn
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 13:08:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nP6t0-00089n-EG
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:06:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nP6sr-0000aR-WA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646157960;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A0Ma5Vdr5GlBK38fG6nuAZ/QE6pxYpn708eHWBdIf88=;
 b=X5Q0GV+TK0iRUOsFr/c7kleDge41rNaYOL1GgXfLMylZd1V/1sApOq8rD4TMRz+TyF0olG
 6UbExsUw+1jeH2RlcZXToFhBiW3glc7ghzX661YDAVZXtMYR/7msfdmnSVfKezBWPtHwN6
 JaXQ9+HjmgVWgPYa6zIP8YdJHnGE4JM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-NYpggpP3ORmu-2rLKuWsuw-1; Tue, 01 Mar 2022 13:05:55 -0500
X-MC-Unique: NYpggpP3ORmu-2rLKuWsuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00F38824FA9
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 18:05:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8F2E84034;
 Tue,  1 Mar 2022 18:05:53 +0000 (UTC)
Date: Tue, 1 Mar 2022 18:05:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 00/25] migration: Postcopy Preemption
Message-ID: <Yh5gfqvUktw+krlt@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <Yh37hLn5Dlffm13P@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 06:55:00PM +0800, Peter Xu wrote:
> On Tue, Mar 01, 2022 at 10:27:10AM +0000, Daniel P. Berrangé wrote:
> So what I'm curious is why TLS is getting quite some attentions in the past
> few years but I didn't even see any selftests included in migration-test on
> tls.  That's something I wanted to look into, maybe even before adding the
> preempt+tls support. But maybe I just missed something, as I didn't use tls
> a lot in the past.

I'm going to send some patches for adding TLS to migration-test

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



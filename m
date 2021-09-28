Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FD641B47F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 18:55:32 +0200 (CEST)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGOB-0002uW-G0
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 12:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGLa-0000p0-Em
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:52:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGLJ-0002yi-SN
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632847951;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5ymoibBwngOgWG+i9ORaBbxI6bt+2z1hlYLqUldHp0=;
 b=XCDQX6N+0ETinvD+K0VnynJBnL3R7i7WHLx9B1eLabvo7DW6ikD6CtRue8tzCVn1fVlgwY
 ns9g91Nmmcnz8diSdjYYHqbPQHM6toTWBCESLnyEnIGLdBc4Nq/RDJNmyvyApmzD2XD04V
 wp8Cul3GmMMefjKwN/k3uOTnznxaY/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-aTq354muPZq_6-jRM3Kq0Q-1; Tue, 28 Sep 2021 12:52:30 -0400
X-MC-Unique: aTq354muPZq_6-jRM3Kq0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17894100C661;
 Tue, 28 Sep 2021 16:52:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5E2860938;
 Tue, 28 Sep 2021 16:52:13 +0000 (UTC)
Date: Tue, 28 Sep 2021 17:52:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 5/7] util/oslib-posix: Avoid creating a single thread
 with MADV_POPULATE_WRITE
Message-ID: <YVNIO4pRD5w08Vuq@redhat.com>
References: <20210816094739.21970-1-david@redhat.com>
 <20210816094739.21970-6-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210816094739.21970-6-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Pankaj Gupta <pankaj.gupta@ionos.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 11:47:37AM +0200, David Hildenbrand wrote:
> Let's simplify the case when we only want a single thread and don't have
> to mess with signal handlers.
> 
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  util/oslib-posix.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



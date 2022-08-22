Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3257E59BE09
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 13:02:01 +0200 (CEST)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ5Bv-0005EK-6v
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 07:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ58Y-00023z-Km
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ58W-0000ep-Lh
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661165907;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yd25JxtERZclfK6rrbcyeunlqIB0pUZSKfD260d+724=;
 b=fAywcmCAj/BD80b9JIZwTbpH5dVAM+kiGWJhXRXmLdsrsI/51xR6WI3TQz5xesBb1OagSp
 Rksa84xh1GrNFomaBbHurIwrpL6idq5vweZhu20IgF9m0oN+RAZV8QGgnqdf+errBFMId2
 gy+rGRSOiR3FZTCaFbuENtOQVXO0LHc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-V0RfqqY9Pz6lbCAn0RvIwg-1; Mon, 22 Aug 2022 06:58:26 -0400
X-MC-Unique: V0RfqqY9Pz6lbCAn0RvIwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70D3E8032F1;
 Mon, 22 Aug 2022 10:58:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 580F3140EBE3;
 Mon, 22 Aug 2022 10:58:25 +0000 (UTC)
Date: Mon, 22 Aug 2022 11:58:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 3/4] tests/migration/i386: Speed up the i386 migration
 test (when using TCG)
Message-ID: <YwNhT3NlP5XrGCuk@redhat.com>
References: <20220819053802.296584-1-thuth@redhat.com>
 <20220819053802.296584-4-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819053802.296584-4-thuth@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 19, 2022 at 07:38:01AM +0200, Thomas Huth wrote:
> When KVM is not available, the i386 migration test also runs in a rather
> slow fashion, since the guest code takes a couple of seconds to print
> the "B"s on the serial console, and the migration test has to wait for
> this each time. Let's increase the frequency here, too, so that the
> delays in the migration tests get smaller.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/migration/i386/a-b-bootblock.h | 12 ++++++------
>  tests/migration/i386/a-b-bootblock.S |  1 +
>  2 files changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



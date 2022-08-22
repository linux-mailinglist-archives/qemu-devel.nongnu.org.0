Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA659BE07
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 13:00:23 +0200 (CEST)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ5AM-0003mG-UN
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 07:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ586-00010V-Qc
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:58:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ583-0000dP-Lw
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661165878;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m5kyyvayImkMpKZHUAl0lWK0IYeGDMVF6dsccus4oC0=;
 b=fQtwARRqgnay0f9p5sKfqlVncrPYgTsPdpmPmjNrbsy1gURM88l/98VYXfJsVdHKae2JoP
 ce2YoFdk0GNX7IwgrxvlokpY7W5l70wPDxkWVWm/BU/w9Unm2ZMLajQAYeEiUMKRx17K1U
 QkkgVh4jW/8cSdbkUvQ95aw7jU1VA0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-ySlSHVUFOeGg-NGEzXeY9g-1; Mon, 22 Aug 2022 06:57:56 -0400
X-MC-Unique: ySlSHVUFOeGg-NGEzXeY9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 103521824604;
 Mon, 22 Aug 2022 10:57:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 018174010FA1;
 Mon, 22 Aug 2022 10:57:54 +0000 (UTC)
Date: Mon, 22 Aug 2022 11:57:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 2/4] tests/migration/aarch64: Speed up the aarch64
 migration test
Message-ID: <YwNhMASJCURwrQXv@redhat.com>
References: <20220819053802.296584-1-thuth@redhat.com>
 <20220819053802.296584-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819053802.296584-3-thuth@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Aug 19, 2022 at 07:38:00AM +0200, Thomas Huth wrote:
> The migration tests spend a lot of time waiting for a sign of live
> of the guest on the serial console. The aarch64 migration code only
> outputs "B"s every couple of seconds (at least it takes more than 4
> seconds between each characeter on my x86 laptop). There are a lot
> of migration tests, and if each test that checks for a successful
> migration waits for these characters before and after migration, the
> wait time sums up to multiple minutes! Let's use a shorter delay to
> speed things up.
> 
> While we're at it, also remove a superfluous masking with 0xff - we're
> reading and storing bytes, so the upper bits of the register do not
> matter anyway.
> 
> With these changes, the test runs twice as fast on my laptop, decreasing
> the total run time from approx. 8 minutes to only 4 minutes!
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/migration/aarch64/a-b-kernel.h | 10 +++++-----
>  tests/migration/aarch64/a-b-kernel.S |  3 +--
>  2 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



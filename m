Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A950069225C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:36:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVQl-0007Bo-12; Fri, 10 Feb 2023 10:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQVQi-0007BS-4q
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:35:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQVQg-0004x8-AA
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676043313;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=x1XpSPU7CVB8hE5I3ErAxvEDyxmqYSs721N6Rx/HoLA=;
 b=fQJO811o5Yc8W7xQddc03XKCRNAkDbVfc4anN4XDzKHkP6M5sKyRdgBJjkUJ7JTZSWdkyn
 6OIUKkoC4euLb0eXsBy1rM5vx7mefFiLJ8X8GCDUyAmn659VJdO/JK0FJNo4byQmus3EXm
 eqgYFqM9rnDN52Yxjl9Ca5z591QixTE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-bsfdHemlOUSSdhywb0D3KQ-1; Fri, 10 Feb 2023 10:35:09 -0500
X-MC-Unique: bsfdHemlOUSSdhywb0D3KQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E44F299E75F;
 Fri, 10 Feb 2023 15:35:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0937C140EBF4;
 Fri, 10 Feb 2023 15:35:07 +0000 (UTC)
Date: Fri, 10 Feb 2023 15:35:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Nikolay Borisov <nborisov@suse.com>, dgilbert@redhat.com,
 qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com
Subject: Re: [PATCH v3 00/14] File-based migration support and fixed-ram
 features
Message-ID: <Y+ZkKR+dry3aiynr@redhat.com>
References: <20221028103914.908728-1-nborisov@suse.com>
 <734376eb-0098-8885-190f-f328ddedf81b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <734376eb-0098-8885-190f-f328ddedf81b@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Thu, Feb 09, 2023 at 02:32:01PM +0100, Claudio Fontana wrote:
> Hello Daniel and all,
> 
> resurrecting this series from end of last year,
> 
> do we think that this is the right approach and first step to
> be able to provide good performance for virsh save and virsh
> restore?

I've looked through the series in some more detail now and will
send review comments separately. Overall, I'm pretty pleased with
the series and think it is on the right path. The new format it
provides should be amenable to parallel I/O with multifd and
be able to support O_DIRECT to avoid burning through the host I/O
cache.

There is obviously a bit of extra complexity from having a new
way to map RAM to the output, but it looks fairly well contained
in just a couple of places of the code. The performance wins
should be able to justify the extra maint burden IMHO.

> Do we still agree on this way forward, any comments? Thanks,

I'm not a migration maintainer, but overall I think it is
good.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



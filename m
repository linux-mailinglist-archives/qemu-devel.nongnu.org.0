Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F5D333BDA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:56:54 +0100 (CET)
Received: from localhost ([::1]:44326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxSP-0000kK-Af
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJxR9-0008BD-Jq
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:55:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJxR5-0001k4-27
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615377329;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QGC/DPgxXyUgAXUb1EA6Nf6GOujkxbj4PAGUCVF9UA=;
 b=Fl3C9WH3K5kOqZqkRsKuotHah7UJM4IOLvAZH6rawqDecSdOEiOqo5nuCP5rc1Zy4ef1LQ
 ol9IPQCazsAynvwLrluykujGCXDBUES0ZtGDSaSIpfit+iZZhEhmT4UA+Q3y9JOz+5J0dH
 MBYhGg8SJazfLgL/C/NCx3n53yUyQfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-UYc5JKffPuSrRXBhUTu8Qw-1; Wed, 10 Mar 2021 06:55:25 -0500
X-MC-Unique: UYc5JKffPuSrRXBhUTu8Qw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D12E108BD08;
 Wed, 10 Mar 2021 11:55:24 +0000 (UTC)
Received: from redhat.com (ovpn-115-24.ams2.redhat.com [10.36.115.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B02FB6F130;
 Wed, 10 Mar 2021 11:55:18 +0000 (UTC)
Date: Wed, 10 Mar 2021 11:55:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/3] block: Introduce the 'zeroes-co' driver to help
 security reports
Message-ID: <YEizo2E9CB36wSUS@redhat.com>
References: <20210310114314.1068957-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310114314.1068957-1-philmd@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 12:43:11PM +0100, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This is an alternative approach to changing null-co driver
> default 'read-zeroes' option to true:
> https://www.mail-archive.com/qemu-block@nongnu.org/msg80873.html
> 
> Instead we introduce yet another block driver with an explicit
> name: 'zeroes-co'. We then clarify in secure-coding-practices.rst
> that security reports have to be sent using this new driver.

IMHO introducing a new block driver, when this can be solved by
simply adding a property to the existing driver, just feels mad
Your previous series made much more sense, and despite the long
thread, I didn't see anyone suggest a real world blocker with
making it read zeros by default.

I think Max's last mail sums it up pretty well

  https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg07173.html

[quote]
In cases where we have a test that just wants a simple block node that
doesn’t use disk space, the memset() can’t be noticeable. But it’s just
a test, so do we even need the memset()? Strictly speaking, perhaps not,
but if someone is to run it via Valgrind or something, they may get
false positives, so just doing the memset() is the right thing to do.

For performance tests, it must be possible to set read-zeroes=off,
because even though “that memset() isn’t noticeable in a functional
test”, in a hard-core performance test, it will be.

So we need a switch. It should default to memset(), because (1) making
tools like Valgrind happy seems like a reasonable objective to me, and
(2) in the majority of cases, the memset() cannot have a noticeable
impact.
[/quote]


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



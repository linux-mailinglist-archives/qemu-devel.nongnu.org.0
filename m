Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD93227D6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:32:46 +0100 (CET)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEU3h-0001Ns-Cd
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEU1e-0000dM-D9
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:30:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEU1a-00031q-Kv
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:30:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614072633;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4KxayoMikW1iVHGHyaEr95VJkvhMERd9F+UvsCPKZg=;
 b=YA68V0fehPKSsia3yT2gAd2WhHbg9kvRGkY/aJgMMgIiO0Eoc4mVyHZOVfnyjv8efElGs+
 uqduGS8rNPrSh2TbuayWXK80tzbzCdvv3TxT/mbPLjVUqKpBiqeDHhQaNFRBNgLNLOLhm5
 aIgfFNga9I/bK30thGhKD1gkFne0t/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-XcU94JvSPP2Oe8SBbTfvVg-1; Tue, 23 Feb 2021 04:30:05 -0500
X-MC-Unique: XcU94JvSPP2Oe8SBbTfvVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E27371009617;
 Tue, 23 Feb 2021 09:30:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AA0E1001281;
 Tue, 23 Feb 2021 09:29:51 +0000 (UTC)
Date: Tue, 23 Feb 2021 09:29:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default
 with 'null-co' driver
Message-ID: <YDTLDMMk/kX9ILNU@redhat.com>
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210213215448.GA67780@ip-172-44-255-31>
 <3da6a2aa-472e-d9e1-b803-303891513274@redhat.com>
 <38dd38eb-af59-8baf-b908-fb6c4e842cd1@redhat.com>
 <YDP0sZHoT45skArd@redhat.com>
 <d6602268-c447-d26c-dbe5-d7611dd882b4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d6602268-c447-d26c-dbe5-d7611dd882b4@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 09:44:51AM +0100, Max Reitz wrote:
> On 22.02.21 19:15, Daniel P. Berrangé wrote:
> > On Fri, Feb 19, 2021 at 03:09:43PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 2/19/21 12:07 PM, Max Reitz wrote:
> > > > On 13.02.21 22:54, Fam Zheng wrote:
> > > > > On 2021-02-11 15:26, Philippe Mathieu-Daudé wrote:
> > > > > > The null-co driver doesn't zeroize buffer in its default config,
> > > > > > because it is designed for testing and tests want to run fast.
> > > > > > However this confuses security researchers (access to uninit
> > > > > > buffers).
> > > > > 
> > > > > I'm a little surprised.
> > > > > 
> > > > > Is changing default the only way to fix this? I'm not opposed to
> > > > > changing the default but I'm not convinced this is the easiest way.
> > > > > block/nvme.c also doesn't touch the memory, but defers to the device
> > > > > DMA, why doesn't that confuse the security checker?
> > > 
> > > Generally speaking, there is a balance between security and performance.
> > > We try to provide both, but when we can't, my understanding is security
> > > is more important.
> > > 
> > > Customers expect a secure product. If they prefer performance and
> > > at the price of security, it is also possible by enabling an option
> > > that is not the default.
> > > 
> > > I'm not sure why you mention block/nvme here. I have the understanding
> > > the null-co driver is only useful for testing. Are there production
> > > cases where null-co is used?
> > 
> > Do we have any real world figures for the performance of null-co
> > with & without  zero'ing ?  Before worrying about a tradeoff of
> > security vs performance, it'd be good to know if there is actually
> > a real world performance problem in the first place. Personally I'd
> > go for zero'ing by defualt unless the performance hit was really
> > bad.
> 
> AFAIU, null-co is only used for testing, be it to just create some block
> nodes in the iotests, or perhaps for performance testing where you want to
> get the minimal roundtrip time through the block layer.  So there is no
> "real world performance problem", because there is no real world use of
> null-co or null-aio.  At least there shouldn’t be.
> 
> That begs the question of whether read-zeroes=off even makes sense, and I
> think it absolutely does.
> 
> In cases where we have a test that just wants a simple block node that
> doesn’t use disk space, the memset() can’t be noticeable.  But it’s just a
> test, so do we even need the memset()?  Strictly speaking, perhaps not, but
> if someone is to run it via Valgrind or something, they may get false
> positives, so just doing the memset() is the right thing to do.
> 
> For performance tests, it must be possible to set read-zeroes=off, because
> even though “that memset() isn’t noticeable in a functional test”, in a
> hard-core performance test, it will be.
> 
> So we need a switch.  It should default to memset(), because (1) making
> tools like Valgrind happy seems like a reasonable objective to me, and (2)
> in the majority of cases, the memset() cannot have a noticeable impact.

Yes, that all makes sense to me.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



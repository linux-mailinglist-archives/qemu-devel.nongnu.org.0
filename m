Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690FF6719E4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:01:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6Bz-0007uK-UW; Wed, 18 Jan 2023 06:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pI6Bv-0007u5-LL
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:01:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pI6Bu-0005Lp-31
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674039672;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u2qpmawTE6XdPo4xyzJczb79R1CVHFcky7d/kbo7IX8=;
 b=S64zKDwaXkhhym6t8VLMc+KzRS53F3MFQaXhaAXTDA6z4hd1QLNd7azx2v6rE/AmIpwOGV
 9Vj2Y3nXMmEux6jy0kTtuR9I+vAFseOdSpEfhnMOLu5B1bsKSBII3k9/3AaUfPp9M/c8k7
 EAmwBZGvGIC1AT5OytZU177EbCQDxLA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-2dv_ijiaMlKxo9-0Gg0YUw-1; Wed, 18 Jan 2023 06:01:07 -0500
X-MC-Unique: 2dv_ijiaMlKxo9-0Gg0YUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31E62857F42;
 Wed, 18 Jan 2023 11:01:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9614440C2064;
 Wed, 18 Jan 2023 11:01:03 +0000 (UTC)
Date: Wed, 18 Jan 2023 11:01:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 zhenwei pi <pizhenwei@bytedance.com>, arei.gonglei@huawei.com,
 dgilbert@redhat.com, eblake@redhat.com, armbru@redhat.com,
 michael.roth@amd.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [for-8.0 v2 05/11] cryptodev: Introduce 'query-cryptodev' QMP
 command
Message-ID: <Y8fRbRtUjXHKi607@redhat.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
 <20221122140756.686982-6-pizhenwei@bytedance.com>
 <Y8UyezxcEeE+TH2p@redhat.com>
 <20230118052127-mutt-send-email-mst@kernel.org>
 <Y8fKBEmXD862n3EW@redhat.com>
 <97be9e13-6aa3-32c0-dfb8-31225d5efcbc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97be9e13-6aa3-32c0-dfb8-31225d5efcbc@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Jan 18, 2023 at 11:58:19AM +0100, Thomas Huth wrote:
> On 18/01/2023 11.29, Daniel P. Berrangé wrote:
> > On Wed, Jan 18, 2023 at 05:25:37AM -0500, Michael S. Tsirkin wrote:
> > > On Mon, Jan 16, 2023 at 11:18:19AM +0000, Daniel P. Berrangé wrote:
> > > > > +    for (uint32_t i = 0; i < QCRYPTODEV_BACKEND_SERVICE__MAX; i++) {
> > > > 
> > > > QEMU coding style doesn't declare types inside the for() control
> > > > conditions. I'd suggest 'size_t i', and put it at top of this
> > > > function.
> > > 
> > > It's actually kind of vague:
> > > 
> > > 	Mixed declarations (interleaving statements and declarations within
> > > 	blocks) are generally not allowed; declarations should be at the beginning
> > > 	of blocks.
> > > 
> > > for loop starts a block, does it not?
> > 
> > I wasn't refering to the specific docs per-se, but rather that no
> > code does this at all in QEMU. It is effectively our style, even
> > if not documented as such
> 
> $ grep -r 'for (int ' * | wc -l
> 381
> 
> ... we're using it in many places already, and I think it should be OK since
> we started using gnu99 and later as a base standard. Just my 0.02 cents.

Sigh, my bad grepping skills, i missed the space between for and (.
I withdraw my objection.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



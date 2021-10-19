Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77417433D29
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:15:16 +0200 (CEST)
Received: from localhost ([::1]:40334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcshn-0003vK-AK
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mcsPd-0003gJ-1F
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:56:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mcsPZ-00019M-Oq
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634662583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NblAFXvuKp7Z3socW2L9SHOaoq2jr2Wv+/LMxV54zZs=;
 b=BqNn+IX2+2vYm14/LlunMiMddC9CX7MW1eaTFxErVWETfpvrn3WNMLttXNUOGosvc/BO9n
 iPLaFUATAGGgp8kBWNc1MNmiOw0119moefNPVA33Y/3Y69XvNGIraGvJicOTZyK7biC+HZ
 z/HyuA23a4zTaZrCIDzJ+eDsdcU1XMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-lkIgnbW_PQaethoxCBc4Xg-1; Tue, 19 Oct 2021 12:56:20 -0400
X-MC-Unique: lkIgnbW_PQaethoxCBc4Xg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D21710A8E00;
 Tue, 19 Oct 2021 16:56:19 +0000 (UTC)
Received: from localhost (unknown [10.22.17.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AC1C5DAA5;
 Tue, 19 Oct 2021 16:56:12 +0000 (UTC)
Date: Tue, 19 Oct 2021 12:56:11 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Message-ID: <20211019165611.scfagcp4ikhigx5k@habkost.net>
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <a9b2ff3a-0bba-216c-eeda-50821be4940e@dupond.be>
 <YW6h+YcNEgyzh5zw@stefanha-x1.localdomain>
 <20211019065850-mutt-send-email-mst@kernel.org>
 <20211019152913.wjipmv6trjx6k7xa@habkost.net>
 <20211019120619-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211019120619-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
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
Cc: berrange@redhat.com, Stefan Hajnoczi <stefanha@gmail.com>,
 jasowang@redhat.com, qemu-devel@nongnu.org,
 Jean-Louis Dupond <jean-louis@dupond.be>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 12:13:17PM -0400, Michael S. Tsirkin wrote:
> On Tue, Oct 19, 2021 at 11:29:13AM -0400, Eduardo Habkost wrote:
> > On Tue, Oct 19, 2021 at 06:59:09AM -0400, Michael S. Tsirkin wrote:
> > > On Tue, Oct 19, 2021 at 11:46:17AM +0100, Stefan Hajnoczi wrote:
> > > > On Tue, Oct 12, 2021 at 10:36:01AM +0200, Jean-Louis Dupond wrote:
> > > > > Forgot to CC maintainers.
> > > > 
> > > > Also CCing Jason Wang and Michael Tsirkin for VIRTIO.
> > > > 
> > > > Stefan
> > > 
> > > OMG
> > > where all compat properties broken all the time?
> > 
> > Compat properties that existed when commit f6e501a28ef9 ("virtio:
> > Provide version-specific variants of virtio PCI devices") was
> > merged are not broken, because virtio-*-transitional and
> > virtio-*-non-transitional were brand new QOM types (so there's no
> > compatibility to be kept with old QEMU versions).
> > 
> > Compat properties referencing "virtio-*-pci" instead of
> > "virtio-*-pci-base" added after commit f6e501a28ef9 are probably
> > broken, yes.
> > 
> > -- 
> > Eduardo
> 
> Oh. So just this one:
>     { "virtio-net-pci", "vectors", "3"},
> 
> right?

I think so.  That's the only post-4.0 virtio-*-pci compat property I see in
hw/core/machine.c.

pc.c doesn't have any post-4.0 virtio-*-pci compat props.  I didn't see any
virtio compat props on spapr.c and s390-virtio-ccw.c.

> 
> about the patch: how do people feel about virtio specific
> stuff in qdev core? Ok by everyone?

Not OK, if we have a mechanism to avoid that, already (the
"virtio-net-pci-base" type name).  I wonder what we can do to
make this kind of mistake less likely, though.

Jean-Louis, Jason, does the following fix work?

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
diff --git a/hw/core/machine.c b/hw/core/machine.c
index b8d95eec32d..bd9c6156c1a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -56,7 +56,7 @@ GlobalProperty hw_compat_5_2[] = {
     { "ICH9-LPC", "smm-compat", "on"},
     { "PIIX4_PM", "smm-compat", "on"},
     { "virtio-blk-device", "report-discard-granularity", "off" },
-    { "virtio-net-pci", "vectors", "3"},
+    { "virtio-net-pci-base", "vectors", "3"},
 };
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
-- 
Eduardo



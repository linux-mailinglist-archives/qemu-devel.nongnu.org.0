Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064066A577F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxpX-00069K-4P; Tue, 28 Feb 2023 06:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWxpV-00068t-0k
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:07:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWxpT-00080P-9F
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677582449;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oX1uGprA8wYYb9B1gNDOTRE3mlU/cd4dcqHLbNOCl+w=;
 b=GSxsBH3IwI1mwdcre6Ea2xTKSesoSyPDSWVd21Pe4eFqUm7SnQ0s4hpNqOSkjQXuJRITYX
 rp/zlcT4v/IeIgk1QgzxPuHTThAke6A7KkQpVsPqwdO3+akTb1zSyE5Dh8KIFlQ+N21A/3
 R4X1jPR4NqeNqC9ny4gaX+cMqNjTpxs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-RRJVUBDCOFGJwe4cdX-l9A-1; Tue, 28 Feb 2023 06:07:26 -0500
X-MC-Unique: RRJVUBDCOFGJwe4cdX-l9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBE4718A068C;
 Tue, 28 Feb 2023 11:07:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09309404BEC5;
 Tue, 28 Feb 2023 11:07:23 +0000 (UTC)
Date: Tue, 28 Feb 2023 11:07:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>, jasowang@redhat.com,
 pbonzini@redhat.com, arei.gonglei@huawei.com, yechuan@huawei.com,
 eperezma@redhat.com, alex.williamson@redhat.com,
 mtosatti@redhat.com, clg@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 3/3] virtio-pci: defer to commit kvm irq routing when
 enable msi/msix
Message-ID: <Y/3gaVgDcf26vo6Y@redhat.com>
References: <20230228093937.2515-1-longpeng2@huawei.com>
 <20230228093937.2515-4-longpeng2@huawei.com>
 <20230228051830-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230228051830-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Tue, Feb 28, 2023 at 05:40:33AM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 05:39:37PM +0800, Longpeng(Mike) wrote:
> > From: Longpeng <longpeng2@huawei.com>
> > 
> > All unmasked vectors will be setup in msix_set_vector_notifiers(), which
> > is a time-consuming operation because each vector need to be submit to
> > KVM once. It's even worse if the VM has several devices and each devices
> > has dozens of vectors.
> > 
> > We can defer and commit the vectors in batch, just like the commit dc580d51f7
> > ("vfio: defer to commit kvm irq routing when enable msi/msix"),
> > 
> > The can reduce 80% of the time spending on virtio_pci_set_guest_notifiers().
> 
> cover letter also refers to 80%. what about patch 1 then? does it 
> contribute some of this gain?
> 
> > Signed-off-by: Longpeng <longpeng2@huawei.com>
> 
> In the age of language models there's no longer any excuse to post
> agrammatical commit messages.

IMHO it is not appropriate to criticize the writing of people
who may not have English as a first language. 

>                               Please just give your text to one of these
> to correct.

I'd really rather we don't suggest our contributors feed stuff
through such systems. You might have an example where its output
made sense, but there's plenty of demonstrations of such tools
outputting obvious garbage, or worse stuff that superficially
looks OK but is subtly changing the meaning. The latter is going
to be especially hard to spot for contributors without English
as a first language. IMHO it is better to have explanations
directly written by the contributor so it accurately reflects
their own understanding of the patch, even if not grammatically
perfect.

And that's ignoring the unsettled legal questions around the
licensing of output from these systems. Personally I'd suggest
our coding guidelines should explicitly reject any usage of
so called "AI" systems for QEMU contributions because of legal
uncertainty alone.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



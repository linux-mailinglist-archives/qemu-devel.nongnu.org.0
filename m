Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C84F1537
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 14:49:40 +0200 (CEST)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbM9K-0000zO-MN
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 08:49:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nbM5u-00078Q-DN
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 08:46:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nbM5r-0001qv-Ld
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 08:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649076361;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=G8Ftvno+vJeP5JgTio0jVQNlJdqB11TYE6VZMo8pEuo=;
 b=PV32dg8NNtDB/Hic408D+ZGcgyCf3fUxZAWcqeLG53UHaLUNyY3q9UI69YTna36iRUGWpO
 Aptpm6edVN9/h72FtKC5AgM+HjKg3Yizl0U6YMoT7bKFZsnj2HrX6YW5oiIjWQlpQld8N4
 MB81qD5WAfflVx2bQYX7anjDv9X6y7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-Ji0l9pDkOqqa2tZqvJvLBQ-1; Mon, 04 Apr 2022 08:45:58 -0400
X-MC-Unique: Ji0l9pDkOqqa2tZqvJvLBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58388180074D;
 Mon,  4 Apr 2022 12:45:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D8341047E8;
 Mon,  4 Apr 2022 12:45:54 +0000 (UTC)
Date: Mon, 4 Apr 2022 13:45:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
Message-ID: <YkrogEItLOGcuDwv@redhat.com>
References: <20220329152123.493731-1-iii@linux.ibm.com>
 <YkrUbt8Z+N5uenDT@work-vm>
MIME-Version: 1.0
In-Reply-To: <YkrUbt8Z+N5uenDT@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 f.ebner@proxmox.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 Juan Quintela <quintela@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, s.reiter@proxmox.com,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, peterx@redhat.com,
 qemu-s390x@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, Christian Borntraeger <borntraeger@linux.ibm.com>,
 jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 04, 2022 at 12:20:14PM +0100, Dr. David Alan Gilbert wrote:
> * Ilya Leoshkevich (iii@linux.ibm.com) wrote:
> > zlib_send_prepare() compresses pages of a running VM. zlib does not
> > make any thread-safety guarantees with respect to changing deflate()
> > input concurrently with deflate() [1].
> > 
> > One can observe problems due to this with the IBM zEnterprise Data
> > Compression accelerator capable zlib [2]. When the hardware
> > acceleration is enabled, migration/multifd/tcp/zlib test fails
> > intermittently [3] due to sliding window corruption.
> > 
> > At the moment this problem occurs only with this accelerator, since
> > its architecture explicitly discourages concurrent accesses [4]:
> > 
> >     Page 26-57, "Other Conditions":
> > 
> >     As observed by this CPU, other CPUs, and channel
> >     programs, references to the parameter block, first,
> >     second, and third operands may be multiple-access
> >     references, accesses to these storage locations are
> >     not necessarily block-concurrent, and the sequence
> >     of these accesses or references is undefined.
> > 
> > Still, it might affect other platforms due to a future zlib update.
> > Therefore, copy the page being compressed into a private buffer before
> > passing it to zlib.
> 
> While this might work around the problem; your explanation doesn't quite
> fit with the symptoms; or if they do, then you have a separate problem.
> 
> The live migration code relies on the fact that the source is running
> and changing it's memory as the data is transmitted; however it also
> relies on the fact that if this happens the 'dirty' flag is set _after_
> those changes causing another round of migration and retransmission of
> the (now stable) data.
> 
> We don't expect the load of the data for the first page write to be
> correct, consistent etc - we just rely on the retransmission to be
> correct when the page is stable.
> 
> If your compressor hardware is doing something undefined during the
> first case that's fine; as long as it works fine in the stable case
> where the data isn't changing.
> 
> Adding the extra copy is going to slow everyone else dowmn; and since
> there's plenty of pthread lockingin those multifd I'm expecting them
> to get reasonably defined ordering and thus be safe from multi threading
> problems (please correct us if we've actually done something wrong in
> the locking there).
> 
> IMHO your accelerator when called from a zlib call needs to behave
> the same as if it was the software implementation; i.e. if we've got
> pthread calls in there that are enforcing ordering then that should be
> fine; your accelerator implementation needs to add a barrier of some
> type or an internal copy, not penalise everyone else.

It is reasonable to argue that QEMU is relying on undefined behaviour
when invoking zlib in this case, so it isn't clear that the accelerator
impl should be changed, rather than QEMU be changed to follow the zlib
API requirements. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



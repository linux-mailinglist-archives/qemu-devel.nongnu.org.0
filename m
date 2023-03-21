Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9176C2F09
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 11:32:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peZHo-000170-9c; Tue, 21 Mar 2023 06:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peZHm-00016T-GA
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 06:32:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peZHk-0001Su-O9
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 06:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679394727;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4W/4nrAHP64mnQYHJhv+Eu0Nz1CUM1J7m8M3JqQtww=;
 b=DXRW35j/SvLtlWZdZJ/E/na6IG6F/IC/vuNbEc0B6G+hO9CTvFg1lCurhpc7L0FHpUhV3x
 6I3QIL76tvgyg8/RYKIxBNvZWcaq67M0rpv0Y/FH+xsqAe1cq2zw4LyOCgRaHdxi3tgmIA
 VecTp+R0SRwwvUEWAIxfLpGvrGn1kzA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-mG01RzpAM_qadCBMGhWecg-1; Tue, 21 Mar 2023 06:30:20 -0400
X-MC-Unique: mG01RzpAM_qadCBMGhWecg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FD91101A553;
 Tue, 21 Mar 2023 10:30:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E374140E95F;
 Tue, 21 Mar 2023 10:30:18 +0000 (UTC)
Date: Tue, 21 Mar 2023 10:30:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH for-8.0 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Message-ID: <ZBmHOBEfTCLsA0US@redhat.com>
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-2-clg@kaod.org>
 <895227cc-243a-1e93-26c2-da22bd8864c5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <895227cc-243a-1e93-26c2-da22bd8864c5@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

On Tue, Mar 21, 2023 at 11:22:33AM +0100, Paolo Bonzini wrote:
> On 3/21/23 09:33, Cédric Le Goater wrote:
> > From: Cédric Le Goater<clg@redhat.com>
> > 
> > GCC13 reports an error :
> > 
> > ../util/async.c: In function ‘aio_bh_poll’:
> > include/qemu/queue.h:303:22: error: storing the address of local variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ [-Werror=dangling-pointer=]
> >    303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
> >        |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> > ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
> >    169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> >        |     ^~~~~~~~~~~~~~~~~~~~
> > ../util/async.c:161:17: note: ‘slice’ declared here
> >    161 |     BHListSlice slice;
> >        |                 ^~~~~
> > ../util/async.c:161:17: note: ‘ctx’ declared here
> > 
> > But the local variable 'slice' is removed from the global context list
> > in following loop of the same routine. Add an intermediate helper to
> > silent GCC. No functional change.
> 
> Before doing this, I would like to see a case where this bug was _not_
> caught by either Coverity (which is currently offline but I'm fixing it
> right now) or just cursory review.

IMHO coverity is not a substitute for this, because it is only available
post merge, while the GCC warning is available to all maintainers on
every build. As for code review, mistakes inevitably happen. 

Personally I find the code in this method pretty obtuse. It is hard to
reason about it to convince yourself that it is safe to be adding the
local variable to the global linked list and have it removed again
before returning.

Stefan has explained why it is correct, but I tend to think of the compiler
warning here as a sign that the code might be better to be written in a
different way that is more obviously correct. If this really is the best
way to write this method though, an alternative could be selectively
disabling the warning with a local pragma, along with adding a comment
to the method to explain why this unusual code pattern is indeed safe.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



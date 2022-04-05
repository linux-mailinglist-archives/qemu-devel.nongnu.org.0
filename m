Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE8E4F390E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 16:42:55 +0200 (CEST)
Received: from localhost ([::1]:37878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbkOU-00012G-Ch
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 10:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nbkN0-0008LJ-9Y
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:41:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nbkMx-0000Qr-5l
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649169678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/zNIXYL/j8FqiRFhzcEDYe7EWkk0tyjfRfhhxPDrYjw=;
 b=ArlxmMDMPtdxwq1ysLcpreP1GrbAKIEXN9KnuDN8WSAxaBJ0FPL+Zg2J3/2+KhdzwESNWJ
 sSzkYPcwoZPk8Q17+6wgyw+fXyYYbngjKaJZL3R6/kq9IRRIKKIa3ml1uUp9/aOeXon/6Z
 bNsCAp132Hsd9ccrpalhkkPjMiq97tw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-AoYnVWKSOJ2NfckfNBbUcQ-1; Tue, 05 Apr 2022 10:41:13 -0400
X-MC-Unique: AoYnVWKSOJ2NfckfNBbUcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85E6B802809;
 Tue,  5 Apr 2022 14:41:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9595112C083;
 Tue,  5 Apr 2022 14:41:09 +0000 (UTC)
Date: Tue, 5 Apr 2022 16:41:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Subject: Re: [PATCH] block/stream: Drain subtree around graph change
Message-ID: <YkxVBCbrSa1F9k+S@redhat.com>
References: <20220324125756.9950-1-hreitz@redhat.com>
 <YkwWbAoYmkVuHlQA@redhat.com>
 <303aace0-2545-91a1-ef48-568f74680ca8@mail.ru>
MIME-Version: 1.0
In-Reply-To: <303aace0-2545-91a1-ef48-568f74680ca8@mail.ru>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: eesposit@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.04.2022 um 14:12 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Thanks Kevin! I have already run out of arguments in the battle
> against using subtree-drains to isolate graph modification operations
> from each other in different threads in the mailing list)
> 
> (Note also, that the top-most version of this patch is "[PATCH v2]
> block/stream: Drain subtree around graph change")

Oops, I completely missed the v2. Thanks!

> About avoiding polling during graph-modifying operations, there is a
> problem: some IO operations are involved into block-graph modifying
> operations. At least it's rewriting "backing_file_offset" and
> "backing_file_size" fields in qcow2 header.
> 
> We can't just separate rewriting metadata from graph modifying
> operation: this way another graph-modifying operation may interleave
> and we'll write outdated metadata.

Hm, generally we don't update image metadata when we reconfigure the
graph. Most changes are temporary (like insertion of filter nodes) and
the image header only contains a "default configuration" to be used on
the next start.

There are only a few places that update the image header; I think it's
generally block job completions. They obviously update the in-memory
graph, too, but they don't write to the image file (and therefore
potentially poll) in the middle of updating the in-memory graph, but
they do both in separate steps.

I think this is okay. We must just avoid polling in the middle of graph
updates because if something else changes the graph there, it's not
clear any more that we're really doing what the caller had in mind.

> So I still think, we need a kind of global lock for graph modifying
> operations. Or a kind per-BDS locks as you propose. But in this case
> we need to be sure that taking all needed per-BDS locks we'll avoid
> deadlocking.

I guess this depends on the exact granularity of the locks we're using.
If you take the lock only while updating a single edge, I don't think
you could easily deadlock. If you hold it for more complex operations,
it becomes harder to tell without checking the code.

Kevin



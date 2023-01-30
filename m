Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE5F680B67
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 11:58:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMRqQ-0006Z6-BO; Mon, 30 Jan 2023 05:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pMRqO-0006Wm-75
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:57:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pMRqM-0003lI-Og
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675076218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rz/7ZjPIUuUrwzXOoR0WZeP7Be/BbpeRi4g/x6UzejU=;
 b=L2B2a3FOTtj4nDRDVTlkWN+kY+q7mCIL39cPoKqY5ZrSnsL1xRFF67U4Ei1nNA/QED8qNN
 IIKAZ0jBotwZcNWmh+opRO8T2KxI3bfoCNBybp6khnOxKzpRk4zvMR13hhQ1yL+1otBJk3
 3/hMm68IFaRrK4zOPSRa1bPEVU4k6ng=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-wvilOXG4NdSUMvLgQrzVYQ-1; Mon, 30 Jan 2023 05:56:52 -0500
X-MC-Unique: wvilOXG4NdSUMvLgQrzVYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5B023802B87;
 Mon, 30 Jan 2023 10:56:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4C6B2166B26;
 Mon, 30 Jan 2023 10:56:50 +0000 (UTC)
Date: Mon, 30 Jan 2023 11:56:49 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 03/12] block/vmdk: Change extent info type
Message-ID: <Y9eiccNn2UJgxxiB@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
 <20220620162704.80987-4-hreitz@redhat.com>
 <Y8lfsJ5W2UxUPmWm@redhat.com>
 <20230127230625.zo3vw7fkxjv5yvki@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127230625.zo3vw7fkxjv5yvki@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 28.01.2023 um 00:06 hat Eric Blake geschrieben:
> On Thu, Jan 19, 2023 at 04:20:16PM +0100, Kevin Wolf wrote:
> > Am 20.06.2022 um 18:26 hat Hanna Reitz geschrieben:
> > > VMDK's implementation of .bdrv_get_specific_info() returns information
> > > about its extent files, ostensibly in the form of ImageInfo objects.
> > > However, it does not get this information through
> > > bdrv_query_image_info(), but fills only a select few fields with custom
> > > information that does not always match the fields' purposes.
> > > 
> > > For example, @format, which is supposed to be a block driver name, is
> > > filled with the extent type, e.g. SPARSE or FLAT.
> > > 
> > > In ImageInfo, @compressed shows whether the data that can be seen in the
> > > image is stored in compressed form or not.  For example, a compressed
> > > qcow2 image will store compressed data in its data file, but when
> > > accessing the qcow2 node, you will see normal data.  This is not how
> > > VMDK uses the @compressed field for its extent files: Instead, it
> > > signifies whether accessing the extent file will yield compressed data
> > > (which the VMDK driver then (de-)compresses).
> > 
> > Actually, VMDK was the only user of the field in ImageInfo. qcow2
> > doesn't set the field at all because it would have to parse all L2
> > tables in order to set it.
> > 
> > So I suppose @compressed can now be removed from ImageInfo?
> 
> I think you are okay for VMDK (the new struct has the same field
> names, but better meanings, and the on-the-wire representation for
> someone querying a known-VMDK image doesn't change).  For non-VMDK,
> any code that was querying @compressed will break, but arguably no one
> was doing that since it would have always been false.  If we want to
> be super-conservative, we deprecate the field now and only remove it
> from ImageInfo in a later release, but I'd rather trust Markus on this
> decision.

It is an optional field and VMDK is the only driver that ever provided
it, and only in the context of extent information. In this case, the
information on the wire stays the same after this patch.

So I don't think there is any visible difference for a client, apart
from schema introspection?

> On a side note - would it be worth adding a bit to the qcow2 header
> (one of the compatible_feature bits seems best) which we set when
> writing a compressed cluster, so that on newer images, it is an O(1)
> probe of whether the image contains (or at least has contained in the
> past) a compressed cluster?  Or is that going to add needless overhead
> for something we really don't need to know all that often?

I think the only use for it would be displaying it in 'qemu-img info'.

Would you combine two bits then? One for "compressed bit is valid" and
one for "contains compressed clusters"? Because with one bit you can
only distinguish "compressed" from "don't know", but there wouldn't be a
way to say for certain that an image is uncompressed.

Kevin



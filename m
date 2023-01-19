Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D1673D5B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:20:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWiM-0001R6-5C; Thu, 19 Jan 2023 10:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIWiJ-00018E-07
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:20:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIWiH-0000Cg-G3
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674141624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o4exCpIaeOZcV+u9M1RkrAi8fzxHzEF3z/eEJ4o9yJk=;
 b=MiSI0mUYnTJIuqc+YP1lqC+52A53eLwydMDSbSREIhL8GhJy5tDBRp2znn4/c672yFUwK5
 zOWg9A6eaWDLo8h3AtJWFxyfQcqqE9o1D2rMW5btuPDlXs6/WzWPKvONuejIx3BUJ6gUC+
 B5OLZnf4Z2ok8mUK51A0brZbjOD0i1A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-E3PPiTHrOuKpuesUJt1tAQ-1; Thu, 19 Jan 2023 10:20:18 -0500
X-MC-Unique: E3PPiTHrOuKpuesUJt1tAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A05AA882826;
 Thu, 19 Jan 2023 15:20:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2C17C15BAD;
 Thu, 19 Jan 2023 15:20:17 +0000 (UTC)
Date: Thu, 19 Jan 2023 16:20:16 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 03/12] block/vmdk: Change extent info type
Message-ID: <Y8lfsJ5W2UxUPmWm@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
 <20220620162704.80987-4-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620162704.80987-4-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 20.06.2022 um 18:26 hat Hanna Reitz geschrieben:
> VMDK's implementation of .bdrv_get_specific_info() returns information
> about its extent files, ostensibly in the form of ImageInfo objects.
> However, it does not get this information through
> bdrv_query_image_info(), but fills only a select few fields with custom
> information that does not always match the fields' purposes.
> 
> For example, @format, which is supposed to be a block driver name, is
> filled with the extent type, e.g. SPARSE or FLAT.
> 
> In ImageInfo, @compressed shows whether the data that can be seen in the
> image is stored in compressed form or not.  For example, a compressed
> qcow2 image will store compressed data in its data file, but when
> accessing the qcow2 node, you will see normal data.  This is not how
> VMDK uses the @compressed field for its extent files: Instead, it
> signifies whether accessing the extent file will yield compressed data
> (which the VMDK driver then (de-)compresses).

Actually, VMDK was the only user of the field in ImageInfo. qcow2
doesn't set the field at all because it would have to parse all L2
tables in order to set it.

So I suppose @compressed can now be removed from ImageInfo?

Kevin



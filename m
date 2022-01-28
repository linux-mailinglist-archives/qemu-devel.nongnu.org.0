Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526BB49FAFA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 14:43:03 +0100 (CET)
Received: from localhost ([::1]:45052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDRWm-000674-Py
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 08:43:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nDRB1-0007N5-NG
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 08:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nDRAt-000182-K7
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 08:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643376021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqOK2Qy46IiIquBrJKcmnJolJYRjAHhnFM+VP2pAtj8=;
 b=jPeBQQxFjs6h1amO50Gnl+wGMSVhtthrundVDdIG8dYKZ/RE8vu9FPTtsaGNz52FCT7rgS
 PF4LitsNmddfqaYudL33hvniAt2d5vWptHNtFUQxUWjrWXYhBa4ERISlQEqYuAitEXLxxI
 ajbvg7KvsUiXujPVN7+slozjnzTdxJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-h3xr6kESOpG_y5KUg1AvkA-1; Fri, 28 Jan 2022 08:20:16 -0500
X-MC-Unique: h3xr6kESOpG_y5KUg1AvkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E229518B6152;
 Fri, 28 Jan 2022 13:19:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1319F2377B;
 Fri, 28 Jan 2022 13:19:45 +0000 (UTC)
Date: Fri, 28 Jan 2022 14:19:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: Block alignment of qcow2 compress driver
Message-ID: <YfPtcGQGIZP4cYrJ@redhat.com>
References: <20220128110732.GA19514@redhat.com>
 <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
 <20220128114815.GQ1127@redhat.com>
 <26486e0e-adb5-aa3b-e70d-82ab21a0d2be@redhat.com>
 <20220128121803.GS1127@redhat.com>
 <54f3a548-ebea-9ed5-6387-5dda2bf92c4e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <54f3a548-ebea-9ed5-6387-5dda2bf92c4e@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: andrey.shinkevich@virtuozzo.com, eblake@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.01.2022 um 13:30 hat Hanna Reitz geschrieben:
> > > I just changed that line of code [2], as shown in [4].  I suppose
> > > the better thing to do would be to have an option for the NBD server
> > > to force-change the announced request alignment, because it can
> > > expect the qemu block layer code to auto-align requests through
> > > RMW.  Doing it in the client is wrong, because the NBD server might
> > > want to detect that the client sends unaligned requests and reject
> > > them (though ours doesn’t, it just traces such events[5] – note that
> > > it’s explicitly noted there that qemu will auto-align requests).
> > I know I said I didn't care about performance (in this case), but is
> > there in fact a penalty to sending unaligned requests to the qcow2
> > layer?  Or perhaps it cannot compress them?
> 
> In qcow2, only the whole cluster can be compressed, so writing compressed
> data means having to write the whole cluster.  qcow2 could implement the
> padding by itself, but we decided to just leave the burden of only writing
> full clusters (with the COMPRESSED write flag) on the callers.
> 
> Things like qemu-img convert and blockdev-backup just adhere to that by
> design; and the compress driver makes sure to set its request alignment
> accordingly so that requests to it will always be aligned to the cluster
> size (either by its user, or by the qemu block layer which performs the
> padding automatically).

I thought the more limiting factor would be that after auto-aligning the
first request by padding with zeros, the second request to the same
cluster would fail because compression doesn't allow using an already
allocated cluster:

    /* Compression can't overwrite anything. Fail if the cluster was already
     * allocated. */
    cluster_offset = get_l2_entry(s, l2_slice, l2_index);
    if (cluster_offset & L2E_OFFSET_MASK) {
        qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
        return -EIO;
    }

Did you always just test a single request or why don't you run into
this?

I guess checking L2E_OFFSET_MASK is strictly speaking wrong because it's
invalid for compressed clusters (qcow2_get_cluster_type() feels more
appropriate), but in practice, you will always have non-zero data there,
so it should error out here.

Kevin



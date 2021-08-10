Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE93E5CAC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:14:49 +0200 (CEST)
Received: from localhost ([::1]:54246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSWm-0007mo-3u
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mDSVS-0006BI-Kh
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mDSVM-000519-9p
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628604797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKURG97cen/uSp1DMiYr9BPcacC0ToX9L7UqUDuFeB0=;
 b=ihOOyb7oIYr/MQ2l71rUbz02QjiIQxIkETGv2D7Dt9CZ1z6/fpmvHGvqMRyyEBzmIDr7Pj
 EuPZQK4/OewHlzDnac+tKgdxEH2hywUcvH8bSLutM7K63nnYmpzbR/lUanJNEF5RSU9GZm
 4E8bR/Un+k5glnUfg7nm8vkPQS0Mz4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-sPcqGu7cNQmN143ZbQ7C8g-1; Tue, 10 Aug 2021 10:13:16 -0400
X-MC-Unique: sPcqGu7cNQmN143ZbQ7C8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73D5B87D543
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 14:13:15 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B2465D9C6;
 Tue, 10 Aug 2021 14:12:57 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id C01E72237F5; Tue, 10 Aug 2021 10:12:56 -0400 (EDT)
Date: Tue, 10 Aug 2021 10:12:56 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 10/10] virtiofsd: Add lazy lo_do_find()
Message-ID: <YRKJaKvnmYjp+4/j@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-11-mreitz@redhat.com>
 <YRF9Q+MSjrbeybd2@redhat.com>
 <dfebe39a-35d4-1e1c-c63f-2312586aa97d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <dfebe39a-35d4-1e1c-c63f-2312586aa97d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 10:38:32AM +0200, Hanna Reitz wrote:
> On 09.08.21 21:08, Vivek Goyal wrote:
> > On Fri, Jul 30, 2021 at 05:01:34PM +0200, Max Reitz wrote:
> > > lo_find() right now takes two lookup keys for two maps, namely the file
> > > handle for inodes_by_handle and the statx information for inodes_by_ids.
> > > However, we only need the statx information if looking up the inode by
> > > the file handle failed.
> > > 
> > > There are two callers of lo_find(): The first one, lo_do_lookup(), has
> > > both keys anyway, so passing them does not incur any additional cost.
> > > The second one, lookup_name(), though, needs to explicitly invoke
> > > name_to_handle_at() (through get_file_handle()) and statx() (through
> > > do_statx()).  We need to try to get a file handle as the primary key, so
> > > we cannot get rid of get_file_handle(), but we only need the statx
> > > information if looking up an inode by handle failed; so we can defer
> > > that until the lookup has indeed failed.
> > So IIUC, this patch seems to be all about avoiding do_statx()
> > call in lookup_name() if file handle could be successfully
> > generated.
> > 
> > So can't we just not modify lookup_name() to not call statx()
> > if file handle could be generated. And also modfiy lo_find()
> > to use st/mnt_id only if fhandle==NULL.
> > 
> > That probably is much simpler change as compared to passing function
> > pointers around.
> 
> Definitely, but I don’t know whether it’s correct.

What problem do you see from correctness point of view.
> 
> Or, we can just drop this patch and say that we don’t need to over-optimize
> C virtiofsd.

Rust version is used by very few people, while C version is in production.
So I will definitely optimize C version. Once rust version is widely
available and available in product, then we can start paying less
attention to C version, IMHO.

Vivek



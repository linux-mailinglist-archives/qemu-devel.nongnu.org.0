Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C284A02E2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 22:34:48 +0100 (CET)
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYtK-00088G-Sj
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 16:34:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDYhd-0006re-4O
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 16:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDYhZ-0000qt-Ta
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 16:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643404956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WltlMizdQIWgL17n2wtG9iBhWJJHX0rrCeBn/XJymPA=;
 b=KzEkTHeAOFZ203ccA5jf1jgSuuvpLgcEfZhtGZ9VcJOegyxxGXNA4pdpMhi8bphluEXzYl
 sykMOCSNv3+//yh4sZiJdq2WrYPVZczJd0PkM238FUx6ecbekHpuRrcEIX4Elflh3wMjxT
 lkWc4RqQV8oJYq8WfZCh2c2heyDj8ig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-rsRkiyNYM16C82x_41-U_A-1; Fri, 28 Jan 2022 16:22:33 -0500
X-MC-Unique: rsRkiyNYM16C82x_41-U_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48ACE100C661;
 Fri, 28 Jan 2022 21:22:32 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69C7B1024879;
 Fri, 28 Jan 2022 21:22:28 +0000 (UTC)
Date: Fri, 28 Jan 2022 15:22:26 -0600
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: Block alignment of qcow2 compress driver
Message-ID: <20220128212226.ijwkrxhptyxb7l64@redhat.com>
References: <20220128110732.GA19514@redhat.com>
 <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
 <20220128114815.GQ1127@redhat.com>
 <26486e0e-adb5-aa3b-e70d-82ab21a0d2be@redhat.com>
 <20220128121803.GS1127@redhat.com>
 <54f3a548-ebea-9ed5-6387-5dda2bf92c4e@redhat.com>
 <20220128133053.GT1127@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220128133053.GT1127@redhat.com>
User-Agent: NeoMutt/20211029-256-77b59a
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 01:30:53PM +0000, Richard W.M. Jones wrote:
> > 
> > In qcow2, only the whole cluster can be compressed, so writing
> > compressed data means having to write the whole cluster.  qcow2
> > could implement the padding by itself, but we decided to just leave
> > the burden of only writing full clusters (with the COMPRESSED write
> > flag) on the callers.
> 
> I feel like this may be a bug in what qemu-nbd advertises.  Currently
> it is:
> 
> $ qemu-nbd -t --image-opts driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=output.qcow2 &
> [2] 2068900
> $ nbdinfo nbd://localhost

> 		block_size_minimum: 65536    <---
> 		block_size_preferred: 65536
> 		block_size_maximum: 33554432
> 
> block_size_preferred is (rightly) set to 64K, as that's what the
> compress + qcow2 combination prefers.
> 
> But block_size_minimum sounds as if it should be 512 or 1, if qemu-nbd
> is able to reassemble smaller than preferred requests, even if they
> are suboptimal.

When compression is involved, 64k is the minimum block size at the
qcow2 layer, but the qemu NBD layer is relying on the generic block
core code to do RMW on anything smaller than that.  If the RMW doesn't
work, we may have a bug in the block layer.  Even if it does appear to
work, I'm not sure whether the block layer is able to recompress a
cluster - it may be that the act of RMW on a partially-written
initially-compressed cluster causes that cluster to no longer be
compressed, at which point, while your write succeeded, you are no
longer getting any compression.

So, while it is a nice QoI feature of qemu-nbd that we can rely on the
block layer RMW to accept client requests that were smaller than the
advertised minimum block size, I still think the advertised size is
correct, and that the client is in violation of the spec if it is
requesting but then not honoring the advertised size.  And yes, while
it is a pain to hack nbdcopy to pay more attention to block sizing, I
think in the long run it will be worth it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



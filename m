Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A949F7FD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:12:27 +0100 (CET)
Received: from localhost ([::1]:43932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDPB4-0007z9-Gi
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:12:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDP6b-0005C9-Su
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:07:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDP6V-0005Za-Kx
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643368061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=JLDRGlqSj0GjDiqqfP8Oxp9q5DZcwymf65r484BA5TI=;
 b=SHBcEpYBxdGOKgH8oSyvPAL4qmhqWK8FYAHqkYMd7g0mz9GqPVIzC8ZEJKTfIP8L5W4JBF
 FYbfa6Rmo6OBPYZ8TTef1cqJ7pAym5P16dddHzkMjArM36av2reaS9u7fPs5l6uwUCLua8
 o78fOd/ZnVXrpIrj3GBdn+SUM0al/nI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-8otDviRlMUe30A04xwSGDQ-1; Fri, 28 Jan 2022 06:07:37 -0500
X-MC-Unique: 8otDviRlMUe30A04xwSGDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A24C21F2DA;
 Fri, 28 Jan 2022 11:07:36 +0000 (UTC)
Received: from localhost (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9DB178DD6;
 Fri, 28 Jan 2022 11:07:33 +0000 (UTC)
Date: Fri, 28 Jan 2022 11:07:32 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Block alignment of qcow2 compress driver
Message-ID: <20220128110732.GA19514@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, hreitz@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The commands below set up a sparse RAM disk, with an allocated block
at offset 32K and another one at offset 1M-32K.  Then it tries to copy
this to a compressed qcow2 file using qemu-nbd + the qemu compress
filter:

  $ qemu-img create -f qcow2 output.qcow2 1M
  $ qemu-nbd -t --image-opts driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=output.qcow2 & sleep 1
  $ nbdkit -U - \
           data '@32768 1*32768 @1015808 1*32768' \
           --run 'nbdcopy $uri nbd://localhost -p'

The nbdcopy command fails when zeroing the first 32K with:

  nbd://localhost: nbd_aio_zero: request is unaligned: Invalid argument

This is a bug in nbdcopy because it ignores the minimum block size
being correctly declared by the compress filter:

  $ nbdinfo nbd://localhost
  protocol: newstyle-fixed without TLS
  export="":
	export-size: 1048576 (1M)
	uri: nbd://localhost:10809/
	contexts:
  ...
		block_size_minimum: 65536          <----
		block_size_preferred: 65536
		block_size_maximum: 33554432

The compress filter sets the minimum block size to the the same as the
qcow2 cluster size here:

  https://gitlab.com/qemu-project/qemu/-/blob/cfe63e46be0a1f8a7fd2fd5547222f8344a43279/block/filter-compress.c#L117

I patched qemu to force this to 4K:

-    bs->bl.request_alignment = bdi.cluster_size;
+    //bs->bl.request_alignment = bdi.cluster_size;
+    bs->bl.request_alignment = 4096;

and the copy above works, and the output file is compressed!

So my question is, does the compress filter in qemu really need to
declare the large minimum block size?  I'm not especially concerned
about efficiency, I'd prefer it just worked, and changing nbdcopy to
understand block sizes is painful.

Is it already adjustable at run time?  (I tried using --image-opts
like compress.request_alignment=4096 but it seems like the filter
doesn't support anything I could think of, and I don't know how to
list the supported options.)

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html



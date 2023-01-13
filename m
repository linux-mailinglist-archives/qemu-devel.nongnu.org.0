Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54596669C8E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:38:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGM1q-0001Fr-S4; Fri, 13 Jan 2023 10:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGM1j-0001AP-IH
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:31:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGM1g-0002Ym-Mu
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673623885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+lggzdD4XrXIAmz96H3tEcA7mq+f1yz9R3ziDOqcgbc=;
 b=B5HRg7ktjChGV1tu3XenHaFyABzyET6+jIxwXUvQJLVPcK1BGP9AK5vE5UtMOAOLZQYgao
 EQguVQzBvrN3PAn5r4TDDeDEhWOI20lGq4o90/DXZvCR7cplSJS91GlorZfENTEdzfHlqA
 HmbmupqD5ttjuc5YqfhycbWfozwNQ0Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-b9G5mTACOTmR6wJTrxHXhA-1; Fri, 13 Jan 2023 10:31:24 -0500
X-MC-Unique: b9G5mTACOTmR6wJTrxHXhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27AEF19705B9;
 Fri, 13 Jan 2023 15:31:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D35153A0;
 Fri, 13 Jan 2023 15:31:21 +0000 (UTC)
Date: Fri, 13 Jan 2023 16:31:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qing Wang <qinwang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH] block-backend: fix virtio-scsi assertion failure with
 blk_drain_noref()
Message-ID: <Y8F5SACiNCjoNXR/@redhat.com>
References: <20230104195633.86143-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104195633.86143-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Am 04.01.2023 um 20:56 hat Stefan Hajnoczi geschrieben:
> scsi_device_purge_requests() is called from I/O code by virtio-scsi TMF
> emulation code. It must not call Global State APIs like blk_drain()
> because that results in an assertion failure.
> 
> blk_drain() is a Global State API because it uses bdrv_unref(). Actually
> ref/unref is unnecessary in device emulation code because the drive=
> qdev property holds the reference.

Just for the record: We came to the conclusion that this isn't true.

We're not doing blk_ref/unref here, but bdrv_ref/unref. The function
calls bdrv_drained_end(bs), so the node must still exist at that point
and the ref/unref is required to ensure this.

The root node of the BlockBackend can change, so without the ref/unref
pair the last reference to the node can go away even if the BlockBackend
still exists.

So we'll need a different solution.

Kevin



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606F06F4842
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:23:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsky-0007Ff-FE; Tue, 02 May 2023 12:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ptskv-0007ER-G6
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:21:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ptskt-0006kn-Pf
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683044490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=veAM1yxiNJOFHsx6/inor+jTVAWMkCyEti4maPSbfwU=;
 b=GvWuG76/BJfvvqcyPpvdY8HQIqsHpKQA6WpfN4zl2+PIrpmohDt91R1+c3lM4Mqo3gIDoQ
 fqaioTkvkf0HQG9S1tmccAfOVOEmHTaAxrNtsf2Ip3pA8bxTPYdTv0n6Y4BEEUG60kBi+s
 KbUpCLAa9NDf+mC2CamMTqBaGc2bUSM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-XFbx3vdZP5Ky0DHbFh4gXA-1; Tue, 02 May 2023 12:21:28 -0400
X-MC-Unique: XFbx3vdZP5Ky0DHbFh4gXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C753C2807D63;
 Tue,  2 May 2023 16:21:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2BA563F4A;
 Tue,  2 May 2023 16:21:21 +0000 (UTC)
Date: Tue, 2 May 2023 18:21:20 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 10/20] block: drain from main loop thread in
 bdrv_co_yield_to_drain()
Message-ID: <ZFE4gFFXnu+FSk35@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-11-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172716.1033562-11-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> For simplicity, always run BlockDevOps .drained_begin/end/poll()
> callbacks in the main loop thread. This makes it easier to implement the
> callbacks and avoids extra locks.
> 
> Move the function pointer declarations from the I/O Code section to the
> Global State section in block-backend-common.h.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

If we're updating function pointers, we should probably update them in
BdrvChildClass and BlockDriver, too.

This means that a non-coroutine caller can't run in an iothread, not
even the home iothread of the BlockDriverState. (I'm not sure if it was
allowed previously. I don't think we're actually doing this, but in
theory it could have worked.) Maybe put a GLOBAL_STATE_CODE() after
handling the bdrv_co_yield_to_drain() case? Or would that look too odd?

    IO_OR_GS_CODE();

    if (qemu_in_coroutine()) {
        bdrv_co_yield_to_drain(bs, true, parent, poll);
        return;
    }

    GLOBAL_STATE_CODE();

Kevin



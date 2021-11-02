Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA361442E7C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:51:19 +0100 (CET)
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtG2-00067K-IL
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhsZX-0000ej-EG
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:07:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhsZS-00005d-Gv
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635854835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mmTZ6qhHeLBeh/Dcf74OqD6sIxWOz0wnvWK7j2Szh8g=;
 b=GqvPXCacNwdw5fYOIYn7SubjGqgBa+F+GrIB6sQHbtHShywu+/jtOHlHJP3dT/TGDWXeTK
 dDM7MlP/o5uK/kxcThC8AmcDEgkECD+Rd4HWtZb4jNYrCNy52eYt42jxHUMrflsh4xOLDh
 utD5oCbUfdEvWUKHi+PCI4kWLXRSNXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-d27leslWMF-f-ChsbqwcVg-1; Tue, 02 Nov 2021 08:07:13 -0400
X-MC-Unique: d27leslWMF-f-ChsbqwcVg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78367808237;
 Tue,  2 Nov 2021 12:07:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5621A5F4F7;
 Tue,  2 Nov 2021 12:07:04 +0000 (UTC)
Date: Tue, 2 Nov 2021 13:07:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 0/3] linux-aio: allow block devices to limit
 aio-max-batch
Message-ID: <YYEp5lWl2v67c5Wn@redhat.com>
References: <20211026162346.253081-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026162346.253081-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.10.2021 um 18:23 hat Stefano Garzarella geschrieben:
> v1: https://lore.kernel.org/qemu-devel/20210923143100.182979-1-sgarzare@redhat.com
> v2:
> - @aio-max-batch documentation rewrite [Stefan, Kevin]
> - added Stefan and Kevin R-b tags
> 
> Commit d7ddd0a161 ("linux-aio: limit the batch size using
> `aio-max-batch` parameter") added a way to limit the batch size
> of Linux AIO backend for the entire AIO context.
> 
> The same AIO context can be shared by multiple devices, so
> latency-sensitive devices may want to limit the batch size even
> more to avoid increasing latency.
> 
> This series add the `aio-max-batch` option to the file backend,
> and use it in laio_co_submit() and laio_io_unplug() to limit the
> Linux AIO batch size more than the limit set by the AIO context.

Thanks, applied to the block branch.

Kevin



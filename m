Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA162B0907
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:55:19 +0100 (CET)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEwQ-0008CP-VL
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdEtB-0006T4-H8
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:51:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdEt4-0005E9-6J
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605196309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQK8HIx1kVNJ91h4r3LlEA42OrIyGX9Sc7P3Ub4SWZs=;
 b=V9LJdLKIWwSibIhE8Q7eINa1VctDuqBABRegSe2yiq/2shyNgyEZ/g3oNnlWTIThRyeRuK
 v0JC8jCd3LNUpZcWOGwbcYh3EKfGErA3zj3ThXUQxFyRPpnzMSCxCz15L+Y0Ys8BlOc1P9
 hnbuZkERE/A/JkiPsb5EKk5BQZScQFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-S4o0tk8GNgW4Q8TgjuOJSw-1; Thu, 12 Nov 2020 10:51:47 -0500
X-MC-Unique: S4o0tk8GNgW4Q8TgjuOJSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47C3A186841D;
 Thu, 12 Nov 2020 15:51:46 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-37.ams2.redhat.com
 [10.36.114.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E84060C0F;
 Thu, 12 Nov 2020 15:51:30 +0000 (UTC)
Subject: Re: [PATCH for-5.2 10/10] block/export: port virtio-blk read/write
 range check
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-11-stefanha@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a00d46ce-fbdb-eeca-79a5-c17bc50170d1@redhat.com>
Date: Thu, 12 Nov 2020 16:51:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111124331.1393747-11-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.20 13:43, Stefan Hajnoczi wrote:
> Check that the sector number and byte count are valid.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/export/vhost-user-blk-server.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
> index d88e41714d..6d7fd0fec3 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -214,9 +214,23 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
>           QEMUIOVector qiov;
>           if (is_write) {
>               qemu_iovec_init_external(&qiov, out_iov, out_num);
> +
> +            if (unlikely(!vu_blk_sect_range_ok(vexp, req->sector_num,
> +                                               qiov.size))) {
> +                req->in->status = VIRTIO_BLK_S_IOERR;
> +                break;
> +            }
> +
>               ret = blk_co_pwritev(blk, offset, qiov.size, &qiov, 0);
>           } else {
>               qemu_iovec_init_external(&qiov, in_iov, in_num);
> +
> +            if (unlikely(!vu_blk_sect_range_ok(vexp, req->sector_num,
> +                                               qiov.size))) {
> +                req->in->status = VIRTIO_BLK_S_IOERR;
> +                break;
> +            }
> +
>               ret = blk_co_preadv(blk, offset, qiov.size, &qiov, 0);
>           }
>           if (ret >= 0) {

req->sector_num is not a block layer sector, though (i.e. not a 512-byte 
sector); it references sectors of size vexp->blk_size (which I presume 
aren’t necessarily 512 bytes in length).

Second, I now understand why vu_blk_sect_range_ok() takes a byte length; 
but with an arbitrary length as given here, it must also round that down 
when converting that length to block layer sectors.  (Or just compare 
the byte length against the result of bdrv_getlength().)

Max



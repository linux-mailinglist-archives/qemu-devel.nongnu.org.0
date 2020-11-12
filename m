Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CED82B0859
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:26:58 +0100 (CET)
Received: from localhost ([::1]:36654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEUz-00048L-1r
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdEU4-0003dp-Lz
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:26:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdEU0-0003nY-CH
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605194753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aByCAGmirDMhNC7tHmREiG/7uhbpg+0xvcQ6fSKi9Yc=;
 b=YhoZKCn9EvWlN6r2BoRgEHvQtquc1mTkzXUMhjYh4uhTWOLKh5tussR1/DdUxC/wFQpj0e
 qC+oFnWRZkhVvFH5sPBQkFERzT70HjKoua20Tq/JXRFLz9UqtZ5juiQJqp1sfZQD7f3co+
 hL6xsy0JbURZerbJIKL2DQ5ae1jGkBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-HSrAssUnNBy7URglUhYMeA-1; Thu, 12 Nov 2020 10:25:50 -0500
X-MC-Unique: HSrAssUnNBy7URglUhYMeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 997C16415B;
 Thu, 12 Nov 2020 15:25:49 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-37.ams2.redhat.com
 [10.36.114.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F02E255765;
 Thu, 12 Nov 2020 15:25:40 +0000 (UTC)
Subject: Re: [PATCH for-5.2 08/10] block/export: port virtio-blk discard/write
 zeroes input validation
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-9-stefanha@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0446562a-c3bf-cff4-82e2-71b9ae2cf3bf@redhat.com>
Date: Thu, 12 Nov 2020 16:25:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111124331.1393747-9-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
> Validate discard/write zeroes the same way we do for virtio-blk. Some of
> these checks are mandated by the VIRTIO specification, others are
> internal to QEMU.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/export/vhost-user-blk-server.c | 115 +++++++++++++++++++++------
>   1 file changed, 92 insertions(+), 23 deletions(-)
> 
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
> index 62672d1cb9..3295d3c951 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c

[...]

> @@ -58,30 +60,101 @@ static void vu_blk_req_complete(VuBlkReq *req)
>       free(req);
>   }
>   
> +static bool vu_blk_sect_range_ok(VuBlkExport *vexp, uint64_t sector,
> +                                 size_t size)
> +{
> +    uint64_t nb_sectors = size >> BDRV_SECTOR_BITS;
> +    uint64_t total_sectors;
> +
> +    if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {

I wonder why you pass a byte length, then shift it down to sectors, when 
it’s kind of unsafe on the caller’s side to even calculate that byte 
length (because the caller has to verify that shifting the sector count 
up to be a byte length is safe).

Wouldn’t it be simpler to pass nb_sectors (perhaps even as uint64_t, 
because why not) and then compare that against BDRV_REQUEST_MAX_BYTES here?

(With how the code is written, it also has the problem of rounding down 
@size.  Which isn’t a problem in practice because the caller effectively 
guarantees that @size is aligned to sectors, but it still means that the 
code looks a bit strange.  As in, “Why is it safe to round down?  Ah, 
because the caller always produces an aligned value.  But why does the 
caller even pass a byte count, then?  Especially given that the offset 
is passed as a sector index, too.”)

> +        return false;
> +    }
> +    if ((sector << BDRV_SECTOR_BITS) % vexp->blk_size) {

This made me wonder why the discard/write-zeroes sector granularity 
would be BDRV_SECTOR_BITS and not blk_size, which is used for IN/OUT 
(read/write) requests.

I still don’t know, but judging from the only reference I could find 
quickly (contrib/vhost-user-blk/vhost-user-blk.c), it seems correct.

OTOH, I wonder whether BDRV_SECTOR_BITS/BDRV_SECTOR_SIZE are the correct 
constants.  Isn’t it just 9/512 as per some specification, i.e., 
shouldn’t it be independent of qemu’s block layer’s sector size?

> +        return false;
> +    }
> +    blk_get_geometry(vexp->export.blk, &total_sectors);
> +    if (sector > total_sectors || nb_sectors > total_sectors - sector) {
> +        return false;
> +    }
> +    return true;
> +}
> +

[...]

> @@ -170,19 +243,13 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
>       }
>       case VIRTIO_BLK_T_DISCARD:
>       case VIRTIO_BLK_T_WRITE_ZEROES: {
> -        int rc;
> -
>           if (!vexp->writable) {
>               req->in->status = VIRTIO_BLK_S_IOERR;
>               break;
>           }
>   
> -        rc = vu_blk_discard_write_zeroes(blk, &elem->out_sg[1], out_num, type);
> -        if (rc == 0) {
> -            req->in->status = VIRTIO_BLK_S_OK;
> -        } else {
> -            req->in->status = VIRTIO_BLK_S_IOERR;
> -        }
> +        req->in->status = vu_blk_discard_write_zeroes(vexp, elem->out_sg,
> +                                                      out_num, type);

elem->out_sg is different from &elem->out_sg[1], but from what I can 
tell vu_blk_discard_write_zeroes() doesn’t really change in how it 
treats @iov.

I’m confused.  Is that a bug fix?  (If so, it isn’t mentioned in the 
commit message)

Apart from this, the patch looks good to me (although there are the two 
things mentioned above that I find a bit strange, but definitely not wrong).

Max

>           break;
>       }
>       default:



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A366229DB1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 19:03:11 +0200 (CEST)
Received: from localhost ([::1]:34432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyI98-0003jD-52
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 13:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jyI7U-0002Pq-BY
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 13:01:28 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46806
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jyI7S-0003M6-BX
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 13:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595437285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETa5pJZJJlCGYuqKBcyua+gmoDO+2wOQ6iaGeXOOI9k=;
 b=SjFJakv0dcTKlEOnTlkJt8w/eOnPpIn9cHBub0RKTbRD/l1pX32CV0qrioQUM81wRsp/Ak
 kTzxN8y13uqOXs+Yg9Cvv6SjM4JGOi0BxmfR8PqGHn1U/a2Mj1msKu1WZ1E0gz/kTRyhmN
 w+F4SXDt1V62UQ+tHOPcrEGwIR9P5xU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-ZVJIORW3M9CrTNeiszIzuQ-1; Wed, 22 Jul 2020 13:01:22 -0400
X-MC-Unique: ZVJIORW3M9CrTNeiszIzuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAB2D800688;
 Wed, 22 Jul 2020 17:01:21 +0000 (UTC)
Received: from starship (unknown [10.35.206.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 872E65BAD5;
 Wed, 22 Jul 2020 17:01:20 +0000 (UTC)
Message-ID: <498fc3712cd3a0cb0f6588331c47b5d12b7eac96.camel@redhat.com>
Subject: Re: [PATCH for-5.1 1/2] qcow2: Implement v2 zero writes with
 discard if possible
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Date: Wed, 22 Jul 2020 20:01:19 +0300
In-Reply-To: <20200720131810.177978-2-kwolf@redhat.com>
References: <20200720131810.177978-1-kwolf@redhat.com>
 <20200720131810.177978-2-kwolf@redhat.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 21:28:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-07-20 at 15:18 +0200, Kevin Wolf wrote:
> qcow2 version 2 images don't support the zero flag for clusters, so for
> write_zeroes requests, we return -ENOTSUP and get explicit zero buffer
> writes. If the image doesn't have a backing file, we can do better: Just
> discard the respective clusters.
> 
> This is relevant for 'qemu-img convert -O qcow2 -n', where qemu-img has
> to assume that the existing target image may contain any data, so it has
> to write zeroes. Without this patch, this results in a fully allocated
> target image, even if the source image was empty.
> 
> Reported-by: Nir Soffer <nsoffer@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/qcow2-cluster.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> index 4b5fc8c4a7..a677ba9f5c 100644
> --- a/block/qcow2-cluster.c
> +++ b/block/qcow2-cluster.c
> @@ -1797,8 +1797,15 @@ int qcow2_cluster_zeroize(BlockDriverState *bs, uint64_t offset,
>      assert(QEMU_IS_ALIGNED(end_offset, s->cluster_size) ||
>             end_offset >= bs->total_sectors << BDRV_SECTOR_BITS);
>  
> -    /* The zero flag is only supported by version 3 and newer */
> +    /*
> +     * The zero flag is only supported by version 3 and newer. However, if we
> +     * have no backing file, we can resort to discard in version 2.
> +     */
>      if (s->qcow_version < 3) {
> +        if (!bs->backing) {
> +            return qcow2_cluster_discard(bs, offset, bytes,
> +                                         QCOW2_DISCARD_REQUEST, false);
> +        }
>          return -ENOTSUP;
>      }
>  

From my knowelege of nvme, I remember that discard doesn't have to zero the blocks.
There is special namespace capability the indicates the contents of the discarded block.
(Deallocate Logical Block Features)

If and only if the discard behavier flag indicates that discarded areas are zero,
then the write-zero command can have special 'deallocate' flag that hints the controller
to discard the sectors.

So woudn't discarding the clusters have theoretical risk of introducing garbage there?

Best regards,
	Maxim Levitsky



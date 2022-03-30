Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002D44EC69D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 16:34:00 +0200 (CEST)
Received: from localhost ([::1]:55746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZZOZ-0006qr-Gt
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 10:33:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nZZMx-0005yh-3a
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nZZMt-0002zG-VM
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648650734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tjc6K4AM/ilRwvasUFHsrpEL1fnCaqccmDTnTNiVfz4=;
 b=fHNTUF51VOOj6FFoOtd2JG7DM0vJe6fZGMrYbqkWZ6v1By20xM1stAWPjh1lS2kHJRQg8P
 7KDqvW2fUiycqq2ejjQTRpZ7VIPHAIcv1B3U612rTyhYs1G8zQTaJjOUN34AhBdQgiMNSp
 ODedYbXNRi+r1iteYcWgBrS9//RHzEY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-V7F33w99MpKnHLRMfBoy2A-1; Wed, 30 Mar 2022 10:32:09 -0400
X-MC-Unique: V7F33w99MpKnHLRMfBoy2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E77153803522;
 Wed, 30 Mar 2022 14:32:08 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2EE640D0160;
 Wed, 30 Mar 2022 14:32:07 +0000 (UTC)
Date: Wed, 30 Mar 2022 09:32:06 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 1/2] qcow2: Improve refcount structure rebuilding
Message-ID: <20220330143206.eo2rreenm5rs5dr3@redhat.com>
References: <20220329091917.24512-1-hreitz@redhat.com>
 <20220329091917.24512-2-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220329091917.24512-2-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-524-5b0234
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 11:19:16AM +0200, Hanna Reitz wrote:
> When rebuilding the refcount structures (when qemu-img check -r found
> errors with refcount = 0, but reference count > 0), the new refcount
> table defaults to being put at the image file end[1].  There is no good
> reason for that except that it means we will not have to rewrite any
> refblocks we already wrote to disk.
> 
> Changing the code to rewrite those refblocks is not too difficult,
> though, so let us do that.  That is beneficial for images on block
> devices, where we cannot really write beyond the end of the image file.
> 
> Use this opportunity to add extensive comments to the code, and refactor
> it a bit, getting rid of the backwards-jumping goto.
> 
> [1] Unless there is something allocated in the area pointed to by the
>     last refblock, so we have to write that refblock.  In that case, we
>     try to put the reftable in there.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1519071
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/941
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block/qcow2-refcount.c | 332 +++++++++++++++++++++++++++++------------
>  1 file changed, 235 insertions(+), 97 deletions(-)
> 

> +static int rebuild_refcounts_write_refblocks(
> +        BlockDriverState *bs, void **refcount_table, int64_t *nb_clusters,
> +        int64_t first_cluster, int64_t end_cluster,
> +        uint64_t **on_disk_reftable_ptr, uint32_t *on_disk_reftable_entries_ptr
> +    )

As you are rewriting this into a helper function, should this function
take Error **errp,...

> +            /* Don't allocate a cluster in a refblock already written to disk */
> +            if (first_free_cluster < refblock_start) {
> +                first_free_cluster = refblock_start;
> +            }
> +            refblock_offset = alloc_clusters_imrt(bs, 1, refcount_table,
> +                                                  nb_clusters,
> +                                                  &first_free_cluster);
> +            if (refblock_offset < 0) {
> +                fprintf(stderr, "ERROR allocating refblock: %s\n",
> +                        strerror(-refblock_offset));
> +                return refblock_offset;

...instead of using fprintf(stderr), where the caller then handles the
error by printing?

Could be done as a separate patch.

>  
> +        /* Refblock is allocated, write it to disk */
> +
>          ret = qcow2_pre_write_overlap_check(bs, 0, refblock_offset,
>                                              s->cluster_size, false);
>          if (ret < 0) {
>              fprintf(stderr, "ERROR writing refblock: %s\n", strerror(-ret));
> -            goto fail;
> +            return ret;
>          }

Another spot where errp conversion might improve the code.

>  
> -        /* The size of *refcount_table is always cluster-aligned, therefore the
> -         * write operation will not overflow */
> +        /*
> +         * The refblock is simply a slice of *refcount_table.
> +         * Note that the size of *refcount_table is always aligned to
> +         * whole clusters, so the write operation will not result in
> +         * out-of-bounds accesses.
> +         */
>          on_disk_refblock = (void *)((char *) *refcount_table +
>                                      refblock_index * s->cluster_size);
>  
> @@ -2550,23 +2579,99 @@ write_refblocks:
>                            s->cluster_size);
>          if (ret < 0) {
>              fprintf(stderr, "ERROR writing refblock: %s\n", strerror(-ret));
> -            goto fail;
> +            return ret;
>          }

and another

>  
> -        /* Go to the end of this refblock */
> +        /* This refblock is done, skip to its end */
>          cluster = refblock_start + s->refcount_block_size - 1;
>      }
>  
> -    if (reftable_offset < 0) {
> -        uint64_t post_refblock_start, reftable_clusters;
> +    return reftable_grown;
> +}

The helper function looks okay.

> +
> +/*
> + * Creates a new refcount structure based solely on the in-memory information
> + * given through *refcount_table (this in-memory information is basically just
> + * the concatenation of all refblocks).  All necessary allocations will be
> + * reflected in that array.
> + *
> + * On success, the old refcount structure is leaked (it will be covered by the
> + * new refcount structure).
> + */
> +static int rebuild_refcount_structure(BlockDriverState *bs,
> +                                      BdrvCheckResult *res,
> +                                      void **refcount_table,
> +                                      int64_t *nb_clusters)
> +{
> +    BDRVQcow2State *s = bs->opaque;
> +    int64_t reftable_offset = -1;
> +    int64_t reftable_length = 0;
> +    int64_t reftable_clusters;
> +    int64_t refblock_index;
> +    uint32_t on_disk_reftable_entries = 0;
> +    uint64_t *on_disk_reftable = NULL;
> +    int ret = 0;
> +    int reftable_size_changed = 0;
> +    struct {
> +        uint64_t reftable_offset;
> +        uint32_t reftable_clusters;
> +    } QEMU_PACKED reftable_offset_and_clusters;
> +
> +    qcow2_cache_empty(bs, s->refcount_block_cache);
> +
> +    /*
> +     * For each refblock containing entries, we try to allocate a
> +     * cluster (in the in-memory refcount table) and write its offset
> +     * into on_disk_reftable[].  We then write the whole refblock to
> +     * disk (as a slice of the in-memory refcount table).
> +     * This is done by rebuild_refcounts_write_refblocks().
> +     *
> +     * Once we have scanned all clusters, we try to find space for the
> +     * reftable.  This will dirty the in-memory refcount table (i.e.
> +     * make it differ from the refblocks we have already written), so we
> +     * need to run rebuild_refcounts_write_refblocks() again for the
> +     * range of clusters where the reftable has been allocated.
> +     *
> +     * This second run might make the reftable grow again, in which case
> +     * we will need to allocate another space for it, which is why we
> +     * repeat all this until the reftable stops growing.
> +     *
> +     * (This loop will terminate, because with every cluster the
> +     * reftable grows, it can accomodate a multitude of more refcounts,
> +     * so that at some point this must be able to cover the reftable
> +     * and all refblocks describing it.)
> +     *
> +     * We then convert the reftable to big-endian and write it to disk.
> +     *
> +     * Note that we never free any reftable allocations.  Doing so would
> +     * needlessly complicate the algorithm: The eventual second check
> +     * run we do will clean up all leaks we have caused.
> +     */

Freeing reftable allocations from the first run might allow the second
(or third) to find a spot earlier in the image that is large enough to
contain the resized reftable, compared to leaving it leaked and
forcing subsequent runs to look later into the image.  But I agree
that the complication of code needed to handle that is not worth the
minor corner-case savings of a more densely packed overall image (the
leaked clusters will probably remain sparse for any decent cluster
size).

Another approach might be to intentionally over-allocate the reftable
to the point where we know it can't grow, then allocate, then scale it
back down to how much we actually used (possibly reclaiming a few
clusters at the end of the allocation).  But that's an even bigger
rewrite, and again, not worth the headache.

512-byte clusters would be where this is most likely to be noticeable
(that is, hitting a 3rd iteration with 512-byte clusters is probably
easy enough to actually test, but hitting a 3rd iteration with 2M
clusters is probably prohibitively expensive if even possible).

> +
> +    reftable_size_changed =
> +        rebuild_refcounts_write_refblocks(bs, refcount_table, nb_clusters,
> +                                          0, *nb_clusters,
> +                                          &on_disk_reftable,
> +                                          &on_disk_reftable_entries);
> +    if (reftable_size_changed < 0) {
> +        res->check_errors++;
> +        ret = reftable_size_changed;
> +        goto fail;
> +    }
> +
> +    /*
> +     * There was no reftable before, so rebuild_refcounts_write_refblocks()
> +     * must have increased its size (from 0 to something).
> +     */
> +    assert(reftable_size_changed == true);

'int == bool'.  Works, but is a bit odd.  I might have done just
assert(reftable_size_changed), since we just ruled out negative values
above.  Particularly since...

> +
> +    do {
> +        int64_t reftable_start_cluster, reftable_end_cluster;
> +        int64_t first_free_cluster = 0;
...
> +
> +        /*
> +         * If the reftable size has changed, we will need to find a new
> +         * allocation, repeating the loop.
> +         */
> +    } while (reftable_size_changed);

...here you ARE using the int as a bool directly.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



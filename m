Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F64EEE95
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:55:02 +0200 (CEST)
Received: from localhost ([::1]:53898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHjx-0001lP-TS
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:55:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHeU-0004M0-By
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHeQ-0002rh-Ng
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648820956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5aZ8T9CmBzdxNW0ycVIIFdkNYUyNRz76jQ4X/YcHZ9g=;
 b=hFgXYrHzqe4/mdVhukC7tJAihhiRrX7DXpjVXeAw4ngw/fCOytycvTICDA1zuOoBft6StL
 9ntFpq9faC4Ksy7y1IJdrxSFRiep8nWoSTDvOnwmOVhh2eWxlanxtZnr+OU5B43Wz3oHZF
 z5mtQ3f6d+UQwd/GzGRMQDyniazVziE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-C7Chx9yJPICcAoJZdcGgmA-1; Fri, 01 Apr 2022 09:49:16 -0400
X-MC-Unique: C7Chx9yJPICcAoJZdcGgmA-1
Received: by mail-ej1-f71.google.com with SMTP id
 er8-20020a170907738800b006e003254d86so1617023ejc.11
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5aZ8T9CmBzdxNW0ycVIIFdkNYUyNRz76jQ4X/YcHZ9g=;
 b=r+HMH9std/cPskEpeGAqczaDo7VWn7ri7ixaSkt3tWQwXlKsNzzfRSLnlDaYoCdfoN
 tHZPnI/6gqA3xpQ2YaBrf5p3UPZ7V6wlHJS0lDC6PA1widTLzH3ptFYpYc/OyhVtfixk
 Uc/UA2aEhZSEhNW4eKTUNMbwbjIO+9Y0dshWU4BxLdbdoCJoowtl9x6CSMT4rZ8BI3SI
 JaNTX6jUDdjRSeJsAxnn186hPfsAFx/JgdNsRYNFdRjh2vOdDgdwXNpreJYDwYwUZj+Q
 e0jl2VMmHuDLS/oPKlgNg3d/j8Dx1G+1XxB7dHP2G9XNwLZLZkLPNwtUGJE7uuodRT8F
 YfqQ==
X-Gm-Message-State: AOAM532l0zu4ep3vSLDnaJCiN32V2k1IDlTjp+eMH3mT21UtwdKzxw+m
 6sBtqS5pt+Kmf1XLJCfM3J7ZC1yBTW3TM9MSMDLN7c0FPNGlJGzYTs7Mk5VPJzFVIlbIBuSPWXw
 k1Euqx49NHar2GdQ=
X-Received: by 2002:a17:907:1dc8:b0:6df:f5fc:f4f9 with SMTP id
 og8-20020a1709071dc800b006dff5fcf4f9mr9310725ejc.739.1648820954751; 
 Fri, 01 Apr 2022 06:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuvbnN+1CGhwfTJCilyuhhUGS3AFeTObCPNDgHTUDnpZdf3N/pKAGTrSPeHftUm89xE8SEFA==
X-Received: by 2002:a17:907:1dc8:b0:6df:f5fc:f4f9 with SMTP id
 og8-20020a1709071dc800b006dff5fcf4f9mr9310706ejc.739.1648820954424; 
 Fri, 01 Apr 2022 06:49:14 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 ss12-20020a170907038c00b006e0ec9e806dsm1041109ejb.136.2022.04.01.06.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:49:13 -0700 (PDT)
Message-ID: <1f6c6655-792a-2e63-3ae8-7509350b6e5d@redhat.com>
Date: Fri, 1 Apr 2022 15:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] qcow2: Improve refcount structure rebuilding
To: Eric Blake <eblake@redhat.com>
References: <20220329091917.24512-1-hreitz@redhat.com>
 <20220329091917.24512-2-hreitz@redhat.com>
 <20220330143206.eo2rreenm5rs5dr3@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330143206.eo2rreenm5rs5dr3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 30.03.22 16:32, Eric Blake wrote:
> On Tue, Mar 29, 2022 at 11:19:16AM +0200, Hanna Reitz wrote:
>> When rebuilding the refcount structures (when qemu-img check -r found
>> errors with refcount = 0, but reference count > 0), the new refcount
>> table defaults to being put at the image file end[1].  There is no good
>> reason for that except that it means we will not have to rewrite any
>> refblocks we already wrote to disk.
>>
>> Changing the code to rewrite those refblocks is not too difficult,
>> though, so let us do that.  That is beneficial for images on block
>> devices, where we cannot really write beyond the end of the image file.
>>
>> Use this opportunity to add extensive comments to the code, and refactor
>> it a bit, getting rid of the backwards-jumping goto.
>>
>> [1] Unless there is something allocated in the area pointed to by the
>>      last refblock, so we have to write that refblock.  In that case, we
>>      try to put the reftable in there.
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1519071
>> Closes: https://gitlab.com/qemu-project/qemu/-/issues/941
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   block/qcow2-refcount.c | 332 +++++++++++++++++++++++++++++------------
>>   1 file changed, 235 insertions(+), 97 deletions(-)
>>
>> +static int rebuild_refcounts_write_refblocks(
>> +        BlockDriverState *bs, void **refcount_table, int64_t *nb_clusters,
>> +        int64_t first_cluster, int64_t end_cluster,
>> +        uint64_t **on_disk_reftable_ptr, uint32_t *on_disk_reftable_entries_ptr
>> +    )
> As you are rewriting this into a helper function, should this function
> take Error **errp,...
>
>> +            /* Don't allocate a cluster in a refblock already written to disk */
>> +            if (first_free_cluster < refblock_start) {
>> +                first_free_cluster = refblock_start;
>> +            }
>> +            refblock_offset = alloc_clusters_imrt(bs, 1, refcount_table,
>> +                                                  nb_clusters,
>> +                                                  &first_free_cluster);
>> +            if (refblock_offset < 0) {
>> +                fprintf(stderr, "ERROR allocating refblock: %s\n",
>> +                        strerror(-refblock_offset));
>> +                return refblock_offset;
> ...instead of using fprintf(stderr), where the caller then handles the
> error by printing?
>
> Could be done as a separate patch.

Sounds good!  I don’t know whether a separate patch is better or not, 
but since you gave an R-b on this one as-is, I will send it as a 
separate patch (together in one v3 series, though).

>>   
>> +        /* Refblock is allocated, write it to disk */
>> +
>>           ret = qcow2_pre_write_overlap_check(bs, 0, refblock_offset,
>>                                               s->cluster_size, false);
>>           if (ret < 0) {
>>               fprintf(stderr, "ERROR writing refblock: %s\n", strerror(-ret));
>> -            goto fail;
>> +            return ret;
>>           }
> Another spot where errp conversion might improve the code.
>
>>   
>> -        /* The size of *refcount_table is always cluster-aligned, therefore the
>> -         * write operation will not overflow */
>> +        /*
>> +         * The refblock is simply a slice of *refcount_table.
>> +         * Note that the size of *refcount_table is always aligned to
>> +         * whole clusters, so the write operation will not result in
>> +         * out-of-bounds accesses.
>> +         */
>>           on_disk_refblock = (void *)((char *) *refcount_table +
>>                                       refblock_index * s->cluster_size);
>>   
>> @@ -2550,23 +2579,99 @@ write_refblocks:
>>                             s->cluster_size);
>>           if (ret < 0) {
>>               fprintf(stderr, "ERROR writing refblock: %s\n", strerror(-ret));
>> -            goto fail;
>> +            return ret;
>>           }
> and another
>
>>   
>> -        /* Go to the end of this refblock */
>> +        /* This refblock is done, skip to its end */
>>           cluster = refblock_start + s->refcount_block_size - 1;
>>       }
>>   
>> -    if (reftable_offset < 0) {
>> -        uint64_t post_refblock_start, reftable_clusters;
>> +    return reftable_grown;
>> +}
> The helper function looks okay.
>
>> +
>> +/*
>> + * Creates a new refcount structure based solely on the in-memory information
>> + * given through *refcount_table (this in-memory information is basically just
>> + * the concatenation of all refblocks).  All necessary allocations will be
>> + * reflected in that array.
>> + *
>> + * On success, the old refcount structure is leaked (it will be covered by the
>> + * new refcount structure).
>> + */
>> +static int rebuild_refcount_structure(BlockDriverState *bs,
>> +                                      BdrvCheckResult *res,
>> +                                      void **refcount_table,
>> +                                      int64_t *nb_clusters)
>> +{
>> +    BDRVQcow2State *s = bs->opaque;
>> +    int64_t reftable_offset = -1;
>> +    int64_t reftable_length = 0;
>> +    int64_t reftable_clusters;
>> +    int64_t refblock_index;
>> +    uint32_t on_disk_reftable_entries = 0;
>> +    uint64_t *on_disk_reftable = NULL;
>> +    int ret = 0;
>> +    int reftable_size_changed = 0;
>> +    struct {
>> +        uint64_t reftable_offset;
>> +        uint32_t reftable_clusters;
>> +    } QEMU_PACKED reftable_offset_and_clusters;
>> +
>> +    qcow2_cache_empty(bs, s->refcount_block_cache);
>> +
>> +    /*
>> +     * For each refblock containing entries, we try to allocate a
>> +     * cluster (in the in-memory refcount table) and write its offset
>> +     * into on_disk_reftable[].  We then write the whole refblock to
>> +     * disk (as a slice of the in-memory refcount table).
>> +     * This is done by rebuild_refcounts_write_refblocks().
>> +     *
>> +     * Once we have scanned all clusters, we try to find space for the
>> +     * reftable.  This will dirty the in-memory refcount table (i.e.
>> +     * make it differ from the refblocks we have already written), so we
>> +     * need to run rebuild_refcounts_write_refblocks() again for the
>> +     * range of clusters where the reftable has been allocated.
>> +     *
>> +     * This second run might make the reftable grow again, in which case
>> +     * we will need to allocate another space for it, which is why we
>> +     * repeat all this until the reftable stops growing.
>> +     *
>> +     * (This loop will terminate, because with every cluster the
>> +     * reftable grows, it can accomodate a multitude of more refcounts,
>> +     * so that at some point this must be able to cover the reftable
>> +     * and all refblocks describing it.)
>> +     *
>> +     * We then convert the reftable to big-endian and write it to disk.
>> +     *
>> +     * Note that we never free any reftable allocations.  Doing so would
>> +     * needlessly complicate the algorithm: The eventual second check
>> +     * run we do will clean up all leaks we have caused.
>> +     */
> Freeing reftable allocations from the first run might allow the second
> (or third) to find a spot earlier in the image that is large enough to
> contain the resized reftable, compared to leaving it leaked and
> forcing subsequent runs to look later into the image.  But I agree
> that the complication of code needed to handle that is not worth the
> minor corner-case savings of a more densely packed overall image (the
> leaked clusters will probably remain sparse for any decent cluster
> size).
>
> Another approach might be to intentionally over-allocate the reftable
> to the point where we know it can't grow, then allocate, then scale it
> back down to how much we actually used (possibly reclaiming a few
> clusters at the end of the allocation).  But that's an even bigger
> rewrite, and again, not worth the headache.
>
> 512-byte clusters would be where this is most likely to be noticeable
> (that is, hitting a 3rd iteration with 512-byte clusters is probably
> easy enough to actually test, but hitting a 3rd iteration with 2M
> clusters is probably prohibitively expensive if even possible).

Yes, I figured it’s complex enough as-is.  Perhaps later(tm) someone(tm) 
can try their hand on improving this. O:)

>> +
>> +    reftable_size_changed =
>> +        rebuild_refcounts_write_refblocks(bs, refcount_table, nb_clusters,
>> +                                          0, *nb_clusters,
>> +                                          &on_disk_reftable,
>> +                                          &on_disk_reftable_entries);
>> +    if (reftable_size_changed < 0) {
>> +        res->check_errors++;
>> +        ret = reftable_size_changed;
>> +        goto fail;
>> +    }
>> +
>> +    /*
>> +     * There was no reftable before, so rebuild_refcounts_write_refblocks()
>> +     * must have increased its size (from 0 to something).
>> +     */
>> +    assert(reftable_size_changed == true);
> 'int == bool'.  Works, but is a bit odd.  I might have done just
> assert(reftable_size_changed), since we just ruled out negative values
> above.  Particularly since...

OK, sure.  (I guess I wanted to make the point that the return value on 
success is just a bool, hence the explicit `true` here, but if it 
doesn’t help, I’ll abbreviate it.)

>> +
>> +    do {
>> +        int64_t reftable_start_cluster, reftable_end_cluster;
>> +        int64_t first_free_cluster = 0;
> ...
>> +
>> +        /*
>> +         * If the reftable size has changed, we will need to find a new
>> +         * allocation, repeating the loop.
>> +         */
>> +    } while (reftable_size_changed);
> ...here you ARE using the int as a bool directly.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks a lot!

Hanna



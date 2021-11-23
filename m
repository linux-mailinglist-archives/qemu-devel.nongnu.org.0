Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A133E459C77
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 07:58:16 +0100 (CET)
Received: from localhost ([::1]:47234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpPkt-0003Pq-8n
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 01:58:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mpPjs-0002cb-2B
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 01:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mpPjn-0004nL-NB
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 01:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637650625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWUj1kggOJwVn9nufANfVaiqNMAveWmuMeYYz856+vQ=;
 b=RDugUy/ArJgAv1mkmcPlcMIcMglRYjswiSVqd/97UDd5+T/nF+Sr43SHP/XDBKDb08G/bt
 GZ3JNDOYoS0iDo2PSRxqVUuajI3Cq8Zs3frVaBvqkwEaUimOT45TomRAQb7E3h7JgPE7xV
 sPjKyXWMxjUjhNxVGNRHrOBXwprLOSY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377--7YVfEujMtWMrBtXtsjP6g-1; Tue, 23 Nov 2021 01:57:04 -0500
X-MC-Unique: -7YVfEujMtWMrBtXtsjP6g-1
Received: by mail-pf1-f197.google.com with SMTP id
 c6-20020aa781c6000000b004a4fcdf1d6dso1418361pfn.4
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 22:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GWUj1kggOJwVn9nufANfVaiqNMAveWmuMeYYz856+vQ=;
 b=EjgqaglTF0suT7gYKyrl8qooHjqTY2u4IKom+MFO5mhCtQrO9D4mbfjSM9/y1enY6T
 Y2koWB9gFqH4QUGs+pwKntqbEpoWo2bW1hbjIAMTrTvO9jA0Uss5WPXE3pZKbDG/ObLZ
 sZje3eWt3gXaPMJOpaRltrDxrSWZOZ2focY5LhgJq7BlmXPQHn88JtgQTMrni5HCJTeh
 cFWJgasrGw3+BzTwmMQ9Ti05f9nBMNvWRv/pwsxcqwUPDlq1IfjPXTjUL0uAUjQi1qTs
 +1aGgiaYRV8PgcV6cj3cP4YZx63M1cAyqeWQ/eO1tRQHlxpixvVFJdjOpdt2ozB/lA66
 PhBQ==
X-Gm-Message-State: AOAM530Zrvp8nw5tl/LtVEobieFecewwk94q0sgu0LMRoRnB+0VgPmJV
 EUN+3A6QG6pQE+TNFdZpqTAgxxH5x1wcoNhWH+Uz6M8Iruq/rpiByeg4FI0VsMxP7UJIKsmF1lQ
 Py7owpJpyBEPBp+0=
X-Received: by 2002:a17:90b:1bc4:: with SMTP id
 oa4mr180966pjb.179.1637650623340; 
 Mon, 22 Nov 2021 22:57:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPL2QJKjoHPmdLbtxKbySabAMZ4bDIWG493PG9oDl/f0ZYXaMp+tb1JDcCUCke02dyT0JXrw==
X-Received: by 2002:a17:90b:1bc4:: with SMTP id
 oa4mr180909pjb.179.1637650623001; 
 Mon, 22 Nov 2021 22:57:03 -0800 (PST)
Received: from xz-m1.local ([191.101.132.71])
 by smtp.gmail.com with ESMTPSA id md6sm107102pjb.22.2021.11.22.22.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 22:57:01 -0800 (PST)
Date: Tue, 23 Nov 2021 14:56:52 +0800
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH v5 23/26] util: Add iova_tree_alloc
Message-ID: <YZyQtF0SIPcVZI+v@xz-m1.local>
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-24-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211029183525.1776416-24-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org, Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Eugenio,

Sorry for the super late response.

On Fri, Oct 29, 2021 at 08:35:22PM +0200, Eugenio Pérez wrote:

[...]

> +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> +                    hwaddr iova_last)
> +{
> +    struct IOVATreeAllocArgs args = {
> +        .new_size = map->size,
> +        .iova_begin = iova_begin,
> +        .iova_last = iova_last,
> +    };
> +
> +    if (iova_begin == 0) {
> +        /* Some devices does not like addr 0 */
> +        iova_begin += qemu_real_host_page_size;
> +    }

Any explanation of why zero is not welcomed?

It would be great if we can move this out of iova-tree.c, because that doesn't
look like a good place to, e.g. reference qemu_real_host_page_size, anyways.
The caller can simply pass in qemu_real_host_page_size as iova_begin when
needed (and I highly doubt it'll be a must for all iova-tree users..)

> +
> +    assert(iova_begin < iova_last);
> +
> +    /*
> +     * Find a valid hole for the mapping
> +     *
> +     * Assuming low iova_begin, so no need to do a binary search to
> +     * locate the first node.
> +     *
> +     * TODO: We can improve the search speed if we save the beginning and the
> +     * end of holes, so we don't iterate over the previous saved ones.
> +     *
> +     * TODO: Replace all this with g_tree_node_first/next/last when available
> +     * (from glib since 2.68). To do it with g_tree_foreach complicates the
> +     * code a lot.
> +     *
> +     */
> +    g_tree_foreach(tree->tree, iova_tree_alloc_traverse, &args);
> +    if (!iova_tree_alloc_map_in_hole(&args)) {
> +        /*
> +         * 2nd try: Last iteration left args->right as the last DMAMap. But
> +         * (right, end) hole needs to be checked too
> +         */
> +        iova_tree_alloc_args_iterate(&args, NULL);
> +        if (!iova_tree_alloc_map_in_hole(&args)) {
> +            return IOVA_ERR_NOMEM;
> +        }
> +    }
> +
> +    map->iova = MAX(iova_begin,
> +                    args.hole_left ?
> +                    args.hole_left->iova + args.hole_left->size + 1 : 0);
> +    return iova_tree_insert(tree, map);
> +}

Re the algorithm - I totally agree Jason's version is much better.

Thanks,

-- 
Peter Xu



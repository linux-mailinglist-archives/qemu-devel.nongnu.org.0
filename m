Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AADC3218BB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:31:33 +0100 (CET)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBJE-0004ZB-65
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEBF8-0001hi-Re
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:27:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEBEz-0005pj-DB
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614000427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Y7gOJHV21lHKvyedE/MISQHuj93xcXD147ey4bS6po=;
 b=TlzZkBVq9rsGZ9GLg8U3XXy8yYVN0uYISdq5IlCJUqrURn/2zEU9HVCm3VgNmpuEwJnPP7
 XFeIrR4xhXpSSP4TGTtjv4unRrLrbW9FLJ7ljRDlsQwcCbrj21MJT7bHNvemeySD0IPWVS
 sWubeQM+goasg+QRSuf4AXzKPUl4Z0w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-PSZzdHVRMDm5LGOz8g9X6g-1; Mon, 22 Feb 2021 08:27:06 -0500
X-MC-Unique: PSZzdHVRMDm5LGOz8g9X6g-1
Received: by mail-ed1-f70.google.com with SMTP id dk21so6957904edb.10
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:27:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Y7gOJHV21lHKvyedE/MISQHuj93xcXD147ey4bS6po=;
 b=KRzOwv3N7cMMxct/JIcqvQ6xzsUDa9d8MUfgjYZU7LERVtFcHhi9LBtqnM1G90umTN
 c/mRZav703LiGE9s9Cib9HELJxDFi9+eEd6gpZ/Gka418P0F6edwuKtEtIs8rEBLnq1H
 R03+dW9lt2Y3ZLZl5Gtn44wawNn0REzLljE8YShGhW7x8jGYT+Mowi1xOSrF7WM7AIuP
 PrcprrMHxtEttUIfzS/X1Q77EMYkvE1xHXZGt6+mKYfzOexZphwZnq+yAZQVxmETPnSn
 TLShcazbjUUofEso2Otz3IRYrNwqwZ5CcHdlldhBiyelbvEe1+CeYvwSD/JwKLy+XpHk
 jNMA==
X-Gm-Message-State: AOAM533ajdtoceYU1qKnwH+6ZtiG9AiBGJbZ50ZIUMRy4r9cFkvtvoab
 GWuI76RRtEsyjTmAzHJurGli/jxYXpODQUcPVRJg5csEG88N0CpcjgtUh3fhMdOyV/98Na5GkZt
 +SLjK/LPJeR5e+24=
X-Received: by 2002:a05:6402:c8e:: with SMTP id
 cm14mr16615661edb.33.1614000425094; 
 Mon, 22 Feb 2021 05:27:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVthZnOWSRT0csPOXWUhqyJy5YuL6gUP+ra9sPBdMAvX9Z0ryh9QyZ4kvE/+nPwhvzRDZIJQ==
X-Received: by 2002:a05:6402:c8e:: with SMTP id
 cm14mr16615638edb.33.1614000424917; 
 Mon, 22 Feb 2021 05:27:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t11sm12064670edd.1.2021.02.22.05.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:27:04 -0800 (PST)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-2-david@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 01/12] memory: Introduce RamDiscardMgr for RAM memory
 regions
Message-ID: <7137d1ad-2741-7536-5a3c-58d0c4f8306b@redhat.com>
Date: Mon, 22 Feb 2021 14:27:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222115708.7623-2-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/21 12:56, David Hildenbrand wrote:
> 
> +    /**
> +     * @get_min_granularity:
> +     *
> +     * Get the minimum granularity in which listeners will get notified
> +     * about changes within the #MemoryRegion via the #RamDiscardMgr.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     *
> +     * Returns the minimum granularity.
> +     */
> +    uint64_t (*get_min_granularity)(const RamDiscardMgr *rdm,
> +                                    const MemoryRegion *mr);
> +
> +    /**
> +     * @is_populated:
> +     *
> +     * Check whether the given range within the #MemoryRegion is completely
> +     * populated (i.e., no parts are currently discarded). There are no
> +     * alignment requirements for the range.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     * @offset: offset into the #MemoryRegion
> +     * @size: size in the #MemoryRegion
> +     *
> +     * Returns whether the given range is completely populated.
> +     */
> +    bool (*is_populated)(const RamDiscardMgr *rdm, const MemoryRegion *mr,
> +                         ram_addr_t offset, ram_addr_t size);
> +
> +    /**
> +     * @register_listener:
> +     *
> +     * Register a #RamDiscardListener for a #MemoryRegion via the
> +     * #RamDiscardMgr and immediately notify the #RamDiscardListener about all
> +     * populated parts within the #MemoryRegion via the #RamDiscardMgr.
> +     *
> +     * In case any notification fails, no further notifications are triggered
> +     * and an error is logged.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     * @rdl: the #RamDiscardListener
> +     */
> +    void (*register_listener)(RamDiscardMgr *rdm, const MemoryRegion *mr,
> +                              RamDiscardListener *rdl);
> +
> +    /**
> +     * @unregister_listener:
> +     *
> +     * Unregister a previously registered #RamDiscardListener for a
> +     * #MemoryRegion via the #RamDiscardMgr after notifying the
> +     * #RamDiscardListener about all populated parts becoming unpopulated
> +     * within the #MemoryRegion via the #RamDiscardMgr.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     * @rdl: the #RamDiscardListener
> +     */
> +    void (*unregister_listener)(RamDiscardMgr *rdm, const MemoryRegion *mr,
> +                                RamDiscardListener *rdl);
> +
> +    /**
> +     * @replay_populated:
> +     *
> +     * Notify the #RamDiscardListener about all populated parts within the
> +     * #MemoryRegion via the #RamDiscardMgr.
> +     *
> +     * In case any notification fails, no further notifications are triggered.
> +     * The listener is not required to be registered.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     * @rdl: the #RamDiscardListener
> +     *
> +     * Returns 0 on success, or a negative error if any notification failed.
> +     */
> +    int (*replay_populated)(const RamDiscardMgr *rdm, const MemoryRegion *mr,
> +                            RamDiscardListener *rdl);

If this function is only going to use a single callback, just pass it 
(together with a void *opaque) as the argument.
> +};
> +
>  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
>  typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
>  
> @@ -487,6 +683,7 @@ struct MemoryRegion {
>      const char *name;
>      unsigned ioeventfd_nb;
>      MemoryRegionIoeventfd *ioeventfds;
> +    RamDiscardMgr *rdm; /* Only for RAM */
>  };


The idea of sending discard notifications is obviously good.  I have a 
couple of questions on the design that you used for the interface; I'm 
not saying that it should be done differently, I would only like to 
understand the trade offs that you chose:

1) can the RamDiscardManager (no abbreviations :)) be just the owner of 
the memory region (obj->parent)?  Alternatively, if you want to make it 
separate from the owner, does it make sense for it to be a separate 
reusable object, sitting between virtio-mem and the MemoryRegion, so 
that the implementation can be reused?

2) why have the new RamDiscardListener instead of just extending 
MemoryListener? Conveniently, vfio already has a MemoryListener that can 
be extended, and you wouldn't need the list of RamDiscardListeners. 
There is already a precedent of replaying the current state when a 
listener is added (see listener_add_address_space), so this is not 
something different between ML and RDL.

Also, if you add a new interface, you should have "method call" wrappers 
similar to user_creatable_complete or user_creatable_can_be_deleted.

Thanks,

Paolo



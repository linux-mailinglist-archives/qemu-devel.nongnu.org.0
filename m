Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB0A3D3A90
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 14:52:43 +0200 (CEST)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ufS-0003yg-Da
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 08:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6ueL-0003CI-LR
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6ueK-0008AR-1C
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627044691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZMtHzKg345eZYvvQAlpAK9IJ9bhNF6jGI3QYF0qW0go=;
 b=I9iKGLjBASgxN6zjZuhNbMRSCLq76aJLdFr8c1zaXNB5yZZILbhitadcvcYiz/A/MtZcVQ
 5pBv7Re7cU2+iKkUH+9bwMN1E4k/bFsEFfm9prk9j4bbUz96mNkjZGhkpEHdXX3LEVFHl0
 WDkdSvux9R5Elsbhx7tG5bZ7FXzuHas=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-lvKs0_zFMreWPBxyKSwXig-1; Fri, 23 Jul 2021 08:51:30 -0400
X-MC-Unique: lvKs0_zFMreWPBxyKSwXig-1
Received: by mail-qv1-f72.google.com with SMTP id
 m7-20020a0cf1870000b0290317f589a54fso1829883qvl.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 05:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZMtHzKg345eZYvvQAlpAK9IJ9bhNF6jGI3QYF0qW0go=;
 b=iJi+z0eWkG8Wo6NfQJ46jeMdIySfWhmcMBj0+Hye2yWkc1nSdzDbUp8q1Iddd7WX+a
 MQikOshCidvoWoQmTazxcmo+M9Do1PBA34hcWlOqeEEqB623FiWDuYq+Ax3TiGOGC6bg
 Tw3Qm6z3ZXH/cC/VBhPdYtNB5YGMuBWiwi/wHOU+2zRyOSa7UtCNIYQDvbKGKYLD7zwv
 CRGM6ClyLayqLwuOOSJvlZqdxAtUc3q7kdxM8pCbHIC1RwobDRCsgqlouAgdDGTj3M+6
 +Zooehw0qsBTWPczZhL7dQrOYDTmqsqgUMp5ZbnubaN2NXWsZpROjGe5NxMdcAGrX+zO
 NZiw==
X-Gm-Message-State: AOAM532mmx2BT/WgKf/ZQtnT+p7oL0l/GuhPll6T8dA84s7wmdDWyjM2
 lCes4O46334x4gYKmSXNWQpppnkiiWei+Z4PHyKPXEKbGZICGcagxvgUm5/GyfsuDBP7P8X35IY
 tUbb8Slm10NUJAhA=
X-Received: by 2002:a37:99c3:: with SMTP id b186mr4638768qke.361.1627044689543; 
 Fri, 23 Jul 2021 05:51:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybD0gPvnYMeOVVSexulpUJ+Pn/0Tqkrf1TZoSvb+yof+S6YAtpK0SHvfH4IHtgttj3qTJQtg==
X-Received: by 2002:a37:99c3:: with SMTP id b186mr4638747qke.361.1627044689322; 
 Fri, 23 Jul 2021 05:51:29 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id c16sm11533812qtv.32.2021.07.23.05.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 05:51:28 -0700 (PDT)
Date: Fri, 23 Jul 2021 08:51:27 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
Message-ID: <YPq7Txt3SnIpdNKD@t490s>
References: <20210722083055.23352-1-wei.w.wang@intel.com>
 <0faf5f01-399f-621f-431e-d35b3e87b9ff@redhat.com>
 <b39f279ef6634325ab2be8d903e41001@intel.com>
 <YPmF1BAHA059yYln@t490s>
 <ab4a5e1e-ed7f-5b4b-88e6-d4c56ed5a256@redhat.com>
 <YPmt3vrn5MfH6I13@t490s>
 <087670b0-d28c-7f3d-caf4-f37acf8f7d7e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <087670b0-d28c-7f3d-caf4-f37acf8f7d7e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Wang, Wei W" <wei.w.wang@intel.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 09:50:18AM +0200, David Hildenbrand wrote:
> On 22.07.21 19:41, Peter Xu wrote:
> > On Thu, Jul 22, 2021 at 04:51:48PM +0200, David Hildenbrand wrote:
> > > I'll give it a churn.
> > 
> > Thanks, David.
> > 
> 
> Migration of a 8 GiB VM
> * within the same host
> * after Linux is up and idle
> * free page hinting enabled
> * after dirtying most VM memory using memhog
> * keeping bandwidth set to QEMU defaults
> * On my 16 GiB notebook with other stuff running
> 
> 
> Current upstream with 63268c4970a, without this patch:
> 
> total time: 28606 ms
> downtime: 33 ms
> setup: 3 ms
> transferred ram: 3722913 kbytes
> throughput: 1066.37 mbps
> remaining ram: 0 kbytes
> total ram: 8389384 kbytes
> duplicate: 21674 pages
> skipped: 0 pages
> normal: 928866 pages
> normal bytes: 3715464 kbytes
> dirty sync count: 5
> pages-per-second: 32710
> 
> Current upstream without 63268c4970a, without this patch:
> 
> total time: 28530 ms
> downtime: 277 ms
> setup: 4 ms
> transferred ram: 3726266 kbytes
> throughput: 1070.21 mbps
> remaining ram: 0 kbytes
> total ram: 8389384 kbytes
> duplicate: 21890 pages
> skipped: 0 pages
> normal: 929702 pages
> normal bytes: 3718808 kbytes
> dirty sync count: 5
> pages-per-second: 32710
> 
> 
> Current upstream without 63268c4970a, with this patch:
> 
> total time: 5115 ms
> downtime: 37 ms
> setup: 5 ms
> transferred ram: 659532 kbytes
> throughput: 1057.94 mbps
> remaining ram: 0 kbytes
> total ram: 8389384 kbytes
> duplicate: 20748 pages
> skipped: 0 pages
> normal: 164516 pages
> normal bytes: 658064 kbytes
> dirty sync count: 4
> pages-per-second: 32710
> 
> 
> Current upstream with 63268c4970a, with this patch:
> 
> total time: 5205 ms
> downtime: 45 ms
> setup: 3 ms
> transferred ram: 659636 kbytes
> throughput: 1039.39 mbps
> remaining ram: 0 kbytes
> total ram: 8389384 kbytes
> duplicate: 20264 pages
> skipped: 0 pages
> normal: 164543 pages
> normal bytes: 658172 kbytes
> dirty sync count: 4
> pages-per-second: 32710
> 
> 
> 
> I repeated the last two measurements two times and took the "better"
> results.
> 
> Looks like this patch does it job and that 63268c4970a doesn't seem to
> degrade migration in this combination/setup significantly (if at all, we
> would have to do more measurements).

Thanks again for helping!

Just to double check: the loop in qemu_guest_free_page_hint() won't run for a
lot of iterations, right?  Looks like that only happens when over ramblock
boundaries.  Otherwise we may also want to move that mutex out of the loop at
some point because atomic looks indeed expensive on huge hosts.

-- 
Peter Xu



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E733D3DAD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:36:45 +0200 (CEST)
Received: from localhost ([::1]:46168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yAG-00042V-5Q
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6y8c-00018H-Pk
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:35:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6y8b-0007Cm-0j
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627058100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XMa1Vsuz9TqFqBpHErHQNycZlKQiL142Muxk7a7pMc0=;
 b=dGUW4CMVsbBZUQBnfaHPA2dNrAVB1ROU5kd6H2KPMZVDbNIlkCUt3KHaa2ML2TqM4gOaIt
 HYG44HTnHceBY8c2XEynwXUXyVfOQuG4seI2RY8Pquf4jYSfHwEJwP/S23jgGqtiph5661
 qwu+z0gBr81pTXzOFn5JeLyfbOMDLDo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-RaxPkMxYODmRbkViYFp79A-1; Fri, 23 Jul 2021 12:34:57 -0400
X-MC-Unique: RaxPkMxYODmRbkViYFp79A-1
Received: by mail-qk1-f200.google.com with SMTP id
 a26-20020a05620a16dab02903b960837cbfso720320qkn.10
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XMa1Vsuz9TqFqBpHErHQNycZlKQiL142Muxk7a7pMc0=;
 b=EscqKetstBuZqxlOydqqdp0GGvv1F2mPvvjLeGzTPMB8TQibNb9p7Dr5+8HGbbvmAX
 SBHIqa54h9S1SnR0rgoIh7Lsx/S8ml1JSMdte0jpIcHEJYdqinesUaNZDVFD7JeuhPvD
 K7Y7UER5RmFztRS/xtGWqJ7OVP9VoxYmbTtcnUMjsgcp6DY0LT/ElaDJ4D/G6Pa53VtE
 SFFiCkxDiwK8GTm+Fd2poLdi6V4VoNOOsMKz8/+rl+FKFga8EBEtDWc00GWmGr+WbKLp
 tuygjBCEF6RosfMPFlAr15a/5UYfvJ5muFmwMJNfr8XtB8ryXapDbti15pdML71xFgdu
 XmgA==
X-Gm-Message-State: AOAM530I5uYRsf5Wh8HL/1sPeFcdY25XlDT/LzcBFWdk1+9K/RF8puEq
 uV8eVAT5VMUDrqKWxT8c3VsV27pMQXLYvSrEym28dES/MeOQCC4XiIBRWfBEvW2hhYCQqtFGzCM
 7BCFgWywAssgfez8=
X-Received: by 2002:a0c:fa87:: with SMTP id o7mr1500857qvn.14.1627058096726;
 Fri, 23 Jul 2021 09:34:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCvF1Uc5W2zXvL8j6WToHXu+WkP1ODV+g/1QD40pW0bZQri0FeX6efD7Swso/SJktVIdMwTg==
X-Received: by 2002:a0c:fa87:: with SMTP id o7mr1500835qvn.14.1627058096558;
 Fri, 23 Jul 2021 09:34:56 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i21sm14669724qkl.20.2021.07.23.09.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:34:55 -0700 (PDT)
Date: Fri, 23 Jul 2021 12:34:54 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/6] virtio-mem: Drop precopy notifier
Message-ID: <YPrvri1dUmARpA1Z@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-5-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721092759.21368-5-david@redhat.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 11:27:57AM +0200, David Hildenbrand wrote:
> Migration code now properly handles RAMBlocks which are indirectly managed
> by a RamDiscardManager. No need for manual handling via the free page
> optimization interface, let's get rid of it.
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463123CF150
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:27:14 +0200 (CEST)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eXR-0001d8-Ba
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5eSd-00004u-QC
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:22:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5eSc-0005vf-0X
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:22:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626744132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktS/51zfswrI6jFwFXD1ly/vsP+wfakKzA/1W35HSzM=;
 b=GyNT8gXAUi2KgRXOKcAsVSE0k8+monbvRRo78/u5rr/qj7RYfrw/qx9/Y/gE09Tk7FoADI
 jTHLDBg6v0qVnobeSdhjB5u+FEE/NInKfLcSx/8xAG6mUgo4w9A490iwSsU9wk57A1PSGE
 PXs/dV4yHTJBY6dLIqPjxmba4BLpy0E=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-N4I1fN6pM02MhMnrGwatDQ-1; Mon, 19 Jul 2021 21:22:11 -0400
X-MC-Unique: N4I1fN6pM02MhMnrGwatDQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 eo14-20020ad4594e0000b02902fc3fd31414so13815720qvb.16
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ktS/51zfswrI6jFwFXD1ly/vsP+wfakKzA/1W35HSzM=;
 b=Uw7ULr/HXfSXoSsN8N0qOcUr1HALx4Sue7vu8dD60TggshSq2CqkNOna9VXCO1VG4u
 YWI7Qi07ONEejFgUKDcb5yGm7jNBmm7rwQTDwpyKKyhkYQDNjlXGMEX1P2IznRR5xqpJ
 CG2Ny7SbPONKD2mqkfkAh3YQd7prADEoBEGtCNyH53rMLvQu2qH+ej8mBnmLrVFJwIYz
 LqAQBNlw6kTnNGx8vnYBQMkxcTwAiRLWJlEMOLJxbgANYA23tjyY7Ws0beVmwFmyTKil
 qlATAwDqAy6hZkJxAhn0q1sAPVGEH/NMoFN+zLaDywWw8o9Pi82NI+RT+WHEa2W9BYOD
 SUuQ==
X-Gm-Message-State: AOAM530L4SS9wGa8RNaPjwRFpuJrAJt/nedZGU2zsc1YKMSq79mAfWkL
 lbQYI/ygUu/p1EBum2Z7r4PGZr7EbhX6jaMfejxOtGppiXHgV5jndfmakik66FCFsGULuXjIrt5
 1LXaRKKa8Z04nZlM=
X-Received: by 2002:ad4:4ae5:: with SMTP id cp5mr27487249qvb.38.1626744131218; 
 Mon, 19 Jul 2021 18:22:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW0NzsEY9RgkQg087NYTWUfqTdiUpNsJjSED2zuhLT8/LFaFQ5nocyhYqGnG/jxVcYzyrbKQ==
X-Received: by 2002:ad4:4ae5:: with SMTP id cp5mr27487229qvb.38.1626744130997; 
 Mon, 19 Jul 2021 18:22:10 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id l4sm8745592qkd.77.2021.07.19.18.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:22:10 -0700 (PDT)
Date: Mon, 19 Jul 2021 21:22:09 -0400
From: Peter Xu <peterx@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: Question on memory commit during MR finalize()
Message-ID: <YPYlQUwIT/R0FkWP@t490s>
References: <CH0PR02MB78989C2F77880AA5355037748B129@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPB/8f0pv7mDR310@t490s>
 <CH0PR02MB7898ACD1C68149CE11314EB08B119@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPGVQ0ONUc/qPSNz@t490s>
 <CH0PR02MB7898BB81DCB85237D38E07638BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPWglNqZFegBRZjM@t490s>
 <CH0PR02MB789857DE73B0A9B1FC29593E8BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
 <CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPXZkynODtvXXx6c@t490s>
 <D22C9D84-EE93-4DA8-99DE-98C46E27809C@oracle.com>
MIME-Version: 1.0
In-Reply-To: <D22C9D84-EE93-4DA8-99DE-98C46E27809C@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Thanos Makatos <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, John Levon <john.levon@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 08:58:44PM +0000, John Johnson wrote:
> 
> 
> > On Jul 19, 2021, at 12:59 PM, Peter Xu <peterx@redhat.com> wrote:
> > 
> > 
> > Here vfio_user_send_recv() looks tricky to me - it releases the bql within a
> > memory update procedure, and IMHO it needs some serious justification on why it
> > can do so. For example, what if memory layout changed when waiting for the
> > reply?  As it can happen in parallel if without bql, afaict.
> > 
> 
> 
> 	The reason bql is dropped is usually the thread will sleep waiting
> for a reply from the server, and I didn't think it was a good idea to block
> all threads in the meantime.  Most vfio-user requests result from a guest
> action, so just blocking the single CPU thread for the reply is good.

Sleeping with bql is actually ok imho, but indeed if it can take very long then
we should make it async.

> 
> 	The vfio-user code doesn’t depend on the memory layout being stable,
> it’s just sending the layout updates to the server.  Would it be better to
> send memory updates asynchronously, and wait for all the replies in the commit
> callback?

Yes, I believe a lot of similar things are done within qemu, e.g. there can be
a bottom half scheduled so all things will be serialized using bql.

Btw, it's not only about whether vfio-user would survive with memory layout
change, I think the problem is vfio-user now released the bql without qemu core
qemu memory noticing it, while core memory relies on bql to serialize.  That's
why we can get very strange rcu thread crash - it's potentially an outcome of
the race.

Thanks,

-- 
Peter Xu



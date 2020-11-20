Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFC12BB0DB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:45:31 +0100 (CET)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9XO-0003NJ-Th
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kg9VO-00023I-NH
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:43:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kg9VM-0001VZ-I3
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605890601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VT948fUF6CYPZYaTz2mmZjpBQg1+bEN/gEyGgd7v3XY=;
 b=Wh6LJVMa+20zi/Lg4NL5DZgG4sKXuWbQWqdGshC/znyWd6veMaBwbZhj9RP8dBPLRTyeff
 +yNikqagzJJn9qsjd0OeOPc8hzAT5iaJMlufKZbaZLmfIxvlPrxdD1xeJJN9Zp+k3FYGua
 a+Q87MfxV6wdYrr5HPJ5XLgRdzjhzLY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-F2YySPg1Opu4WFLGVFFzpw-1; Fri, 20 Nov 2020 11:43:18 -0500
X-MC-Unique: F2YySPg1Opu4WFLGVFFzpw-1
Received: by mail-qt1-f200.google.com with SMTP id 7so7758015qtw.23
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:43:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VT948fUF6CYPZYaTz2mmZjpBQg1+bEN/gEyGgd7v3XY=;
 b=lx8y+GXc5snrGkXjb+g33fnf422/ZEhyVVMsHn7YVEf9v6O/mTf5pU1rXzG8i92sdp
 9vBgJqmYAEM6wa7PYd8h+DLCavfHyEEvB2FTUG8L4K0n3ve6RR/jLyjyXDJSk+E2uK8v
 ZG2T11pTqhN97n3r3ONSDxFRVBfc6BdQ12cZ0DypFdvFsg6qK5UoUhcFimyDWJmYQ3KY
 XeTSaHqvhtxAW6s3HExDWDOKARQXbww3Py7TnWIo579LurBEdVc1AjUJiGl2Jf68kEfM
 QRPInsjDhoSTigeG7KwLu3XKXrwyioSbeGSsE+beVBRu07U4KNL+vhVpo7BGJG6O9lck
 LYcg==
X-Gm-Message-State: AOAM530mcF/YPqjs19ipKPAR4CGlro0da3MT1/Ij2XZDLFoPS0KQfNDg
 tdknnU5K5fRkKbAh9OmlWbcY3EaGYK0U0CUO7s4GRByCN9boVDxDLpCAw4OTGjufAoSYkpRNUC9
 Q86bsDDPZNozgIZs=
X-Received: by 2002:a05:620a:a1d:: with SMTP id
 i29mr17180263qka.466.1605890598476; 
 Fri, 20 Nov 2020 08:43:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0TH7T7vwAX+Kr/AEl4EBUMuqM1PDMLKYovyVOn4zo1m5j45mAdA+8/JnOSGRO+xMeNyIzjg==
X-Received: by 2002:a05:620a:a1d:: with SMTP id
 i29mr17180242qka.466.1605890598253; 
 Fri, 20 Nov 2020 08:43:18 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id c1sm2345275qkd.74.2020.11.20.08.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 08:43:17 -0800 (PST)
Date: Fri, 20 Nov 2020 11:43:16 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 3/7] support UFFD write fault processing in
 ram_save_iterate()
Message-ID: <20201120164316.GC60522@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-4-andrey.gruzdev@virtuozzo.com>
 <20201119182516.GB6538@xz-x1>
 <1e35a550-a6a0-fbe2-ac8d-6844ce23b3fb@virtuozzo.com>
 <20201120150703.GE32525@xz-x1>
 <2797b4b6-b083-750f-385b-f0aa09730251@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <2797b4b6-b083-750f-385b-f0aa09730251@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=no autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 07:15:07PM +0300, Andrey Gruzdev wrote:
> Yeah, I think we can re-use the postcopy queue code for faulting pages. I'm
> worring a little about some additional overhead dealing with urgent request
> semaphore. Also, the code won't change a lot, something like:
> 
> [...]
>         /* In case of 'write-tracking' migration we first try
>          * to poll UFFD and sse if we have write page fault event */
>         poll_fault_page(rs);
> 
>         again = true;
>         found = get_queued_page(rs, &pss);
> 
>         if (!found) {
>             /* priority queue empty, so just search for something dirty */
>             found = find_dirty_block(rs, &pss, &again);
>         }
> [...]

Could I ask what's the "urgent request semaphore"?  Thanks,

-- 
Peter Xu



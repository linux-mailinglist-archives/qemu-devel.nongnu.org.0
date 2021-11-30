Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E844633CA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 13:05:14 +0100 (CET)
Received: from localhost ([::1]:39250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms1sm-0001T8-Cj
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 07:05:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ms1pA-0007Uh-ID
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:01:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ms1p3-0002yi-Ai
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638273674;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ynipGi1VIKYxAplT/ixwe2z25x6wfv3w8qUSxP26EzI=;
 b=cY/TDAPUGO3od+183cUYZpWXmJCU+1MfW1Y7pfy3Oue285dmBaMXbuVrk2pGRvRUBDIllz
 mVyXvkB7uFeMuC7I5f+ECuW++1mdH9j6pngHonpNI/JvyiAQQ1KVAJ60jpbySCEq76Asl8
 dRbhyQYvywm174KPx4jmracjY6noJ7w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-nVu8b4KiOcu3_37EK5alGw-1; Tue, 30 Nov 2021 07:01:12 -0500
X-MC-Unique: nVu8b4KiOcu3_37EK5alGw-1
Received: by mail-wm1-f69.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so13624804wmc.7
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 04:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=ynipGi1VIKYxAplT/ixwe2z25x6wfv3w8qUSxP26EzI=;
 b=H3FuZfg2GOhpCneo4YwwfYkrIsGGNHAkqPv4aO1XU3vhLbIzSGNoeveoAh/dtZ61zC
 1Y5JCSVQwlGgZDuxfMIGKrBOnOgq+ioljIkqvLtTbnjtte2KlgRiH3N9PdZ0kRIDb6Kf
 rl/xurhFZCpnZ0wkaRa97M68CPmcuBOgO5VbRhbadGhH6elMXQixDFHzWt+OiGaU5+sY
 +sA/usD/XAjb08FVc4ce/TsSlXT39FWgV+lC6cUL1wdTFTo5e6xa5LDlbtQJeF/2wmji
 WiCexIjXIQ7+PynWomkDYP3/RqNQmvUSh/mnz5rqBF6Th72OEdpgA7iOC9l2/Cxl01oe
 qMyA==
X-Gm-Message-State: AOAM5303nl/H8JDuoedZ6ctDe7XHt+a01qtddZUvKq9OmMB5riBb1uLc
 NeOT3/AdmY99qoU9JSfawblw5LtguGikVZZZSfwciTAZoZ1OnhXGVuzZz8FdoPa/Vo/n56My+Vj
 RyMHhT7unq1aoDPw=
X-Received: by 2002:a5d:650f:: with SMTP id x15mr39680510wru.201.1638273671718; 
 Tue, 30 Nov 2021 04:01:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyu1yBYnAqi3+dkIoyZVWnP9zaAthDvBubG8d7fWLEt9af5QEVLfnvlNpKl1mh8yhXrb2r+hQ==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr39680485wru.201.1638273671524; 
 Tue, 30 Nov 2021 04:01:11 -0800 (PST)
Received: from localhost (static-168-39-62-95.ipcom.comunitel.net.
 [95.62.39.168])
 by smtp.gmail.com with ESMTPSA id h3sm15751964wrv.69.2021.11.30.04.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 04:01:10 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 17/23] multifd: Use normal pages array on the send side
In-Reply-To: <YaYB7sSHKoVZgJ6q@work-vm> (David Alan Gilbert's message of "Tue, 
 30 Nov 2021 10:50:22 +0000")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-18-quintela@redhat.com>
 <YaYB7sSHKoVZgJ6q@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 30 Nov 2021 13:01:10 +0100
Message-ID: <87czmhhmyh.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Can you explain a bit more what's going on here?

Sorry.

Until patch 20, we have what we had always have:

pages that are sent through multifd (non zero pages).  We are going to
call it normal pages.  So right now, we use the array of pages that we
are passed in directly on the multifd send methods.

But when we introduce zero pages handling around patch 20, we end having
two types of pages sent through multifd:
- normal pages (a.k.a. non-zero pages)
- zero pages

So the options are:
- we rename the fields before we introduce the zero page code, and then
  we introduce the zero page code.
- we rename at the same time that we introduce the zero page code.

I decided to go with the 1st option.

The other thing that we do here is that we introduce the normal array
pages, so right now we do:

for (i = 0; i < pages->num; i++) {
    p->narmal[p->normal_num] = pages->offset[i];
    p->normal_num++:
}


Why?

Because then patch 20 becomes:

for (i = 0; i < pages->num; i++) {
    if (buffer_is_zero(page->offset[i])) {
        p->zerol[p->zero_num] = pages->offset[i];
        p->zeronum++:
    } else {
        p->narmal[p->normal_num] = pages->offset[i];
        p->normal_num++:
    }
}

i.e. don't have to touch the handling of normal pages at all, only this
for loop.

As an added benefit, after this patch, multifd methods don't need to
know about the pages array, only about the params array (that will allow
me to drop the locking earlier).

I hope this helps.

Later, Juan.



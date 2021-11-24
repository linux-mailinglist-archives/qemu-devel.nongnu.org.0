Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182D045B8B7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:56:51 +0100 (CET)
Received: from localhost ([::1]:42096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppxK-00039H-8A
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mppSR-0007n2-Md
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:24:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mppSL-0007Tc-RK
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637749484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8WKJ/IeEuHQLszFzjBntpT7TXVUosT1iOb3Xz8j2R1E=;
 b=PnBnvwVyUXbGSVWtLkxq/4s5Zpn1bCfRvXEa1Ykz8rErU8aOSniIhb5C9xH4Sl74+fbSfe
 6WZARrh1l1et+QGjR0f2vBDWeECXxoSbxTxbdw0ZSSQU1zRUkQaHsi4KBb8L1wcvrvYqzB
 6hekJHErO3PLNyqLHK8jB5yCiNlum7c=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-TCTQQFb0OSCIRwjksBd1aA-1; Wed, 24 Nov 2021 05:24:30 -0500
X-MC-Unique: TCTQQFb0OSCIRwjksBd1aA-1
Received: by mail-pj1-f69.google.com with SMTP id
 x6-20020a17090a6c0600b001a724a5696cso1392857pjj.6
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 02:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8WKJ/IeEuHQLszFzjBntpT7TXVUosT1iOb3Xz8j2R1E=;
 b=qkJEkFmXQkhOUbW+R1HmwhaOA1/hDYZ3KrCA+i6CUw342eP48nHz74z5qD3McGXYkm
 akS6fA8TYr3eBXYnZCKZtCC64z7xm8FiJe1ohGoOROVbtZbrwEKhkx+Xo5MYfVjDnFkE
 x3Ex6P21mZdYROmicez6kX1FNcv7rvZFyHAKLguE8qXtDebBTYGNMfDvOv0uoA9aSaMe
 tBn/Vb7LVFhrA07y6SWi0NvCOJY0otEaeYEvQvLXyyxoMkqtPljVLcX9obUtvdA/3ppy
 rxfRf2LbT8W/ZA+ZeR0u1lBXSutRNw0gCiOLnsj3UkIsDpux90RB0g7GKXII5s3jeh/b
 0bwA==
X-Gm-Message-State: AOAM532b22yMyBK8/2N2CxTQmPGHmLIf9bnsI6YB2Cdwo7QATVytTWb3
 qoqGSI0yBF0/pN3s2NPQ7+IZf077LmvhQUhuGOgMnbo9C3FP82fPfvePVX7AhcHwEFVJAo+WtI/
 KnI14AFWhuaLRhSU=
X-Received: by 2002:a17:902:a605:b0:143:d289:f3fb with SMTP id
 u5-20020a170902a60500b00143d289f3fbmr16866005plq.41.1637749468966; 
 Wed, 24 Nov 2021 02:24:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPFhQ3yEjMw8pZv30bm59o+pfIoL/DFRYMPsnWoLgM1122w4L+EtE/ITCjW9zs1EWYSjHUQQ==
X-Received: by 2002:a17:902:a605:b0:143:d289:f3fb with SMTP id
 u5-20020a170902a60500b00143d289f3fbmr16865966plq.41.1637749468722; 
 Wed, 24 Nov 2021 02:24:28 -0800 (PST)
Received: from xz-m1.local ([94.177.118.150])
 by smtp.gmail.com with ESMTPSA id p2sm4102468pja.55.2021.11.24.02.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 02:24:28 -0800 (PST)
Date: Wed, 24 Nov 2021 18:24:22 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 00/23] Migration: Transmit and detect zero pages in
 the multifd threads
Message-ID: <YZ4S1tP3I3U3bBwr@xz-m1.local>
References: <20211124100617.19786-1-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-1-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 11:05:54AM +0100, Juan Quintela wrote:
> Hi
> 
> Trying with a different server.
> As it used to happen, when I sent everything only to me, everything worked.
> 
> Sorry folks.
> 
> [v2]
> This is a rebase against last master.
> 
> And the reason for resend is to configure properly git-publish and
> hope this time that git-publish send all the patches.

I do suffer from this too.  I normally use git-publish parameters "-S" plus
"-R" together when it happens, then in the interactive console selectively send
leftover series to complete previous attempt.

I think it's not a bug for git-publish, but git-send-email with fail with an
SMTP error.  I'm no expert of that, but iirc last time we discussed Paolo
mentioned it could be a git-send-email bug.  Copy Paolo for that in case
there's any further clue out of it.

> 
> Please, review.
> 
> [v1]
> Since Friday version:
> - More cleanups on the code
> - Remove repeated calls to qemu_target_page_size()
> - Establish normal pages and zero pages
> - detect zero pages on the multifd threads
> - send zero pages through the multifd channels.
> - reviews by Richard addressed.
> 
> It pases migration-test, so it should be perfect O:+)

OK I "agree". :-D

Besides, shall we try measure some real workloads?  E.g. total migration time
of an idle guest doing 8 channels multifd migration with/without the patchset?
I'd expect there's a huge speedup on that even with a low speed NIC, and it'll
be great to verify it.

-- 
Peter Xu



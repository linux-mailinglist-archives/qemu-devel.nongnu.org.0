Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E03F337AD4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:29:41 +0100 (CET)
Received: from localhost ([::1]:55766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKP80-0006yF-2j
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKP1I-0001TG-Rp
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:22:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKP1G-0001YS-TK
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615483361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ynQYSBffFl9XMvv00ZkHK2cVQG4D8EfqcjcOjsrQDxg=;
 b=U+oTc7XqG8HNqFIpUtRSC8bYsRwRFI2F8KkP/29GrL23L0932Y3Z2P3hdYyGE/hsiuF4t/
 o4CvyMSoaC9HQu9tMqcJ1C2SezE1IrfwZltR+PtpSyrNM2e0JllL5XwlwR1eFdu/syxs2H
 m+cqq4+tq96ygyvAp/5gqMB0gNYA+zQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-Ar8nNNHRPGOZoytw6v1cvA-1; Thu, 11 Mar 2021 12:22:40 -0500
X-MC-Unique: Ar8nNNHRPGOZoytw6v1cvA-1
Received: by mail-qk1-f200.google.com with SMTP id h126so16048934qkd.4
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ynQYSBffFl9XMvv00ZkHK2cVQG4D8EfqcjcOjsrQDxg=;
 b=py5blPCxODjvCJKCsGq+1ZMeZ2VXUqoT2aimx773Uhu99WPrBTjvMX4FN9QVdp27mP
 FHeWNDk27FSbuBo3L39Gir9BCkOHBZGT9kFYiODtThOrcNI68oB1+sC6tgfM+CA4Cybf
 o/cqG/0ycPlfWAd7EOoTyRihLcctcgta6wcsRj9rsAv09MLbeEPornb907SU0yFHshft
 NyH93EN6V+K8N6Esdqp7ALY27ZUgNwFEfyZI00f4jfq6QS7HlpjF8l8x57VIk+OtwGga
 iPPFCICLP29tWA0ahM2t7JapezQ/zk9hjMEvJ6IqwIM9EUDqtZB1Mp7OFPL5YjXMp3A/
 AEmA==
X-Gm-Message-State: AOAM530tI3VoNNpUMfCJ2A1ocoskMmnopGR298LmrYvcNUUQuDBn6DZQ
 UQU+10bEYm7vLv/CqY++XU4VJ17c8FCW2EF1wkjTpJjCqz2voASKT91jIjYy9E99bWU4szpbSnA
 mGhkCIutDl/JX0YI=
X-Received: by 2002:a05:6214:1144:: with SMTP id
 b4mr8771867qvt.12.1615483359524; 
 Thu, 11 Mar 2021 09:22:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8mshgg/0L30aXCuIEK/e/kasHDCVKsTgLCNdiIRDLs1wgoybQJrClHsg8u2sJjcTMIlmNUQ==
X-Received: by 2002:a05:6214:1144:: with SMTP id
 b4mr8771834qvt.12.1615483359302; 
 Thu, 11 Mar 2021 09:22:39 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id k126sm2473549qkb.4.2021.03.11.09.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:22:38 -0800 (PST)
Date: Thu, 11 Mar 2021 12:22:36 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 02/12] softmmu/physmem: Fix ram_block_discard_range()
 to handle shared anonymous memory
Message-ID: <20210311172236.GG194839@xz-x1>
References: <20210308150600.14440-1-david@redhat.com>
 <20210308150600.14440-3-david@redhat.com>
 <YEpH1FAabcILd38K@work-vm>
 <df216a57-d45a-9563-5e88-0f2ebf6b0a7e@redhat.com>
 <20210311171153.GF194839@xz-x1>
 <26d2c57a-971d-3abd-6ec3-1a38fb47a398@redhat.com>
MIME-Version: 1.0
In-Reply-To: <26d2c57a-971d-3abd-6ec3-1a38fb47a398@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 06:15:15PM +0100, David Hildenbrand wrote:
> On 11.03.21 18:11, Peter Xu wrote:
> > On Thu, Mar 11, 2021 at 05:45:46PM +0100, David Hildenbrand wrote:
> > > On 11.03.21 17:39, Dr. David Alan Gilbert wrote:
> > > > * David Hildenbrand (david@redhat.com) wrote:
> > > > > We can create shared anonymous memory via
> > > > >       "-object memory-backend-ram,share=on,..."
> > > > > which is, for example, required by PVRDMA for mremap() to work.
> > > > > 
> > > > > Shared anonymous memory is weird, though. Instead of MADV_DONTNEED, we
> > > > > have to use MADV_REMOVE. MADV_DONTNEED fails silently and does nothing.
> > > > 
> > > > OK, I wonder how stable these rules are; is it defined anywhere that
> > > > it's required?
> > > > 
> > > 
> > > I had a look at the Linux implementation: it's essentially shmem ... but we
> > > don't have an fd exposed, so we cannot use fallocate() ... :)
> > > 
> > > MADV_REMOVE documents (man):
> > > 
> > > "In the initial implementation, only tmpfs(5) was supported MADV_REMOVE; but
> > > since Linux 3.5, any filesystem which supports the fallocate(2)
> > > FALLOC_FL_PUNCH_HOLE mode also supports MADV_REMOVE."
> > 
> > Hmm, I see that MADV_DONTNEED will still tear down all mappings even for
> > anonymous shmem.. what did I miss?
> 
> Where did you see that?

I see madvise_dontneed_free() calls zap_page_range().

> 
> > 
> 
> MADV_DONTNEED only invalidates private copies in the pagecache. It's
> essentially useless for any kind of shared mappings.

Since it's about zapping page tables, then I don't understand why it won't work
for shmem..

-- 
Peter Xu



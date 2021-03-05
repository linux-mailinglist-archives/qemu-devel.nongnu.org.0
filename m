Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8A032EF65
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:53:25 +0100 (CET)
Received: from localhost ([::1]:53088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIClY-0001pi-HA
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lICk3-0000Cm-QC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:51:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lICk1-0001iM-3D
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614959507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UlJ6fdqEM/xENNgcKMpRZobgOJwem4ynNwsccA5HSgc=;
 b=ef2eLVHqSfxNKXD+LmT3HPjepibUqckSaogZOWDjnUilJuKQY+tNGvwAR0hYgjFpTMrLFL
 quTcE83KReBLk/aRX+li7WTncAd3sqPrkgg7uDDnWy1YqxjL7g0Uxmm+pnGF8QG3ZHUGYK
 n0bxj97BG2GArUu6GGTvdRe23J4G6W4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-zw_Enq5fPlG-vBpRfTJ-nA-1; Fri, 05 Mar 2021 10:51:44 -0500
X-MC-Unique: zw_Enq5fPlG-vBpRfTJ-nA-1
Received: by mail-qt1-f199.google.com with SMTP id r1so1936178qtu.9
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:51:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UlJ6fdqEM/xENNgcKMpRZobgOJwem4ynNwsccA5HSgc=;
 b=RmOhLPnsj/M8LcJLmBi75tgt+fHqPd3FWSXBlGAHj42lC5f3V8x/WgOmD5WxMFd+IE
 3hnTWNQNMdzYoVgEKLIGBJux7yVMj3ds5Xd47DmzlAHhsqEsJd1rVQWcji1w0WkSaLeB
 QdAq2RJs3IwEG+M3gJs3+BxEJVNegfODPBII/ZW5UIPY7AepilOJlAfTZROzA6MyfgAt
 dfQMH5cf2J6+By3dkis7oOihFRn14N9pbtqM2Ne2g5ZBaS7LU2cAtkjRveEdzf8fv8AY
 Haki9ADd0t0PlW/MEYyloef4sCQuE1oj9cwNVgvB8Il1xLRrSDdZp2MoJ8p3z7CX4MI6
 L5xQ==
X-Gm-Message-State: AOAM5309XT8pe3PXYBktwizxQ2Wx+E+TADfxEM8EBkj1XhFaiQP6smpL
 Tl5uNl4t6lWJsmlUqyYdw4D3mDp0PRi0wDPyeP4swSHdfocQ3IZya5gGRZHZ5x8hhfsVmWcmLDc
 yUqEhAS2eY91OEC8=
X-Received: by 2002:a37:49c4:: with SMTP id w187mr9425309qka.444.1614959503448; 
 Fri, 05 Mar 2021 07:51:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzH5vxl6g2RoRfEM3hHNU/sg8Wfqeex8qAzaBwFgtDSTHV7s+AdUMt5FJcl+9vfOKpMhaYn1w==
X-Received: by 2002:a37:49c4:: with SMTP id w187mr9425279qka.444.1614959503259; 
 Fri, 05 Mar 2021 07:51:43 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id c125sm2082676qke.117.2021.03.05.07.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:51:42 -0800 (PST)
Date: Fri, 5 Mar 2021 10:51:41 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 8/9] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE
Message-ID: <20210305155141.GI397383@xz-x1>
References: <20210305101634.10745-1-david@redhat.com>
 <20210305101634.10745-9-david@redhat.com>
 <20210305154206.GH397383@xz-x1>
 <f577f691-9bdc-a435-9f20-1de62be2241e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f577f691-9bdc-a435-9f20-1de62be2241e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 04:44:36PM +0100, David Hildenbrand wrote:
> On 05.03.21 16:42, Peter Xu wrote:
> > On Fri, Mar 05, 2021 at 11:16:33AM +0100, David Hildenbrand wrote:
> > > +#define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
> > > +static bool map_noreserve_effective(int fd, bool readonly, bool shared)
> > > +{
> > 
> > [...]
> > 
> > > @@ -184,8 +251,7 @@ void *qemu_ram_mmap(int fd,
> > >       size_t offset, total;
> > >       void *ptr, *guardptr;
> > > -    if (noreserve) {
> > > -        error_report("Skipping reservation of swap space is not supported");
> > > +    if (noreserve && !map_noreserve_effective(fd, shared, readonly)) {
> > 
> > Need to switch "shared" & "readonly"?
> 
> Indeed, interestingly it has the same effect (as we don't have anonymous
> read-only memory in QEMU :) )

But note there is still a "g_assert(!shared || fd >= 0);" inside.. :)

> 
> (wouldn't have happened with flags  ... hmm)

Right.

-- 
Peter Xu



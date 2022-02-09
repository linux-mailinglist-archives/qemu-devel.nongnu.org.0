Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B394AE66D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 03:18:47 +0100 (CET)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHcZB-0001Ii-Kf
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 21:18:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHcXK-0000Xv-EL
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 21:16:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHcXH-0001ws-FJ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 21:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644373006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJNwgFUJJxEYqSSjePRTndCmDWGoRW+GJ5ZNdtYZv8M=;
 b=Bzh+RPfOpidBBt5a43GOAxMOgF10IwzW7dvDMy07mk8GzS76yMDUj02adMZ/jgRA6Omial
 nscmP9F3VZXBZv2IuYCqJZZ2RtsDmMt72QEzBKKiH62D6Y7MczD7aoFs+LoDDEKd9GBu6G
 yYcCjxdovWErQhRf+GMLjgQk5sOezOw=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-X04k5Ju7PSmGn_kpcOq2VA-1; Tue, 08 Feb 2022 21:16:45 -0500
X-MC-Unique: X04k5Ju7PSmGn_kpcOq2VA-1
Received: by mail-pf1-f197.google.com with SMTP id
 x33-20020a056a000be100b004e03b0e363cso708836pfu.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 18:16:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WJNwgFUJJxEYqSSjePRTndCmDWGoRW+GJ5ZNdtYZv8M=;
 b=0uA6k9birSRYmvTmGcBSicSehiJ8A0jeLGNCIDwZsk/51cGagVElyLnZEHNK8qwx/G
 Ndli2SF4ao12CP2RY8xqAO1Lv0+gFFuUFrELmweY65VXOBBW0e0lcWg2tdOnrhtpqImx
 ywERrgdo3V8ErGuQVFMOIO411OluCCP4TirFPfgP/L4+xNGUbNJ+PbcGsXuojj0pdjIk
 L4IpH7Mx1d6d57h7kvjZZnzlS2WxkH5vk2vXReY92L5E0w9yzU0ycstRRH+qrUYRPUVJ
 YFX+3jTOkKWrkuqBmiZBjOvn7gXVQ5JLWHdV7tBgIuxKHnmwZpGnQ7ZzffoOZZ6QyQp8
 Tl4g==
X-Gm-Message-State: AOAM533UC4RhOMBpii6v1xGMfwDhBfJsByqoNg8mvO80+4kEg8SjN+6i
 Lr8aO95hUon3wlndROQ9jJDrYnlapcB2OdpkiIJP+XL7cxMeHmQnm/ODhQphesJkef7ZZbHMyhO
 zOr7sEZGCCPw++nY=
X-Received: by 2002:a17:90a:348e:: with SMTP id
 p14mr100699pjb.71.1644373004301; 
 Tue, 08 Feb 2022 18:16:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwv06ZwwG4D8eDQS+P914VpShyJZm+Ht27CCnGevawmUdcyYWaULOEDWWEa4kXWgJIjiIfQpg==
X-Received: by 2002:a17:90a:348e:: with SMTP id
 p14mr100681pjb.71.1644373004015; 
 Tue, 08 Feb 2022 18:16:44 -0800 (PST)
Received: from xz-m1.local ([94.177.118.72])
 by smtp.gmail.com with ESMTPSA id k3sm17592030pfu.180.2022.02.08.18.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 18:16:43 -0800 (PST)
Date: Wed, 9 Feb 2022 10:16:37 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 14/15] migration: Postcopy preemption on separate
 channel
Message-ID: <YgMkBYOTBrjLQbPc@xz-m1.local>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-15-peterx@redhat.com>
 <YfwUvGfE46G1oXOv@work-vm> <YgHv/4Ep4JUhfLB4@xz-m1.local>
 <YgJS3qUuyopB+JFZ@work-vm> <YgJWeQm3THpv8iG/@xz-m1.local>
 <YgJu0ZoV/Z4JA4Ye@work-vm>
MIME-Version: 1.0
In-Reply-To: <YgJu0ZoV/Z4JA4Ye@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 01:23:29PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Tue, Feb 08, 2022 at 11:24:14AM +0000, Dr. David Alan Gilbert wrote:
> > > > The current model is we only have 1 postcopy channel and 1 precopy channel, but
> > > > it should be easier if we want to make it N post + 1 pre base on this series.
> > > 
> > > It's not clear to me if we need to be able to do N post + M pre, or
> > > whether we have a rule like always at least 1 post, but if there's more
> > > pagefaults in the queue then you can steal all of the pre channels.
> > 
> > Right, >1 queue length should easily happen with workloads in real cloud
> > environment.  Though even with only 1post channel we can already hit at least
> > <~1ms with this series even if there're 16 pending requests per my test.  I
> > think that may cover quite some real workloads.
> > 
> > One thing to mention is that we should always assume the pre-channels are
> > filled up with tons of pages already in the NIC send buffer, so they won't be
> > good candidate for postcopy requests, IMHO.  So I'm not sure whether we can
> > mixly use the pre/post channels - we may need to leave the post channels idle.
> 
> No I'm not sure either; even with separate channels do we have problems
> with contention on the NIC?

Not on the NIC, but on the same socket; assuming each multifd thread is working
only with one socket.

For example, we have N multifd threads/sockets.  If we find some of them are
"free" from multifd POV, it only means we can write() to those sockets, but it
does not mean that these sockets have empty send buffer.

IMHO that's the major problem we're facing: as long as a socket is shared
between pre and post purposes, then the post pages can be after some pre pages.

I think what we could to do to achieve provisioning of multi-sockets is to keep
M out of N multifd sockets to be idle (M<N), servicing postcopy faults only.
Though those M sockets/threads will work mostly different from the rest multifd
threads, hence we probably can't call it multifd anymore..

-- 
Peter Xu



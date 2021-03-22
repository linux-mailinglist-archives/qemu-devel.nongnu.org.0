Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B4344B4E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:28:57 +0100 (CET)
Received: from localhost ([::1]:52994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONQG-0008Tr-Ai
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lONJR-0002Ro-0l
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:21:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lONJO-0002QZ-EO
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616430109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fprn856YzTLynwknrBj2ikx4QLSrRE1u4QGA15i6xoU=;
 b=BhbGYffu5EE5FoVNybrpeTNOZvD5mPq8r/jatw7JaVTrMDXhLKvQgz0Ez+2bauaJGhAXda
 cu6inxHt2W2BEeB6/5pkE4q7BBB6CtoWizXV9wp6abs+zNMjNgLoIrU3r3iFWFF9kydbwt
 exr3bxViY09A7et6anqhgsGX91VryPg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-FDl90qDxN4GTpJfY88Ybig-1; Mon, 22 Mar 2021 12:21:47 -0400
X-MC-Unique: FDl90qDxN4GTpJfY88Ybig-1
Received: by mail-qv1-f71.google.com with SMTP id ev19so20420354qvb.7
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fprn856YzTLynwknrBj2ikx4QLSrRE1u4QGA15i6xoU=;
 b=o/TnW3GAuXopAn2uoCPDPeWfEJe7MYTPHLL+OSbX9XkRk3F2T3yLw87q6jEMfe2Gab
 eIrVCPSNFZKslru9uhLGQsFiLWM8d+ycsFKAmpFjRqFXpzAFQ7McG3altvdmBD7Q2NuG
 uHERp4egeVNHEa/ZWANYyNSVQrtAySY3nB5ZMyW7vbpX9GZXJ4FmV9Zrwlvro4r3yLXO
 NTmdwG6RR1TMYPe8oNNvE2JTNTYpi+sJy6eeU4nSxK3lvbeiDqDbQdEe9JIsDfsDyoFs
 WJW4kzJhBi5hHOkvuh+FizXH8MZMhLyEvxOc8CoTN2KFEUk+H/ZzIBxAoI86PYkgIlRb
 R5yQ==
X-Gm-Message-State: AOAM531eAnjAXrJmibCRsuaV1YLQUuZ3Ai8LlYL0B+RhiWxM9PN1gOOA
 JJ1jf0VXo6At12Un27uj5P58dsKSoQ0iLBzarpLlFNG/QF2vw2v/MPbV7qCyQGEPhdTNtX1Nw8t
 /czH3d+d4AxE+pvM=
X-Received: by 2002:a05:620a:214a:: with SMTP id
 m10mr863739qkm.372.1616430107014; 
 Mon, 22 Mar 2021 09:21:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtE87eYKtfe6JabwFumUY4QsSrZWI6HUluKUr7nFhz80dYXo+tQZvgXhOKz83GgzFPb3VahQ==
X-Received: by 2002:a05:620a:214a:: with SMTP id
 m10mr863717qkm.372.1616430106679; 
 Mon, 22 Mar 2021 09:21:46 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id 131sm11645872qkl.74.2021.03.22.09.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 09:21:45 -0700 (PDT)
Date: Mon, 22 Mar 2021 12:21:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 09/10] KVM: Disable manual dirty log when dirty ring
 enabled
Message-ID: <20210322162144.GB16645@xz-x1>
References: <20210310203301.194842-1-peterx@redhat.com>
 <20210310203301.194842-10-peterx@redhat.com>
 <c49abf47-412c-26b8-0a28-c1007eed0159@huawei.com>
 <47bfae75-9e2e-50da-a944-a45f64f41514@redhat.com>
MIME-Version: 1.0
In-Reply-To: <47bfae75-9e2e-50da-a944-a45f64f41514@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Hyman <huangy81@chinatelecom.cn>, Keqian Zhu <zhukeqian1@huawei.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 02:55:44PM +0100, Paolo Bonzini wrote:
> On 22/03/21 10:17, Keqian Zhu wrote:
> > Hi Peter,
> > 
> > On 2021/3/11 4:33, Peter Xu wrote:
> > > KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is for KVM_CLEAR_DIRTY_LOG, which is only
> > > useful for KVM_GET_DIRTY_LOG.  Skip enabling it for kvm dirty ring.
> > > 
> > > More importantly, KVM_DIRTY_LOG_INITIALLY_SET will not wr-protect all the pages
> > > initially, which is against how kvm dirty ring is used - there's no way for kvm
> > > dirty ring to re-protect a page before it's notified as being written first
> > > with a GFN entry in the ring!  So when KVM_DIRTY_LOG_INITIALLY_SET is enabled
> > > with dirty ring, we'll see silent data loss after migration.
> > I feel a little regret that dirty ring can not work with KVM_DIRTY_LOG_INITIALLY_SET ...
> > With KVM_DIRTY_LOG_INITIALLY_SET, we can speedup dirty log start. More important, we can
> > enable dirty log gradually. For write fault based dirty log, it greatly reduces the side
> > effect of dirty log over guest.
> > 
> > I hope we can put forward another similar optimization under dirty ring mode. :)
> 
> Indeed, perhaps (even though KVM_GET_DIRTY_LOG does not make sense with
> dirty ring) we could allow KVM_CLEAR_DIRTY_LOG.

Right, KVM_CLEAR_DIRTY_LOG is a good interface to reuse so as to grant
userspace more flexibility to explicit wr-protect some guest pages.  However
that'll need kernel reworks - obviously when I worked on the kernel part I
didn't notice this issue..

To make it a complete work, IMHO we'll also need QEMU to completely drop the
whole dirty bitmap in all the layers, then I'd expect the dirty ring idea as a
whole start to make more difference on huge vms.  They all just need some more
work which should be based on this series.

Shall we make it a "TODO" though?  E.g., I can add a comment here mentioning
about this issue.  I still hope we can have the qemu series lands soon first,
since it'll be bigger project to fully complete it.  Paolo?

Thanks,

-- 
Peter Xu



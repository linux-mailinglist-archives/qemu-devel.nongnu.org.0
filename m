Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148A0BE941
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 01:54:29 +0200 (CEST)
Received: from localhost ([::1]:58494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDH75-0001LF-Th
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 19:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57702)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iDH5S-0000fg-E7
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 19:52:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iDH5P-0001g4-PI
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 19:52:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45314)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iDH5P-0001eC-GY
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 19:52:43 -0400
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 49E16C04AC69
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 23:52:42 +0000 (UTC)
Received: by mail-pg1-f197.google.com with SMTP id 135so152887pgc.23
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 16:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oW9AjH1sS5ZWWlOu4HgojzsRF+in52y2KaByVU43nlQ=;
 b=dIIXev2MK//Z08SpW4NTVSKHOgChbyr2idy4HrKO2vmavAaW9FExKPgNpJYQmZoFIa
 FiKr2RslDhkmx9Z9CyAjZ2XiLBUGz/0JyN0VZX4jdfqdgGUK2Umj9nwyp9RA1U/kvC1/
 z0awCMMLMomtP4oFr7MV+OCWAGGvV95ku/w7NtJGE2Hqyt+5t/d/j67TLHeQ4ax+oyW9
 LsapzflFiVIT81iIbrsojO05SekfbVVfhHt28UxgdmyAYwhWVHhnIFLRXoEtSFPMDEoB
 xb25qvcp/ERDiPyG2QDZxPdKkxU7jC87MCaqGu7+ktqtrkQoa9CXYSzh8e3HBk34LtRO
 aT+w==
X-Gm-Message-State: APjAAAVkfSzn9ARItGc4INjUpHo4W3jQf16xzx6wmzu1Jbv5intsgcXQ
 XJaP60kpYQ1QeNFNqqfv9KFPsowjbFlj2j/JB52qHpRNXMWBMEv8YpR53lCas5VxNNsFxbix0Jk
 Uwj8QabHNg2Wut7w=
X-Received: by 2002:a17:902:8207:: with SMTP id
 x7mr757321pln.147.1569455561510; 
 Wed, 25 Sep 2019 16:52:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzL2JKGUMWqt5NCos+lJjQPQB7A0sBcDnLcRGlh1NvuFnzzqVIklu0nG2/aHqZ+aXQ5JJo4Yg==
X-Received: by 2002:a17:902:8207:: with SMTP id
 x7mr757296pln.147.1569455561303; 
 Wed, 25 Sep 2019 16:52:41 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n8sm157453pgt.40.2019.09.25.16.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 16:52:40 -0700 (PDT)
Date: Thu, 26 Sep 2019 07:52:35 +0800
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v7 4/4] s390: do not call
 memory_region_allocate_system_memory() multiple times
Message-ID: <20190925235235.GV28074@xz-x1>
References: <20190924144751.24149-1-imammedo@redhat.com>
 <20190924144751.24149-5-imammedo@redhat.com>
 <20190925032700.GI28074@xz-x1> <20190925135105.6e5f249a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190925135105.6e5f249a@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 25, 2019 at 01:51:05PM +0200, Igor Mammedov wrote:
> On Wed, 25 Sep 2019 11:27:00 +0800
> Peter Xu <peterx@redhat.com> wrote:
> 
> > On Tue, Sep 24, 2019 at 10:47:51AM -0400, Igor Mammedov wrote:
> > > s390 was trying to solve limited KVM memslot size issue by abusing
> > > memory_region_allocate_system_memory(), which breaks API contract
> > > where the function might be called only once.
> > > 
> > > Beside an invalid use of API, the approach also introduced migration
> > > issue, since RAM chunks for each KVM_SLOT_MAX_BYTES are transferred in
> > > migration stream as separate RAMBlocks.
> > > 
> > > After discussion [1], it was agreed to break migration from older
> > > QEMU for guest with RAM >8Tb (as it was relatively new (since 2.12)
> > > and considered to be not actually used downstream).
> > > Migration should keep working for guests with less than 8TB and for
> > > more than 8TB with QEMU 4.2 and newer binary.
> > > In case user tries to migrate more than 8TB guest, between incompatible
> > > QEMU versions, migration should fail gracefully due to non-exiting
> > > RAMBlock ID or RAMBlock size mismatch.
> > > 
> > > Taking in account above and that now KVM code is able to split too
> > > big MemorySection into several memslots, partially revert commit
> > >  (bb223055b s390-ccw-virtio: allow for systems larger that 7.999TB)
> > > and use kvm_set_max_memslot_size() to set KVMSlot size to
> > > KVM_SLOT_MAX_BYTES.
> > > 
> > > 1) [PATCH RFC v2 4/4] s390: do not call  memory_region_allocate_system_memory() multiple times
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> > 
> > Acked-by: Peter Xu <peterx@redhat.com>
> > 
> > IMHO it would be good to at least mention bb223055b9 in the commit
> > message even if not with a "Fixed:" tag.  May be amended during commit
> > if anyone prefers.
> 
> /me confused, bb223055b9 is mentioned in commit message

I'm sorry, I overlooked that.

>  
> > Also, this only applies the split limitation to s390.  Would that be a
> > good thing to some other archs as well?
> 
> Don't we have the similar bitmap size issue in KVM for other archs?

Yes I thought we had.  So I feel like it would be good to also allow
other archs to support >8TB mem as well.  Thanks,

-- 
Peter Xu


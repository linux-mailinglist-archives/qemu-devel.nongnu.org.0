Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3533712E3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:18:12 +0200 (CEST)
Received: from localhost ([::1]:48330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUiR-0000bN-Ei
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ldUfW-0007Bg-9R
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:15:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ldUfU-0005yg-Es
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620033307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ivhBzJxCglYk/WN8qV1DNyck8uFjfmDAqe0NmFtmXrc=;
 b=N9M3a9jK6UK1bVACGawXzz3ry285W0R3b5ZS9de4TgL6yZkbShgqccwQzxuoKv/H8twNTi
 PwOLpAhDEjtpHb7BYMtTKLg7Ia2DB1wRKSzqaReIzh17GBHhzK6jRBfo9m1PRDFkeLvX2F
 ht9xPwBhIxBFyfnbrZR76rVIoPDLAlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-kV73bjqwPK6Zo4XS-eMaxA-1; Mon, 03 May 2021 05:15:06 -0400
X-MC-Unique: kV73bjqwPK6Zo4XS-eMaxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2315D6D249;
 Mon,  3 May 2021 09:15:05 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-109.ams2.redhat.com
 [10.36.113.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28C2F5D736;
 Mon,  3 May 2021 09:14:59 +0000 (UTC)
Date: Mon, 3 May 2021 11:14:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 4/4] pc-bios/s390-ccw: Allow building with Clang, too
Message-ID: <20210503111457.6f8e3597.cohuck@redhat.com>
In-Reply-To: <87mttcdy4n.fsf@dusky.pond.sub.org>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-5-thuth@redhat.com>
 <87r1iofm61.fsf@dusky.pond.sub.org>
 <15271277-98c2-3925-5937-b9f04ad376b3@redhat.com>
 <3808e5d4-b755-bce5-a25f-2d46ed6a59e7@redhat.com>
 <87mttcdy4n.fsf@dusky.pond.sub.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 03 May 2021 10:23:20 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> David Hildenbrand <david@redhat.com> writes:
> 
> > On 03.05.21 07:17, Thomas Huth wrote:  
> >> On 03/05/2021 06.58, Markus Armbruster wrote:  
> >>> Thomas Huth <thuth@redhat.com> writes:
> >>>  
> >>>> Clang unfortunately does not support generating code for the z900
> >>>> architecture level and starts with the z10 instead. Thus to be able
> >>>> to support compiling with Clang, we have to check for the supported
> >>>> compiler flags. The disadvantage is of course that the bios image
> >>>> will only run with z10 guest CPUs upwards (which is what most people
> >>>> use anyway), so just in case let's also emit a warning in that case.  
> >>>
> >>> What happens when you try to use this bios with an old CPU anyway?  
> >> 
> >> Interesting question. I was expecting the guest to crash since it would be
> >> using a CPU instruction that is not supported on the old CPU model. But I
> >> just gave it a try, and there was no crash. The guest booted just fine.
> >> Either Clang only emits instructions that work with the old z900 anyway, or
> >> our emulation in QEMU is imprecise and we allow newer instructions to be
> >> executed on old models, too.  
> >
> > Yes, that's currently still done. We once thought about disabling that 
> > (there was a patch from Richard), but decided against it because -- back 
> > then -- the default QEMU model was still very basic and would have 
> > essentially disabled all more recent instructions as default.
> >
> > We can most probably do that change soon as we have a "fairly new" 
> > default QEMU CPU model. I can glue it to my z14 change.  
> 
> In case this makes the BIOS crash with old CPUs: when a guest refuses to
> start because the BIOS was compiled the wrong way for it, configure
> having told you so back then is not a nice user experience.  Can we do
> better, with reasonable effort?

I fear the experience will be as bad as for any guest that is using
features from a newer cpu level (i.e. random crashes when the guest
actually tries to use that newer instruction.)

I see two options:
- Just try to start and hope that it works.
- Deprecate any cpu model older than z10.

Anyone have a better idea? I don't particularly like any of the two.



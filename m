Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC20431D94
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:52:29 +0200 (CEST)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcT40-0004W4-5b
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcT1g-0002xP-Is
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcT1e-0002em-R3
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634565001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6dOTP+/NtvBqYqh9zL4xhTXLzA/eMD2oob75CH5+CQ=;
 b=d1N06KPvw7FMItL/ADFxHic6MtDYAhGkc1O20ERdiiUsKZ6AZ+MpVMDrPydMIaYbYjLWMh
 PvgwaVGpTIECYRoRNHHCUDj/shF9h7/+xsvYxREqgVoEKUAoThtfKtPO2osFi13ZI6CicJ
 K67ZTPMbg/watJSivuhnIeI+OP4Gcus=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-LeZ4rGMnMTmYXTWtZelnkg-1; Mon, 18 Oct 2021 09:50:00 -0400
X-MC-Unique: LeZ4rGMnMTmYXTWtZelnkg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k9-20020a7bc409000000b0030d978403e9so2104070wmi.7
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 06:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B6dOTP+/NtvBqYqh9zL4xhTXLzA/eMD2oob75CH5+CQ=;
 b=zaya7WkgVtTf8uVmK2y9qqDRqdGqhukuXF6mE5M1WCzB44o2A10XY58WYJU7d4RRgg
 0PpY9JoMq1O3ykYJSUCuqXQRh8mb3vyYsDHQZf/QWDww6gybaw09rS24G8e1ObMGCkqs
 TJHbihc06poreqfYhLI11MB5fWp0dx07Wu2yvPgfjG8JY1B4zNUppZFWd/YJXlUX0aU8
 CvZUUq0DeIhuI4yZEYgjhxGKO2jxUw67fQEcE1ipmQLL8/9+l5LmYpxgO9XCsmqpB7e5
 0OXC42048idmo/kTOMVIf3RcJN0BV7ZZq9S8nNE+fYRfJltuzXN5K2RNbLWtARrVVcXK
 yhtw==
X-Gm-Message-State: AOAM532SYMblVPv9udhZ4dxaHA+5rLCaxbW+kaVTgwKjqNrOPXkjBL2q
 ITSsmTWDJmzCy723CNuEWKzLdKQppjSOaQNz14MvZRQA2AhkHc5azVOM6hLqji3Y90Fq7IjjUPT
 LLOGISLVzql8F4I0=
X-Received: by 2002:a5d:6892:: with SMTP id h18mr35483303wru.177.1634564998212; 
 Mon, 18 Oct 2021 06:49:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgXzlbJ7TctqODTfKa+5/mCqnZLiHWXXbIxCV83QJEci1vKDy+c2I5v1rTB8CPov8gLDbIJA==
X-Received: by 2002:a5d:6892:: with SMTP id h18mr35483255wru.177.1634564997865; 
 Mon, 18 Oct 2021 06:49:57 -0700 (PDT)
Received: from redhat.com ([2.55.19.190])
 by smtp.gmail.com with ESMTPSA id c17sm12837208wrq.4.2021.10.18.06.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 06:49:56 -0700 (PDT)
Date: Mon, 18 Oct 2021 09:49:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Message-ID: <20211018094924-mutt-send-email-mst@kernel.org>
References: <20211011201047.62587-1-david@redhat.com>
 <YWapnsmfDMPj80Sd@stefanha-x1.localdomain>
 <20211014045239.GA21284@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20211014045239.GA21284@raphael-debian-dev>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 04:52:48AM +0000, Raphael Norwitz wrote:
> On Wed, Oct 13, 2021 at 10:40:46AM +0100, Stefan Hajnoczi wrote:
> > On Mon, Oct 11, 2021 at 10:10:47PM +0200, David Hildenbrand wrote:
> > > We end up not copying the mmap_addr of all existing regions, resulting
> > > in a SEGFAULT once we actually try to map/access anything within our
> > > memory regions.
> > > 
> > > Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
> > > Cc: qemu-stable@nongnu.org
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > > Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
> > > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Coiby Xu <coiby.xu@gmail.com>
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >  subprojects/libvhost-user/libvhost-user.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> > > index bf09693255..787f4d2d4f 100644
> > > --- a/subprojects/libvhost-user/libvhost-user.c
> > > +++ b/subprojects/libvhost-user/libvhost-user.c
> > > @@ -816,6 +816,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> > >              shadow_regions[j].gpa = dev->regions[i].gpa;
> > >              shadow_regions[j].size = dev->regions[i].size;
> > >              shadow_regions[j].qva = dev->regions[i].qva;
> > > +            shadow_regions[j].mmap_addr = dev->regions[i].mmap_addr;
> > >              shadow_regions[j].mmap_offset = dev->regions[i].mmap_offset;
> > >              j++;
> > >          } else {
> > 
> > Raphael: Some questions about vu_rem_mem_reg():
> > 
> > - What ensures that shadow_regions[VHOST_USER_MAX_RAM_SLOTS] is large
> >   enough? The add_mem_reg/set_mem_table code doesn't seem to check
> >   whether there is enough space in dev->regions[] before adding regions.
> >
> 
> Correct - it does not check if there is enough space as is. I can add that.


Just making sure - you are now working on series supreceding this patch?
Is that right?

> > - What happens when the master populated dev->regions[] with multiple
> >   copies of the same region? dev->nregions is only decremented once and
> >   no longer accurately reflects the number of elements in
> >   dev->regions[].
> 
> That case is also not accounted for. I will add it.
> 
> > 
> > libvhost-user must not trust the vhost-user master since vhost-user
> > needs to provide process isolation. Please add input validation.
> > 
> 
> Got it - let me start working on a series.
> 
> > Stefan



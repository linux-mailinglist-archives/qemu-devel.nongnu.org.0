Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D9548FFEF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 02:29:13 +0100 (CET)
Received: from localhost ([::1]:33890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Gpc-0003dd-5u
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 20:29:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9Gnl-0002jo-Is
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 20:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9Gnj-0007Ut-1A
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 20:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642382832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aeGZmhO3PGEqmkTklwcrdP4OLZNL648yPMFy3DnU7fA=;
 b=YAHKWau0Gph7noK/Dit/BonWp++cRM/F1Agh00vB3PdNCU/wvG386sMmM6H+EYODGHv3ND
 Vpj/fBdUKZsf7QuPcWCVORPkzxSjp42WPnkPng8LhXU/qZVWh3PO322nFsNt9XevuiFgor
 uSp1ntP7N94DLWV9oacP1JExx9xHN0E=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-b1ycEHSbP6OJaqVBEKy9dA-1; Sun, 16 Jan 2022 20:27:10 -0500
X-MC-Unique: b1ycEHSbP6OJaqVBEKy9dA-1
Received: by mail-pg1-f197.google.com with SMTP id
 g12-20020a63200c000000b00342cd03227aso6609582pgg.19
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 17:27:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aeGZmhO3PGEqmkTklwcrdP4OLZNL648yPMFy3DnU7fA=;
 b=nZxTzAjgIHpiPmJ+qMKETWvh+1sE2wnam27K051nft08DUWYEAXPQSm+hYfBHIIf4D
 gPbdk6Ukrki8ftoUIOGD/QmpFSupjt6y+t25hnIh1ARXw2WDi96LUVS4FvQvfBfgoHsk
 wBTRDZVuJM7DhubWtt7hG5lG9uvqGXw02DmxffmjqA4bNUiDRovih34ayrHHO/Jl63ng
 XZf9NY4J5nCA+0fLVaWx1GeCPpd6Rq6e0gpAwJBtQkk+CIvWUcXD87Xjhg/ERsppUico
 49fXIjkSIVx9IKUB/BCZyU/qDoDJubWRCTq8RGtYy6vd5ZKsaGDhzazHSdPMjLUOSQ2v
 s7JA==
X-Gm-Message-State: AOAM533629jBn+T1tJL6N/gShYPH/qC7gWs6PxSIMi/T9KMGDRYPrntz
 7O6fsFn5hNiBcsi/yoYXFGyIjk4fZe3AZqbBoyrPBW3kG9R4NhxGKG5HWpdMFi0+46lTz7Ly73c
 TJvRacV24bKNynfs=
X-Received: by 2002:a63:2c93:: with SMTP id
 s141mr16980762pgs.337.1642382829738; 
 Sun, 16 Jan 2022 17:27:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvHFBkKIprjqOum2pC36nvrD/thxrm/cP3e1RBbHG4nqffz0y/CA4fiAkzNL70Vjd9g2OPzw==
X-Received: by 2002:a63:2c93:: with SMTP id
 s141mr16980745pgs.337.1642382829424; 
 Sun, 16 Jan 2022 17:27:09 -0800 (PST)
Received: from xz-m1.local ([191.101.132.59])
 by smtp.gmail.com with ESMTPSA id e3sm9737874pgm.51.2022.01.16.17.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 17:27:08 -0800 (PST)
Date: Mon, 17 Jan 2022 09:27:03 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/3] intel-iommu: drop VTDBus
Message-ID: <YeTF58bY96CiFQsc@xz-m1.local>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-4-jasowang@redhat.com>
 <Yd+mlM7oqqOkFtO4@xz-m1.local>
 <b542cb8d-d1f4-6583-a89e-49dedafc77d4@redhat.com>
 <54f9372b-7a04-28db-5f27-0eafaf87d632@redhat.com>
MIME-Version: 1.0
In-Reply-To: <54f9372b-7a04-28db-5f27-0eafaf87d632@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yi.l.liu@intel.com, yi.y.sun@linux.intel.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 05:15:35PM +0800, Jason Wang wrote:
> 
> 在 2022/1/14 上午10:32, Jason Wang 写道:
> > > > dressSpace *as)
> > > >   /* GHashTable functions */
> > > >   static gboolean vtd_uint64_equal(gconstpointer v1, gconstpointer v2)
> > > >   {
> > > > -    return *((const uint64_t *)v1) == *((const uint64_t *)v2);
> > > > +    const struct vtd_as_key *key1 = v1;
> > > > +    const struct vtd_as_key *key2 = v2;
> > > > +
> > > > +    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn);
> > > >   }
> > > >     static guint vtd_uint64_hash(gconstpointer v)
> > > >   {
> > > > -    return (guint)*(const uint64_t *)v;
> > > > +    const struct vtd_as_key *key = v;
> > > > +    guint value = (guint)(uintptr_t)key->bus;
> > > > +
> > > > +    return (guint)(value << 8 | key->devfn);
> > > Note that value is a pointer to PCIBus*.  Just want to check with
> > > you that it's
> > > intended to use this hash value (or maybe you wanted to use Source
> > > ID so it is
> > > bus number to use not the bus pointer)?
> > 
> > 
> > Right, SID should be used here.
> 
> 
> Sorry for taking too long for the context switching ...
> 
> The hash and shift based the bus pointer is intended since we use bus
> pointer as part of the key. The reason is still, during vtd_find_add_as(),
> SID is not correct since guest might not finish the initialization of the
> device and PCI bridge.

Ah, right.

However here value is left-shifted 8 bits so I'm not sure how it could
guarantee no collision - logically any addresses that match lower 56 bits will
hit with the same devfn by accident.

I don't think it'll matter in reality, but... wondering whether it's easier to
simply use g_direct_hash() (the glibc provided hash function when hash==NULL is
passed over, IOW we simply pass hash_func=NULL for g_hash_table_new) so we'll
hash with struct vtd_as_key* instead; IMHO that'll suffice too.

Thanks,

-- 
Peter Xu



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B650BB37
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:07:49 +0200 (CEST)
Received: from localhost ([::1]:47530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhusu-0004rJ-J4
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhupG-0001mq-8r
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:04:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhupB-0008VW-Cj
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650639836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PVLCG+kf2qyF37t0fi9BB5xYYsocEvjVUcHq6sllP9c=;
 b=LFGR2Sakbdwbld2hUw3abI1Ow3TV+8fGFdtirIXqgYw2DSpUj8Qq/aDasrM8PS3TcGxguv
 aWMfdVxz41Sn2KSQQe3dzyK+AplzeBDxKhkft/el2e1VFcFO2d3mOn0s9eqPpWiALguKpK
 T/kRp5KoDOY6RUNUc7bhE40nS3o6zjc=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-F0hLM4t2OmqiCwznAzNUGg-1; Fri, 22 Apr 2022 11:03:54 -0400
X-MC-Unique: F0hLM4t2OmqiCwznAzNUGg-1
Received: by mail-io1-f72.google.com with SMTP id
 c25-20020a5d9399000000b00652e2b23358so5561858iol.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PVLCG+kf2qyF37t0fi9BB5xYYsocEvjVUcHq6sllP9c=;
 b=OpqqsJ0ZWY8TwX4bIrhDSFYJlVmqz6L5M2vWdU8t6qZt7dF9s0qExcdPtZG5R2qF13
 U+SuMHZ0cNXPtxATcbg05nr7DECzY/9Hjc/KIxRxchHjvmG2TOTzu3+fySJ0fwticUGv
 ttd2A3Q0Uu8enAPeG2jgvOx84OHma/ddo0Y3a+7F8xdtu7vEfFW7Cgd8KMC/MWs7PDH4
 40V3sD8Esv7FGegG986Yf8icPj7I8LeSUcKFaYIt+Is6qqpweA6MPOY1kna8HFQaLpZn
 w9nxAGGA4QZXxRL8jUVdEEknkkKWNM5Pcv3yco1xJj38sQzRYY//kTjj9gisEnX+iPtf
 84/A==
X-Gm-Message-State: AOAM533bQILA8DcNr6lDmDX+tdg2WWw0iR5RC53eiRozSpKIG84n0X1m
 ZccZqt6UOZBo9O9pPaFdKcLVpuSJw39jMwQ4fbSInOkYc01DouHv3ixm3CRCTjW40ZrgX7NEQGR
 AabZyEHYIl7T3ENY=
X-Received: by 2002:a05:6602:2a42:b0:652:8e2d:e4b7 with SMTP id
 k2-20020a0566022a4200b006528e2de4b7mr1465076iov.142.1650639833756; 
 Fri, 22 Apr 2022 08:03:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVwTR+h5YGCUYxX95hStL5v0t4jC8GRP8VTDOA5uwx6qoTgbhk9xcxvvYHbZAP4587GXeBHw==
X-Received: by 2002:a05:6602:2a42:b0:652:8e2d:e4b7 with SMTP id
 k2-20020a0566022a4200b006528e2de4b7mr1465042iov.142.1650639833177; 
 Fri, 22 Apr 2022 08:03:53 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 131-20020a6b0189000000b0065393383518sm1779653iob.48.2022.04.22.08.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:03:52 -0700 (PDT)
Date: Fri, 22 Apr 2022 11:03:51 -0400
From: Peter Xu <peterx@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V2 4/4] intel-iommu: PASID support
Message-ID: <YmLD12KqzgVDih1O@xz-m1.local>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB52762D1CDE8F5417370762CE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtr5byTaRFQT-ut6=ziyOTKBgne_Xa2qu4Nu9Z7sDDmBg@mail.gmail.com>
 <BN9PR11MB52767EA8BF5EA39488D149408C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtCAra8SbubYbqMVO8E6MUwNUaJLM5bVJ32rA31uemVAA@mail.gmail.com>
 <BN9PR11MB52765ACF64CE589365DD7F778C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsFd=tzta103cOyhyRvhHWKvLrTwttGwAh+GPBrxNYTiw@mail.gmail.com>
 <BL1PR11MB5271E349257909AB5754E7A78CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BL1PR11MB5271E349257909AB5754E7A78CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Jason Wang <jasowang@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 02, 2022 at 07:27:15AM +0000, Tian, Kevin wrote:
> > > > > Earlier when Yi proposed Qemu changes for guest SVA [1] he aimed for
> > a
> > > > > coarse-grained knob design:
> > > > > --
> > > > >   Intel VT-d 3.0 introduces scalable mode, and it has a bunch of
> > capabilities
> > > > >   related to scalable mode translation, thus there are multiple
> > combinations.
> > > > >   While this vIOMMU implementation wants simplify it for user by
> > providing
> > > > >   typical combinations. User could config it by "x-scalable-mode" option.
> > > > The
> > > > >   usage is as below:
> > > > >     "-device intel-iommu,x-scalable-mode=["legacy"|"modern"]"
> > > > >
> > > > >     - "legacy": gives support for SL page table
> > > > >     - "modern": gives support for FL page table, pasid, virtual command
> > > > >     -  if not configured, means no scalable mode support, if not proper
> > > > >        configured, will throw error
> > > > > --
> > > > >
> > > > > Which way do you prefer to?
> > > > >
> > > > > [1] https://lists.gnu.org/archive/html/qemu-devel/2020-
> > 02/msg02805.html
> > > >
> > > > My understanding is that, if we want to deploy Qemu in a production
> > > > environment, we can't use the "x-" prefix. We need a full
> > > > implementation of each cap.
> > > >
> > > > E.g
> > > > -device intel-iommu,first-level=on,scalable-mode=on etc.
> > > >
> > >
> > > You meant each cap will get a separate control option?
> > >
> > > But that way requires the management stack or admin to have deep
> > > knowledge about how combinations of different capabilities work, e.g.
> > > if just turning on scalable mode w/o first-level cannot support vSVA
> > > on assigned devices. Is this a common practice when defining Qemu
> > > parameters?
> > 
> > We can have a safe and good default value for each cap. E.g
> > 
> > In qemu 8.0 we think scalable is mature, we can make scalable to be
> > enabled by default
> > in qemu 8.1 we think first-level is mature, we can make first level to
> > be enabled by default.
> > 
> 
> OK, that is a workable way.

Sorry again for a very late comment, I think I agree with both of you. :-)

For debugging purpose parameters like pasid-mode, I'd suggest we make the
default value to be always depend on the parmaeters that we'll expose to
the user at last always with the coarse-grained way.

Assuming that's scalable-mode to be exported by plan (which sounds
reasonable), then we by default have pasid mode on if scalable-mode is
modern, otherwise off.  IMHO we don't even need to bother with turning it
on/off in machine types since we don't even declare these debugging
parameters supported, do we? :)

But these debugging parameters could be useful for debugging and triaging
for sure, keeping them always prefixed with x-.  So it makes sense to have
them when we're making intermediate steps for the whole building.

Then at some point all things stable we export scalable-mode to replace
x-scalable-mode, with an initial versioning alongside (and it doesn't need
to be started with vt-d 3.0, maybe rev3.3 or even later).

How's that sound?

Thanks,

-- 
Peter Xu



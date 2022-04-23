Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD3550CC6E
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 18:53:43 +0200 (CEST)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niJ0w-0001FD-A6
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 12:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1niIzS-0000Tf-HZ
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 12:52:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1niIzO-0006Dx-M0
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 12:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650732724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5wCx8syVH+YyQXpJOwdcQUPK5bUwqhhqaFYAbSa7BPI=;
 b=J17RFiSSUJhb2OmTlPI6QLZ+QSE73sWHEC5hXgOqwknP6UkzK24Bz/XyHmydg4rokKCkWQ
 w6OEwK2SzwQrnwM+nQ4JT+OybskW2r9eLcJXI19AjR9GkSFCyXrt4jcvHe2XfP18MWU73c
 8YDhI0phVnL9eW1JJjMvoqEISi6yf/s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-VSt1rOAhMOyF49Bfz3ElMA-1; Sat, 23 Apr 2022 12:52:03 -0400
X-MC-Unique: VSt1rOAhMOyF49Bfz3ElMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so1135179wme.5
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 09:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5wCx8syVH+YyQXpJOwdcQUPK5bUwqhhqaFYAbSa7BPI=;
 b=l4bMDWiHQbuG68VEuhYv8Wkqq3W0mUVabDw8lmVd8TbmthhzmpR3/53QG+9/K0DdMf
 VxJGkp8DI09SkNNJzRfkiOkDF/ftqaOTam1USdb+dvAOkcu+2sA7lti5cOXKkt8s8XmP
 hacA8vML52CDuLh3gs6Qwof32F1zhtkRdwpzIyRacLZipJWLQsGopw4K0U5t5J3N5GAG
 dy7Lehst30EnPR9REKFB/LobmxOkyGcwVuaKUVFTuutW2XQp5Itjgu7AyApse62jrhXh
 eXHRTOUVLWa11lPWgPj/K6PsXb1mEh9KkhbB6PrcRszuqdvQX5x76JiBX5DI/573/aMj
 +Pww==
X-Gm-Message-State: AOAM532NCtqAbsn/L6lx9xbHft9Kyc7i26yNzmY7C65NFGWfxBtwEav9
 8pXZTFnxmNBERNlvZi0Hjvxrpko+SjoyOP91IZQXM92x6hkhrkf+YEVDllDVklPe4goTJ6G1zow
 GPdCdF/iaRyLg+j4=
X-Received: by 2002:adf:ee4c:0:b0:20a:ca2f:4a0e with SMTP id
 w12-20020adfee4c000000b0020aca2f4a0emr6406162wro.110.1650732721837; 
 Sat, 23 Apr 2022 09:52:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweodPhoOTGO3Apm5M9eKTsqeNDAeO/QLPxARtbufulny/iAYRugdNtPpF9F60WUnc7j2bpXg==
X-Received: by 2002:adf:ee4c:0:b0:20a:ca2f:4a0e with SMTP id
 w12-20020adfee4c000000b0020aca2f4a0emr6406148wro.110.1650732721524; 
 Sat, 23 Apr 2022 09:52:01 -0700 (PDT)
Received: from redhat.com ([2.52.4.155]) by smtp.gmail.com with ESMTPSA id
 g8-20020a5d4888000000b00207a49fa6a1sm5163810wrq.81.2022.04.23.09.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 09:52:00 -0700 (PDT)
Date: Sat, 23 Apr 2022 12:51:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH V2 4/4] intel-iommu: PASID support
Message-ID: <20220423125149-mutt-send-email-mst@kernel.org>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB52762D1CDE8F5417370762CE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtr5byTaRFQT-ut6=ziyOTKBgne_Xa2qu4Nu9Z7sDDmBg@mail.gmail.com>
 <BN9PR11MB52767EA8BF5EA39488D149408C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtCAra8SbubYbqMVO8E6MUwNUaJLM5bVJ32rA31uemVAA@mail.gmail.com>
 <BN9PR11MB52765ACF64CE589365DD7F778C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsFd=tzta103cOyhyRvhHWKvLrTwttGwAh+GPBrxNYTiw@mail.gmail.com>
 <BL1PR11MB5271E349257909AB5754E7A78CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
 <YmLD12KqzgVDih1O@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmLD12KqzgVDih1O@xz-m1.local>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 11:03:51AM -0400, Peter Xu wrote:
> On Sat, Apr 02, 2022 at 07:27:15AM +0000, Tian, Kevin wrote:
> > > > > > Earlier when Yi proposed Qemu changes for guest SVA [1] he aimed for
> > > a
> > > > > > coarse-grained knob design:
> > > > > > --
> > > > > >   Intel VT-d 3.0 introduces scalable mode, and it has a bunch of
> > > capabilities
> > > > > >   related to scalable mode translation, thus there are multiple
> > > combinations.
> > > > > >   While this vIOMMU implementation wants simplify it for user by
> > > providing
> > > > > >   typical combinations. User could config it by "x-scalable-mode" option.
> > > > > The
> > > > > >   usage is as below:
> > > > > >     "-device intel-iommu,x-scalable-mode=["legacy"|"modern"]"
> > > > > >
> > > > > >     - "legacy": gives support for SL page table
> > > > > >     - "modern": gives support for FL page table, pasid, virtual command
> > > > > >     -  if not configured, means no scalable mode support, if not proper
> > > > > >        configured, will throw error
> > > > > > --
> > > > > >
> > > > > > Which way do you prefer to?
> > > > > >
> > > > > > [1] https://lists.gnu.org/archive/html/qemu-devel/2020-
> > > 02/msg02805.html
> > > > >
> > > > > My understanding is that, if we want to deploy Qemu in a production
> > > > > environment, we can't use the "x-" prefix. We need a full
> > > > > implementation of each cap.
> > > > >
> > > > > E.g
> > > > > -device intel-iommu,first-level=on,scalable-mode=on etc.
> > > > >
> > > >
> > > > You meant each cap will get a separate control option?
> > > >
> > > > But that way requires the management stack or admin to have deep
> > > > knowledge about how combinations of different capabilities work, e.g.
> > > > if just turning on scalable mode w/o first-level cannot support vSVA
> > > > on assigned devices. Is this a common practice when defining Qemu
> > > > parameters?
> > > 
> > > We can have a safe and good default value for each cap. E.g
> > > 
> > > In qemu 8.0 we think scalable is mature, we can make scalable to be
> > > enabled by default
> > > in qemu 8.1 we think first-level is mature, we can make first level to
> > > be enabled by default.
> > > 
> > 
> > OK, that is a workable way.
> 
> Sorry again for a very late comment, I think I agree with both of you. :-)
> 
> For debugging purpose parameters like pasid-mode, I'd suggest we make the
> default value to be always depend on the parmaeters that we'll expose to
> the user at last always with the coarse-grained way.
> 
> Assuming that's scalable-mode to be exported by plan (which sounds
> reasonable), then we by default have pasid mode on if scalable-mode is
> modern, otherwise off.  IMHO we don't even need to bother with turning it
> on/off in machine types since we don't even declare these debugging
> parameters supported, do we? :)
> 
> But these debugging parameters could be useful for debugging and triaging
> for sure, keeping them always prefixed with x-.  So it makes sense to have
> them when we're making intermediate steps for the whole building.
> 
> Then at some point all things stable we export scalable-mode to replace
> x-scalable-mode, with an initial versioning alongside (and it doesn't need
> to be started with vt-d 3.0, maybe rev3.3 or even later).
> 
> How's that sound?
> 
> Thanks,
> 
> -- 
> Peter Xu

Sounds good.

-- 
MST



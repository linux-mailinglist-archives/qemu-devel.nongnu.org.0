Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C429E5BE962
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 16:53:48 +0200 (CEST)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaed9-0007IV-GE
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 10:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oacMh-00014D-IN
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:28:44 -0400
Received: from mga05.intel.com ([192.55.52.43]:19982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oacMe-0001pr-SR
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663676916; x=1695212916;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kg1lUUxe57I1mHkfNHZW9UpGAYi8KDGqFhFrsmb9zDo=;
 b=GPygw/5HWcM5ltLwkhq/t31uIQIixdGz34eYMFIM/KflK3U3dOaOZtQn
 G6cQk9u1jKBvYKT/fFLGR3FMXwuNOPWVU4Nn8tYzIDPQCBJ35reeIgCC2
 +3jUC4D0E4ftR2Lf9Oc4ssIwD/ARzmyVys2ukdIWMCPAu3D60+se/Wkr5
 /CRygYPBa3jz80U8l7PCNahRQbI8KHDMMX7bKTq6vVWDp4/XOEW4AZpNN
 Z804fCn3wgXuplFQuGigOy4r5lGmOnbDEPwS2Rk1gdo42rVO2Qi6iOH3E
 egdSBC8qjRBpqFMFuIDxMuzpiSZvRcj56IsVO9rt3GI+ihJ3uq9ImPKg7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="385966068"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="385966068"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 05:28:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="687391678"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2022 05:28:31 -0700
Message-ID: <79e4c6a123e5b1edfaaa88f6ea12facedbaf5711.camel@linux.intel.com>
Subject: Re: [PATCH v3 4/5] acpi/nvdimm: Implement ACPI NVDIMM Label Methods
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca, 
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org, 
 robert.hu@intel.com
Date: Tue, 20 Sep 2022 20:28:31 +0800
In-Reply-To: <20220920111302.0c1716af@redhat.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
 <20220901032721.1392482-5-robert.hu@linux.intel.com>
 <20220909153910.557fdbe7@redhat.com>
 <78f021195335f1cc9d01071db58a51539f29c597.camel@linux.intel.com>
 <20220916093757.689a939f@redhat.com>
 <80b09055416c790922c7c3db60d2ba865792d1b0.camel@linux.intel.com>
 <20220920111302.0c1716af@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=robert.hu@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-09-20 at 11:13 +0200, Igor Mammedov wrote:
> On Fri, 16 Sep 2022 21:15:35 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> 
> > On Fri, 2022-09-16 at 09:37 +0200, Igor Mammedov wrote:
> > 
> > > > Fine, get your point now.
> > > > In ASL it will look like this:
> > > >                     Local1 = Package (0x3) {STTS, SLSA, MAXT}
> > > >                     Return (Local1)  
> > > 
> > >   
> > > > 
> > > > But as for 
> > > >                     CreateDWordField (Local0, Zero, STTS)  //
> > > > Status
> > > >                     CreateDWordField (Local0, 0x04, SLSA)  //
> > > > SizeofLSA
> > > >                     CreateDWordField (Local0, 0x08, MAXT)  //
> > > > Max
> > > > Trans
> > > > 
> > > > I cannot figure out how to substitute with LocalX. Can you shed
> > > > more
> > > > light?  
> > > 
> > > Leave this as is, there is no way to make it anonymous/local with
> > > FooField.
> > > 
> > > (well one might try to use Index and copy field's bytes into a
> > > buffer
> > > and
> > > then explicitly convert to Integer, but that's a rather
> > > convoluted
> > > way
> > > around limitation so I'd not go this route)
> > >   
> > 
> > OK, pls. take a look, how about this?
> > 
> > Method (_LSI, 0, Serialized)  // _LSI: Label Storage Information
> > {   
> >     Local0 = NCAL (ToUUID("4309ac30-0d11-11e4-9191-0800200c9a66"),
> > 0x02, 0x04, Zero, One)    // Buffer
> >     CreateDWordField (Local0, Zero, STTS)  // Status
> >     CreateDWordField (Local0, 0x04, SLSA)  // Size of LSA
> >     CreateDWordField (Local0, 0x08, MAXT)  // Max Transfer Size
> >     Local1 = Package (0x3) {STTS, SLSA, MAXT}
> >     Return (Local1)
> > }
> > 
> > Method (_LSR, 2, Serialized)  // _LSR: Label Storage Read
> > {
> >     Name (INPT, Buffer(8) {})
> >     CreateDWordField (INPT, Zero, OFST);
> >     CreateDWordField (INPT, 4, LEN);
> 
> why do you have to create and use INPT, wouldn't local be enough to
> keep the buffer?

If substitute INPT with LocalX, then later
Local0 = Package (0x01) {LocalX} isn't accepted.

PackageElement :=
DataObject | NameString
> 
> >     OFST = Arg0
> >     LEN = Arg1
> >     Local0 = Package (0x01) {INPT}
> >     Local3 = NCAL (ToUUID("4309ac30-0d11-11e4-9191-0800200c9a66"),
> > 0x02, 0x05, Local0, One)
> >     CreateDWordField (Local3, Zero, STTS)
> >     CreateField (Local3, 32, LEN << 3, LDAT)
> >     Local1 = Package (0x2) {STTS, toBuffer(LDAT)}
> >     Return (Local1)
> > }
> > 
> > Method (_LSW, 3, Serialized)  // _LSW: Label Storage Write
> > {
> >     Local2 = Arg2
> >     Name (INPT, Buffer(8) {})
> 
> ditto
> 
> >     CreateDWordField (INPT, Zero, OFST);
> >     CreateDWordField (INPT, 4, TLEN);
> >     OFST = Arg0
> >     TLEN = Arg1
> >     Concatenate(INPT, Local2, INPT)
> >     Local0 = Package (0x01)
> >     {
> >         INPT
> >     }
> >     Local3 = NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"),
> > 0x02, 0x06, Local0, One)
> >     CreateDWordField (Local3, 0, STTS)
> >     Return (STTS)
> > }




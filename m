Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EAC5E57F8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 03:24:34 +0200 (CEST)
Received: from localhost ([::1]:39894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obAx7-0002IR-Bt
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 21:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1obAvU-0000ea-8s
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 21:22:52 -0400
Received: from mga11.intel.com ([192.55.52.93]:59410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1obAvR-0003OO-Ky
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 21:22:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663809769; x=1695345769;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wFdk/RL3u+55HbD75ch9sUUEqvIR4qO9wf3g8ClY4bI=;
 b=Is+cFfPfokMuZxRb3shdg+fjmHeGQIJ+WG6lgYIVUN6x4bRWoTIXhbNt
 +6UzQ9JM2/fyxCoNn+DyE7DGRndOEN4+97SWkwGSnlIwHiVOYTJoRPRZ4
 cAixz5Xrz6nNQgXNIqSkuxutDvJ+T/3yfNehmQ4HqbuVSLPX2d2gbWH5f
 VRI7bJtDaACV1PaDX8NfzboSuYFEUvnElh+4sAOxjR0qrrMLiBNzp+zBx
 QEVPpM3gCOgFX/RoaZz0ACdRFtoh//6Q6YNInbsuyKX6ICWjh1fpMVB6/
 lgq1Vgat5oFUJlet1XoUbertg1ZM6XQLA3U/qDv94CCq0S146+I+JXNVB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="297768322"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="297768322"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 18:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="682010582"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga008.fm.intel.com with ESMTP; 21 Sep 2022 18:22:38 -0700
Message-ID: <d10d80ddce9a193eeb0dd4cd8fb7a5b2dc519f54.camel@linux.intel.com>
Subject: Re: [PATCH v3 4/5] acpi/nvdimm: Implement ACPI NVDIMM Label Methods
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca, 
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org, 
 robert.hu@intel.com
Date: Thu, 22 Sep 2022 09:22:37 +0800
In-Reply-To: <20220921152927.03973518@redhat.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
 <20220901032721.1392482-5-robert.hu@linux.intel.com>
 <20220909153910.557fdbe7@redhat.com>
 <78f021195335f1cc9d01071db58a51539f29c597.camel@linux.intel.com>
 <20220916093757.689a939f@redhat.com>
 <80b09055416c790922c7c3db60d2ba865792d1b0.camel@linux.intel.com>
 <20220920111302.0c1716af@redhat.com>
 <79e4c6a123e5b1edfaaa88f6ea12facedbaf5711.camel@linux.intel.com>
 <20220921152927.03973518@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=robert.hu@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

On Wed, 2022-09-21 at 15:29 +0200, Igor Mammedov wrote:
> On Tue, 20 Sep 2022 20:28:31 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> 
> > On Tue, 2022-09-20 at 11:13 +0200, Igor Mammedov wrote:
> > > On Fri, 16 Sep 2022 21:15:35 +0800
> > > Robert Hoo <robert.hu@linux.intel.com> wrote:
> > >   
> > > > On Fri, 2022-09-16 at 09:37 +0200, Igor Mammedov wrote:
> > > >   
> > > > > > Fine, get your point now.
> > > > > > In ASL it will look like this:
> > > > > >                     Local1 = Package (0x3) {STTS, SLSA,
> > > > > > MAXT}
> > > > > >                     Return (Local1)    
> > > > > 
> > > > >     
> > > > > > 
> > > > > > But as for 
> > > > > >                     CreateDWordField (Local0, Zero,
> > > > > > STTS)  //
> > > > > > Status
> > > > > >                     CreateDWordField (Local0, 0x04,
> > > > > > SLSA)  //
> > > > > > SizeofLSA
> > > > > >                     CreateDWordField (Local0, 0x08,
> > > > > > MAXT)  //
> > > > > > Max
> > > > > > Trans
> > > > > > 
> > > > > > I cannot figure out how to substitute with LocalX. Can you
> > > > > > shed
> > > > > > more
> > > > > > light?    
> > > > > 
> > > > > Leave this as is, there is no way to make it anonymous/local
> > > > > with
> > > > > FooField.
> > > > > 
> > > > > (well one might try to use Index and copy field's bytes into
> > > > > a
> > > > > buffer
> > > > > and
> > > > > then explicitly convert to Integer, but that's a rather
> > > > > convoluted
> > > > > way
> > > > > around limitation so I'd not go this route)
> > > > >     
> > > > 
> > > > OK, pls. take a look, how about this?
> > > > 
> > > > Method (_LSI, 0, Serialized)  // _LSI: Label Storage
> > > > Information
> > > > {   
> > > >     Local0 = NCAL (ToUUID("4309ac30-0d11-11e4-9191-
> > > > 0800200c9a66"),
> > > > 0x02, 0x04, Zero, One)    // Buffer
> > > >     CreateDWordField (Local0, Zero, STTS)  // Status
> > > >     CreateDWordField (Local0, 0x04, SLSA)  // Size of LSA
> > > >     CreateDWordField (Local0, 0x08, MAXT)  // Max Transfer Size
> > > >     Local1 = Package (0x3) {STTS, SLSA, MAXT}
> > > >     Return (Local1)
> > > > }
> > > > 
> > > > Method (_LSR, 2, Serialized)  // _LSR: Label Storage Read
> > > > {
> > > >     Name (INPT, Buffer(8) {})
> > > >     CreateDWordField (INPT, Zero, OFST);
> > > >     CreateDWordField (INPT, 4, LEN);  
> > > 
> > > why do you have to create and use INPT, wouldn't local be enough
> > > to
> > > keep the buffer?  
> > 
> > If substitute INPT with LocalX, then later
> > Local0 = Package (0x01) {LocalX} isn't accepted.
> > 
> > PackageElement :=
> > DataObject | NameString
> 
> ok, then respin series and lets get it some testing.

Sure. I'd also like it to go through your tests, though I had done some
ordinary tests like guest create/delete/init-labels on vNVDIMM.

> 
> BTW:
> it looks like Windows Server starting from v2019 has support for
> NVDIMM-P devices which came with 'Optane DC Persistent Memory
> Modules'
> but it fails to recognize NVDIMMs in QEMU (complaining something
> about
> wrong target). Perhaps you can reach someone with Optane/ACPI
> expertise within your org and try to fix QEMU side.

Yes, it's a known gap there. I will try that once I had some time and
resource.
> 
> > >   
> > > >     OFST = Arg0
> > > >     LEN = Arg1
> > > >     Local0 = Package (0x01) {INPT}
> > > >     Local3 = NCAL (ToUUID("4309ac30-0d11-11e4-9191-
> > > > 0800200c9a66"),
> > > > 0x02, 0x05, Local0, One)
> > > >     CreateDWordField (Local3, Zero, STTS)
> > > >     CreateField (Local3, 32, LEN << 3, LDAT)
> > > >     Local1 = Package (0x2) {STTS, toBuffer(LDAT)}
> > > >     Return (Local1)
> > > > }
> > > > 
> > > > Method (_LSW, 3, Serialized)  // _LSW: Label Storage Write
> > > > {
> > > >     Local2 = Arg2
> > > >     Name (INPT, Buffer(8) {})  
> > > 
> > > ditto
> > >   
> > > >     CreateDWordField (INPT, Zero, OFST);
> > > >     CreateDWordField (INPT, 4, TLEN);
> > > >     OFST = Arg0
> > > >     TLEN = Arg1
> > > >     Concatenate(INPT, Local2, INPT)
> > > >     Local0 = Package (0x01)
> > > >     {
> > > >         INPT
> > > >     }
> > > >     Local3 = NCAL (ToUUID ("4309ac30-0d11-11e4-9191-
> > > > 0800200c9a66"),
> > > > 0x02, 0x06, Local0, One)
> > > >     CreateDWordField (Local3, 0, STTS)
> > > >     Return (STTS)
> > > > }  
> > 
> > 
> 
> 



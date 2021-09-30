Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53AE41D5AE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:49:31 +0200 (CEST)
Received: from localhost ([::1]:39626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVrkw-0001kf-VH
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVrio-0008Pz-T8
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:47:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVrim-0004MW-6W
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632991635;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qExbhai4ydfesIRzb1ABmVgW0YPYKh9dYRoNMcAg8Xw=;
 b=Llv1ZwD2Tmej/nKIZfKodmlND9KDfLf9M2ifQ2BpRiFxaRJlxZ47O9BswYpxj8Uac0W7eT
 8Ld+NxMcu8eShbEWU5YMS81kckKreZo5fGdO3AjG1gj4waPzFqtPf31hrpl0VlGjDYGXAS
 /HbhAqaBRCfS+HbtSIs6YLzDzIiB/iI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-EpyryX9KM3Oh-zOwxhz_TQ-1; Thu, 30 Sep 2021 04:47:14 -0400
X-MC-Unique: EpyryX9KM3Oh-zOwxhz_TQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71BC51018724
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:47:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A9B619C59;
 Thu, 30 Sep 2021 08:47:04 +0000 (UTC)
Date: Thu, 30 Sep 2021 09:47:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <YVV5hZmEs2NmbiiI@redhat.com>
References: <cover.1632900578.git.mprivozn@redhat.com>
 <20210929092044.GE3361@redhat.com> <YVQy9yiU1RPxCcM8@redhat.com>
 <20210929095719.GH3361@redhat.com> <YVQ7my3BHi1On/JK@redhat.com>
 <20210929103400.GJ3361@redhat.com>
 <20210930073348.GL7596@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930073348.GL7596@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>,
 lersek@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 08:33:48AM +0100, Richard W.M. Jones wrote:
> 
> More data: I found a colleague who has a Hyper-V instance with a
> Windows guest and he helped me to understand how Hyper-V represents
> generation IDs.  Hyper-V has had support for generation IDs since long
> before Microsoft proposed the feature for standardization.  Originally
> (I think pre-2013) Hyper-V used an XML description which included:
> 
> <generation_id type="string">4a07df4361fdf4c883f97bc30e524b9d</generation_id>
> 
> Note this is a pure hex string, not a GUID.
> 
> In current Hyper-V, the same representation is used but it's embedded
> in a binary file.
> 
> My colleague ran two Windows VMs on Hyper-V and examined the
> generation_id on the hypervisor and compared it to the output of
> VMGENID.EXE inside the guest.
> 
> The first guest had this in the binary hypervisor metadata:
> 
> 000056b0  00 00 0e 67 65 6e 65 72  61 74 69 6f 6e 5f 69 64  |...generation_id|
> 000056c0  00 40 00 00 00 38 00 30  00 35 00 61 00 32 00 38  |.@...8.0.5.a.2.8|
> 000056d0  00 37 00 61 00 32 00 35  00 30 00 39 00 38 00 39  |.7.a.2.5.0.9.8.9|
> 000056e0  00 65 00 34 00 66 00 65  00 36 00 66 00 36 00 39  |.e.4.f.e.6.f.6.9|
> 000056f0  00 39 00 32 00 62 00 65  00 33 00 33 00 34 00 61  |.9.2.b.e.3.3.4.a|
> 00005700  00 34 00 33 00 00 00 00  00 00 00 00 00 00 00 00  |.4.3............|
> 
> and reported the output of VMGENID in this guest as:
> 
> VmCounterValue: fe6f6992be334a43:805a287a250989e4
> 
> The second guest had:
> 
> 00005360  c5 06 00 00 00 0e 67 65  6e 65 72 61 74 69 6f 6e  |......generation|
> 00005370  5f 69 64 00 40 00 00 00  65 00 62 00 66 00 62 00  |_id.@...e.b.f.b.|
> 00005380  62 00 37 00 39 00 37 00  33 00 36 00 35 00 37 00  |b.7.9.7.3.6.5.7.|
> 00005390  32 00 38 00 65 00 37 00  30 00 62 00 33 00 66 00  |2.8.e.7.0.b.3.f.|
> 000053a0  64 00 33 00 63 00 37 00  31 00 33 00 65 00 63 00  |d.3.c.7.1.3.e.c.|
> 000053b0  65 00 38 00 34 00 32 00  00 00 00 00 00 00 00 00  |e.8.4.2.........|
> 
> and VMGENID was:
> 
> VmCounterValue: b3fd3c713ece842:ebfbb797365728e7
> 
> Note:
> 
>  - In both cases, the generation ID is clearly not a GUID.
> 
>  - The two 64 bit words are swapped over somewhere, but individual
>    bytes are not byte-swapped, and there is again no evidence of
>    UUID-aware byte swapping.
> 
> ----------------------------------------------------------------------
> 
> So how do we get from where we are to a more sane vmgenid in qemu?
> 
> I propose we deprecate the guid parameter in:
> 
>   -device vmgenid,guid=8987940a-0951-2cc5-e815-10634ff550b9,id=vmgenid0
> 
> Instead it will be replaced by bytes= which will simply write
> the bytes, in the order they appear, into guest memory with no
> attempt to interpret or byte-swap.  Something like:
> 
>   -device vmgenid,bytes=112233445566778899aabbccddeeff00,id=vmgenid0
> 
> (guid although deprecated will need to be kept around for a while,
> along with its weird byte-swapping behaviour).
> 
> We will then have a plain and simple method to emulate the behaviour
> of other hypervisors.  We will look at exactly what bytes they write
> to guest memory and copy that behaviour when v2v converting from those
> hypervisors.

From the libvirt POV, I'm not expecting anything in QEMU to change
in this respect. If guid is replaced by a new attribute taking data
in a different way, then libvirt will have to remap itself, so that
existing usage in libvirt keeps working the same way as it did with
guid.  Essentially from libvirt's POV, it is simply a documentation
issue to specify how the libvirt XML representation translates to
the guest visible representation, and ensure that all libvirt drivers
implement it the same way. The QEMU genid support arrived first so
that set the standard for how libvirt will represent it, that all
further libvirt hypervisor drivers need to match.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



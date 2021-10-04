Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1E9421243
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:06:31 +0200 (CEST)
Received: from localhost ([::1]:52836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXPXy-0002k2-PS
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mXPR1-0005Xm-Ho
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mXPQy-000289-FF
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633359554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IxjpnvEQTkt9cakWylEHhmEl9G4fOVk+B2dX+tOHRu4=;
 b=W/SJeur9jEd+zoUnO3gnFBHpgicjiBCzYulGEpDgooPEfa+dLm0yTFSNEOg5Wt9gmFBMuN
 r0h3kGRmX3bk9H2egtizA7uqGDUbbfKlEyS6OUMkCC3TojBjp7GwADu9VPSC+qTVqMnc+E
 /y1O52je7ps/TOnY3WjwUPyU4q6cwE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-SApJM1DJNMekkriPPdmxfA-1; Mon, 04 Oct 2021 10:59:11 -0400
X-MC-Unique: SApJM1DJNMekkriPPdmxfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC905802CB6;
 Mon,  4 Oct 2021 14:59:10 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 648E25D9D3;
 Mon,  4 Oct 2021 14:59:10 +0000 (UTC)
Date: Mon, 4 Oct 2021 15:59:09 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <20211004145909.GZ3361@redhat.com>
References: <20210929092044.GE3361@redhat.com> <YVQy9yiU1RPxCcM8@redhat.com>
 <20210929095719.GH3361@redhat.com> <YVQ7my3BHi1On/JK@redhat.com>
 <20210929103400.GJ3361@redhat.com>
 <20210930073348.GL7596@redhat.com> <YVV5hZmEs2NmbiiI@redhat.com>
 <20210930091620.GX3361@redhat.com>
 <20211004095912.GP7596@redhat.com>
 <ecfdc6cc-c411-851f-afb6-ac301d722d99@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ecfdc6cc-c411-851f-afb6-ac301d722d99@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>,
 qemu-devel@nongnu.org, armbru@redhat.com, acatan@amazon.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 04:50:51PM +0200, Laszlo Ersek wrote:
> On 10/04/21 11:59, Richard W.M. Jones wrote:
> > It turns out that changing the qemu implementation is painful,
> > particularly if we wish to maintain backwards compatibility of the
> > command line and live migration.
> >
> > Instead I opted to document comprehensively what all the
> > different hypervisors do:
> >
> >   https://github.com/libguestfs/virt-v2v/blob/master/docs/vm-generation-id-across-hypervisors.txt
> 
> > Unfortunately QEMU made a significant mistake when implementing this
> > feature.  Because the string is 128 bits wrong, they decided it must
>                                   ^^^^^^^^^^^^^^
> 
> Haha, that's a great typo :)
> 
> > be a UUID (as you can see above there is no evidence that Microsoft
> > who wrote the original spec thought it was).  Following from this
> > incorrect assumption, they stated that the "UUID" must be supplied to
> > qemu in big endian format and must be byteswapped when writing it to
> > guest memory.  Their documentation says that they only do this for
> > little endian guests, but this is not true of their implementation
> > which byte swaps it for all guests.
> 
> I don't think this is what section "Endian-ness Considerations" in
> "docs/specs/vmgenid.txt" says. That text says that the *device* uses
> little-endian format. That's independent of the endianness of *CPU* of
> the particular guest architecture.
> 
> So the byte-swapping in the QEMU code occurs unconditionally because
> QEMU's UUID type is inherently big endian, and the device model in
> question is fixed little endian. The guest CPU's endianness is
> irrelevant as far as the device is concerned.
> 
> If a BE guest CPU intends to read the generation ID and to interpret it
> as a set of integers, then the guest CPU is supposed to byte-swap the
> appropriate fields itself.
> 
> > References
> 
> I suggest adding two links in this section, namely to:
> - docs/specs/vmgenid.txt
> - hw/acpi/vmgenid.c

Fair enough - I've made the changes you suggest (same URL as above).

Thanks,

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top



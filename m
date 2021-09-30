Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69C41D495
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 09:35:04 +0200 (CEST)
Received: from localhost ([::1]:38268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVqas-0008Ea-Qu
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 03:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVqZz-0007Tz-8I
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 03:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVqZv-0002X4-V9
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 03:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632987242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cfWnUxEGUNo22F2fffNt1uZggo2dNtlsV/uRYPWES+E=;
 b=QRze6PTiOVKEO6VqtIKJCMBMPbnYuPwaPIKvXzcubWzWiyRzOx0wP/GGM9eeeURHhBuYRs
 An/bh4MaLQpq2sRzRVc05uje81h0TLO+dFXk8DHLSo08uIdIychmsB//jmA77fF3drqsOQ
 C8mIrqV8mHhEas+cyhjjpd20PAQURHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-bqpa12B1OhqeoBdzs9_TZw-1; Thu, 30 Sep 2021 03:33:56 -0400
X-MC-Unique: bqpa12B1OhqeoBdzs9_TZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D47F79F945
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 07:33:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6B9260854;
 Thu, 30 Sep 2021 07:33:49 +0000 (UTC)
Date: Thu, 30 Sep 2021 08:33:48 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <20210930073348.GL7596@redhat.com>
References: <cover.1632900578.git.mprivozn@redhat.com>
 <20210929092044.GE3361@redhat.com> <YVQy9yiU1RPxCcM8@redhat.com>
 <20210929095719.GH3361@redhat.com> <YVQ7my3BHi1On/JK@redhat.com>
 <20210929103400.GJ3361@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210929103400.GJ3361@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
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
Cc: libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>,
 lersek@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


More data: I found a colleague who has a Hyper-V instance with a
Windows guest and he helped me to understand how Hyper-V represents
generation IDs.  Hyper-V has had support for generation IDs since long
before Microsoft proposed the feature for standardization.  Originally
(I think pre-2013) Hyper-V used an XML description which included:

<generation_id type="string">4a07df4361fdf4c883f97bc30e524b9d</generation_id>

Note this is a pure hex string, not a GUID.

In current Hyper-V, the same representation is used but it's embedded
in a binary file.

My colleague ran two Windows VMs on Hyper-V and examined the
generation_id on the hypervisor and compared it to the output of
VMGENID.EXE inside the guest.

The first guest had this in the binary hypervisor metadata:

000056b0  00 00 0e 67 65 6e 65 72  61 74 69 6f 6e 5f 69 64  |...generation_id|
000056c0  00 40 00 00 00 38 00 30  00 35 00 61 00 32 00 38  |.@...8.0.5.a.2.8|
000056d0  00 37 00 61 00 32 00 35  00 30 00 39 00 38 00 39  |.7.a.2.5.0.9.8.9|
000056e0  00 65 00 34 00 66 00 65  00 36 00 66 00 36 00 39  |.e.4.f.e.6.f.6.9|
000056f0  00 39 00 32 00 62 00 65  00 33 00 33 00 34 00 61  |.9.2.b.e.3.3.4.a|
00005700  00 34 00 33 00 00 00 00  00 00 00 00 00 00 00 00  |.4.3............|

and reported the output of VMGENID in this guest as:

VmCounterValue: fe6f6992be334a43:805a287a250989e4

The second guest had:

00005360  c5 06 00 00 00 0e 67 65  6e 65 72 61 74 69 6f 6e  |......generation|
00005370  5f 69 64 00 40 00 00 00  65 00 62 00 66 00 62 00  |_id.@...e.b.f.b.|
00005380  62 00 37 00 39 00 37 00  33 00 36 00 35 00 37 00  |b.7.9.7.3.6.5.7.|
00005390  32 00 38 00 65 00 37 00  30 00 62 00 33 00 66 00  |2.8.e.7.0.b.3.f.|
000053a0  64 00 33 00 63 00 37 00  31 00 33 00 65 00 63 00  |d.3.c.7.1.3.e.c.|
000053b0  65 00 38 00 34 00 32 00  00 00 00 00 00 00 00 00  |e.8.4.2.........|

and VMGENID was:

VmCounterValue: b3fd3c713ece842:ebfbb797365728e7

Note:

 - In both cases, the generation ID is clearly not a GUID.

 - The two 64 bit words are swapped over somewhere, but individual
   bytes are not byte-swapped, and there is again no evidence of
   UUID-aware byte swapping.

----------------------------------------------------------------------

So how do we get from where we are to a more sane vmgenid in qemu?

I propose we deprecate the guid parameter in:

  -device vmgenid,guid=8987940a-0951-2cc5-e815-10634ff550b9,id=vmgenid0

Instead it will be replaced by bytes= which will simply write
the bytes, in the order they appear, into guest memory with no
attempt to interpret or byte-swap.  Something like:

  -device vmgenid,bytes=112233445566778899aabbccddeeff00,id=vmgenid0

(guid although deprecated will need to be kept around for a while,
along with its weird byte-swapping behaviour).

We will then have a plain and simple method to emulate the behaviour
of other hypervisors.  We will look at exactly what bytes they write
to guest memory and copy that behaviour when v2v converting from those
hypervisors.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/



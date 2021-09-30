Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117841D61E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 11:17:41 +0200 (CEST)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVsCB-0001YH-HV
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 05:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVsBG-0000sN-C8
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:16:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVsBC-0003iU-AR
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632993395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bU6iTf9NKjMwaTTohBE4uLjKrjvIH62Ik2WPu2ZKE/g=;
 b=XX3h/K/La+bYHBCgGVEnTYTTRCSXSwaYoAs0oAv34YCu4B6dq/k41dHfsfIiLYcvbSkP4x
 s767eFRstFKspS72jWI7MQ+seCVoy4tHG6/hGUBozK+5/qDbGqR+EbOjkngWbCvPvhE2HI
 9eY3aPjjD+pldyHCipYS8Gdo4XMnpzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-eTnwj0nMOxG_MHItN8RbQA-1; Thu, 30 Sep 2021 05:16:27 -0400
X-MC-Unique: eTnwj0nMOxG_MHItN8RbQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 179298143FF
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 09:16:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49CB35C23A;
 Thu, 30 Sep 2021 09:16:21 +0000 (UTC)
Date: Thu, 30 Sep 2021 10:16:20 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <20210930091620.GX3361@redhat.com>
References: <cover.1632900578.git.mprivozn@redhat.com>
 <20210929092044.GE3361@redhat.com> <YVQy9yiU1RPxCcM8@redhat.com>
 <20210929095719.GH3361@redhat.com> <YVQ7my3BHi1On/JK@redhat.com>
 <20210929103400.GJ3361@redhat.com>
 <20210930073348.GL7596@redhat.com> <YVV5hZmEs2NmbiiI@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVV5hZmEs2NmbiiI@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>,
 lersek@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 09:47:01AM +0100, Daniel P. Berrangé wrote:
> On Thu, Sep 30, 2021 at 08:33:48AM +0100, Richard W.M. Jones wrote:
> > I propose we deprecate the guid parameter in:
> > 
> >   -device vmgenid,guid=8987940a-0951-2cc5-e815-10634ff550b9,id=vmgenid0
> > 
> > Instead it will be replaced by bytes= which will simply write
> > the bytes, in the order they appear, into guest memory with no
> > attempt to interpret or byte-swap.  Something like:
> > 
> >   -device vmgenid,bytes=112233445566778899aabbccddeeff00,id=vmgenid0
> > 
> > (guid although deprecated will need to be kept around for a while,
> > along with its weird byte-swapping behaviour).
> > 
> > We will then have a plain and simple method to emulate the behaviour
> > of other hypervisors.  We will look at exactly what bytes they write
> > to guest memory and copy that behaviour when v2v converting from those
> > hypervisors.
> 
> From the libvirt POV, I'm not expecting anything in QEMU to change
> in this respect. If guid is replaced by a new attribute taking data
> in a different way, then libvirt will have to remap itself, so that
> existing usage in libvirt keeps working the same way as it did with
> guid.  Essentially from libvirt's POV, it is simply a documentation
> issue to specify how the libvirt XML representation translates to
> the guest visible representation, and ensure that all libvirt drivers
> implement it the same way. The QEMU genid support arrived first so
> that set the standard for how libvirt will represent it, that all
> further libvirt hypervisor drivers need to match.

I was going to suggest something like:

  <genid type="guid">aa-bb-cc..</genid>
or
  <genid type="binary">aabbcc..</genid>

with the type defaulting to guid for backwards compatibility.

Does libvirt XML have any other fields were you're passing
essentially small snippets of binary data?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org



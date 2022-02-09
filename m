Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88FA4AF578
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:36:41 +0100 (CET)
Received: from localhost ([::1]:44742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHp1I-0004DX-NT
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:36:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nHoaU-0003A2-Nw
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 10:08:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nHoaD-0005u4-Lb
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 10:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644419315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ry/5TdYzgVRvb+g8dWywOjOWX0ZOgzxE20jqcC/nkVM=;
 b=EBSibuDEqJ1J7ydDzsoMh8I0chdJ2iVa22U0m/9DTiHpIUdF2rYxEKGrnn1hI2LTFtb0rg
 bilSpVLLYb7ahSzO5TRkrKERZwMq7/mOznSdiXdgVfwiwek/WBO3SkOpt6WGyTXSl/p+tw
 65/TA6kXxzykMNFzQGI/0qTCMhu7K2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-D65_zh-HNX2Z1UjVPFFFKA-1; Wed, 09 Feb 2022 10:08:34 -0500
X-MC-Unique: D65_zh-HNX2Z1UjVPFFFKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76CF283DD23
 for <qemu-devel@nongnu.org>; Wed,  9 Feb 2022 15:08:33 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2380B70398;
 Wed,  9 Feb 2022 15:08:33 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 8C63422045A; Wed,  9 Feb 2022 10:08:32 -0500 (EST)
Date: Wed, 9 Feb 2022 10:08:32 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: German Maglione <gmaglione@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v5 0/9] virtiofsd: Add support for file
 security context at file creation
Message-ID: <YgPY8FMA9ikejw0L@redhat.com>
References: <20220202193935.268777-1-vgoyal@redhat.com>
 <YgEZDOcFr80tZGWd@redhat.com> <YgGM6pA2sXEAMa3a@redhat.com>
 <YgIw+juiHLCXEhNn@redhat.com>
 <CAJh=p+65FWDbze_86RqBKtd=at_Cj6E2YmUz=5pE29fd--zzwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJh=p+65FWDbze_86RqBKtd=at_Cj6E2YmUz=5pE29fd--zzwA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 09, 2022 at 11:24:29AM +0100, German Maglione wrote:
> On Tue, Feb 8, 2022 at 11:44 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Mon, Feb 07, 2022 at 04:19:38PM -0500, Vivek Goyal wrote:
> > > On Mon, Feb 07, 2022 at 01:05:16PM +0000, Daniel P. Berrangé wrote:
> > > > On Wed, Feb 02, 2022 at 02:39:26PM -0500, Vivek Goyal wrote:
> > > > > Hi,
> > > > >
> > > > > This is V5 of the patches. I posted V4 here.
> > > > >
> > > > >
> > https://listman.redhat.com/archives/virtio-fs/2022-January/msg00041.html
> > > > >
> > > > > These will allow us to support SELinux with virtiofs. This will send
> > > > > SELinux context at file creation to server and server can set it on
> > > > > file.
> > > >
> > > > I've not entirely figured it out from the code, so easier for me
> > > > to ask...
> > > >
> > > > How is the SELinux labelled stored on the host side ? It is stored
> > > > directly in the security.* xattr namespace,
> > >
> > > [ CC Dan Walsh ]
> > >
> > > I just tried to test the mode where I don't do xattr remapping and try
> > > to set /proc/pid/attr/fscreate with the context I want to set. It will
> > > set security.selinux xattr on host.
> > >
> > > But write to /proc/pid/attr/fscreate fails if host does not recognize
> > > the label sent by guest. I am running virtiofsd with unconfined_t but
> > > it still fails because guest is trying to create a file with
> > > "test_filesystem_filetranscon_t" and host does not recognize this
> > > label. Seeing following in audit logs.
> > >
> > > type=SELINUX_ERR msg=audit(1644268262.666:8111): op=fscreate
> > invalid_context="unconfined_u:object_r:test_filesystem_filetranscon_t:s0"
> >
> > Yes, that's to be expected if the host policy doesn't know about the
> > label that the guest is using.
> >
> > IOW, non-mapping case is only useful if you have a very good match
> > between host + guest OS policy. This could be useful for an app
> > like Kata because their guest is not a full OS, it is something
> > special purpose and tightly controlled.
> >
> > > So if we don't remap xattrs and host has SELinux enabled, then it
> > probably
> > > work in very limited circumstances where host and guest policies don't
> > > conflict. I guess its like running fedora 34 guest on fedora 34 host.
> > > I suspect that this will see very limited use. Though I have put the
> > > code in for the sake of completeness.
> >
> > For general purpose guest OS virtualization remapping is going to be
> > effectuively mandatory.  The non-mapped case only usable when you tightly
> > control the guest OS packages from the host.
> >
> 
> 
> If remap is recommended, why not make it mandatory or automatic?,
> for instance, '-o security_label' either requires '-o xattrmap=' or
> automatically makes
> the mapping with the 'trusted' prefix, while  '-o security_label=nomap'
> doesn't, so you
> can choose whatever you want.

It is a recommended settings but not a mandatory setting. So enforcing
any kind of policy will work for some and not for others.

We could refine it down the line depending on how it is used and where
people find it useful.

For now, primary focus is to get basic support patches in the tree.

Thanks
Vivek

> 
> (I'm not suggesting the 'nomap' name, I'm terrible choosing names)
> 
> -- 
> German



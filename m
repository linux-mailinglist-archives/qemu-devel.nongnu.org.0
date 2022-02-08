Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F44AD57D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:28:47 +0100 (CET)
Received: from localhost ([::1]:54588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNjq-0007fN-Al
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:28:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHMLl-0008A8-Rm
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:59:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHMLk-0007q2-2V
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644310784;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HF8fMxs5opOmYeumKa7j0hei2XqIKWbQvGoblV7ENtw=;
 b=dTnSHR/3ldCC6LuEIBkCsEoxfB1yq2Xq2N+qTRqhU5T6xJadrSA2w55AO0E209xl4M67zd
 5gsiXGWlAJ0b3Y7XT1YURRQGG0FvUhlltQBk+uAFQkoxIL2JNxA0Je+afi/UkaEIaLx2IZ
 Ndw0brw9kLZNNeyCX4zYC776p7B4lto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-cr21I_zJMAidW4SpeetYKg-1; Tue, 08 Feb 2022 03:59:43 -0500
X-MC-Unique: cr21I_zJMAidW4SpeetYKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 872478143E5
 for <qemu-devel@nongnu.org>; Tue,  8 Feb 2022 08:59:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 205707AB7E;
 Tue,  8 Feb 2022 08:59:40 +0000 (UTC)
Date: Tue, 8 Feb 2022 08:59:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v5 0/9] virtiofsd: Add support for file security context
 at file creation
Message-ID: <YgIw+juiHLCXEhNn@redhat.com>
References: <20220202193935.268777-1-vgoyal@redhat.com>
 <YgEZDOcFr80tZGWd@redhat.com> <YgGM6pA2sXEAMa3a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YgGM6pA2sXEAMa3a@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: virtio-fs@redhat.com, mszeredi@redhat.com,
 Daniel J Walsh <dwalsh@redhat.com>, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 04:19:38PM -0500, Vivek Goyal wrote:
> On Mon, Feb 07, 2022 at 01:05:16PM +0000, Daniel P. Berrangé wrote:
> > On Wed, Feb 02, 2022 at 02:39:26PM -0500, Vivek Goyal wrote:
> > > Hi,
> > > 
> > > This is V5 of the patches. I posted V4 here.
> > > 
> > > https://listman.redhat.com/archives/virtio-fs/2022-January/msg00041.html
> > > 
> > > These will allow us to support SELinux with virtiofs. This will send
> > > SELinux context at file creation to server and server can set it on
> > > file.
> > 
> > I've not entirely figured it out from the code, so easier for me
> > to ask...
> > 
> > How is the SELinux labelled stored on the host side ? It is stored
> > directly in the security.* xattr namespace,
> 
> [ CC Dan Walsh ]
> 
> I just tried to test the mode where I don't do xattr remapping and try
> to set /proc/pid/attr/fscreate with the context I want to set. It will
> set security.selinux xattr on host.
> 
> But write to /proc/pid/attr/fscreate fails if host does not recognize
> the label sent by guest. I am running virtiofsd with unconfined_t but
> it still fails because guest is trying to create a file with
> "test_filesystem_filetranscon_t" and host does not recognize this
> label. Seeing following in audit logs.
> 
> type=SELINUX_ERR msg=audit(1644268262.666:8111): op=fscreate invalid_context="unconfined_u:object_r:test_filesystem_filetranscon_t:s0"

Yes, that's to be expected if the host policy doesn't know about the
label that the guest is using.

IOW, non-mapping case is only useful if you have a very good match
between host + guest OS policy. This could be useful for an app
like Kata because their guest is not a full OS, it is something
special purpose and tightly controlled.

> So if we don't remap xattrs and host has SELinux enabled, then it probably
> work in very limited circumstances where host and guest policies don't
> conflict. I guess its like running fedora 34 guest on fedora 34 host. 
> I suspect that this will see very limited use. Though I have put the
> code in for the sake of completeness.

For general purpose guest OS virtualization remapping is going to be
effectuively mandatory.  The non-mapped case only usable when you tightly
control the guest OS packages from the host.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



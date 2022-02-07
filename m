Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B84ACB32
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 22:22:08 +0100 (CET)
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHBSZ-0002Ti-5a
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 16:22:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nHBQL-0001lJ-ME
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:19:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nHBQI-0001o2-7n
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:19:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644268785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQUfszrR4zjJJ0QiyJDtMS6qhP+C37t/yJKeCYozeEA=;
 b=YQKn+6J0eg1JlrJDdv81QyVE+GB9R87qW9Hrp5aET0ufzKQ+dSIWOk0J5T7f+RANP9lKjw
 BX1hNbAkGvYWLUEh3D56zD9VZ83fzQ/nBu5dGIq9Kz7pVR3IIcmGz2SDi3l03Z5CahSPnn
 Yeosp2vOJvfYtMYSwkCzz2K7N8HuQrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-ieIZsyC0MDSGObD8X1TwAw-1; Mon, 07 Feb 2022 16:19:39 -0500
X-MC-Unique: ieIZsyC0MDSGObD8X1TwAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEFFA192AB6E
 for <qemu-devel@nongnu.org>; Mon,  7 Feb 2022 21:19:38 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C10F4BC52;
 Mon,  7 Feb 2022 21:19:38 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 1098D22045A; Mon,  7 Feb 2022 16:19:38 -0500 (EST)
Date: Mon, 7 Feb 2022 16:19:38 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v5 0/9] virtiofsd: Add support for file security context
 at file creation
Message-ID: <YgGM6pA2sXEAMa3a@redhat.com>
References: <20220202193935.268777-1-vgoyal@redhat.com>
 <YgEZDOcFr80tZGWd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YgEZDOcFr80tZGWd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com,
 Daniel J Walsh <dwalsh@redhat.com>, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 01:05:16PM +0000, Daniel P. Berrangé wrote:
> On Wed, Feb 02, 2022 at 02:39:26PM -0500, Vivek Goyal wrote:
> > Hi,
> > 
> > This is V5 of the patches. I posted V4 here.
> > 
> > https://listman.redhat.com/archives/virtio-fs/2022-January/msg00041.html
> > 
> > These will allow us to support SELinux with virtiofs. This will send
> > SELinux context at file creation to server and server can set it on
> > file.
> 
> I've not entirely figured it out from the code, so easier for me
> to ask...
> 
> How is the SELinux labelled stored on the host side ? It is stored
> directly in the security.* xattr namespace,

[ CC Dan Walsh ]

I just tried to test the mode where I don't do xattr remapping and try
to set /proc/pid/attr/fscreate with the context I want to set. It will
set security.selinux xattr on host.

But write to /proc/pid/attr/fscreate fails if host does not recognize
the label sent by guest. I am running virtiofsd with unconfined_t but
it still fails because guest is trying to create a file with
"test_filesystem_filetranscon_t" and host does not recognize this
label. Seeing following in audit logs.

type=SELINUX_ERR msg=audit(1644268262.666:8111): op=fscreate invalid_context="unconfined_u:object_r:test_filesystem_filetranscon_t:s0"

So if we don't remap xattrs and host has SELinux enabled, then it probably
work in very limited circumstances where host and guest policies don't
conflict. I guess its like running fedora 34 guest on fedora 34 host. 
I suspect that this will see very limited use. Though I have put the
code in for the sake of completeness.

Thanks
Vivek

> or is is subject to
> xattr remapping that virtiofsd already supports.
> 
> Storing directly means virtiofsd has to run in an essentially
> unconfined context, to let it do arbitrary  changes on security.*
> xattrs without being blocked by SELinux) and has risk that guest
> initiated changes can open holes in the host confinement if
> the exported FS is generally visible to processes on the host.
> 
> 
> Using remapping lets virtiofsd be strictly isolated by SELinux
> policy on the host, and ensures that guest context changes
> can't open up holes in the host.
> 
> Both are valid use cases, so I'd ultimately expect us to want
> to support both, but my preference for a "default" behaviour
> would be remapping.
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 



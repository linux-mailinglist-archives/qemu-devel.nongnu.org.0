Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4614619F1A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:45:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0kQ-00075n-Ji; Fri, 04 Nov 2022 13:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1or0kO-00071M-FU
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:44:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1or0kL-0004qg-Pk
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667583886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MYCFOzGoJkuwN6ZJDxOKITRramjbLqCBdcxOwNeBwOY=;
 b=Sj6KDCoNXiRoD7Xef2o/+e4x2kvg3qtVN64mvEMrGy/iFRv1Av2XHpweYDDFSAZwUMRvm2
 Uc6rhmEOnpmWSlxloToQ2FTXPNJZ/PgtNJjeVsxoPFqvflXEKOS3jtHOmGJ8hmX0rPw24F
 rv5j6aa7YJMb2P3F56cUeoSRqOIUqYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-fBEG5FljPUu4bCkEXxfueg-1; Fri, 04 Nov 2022 13:44:43 -0400
X-MC-Unique: fBEG5FljPUu4bCkEXxfueg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 148D2101A528;
 Fri,  4 Nov 2022 17:44:43 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BFE720182B4;
 Fri,  4 Nov 2022 17:44:40 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Cc: virtio-fs@redhat.com,  qemu-devel@nongnu.org,  Misono Tomohiro
 <misono.tomohiro@jp.fujitsu.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Miklos Szeredi <mszeredi@redhat.com>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  German Maglione <gmaglione@redhat.com>,
 Sergio Lopez <slp@redhat.com>
Subject: Re: Use of unshare(CLONE_FS) in virtiofsd
References: <87r0yj17l6.fsf@oldenburg.str.redhat.com>
 <Y2UM/C3aYtQwf40M@redhat.com>
Date: Fri, 04 Nov 2022 18:44:39 +0100
In-Reply-To: <Y2UM/C3aYtQwf40M@redhat.com> (Vivek Goyal's message of "Fri, 4
 Nov 2022 09:00:44 -0400")
Message-ID: <875yfuzkag.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Vivek Goyal:

>>  The usual
>> recommendation for emulating it is to use openat with O_PATH, and then
>> use getxattr on the virtual /proc/self/fd path.  This needs an
>> additional system call (openat, getxattr, close instead of fchdir,
>> getxattr),
>
> openat(O_PATH) + getxattr(/proc/self/fd) + close() sounds reasonable
> too. Not sure why did we not take that path. May be due to that extra
> syscall or something else.

Thanks.

>> but it avoids the unshare(CLONE_FS) call behind libc's back.
>
> Hmm.., did not know that libc does not like threads calling
> unshare(CLONE_FS). Not sure why that is a problem.

Here's a corner case: We plan to add chroot detection to NSS module
loading (so that we do not load NSS modules after chroot), as a form of
security hardening.  If the application calls unshare(CLONE_FS) and then
chroot, which NSS modules are loaded depends on which threads call NSS
functions.

One could argue that chdir/chroot are problematic, not
unshare(CLONE_FS). 8-)

> BTW, we need separate umask per thread as well. During file creation 
> we might be switching to umask provide in fuse protocol message
> and then switch back. Given multiple therads might be doing this
> creation in parallel, so we ofcourse need this to be per thread
> property.

That's a good point.  That's not something that can be worked around
with *at functions.

> So if your patches for pthread_create() with per thread filesystem
> attributes finally goes upstream, I guess we should be able to
> make use of it and drop unshare(CLONE_FS).

Thank you for the feedback.

Florian



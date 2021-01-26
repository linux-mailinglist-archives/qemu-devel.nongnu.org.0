Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D449303A7A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:38:03 +0100 (CET)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4LjW-0001dz-Bg
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4LiC-0000cE-QP
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:36:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4LiA-0002R8-73
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611657397;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKyiTPtPLHtPQSG2e57kNl7rl5h28FRdybsWaStyL7c=;
 b=UTwliTgVLe1jMX39x7WieZwMo1Bs0sckuwJD9z6IYBObWQqcZHJWk8p9gLgP6Q7ettkvXR
 nOjOQZuvrlfPhaikZKAyGPBH4nmRDCk2XOrkvnufOeJIX7cnJruS6ssVKGvYkuP4kBwASM
 g67eLVA+aDBRtsyjQ9yQXKq2k7NHVEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-9IZwiJqUPcevFYdYJCXDig-1; Tue, 26 Jan 2021 05:36:35 -0500
X-MC-Unique: 9IZwiJqUPcevFYdYJCXDig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9573A8030A8;
 Tue, 26 Jan 2021 10:36:34 +0000 (UTC)
Received: from redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A7F19934;
 Tue, 26 Jan 2021 10:36:22 +0000 (UTC)
Date: Tue, 26 Jan 2021 10:36:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210126103619.GD3640294@redhat.com>
References: <20210126103502.260758-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210126103502.260758-1-stefanha@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: mszeredi@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Alex Xu <alex@alxu.ca>, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 10:35:02AM +0000, Stefan Hajnoczi wrote:
> A well-behaved FUSE client does not attempt to open special files with
> FUSE_OPEN because they are handled on the client side (e.g. device nodes
> are handled by client-side device drivers).
> 
> The check to prevent virtiofsd from opening special files is missing in
> a few cases, most notably FUSE_OPEN. A malicious client can cause
> virtiofsd to open a device node, potentially allowing the guest to
> escape. This can be exploited by a modified guest device driver. It is
> not exploitable from guest userspace since the guest kernel will handle
> special files inside the guest instead of sending FUSE requests.
> 
> This patch adds the missing checks to virtiofsd. This is a short-term
> solution because it does not prevent a compromised virtiofsd process
> from opening device nodes on the host.
> 
> Reported-by: Alex Xu <alex@alxu.ca>
> Fixes: CVE-2020-35517
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



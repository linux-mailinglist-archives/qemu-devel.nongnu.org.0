Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EF92DAB82
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:56:32 +0100 (CET)
Received: from localhost ([::1]:48654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp80N-0006yK-VF
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kp7zT-0006Pc-Jd
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:55:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kp7zR-0008FY-UU
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608029733;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JkPKR0FcyTV+5F3Gcpf/gGYDOdvuo/odOCZbzJgKLTo=;
 b=biiCAwLCghjym/MNZqzCcL3cdXOZ+K88I1T05nsFw2ljU2VeFmVR+fj3iE2+hrfbachHMZ
 idivpV0uE34291hzPFVcGSMVQqxoNcR5TpbJiD7vWv1tjDLUH+TwKzgvHo4W1I6H36WzU0
 OABVnvKZ/eVn7Ri77Tx/MJ4U0YcheQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-RIld1dvKPWmPHHdn3PFIiA-1; Tue, 15 Dec 2020 05:55:22 -0500
X-MC-Unique: RIld1dvKPWmPHHdn3PFIiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96BD9801ABA;
 Tue, 15 Dec 2020 10:55:21 +0000 (UTC)
Received: from redhat.com (ovpn-113-23.ams2.redhat.com [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6772F5D9D3;
 Tue, 15 Dec 2020 10:55:19 +0000 (UTC)
Date: Tue, 15 Dec 2020 10:55:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Li Feng <fengli@smartx.com>
Subject: Re: [PATCH v5] file-posix: detect the lock using the real file
Message-ID: <20201215105516.GI121272@redhat.com>
References: <1608029636-31442-1-git-send-email-fengli@smartx.com>
MIME-Version: 1.0
In-Reply-To: <1608029636-31442-1-git-send-email-fengli@smartx.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, lifeng1519@gmail.com,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, kyle@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 06:53:56PM +0800, Li Feng wrote:
> This patch addresses this issue:
> When accessing a volume on an NFS filesystem without supporting the file lock,
> tools, like qemu-img, will complain "Failed to lock byte 100".
> 
> In the original code, the qemu_has_ofd_lock will test the lock on the
> "/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
> which depends on the underlay filesystem.
> 
> In this patch, add a new 'qemu_has_file_lock' to detect whether the
> file supports the file lock. And disable the lock when the underlay file
> system doesn't support locks.
> 
> Signed-off-by: Li Feng <fengli@smartx.com>
> ---
> v5: simplify the code.
> v4: use the fd as the qemu_has_file_lock argument.
> v3: don't call the qemu_has_ofd_lock, use a new function instead.
> v2: remove the refactoring.
> ---
>  block/file-posix.c   | 61 +++++++++++++++++++++++---------------------
>  include/qemu/osdep.h |  1 +
>  util/osdep.c         | 14 ++++++++++
>  3 files changed, 47 insertions(+), 29 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



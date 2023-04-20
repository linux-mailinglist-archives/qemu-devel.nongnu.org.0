Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3858F6E9804
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:06:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVrT-0007NH-9P; Thu, 20 Apr 2023 11:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppVrP-0007DQ-B6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppVrA-0005su-8a
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682003154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WpvqVXv8XHOUt+WEZVVVeS9728Dk2G5j1PnaVGt60Zk=;
 b=DXOnlqQec6jsWwxgJ4s4lvuqrP1AnWajPFLz0WllDOkq+2zGMFoBXT/Kj9+KiCCn/oneHn
 SvXH8btw+qbPDMc4Y9u1aW5FIGGBAA58C/lBdq+qRSoQogVJp1T+dwpDbwVQUgu22rgzuy
 HJCMxbsQ0D3MfoEcrve3IzJyaqERdz8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-dyT9IBMPOtaYuI3HpfUQuA-1; Thu, 20 Apr 2023 11:05:52 -0400
X-MC-Unique: dyT9IBMPOtaYuI3HpfUQuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6807F185A78B
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 15:05:52 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B41C017D7;
 Thu, 20 Apr 2023 15:05:52 +0000 (UTC)
Date: Thu, 20 Apr 2023 10:05:50 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] systemd: Also clear LISTEN_FDNAMES during systemd socket
 activation
Message-ID: <pfe23ucesluheso6lfexurhc2ixw53vg5dc5d4rkgdx2vgpow4@et3a6dbcmkyu>
References: <20230324153349.1123774-1-eblake@redhat.com>
 <ZCFempFOjEgqyBXJ@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCFempFOjEgqyBXJ@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 27, 2023 at 10:15:06AM +0100, Daniel P. Berrangé wrote:
> On Fri, Mar 24, 2023 at 10:33:49AM -0500, Eric Blake wrote:
> > Some time after systemd documented LISTEN_PID and LISTEN_FDS for
> > socket activation, they later added LISTEN_FDNAMES; now documented at:
> > https://www.freedesktop.org/software/systemd/man/sd_listen_fds.html
> > 
> > In particular, look at the implementation of sd_listen_fds_with_names():
> > https://github.com/systemd/systemd/blob/main/src/libsystemd/sd-daemon/sd-daemon.c
> > 
> > If we ever pass LISTEN_PID=xxx and LISTEN_FDS=n to a child process,
> > but leave LISTEN_FDNAMES=... unchanged as inherited from our parent
> > process, then our child process using sd_listen_fds_with_names() might
> > see a mismatch in the number of names (unexpected -EINVAL failure), or
> > even if the number of names matches the values of those names may be
> > unexpected (with even less predictable results).
> > 
> > Usually, this is not an issue - the point of LISTEN_PID is to tell
> > systemd socket activation to ignore all other LISTEN_* if they were
> > not directed to this particular pid.  But if we end up consuming a
> > socket directed to this qemu process, and later decide to spawn a
> > child process that also needs systemd socket activation, we must
> > ensure we are not leaking any stale systemd variables through to that
> > child.  The easiest way to do this is to wipe ALL LISTEN_* variables
> > at the time we consume a socket, even if we do not yet care about a
> > LISTEN_FDNAMES passed in from the parent process.
> > 
> > See also https://lists.freedesktop.org/archives/systemd-devel/2023-March/048920.html
> > 
> > Thanks: Laszlo Ersek <lersek@redhat.com>
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >  util/systemd.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks; queued on my NBD tree for a pull request this week.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



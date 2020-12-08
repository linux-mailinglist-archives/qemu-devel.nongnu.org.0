Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921CF2D2D5F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:40:47 +0100 (CET)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmeAY-0005TG-Ck
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:40:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kme8M-0004Ij-RW
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:38:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kme8L-0002vu-9v
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607438308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iTQJYRJlmxjf8PmUaiqsXuiKTdf0L5YQfNNLb0vXnhA=;
 b=CITp6daBsHkDXgQGIn4I/P5Xaa9QsdL4+Eom/BB/FF5vhP+dmaFW+DUds40L917wewIKEw
 Fby4tT/Jg6hHGMqXiVP+ihR/E8HMp5uID0TEpMU/LIhYXwjl5tzRkvGLjiwufOjrZlC5//
 YH7TngmpkqBG5Ih0Yvdyxiza9AJPhxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-f6R4Yg5TOXOjd0H7TxhiIg-1; Tue, 08 Dec 2020 09:38:26 -0500
X-MC-Unique: f6R4Yg5TOXOjd0H7TxhiIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 515DB102CB66;
 Tue,  8 Dec 2020 14:38:25 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C2FE19D9D;
 Tue,  8 Dec 2020 14:38:23 +0000 (UTC)
Date: Tue, 8 Dec 2020 15:38:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Li Feng <fengli@smartx.com>
Subject: Re: [PATCH] file-posix: detect the lock using the real file
Message-ID: <20201208143822.GA6392@merkur.fritz.box>
References: <1607432377-87084-1-git-send-email-fengli@smartx.com>
MIME-Version: 1.0
In-Reply-To: <1607432377-87084-1-git-send-email-fengli@smartx.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lifeng1519@gmail.com, kyle@smartx.com,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.12.2020 um 13:59 hat Li Feng geschrieben:
> This patch addresses this issue:
> When accessing a volume on an NFS filesystem without supporting the file lock,
> tools, like qemu-img, will complain "Failed to lock byte 100".
> 
> In the original code, the qemu_has_ofd_lock will test the lock on the
> "/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
> which depends on the underlay filesystem.
> 
> In this patch, make the 'qemu_has_ofd_lock' with a filename be more generic
> and reasonable.
> 
> Signed-off-by: Li Feng <fengli@smartx.com>

Do you know any way how I could configure either the NFS server or the
NFS client such that locking would fail? For any patch related to this,
it would be good if I could even test the scenario.

For this specific patch, I think Daniel has already provided a good
explanation of the fundamental problems it has.

Kevin



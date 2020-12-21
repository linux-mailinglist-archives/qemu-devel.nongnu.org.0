Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B15A2DFC07
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 13:50:21 +0100 (CET)
Received: from localhost ([::1]:44814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krKdo-0003V1-1h
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 07:50:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krKcv-00033j-M0
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:49:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krKct-0000YH-0V
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608554962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5yCz1xk1G61tEQ0WOrnpa0N67Ud3Qjk8WX3/nKpYlCg=;
 b=GlmlmtM07HlbUmLu32//GKAjkugb8CNOX1J9ocslAy9QbKtpYBoH1EcjMzYsBd1Kr/7Szh
 cqjSBCX3EHMmC/ReqfqQ+a87DuS37nKmrOLhXJtGvWn48te1BzxMJYebZJ1HM9MY3R/gaj
 HJP9tGDMR6DZeH1dGG/3HFjuHpAoPtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-bc7xoo4VNjiVSkSxMtUi1Q-1; Mon, 21 Dec 2020 07:49:20 -0500
X-MC-Unique: bc7xoo4VNjiVSkSxMtUi1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ED7D180A087
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 12:49:19 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-3.ams2.redhat.com
 [10.36.114.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F00CD5D6D1;
 Mon, 21 Dec 2020 12:49:09 +0000 (UTC)
Subject: Re: virtiofsd: sshfs as submount?
To: Laszlo Ersek <lersek@redhat.com>, Miklos Szeredi <mszeredi@redhat.com>
References: <599fd4bd-2f62-1ce5-2b9c-0512ee7ead6e@redhat.com>
 <0208dde6-df57-c27a-418f-57cb3c0173f2@redhat.com>
 <c0f7c512-d796-db16-e5fb-a2e346c37e48@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <06de2310-e566-61a7-9ae8-679e9fefabc3@redhat.com>
Date: Mon, 21 Dec 2020 13:49:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c0f7c512-d796-db16-e5fb-a2e346c37e48@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.12.20 13:45, Laszlo Ersek wrote:
> On 12/21/20 13:06, Max Reitz wrote:
> 
>> I can share sshfs through sshfs, so it must be something virtiofs-specific.
> 
> Your insight proved crucial to solving the riddle.
> 
> Chaining sshfs with sshfs made me think that you must have used a normal
> (non-root) user account on the first remote computer (where you ran the
> 2nd sshfs command).
> 
> And that reminded me of the "allow_root" option which I seemed to have
> read somewhere around the FUSE manuals.

Oh, that makes sense.  Right.

> So indeed I set up another sshfs mount on my laptop, with my normal UID,
> and tried to access the mount point from a plain root shell (with
> virtiofsd completely out of the picture) -- it failed with "Permission
> denied". :) It's apparently intentional on sshfs's / FUSE's part, to
> protect the local root user from "remote nastiness injection".
> 
> Then I re-did the sshfs mount, but with "-o allow_root" this time. The
> plain root shell can now access the mount point.

Indeed, that works better.

> ... So can virtiofsd :) It's *amazing* to see remote files in the UEFI
> shell. I never thought "filesystem as a service" could feel this empowering.
> 
> Thanks, Max!

Er, *cough*, my pleasure! O:)

Max



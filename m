Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE9D2DFBD1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 13:26:22 +0100 (CET)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krKGb-0004RX-JP
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 07:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1krKEW-0003Ht-RK
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:24:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1krKET-0008MU-5o
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608553447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PitXkHjVFwSlGiBNq49X3I2cCWxhGBLQygf1QRaCDI4=;
 b=a9MRGKblMa9QNHk0z2imzRzDAuDlpLWPeOAZooJDrJrBMN3uwwf/LgjoxytEyEfheGIdxF
 XOtC+hqt+TsLh5F4qnqSDUg9kG5BnB0AImbIZ6iZmvISyNx9q11zoNsbFBnyt2eT9vUbCB
 hJoO/4/2t5vY6jX9y9WllO0SxnXkGPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-8aX7iJumPiCfINAAfhkPxQ-1; Mon, 21 Dec 2020 07:24:05 -0500
X-MC-Unique: 8aX7iJumPiCfINAAfhkPxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32E65800D53
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 12:24:04 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-71.ams2.redhat.com
 [10.36.114.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1F4D6064B;
 Mon, 21 Dec 2020 12:23:54 +0000 (UTC)
Subject: Re: virtiofsd: sshfs as submount?
To: Max Reitz <mreitz@redhat.com>, Miklos Szeredi <mszeredi@redhat.com>
References: <599fd4bd-2f62-1ce5-2b9c-0512ee7ead6e@redhat.com>
 <0208dde6-df57-c27a-418f-57cb3c0173f2@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <60f161b8-3380-7020-7cbf-7897fcfa0525@redhat.com>
Date: Mon, 21 Dec 2020 13:23:54 +0100
MIME-Version: 1.0
In-Reply-To: <0208dde6-df57-c27a-418f-57cb3c0173f2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/20 13:06, Max Reitz wrote:
> On 20.12.20 00:41, Laszlo Ersek wrote:
>> Hi Miklos,
> 
> (I hope it’s OK for me not to be Miklos, even though I don’t have much
> to add)

:)

Thank you, Max!
Laszlo

>> the following 2019 presentation on Stefan's website:
>>
>>    https://vmsplice.net/
>>    virtio-fs: A Shared File System for Virtual Machines at KVM Forum 2019
>>   
>> https://vmsplice.net/~stefan/virtio-fs_%20A%20Shared%20File%20System%20for%20Virtual%20Machines.pdf
>>
>>
>> has a slide called "Use case: File system-as-a-service" (slide#4). It
>> seems to confirm my "grand" idea to expose an sshfs submount to the
>> guest, via virtiofsd. (The guest need not / should not know it's a
>> submount, just see the files.) Beyond the pure utility of this, it feels
>> exciting to chain FUSE to FUSE. :)
>>
>> I've tried it; the FUSE_READDIRPLUS request fails.
>>
>> [2020-12-20 00:32:08.64+0100] [ID: 00000006] unique: 83, opcode:
>> READDIRPLUS (44), nodeid: 1, insize: 80, pid: 1
>> [2020-12-20 00:32:08.64+0100] [ID: 00000006]    unique: 83, error: -13
>> (Permission denied), outsize: 16
>>
>> More precisely, it fails on the directory entry in the containing
>> directory that is the sshfs mount point, when listing the containing
>> directory.
> 
> I see the same.
> 
>> I've skimmed the following thread:
>>
>>    [PATCH] virtiofsd: Show submounts
>>    https://www.redhat.com/archives/virtio-fs/2020-April/msg00023.html
>>
>> (which is now QEMU commit ace0829c0d08), and I vaguely suspect it should
>> work -- the MS_REC flag is present, and the MS_REC flag seems to be so
>> old that I think my host kernel (latest RHEL7) must support it too.
> 
> It works (for me) with other mounts (like XFS or ext4), so submounts
> shouldn’t be the problem.
> 
>> So... does the sshfs filesystem present itself as unshareable? Is it
>> supposed to work? Does it break for others too?
> 
> I can share sshfs through sshfs, so it must be something virtiofs-specific.
> 
> I tried to debug it, but I could only find that the fstatat()/statx() on
> it (FD opened, then stat called with that FD, an empty pathname, and
> AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW) fails with EPERM.  I tried
> disabling all the sandboxing, but still got that error.
> 
> FWIW, I get the same error with virtiofsd-rs (and there, too, the
> fstatat64() yields the EPERM).
> 
> So far, I couldn’t reproduce it outside of virtiofsd, though...  (Like,
> just invoking stat on the command line works; and a simple program that
> opens the mount point FD and then stats it works, too.)
> 
> Max



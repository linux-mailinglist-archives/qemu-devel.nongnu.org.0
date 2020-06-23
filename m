Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C86A205F7A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 22:40:05 +0200 (CEST)
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnpi7-00039e-9a
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 16:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jnphG-0002gY-0d
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 16:39:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44079
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jnphD-00060S-Gk
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 16:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592944745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jsq9CVKvqwL/Y/aqel5tnTztWvZiz3orAn/FQPynbOg=;
 b=LWU5bb4fDTXogx8fr+NEjeWzdyNb7HVvRhK95MPOySDmqc/cYGmRmurXB/jiaIExp4Znaf
 2LeNeKYtKhVW2pmN/adqSaUyqVD+CxEtCaWqWq5K1LKfghDo1qYycuhVwRqprZkWpv9jJN
 Eg2uHrIuVo67KiTymhXCshvHdXLpHac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-AtP176vHOdiS2Za84zTMWg-1; Tue, 23 Jun 2020 16:38:59 -0400
X-MC-Unique: AtP176vHOdiS2Za84zTMWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ADEE803F7A;
 Tue, 23 Jun 2020 20:38:50 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7C0310013C0;
 Tue, 23 Jun 2020 20:38:49 +0000 (UTC)
Subject: Re: [Bug 1884831] [NEW] qemu-nbd fails to discard bigger chunks
To: Bug 1884831 <1884831@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <159294358125.13789.3860026407311199131.malonedeb@wampee.canonical.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <18e784cc-82ec-0b03-911b-72961cb722cd@redhat.com>
Date: Tue, 23 Jun 2020 15:38:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <159294358125.13789.3860026407311199131.malonedeb@wampee.canonical.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/20 3:19 PM, TobiasHunger wrote:
> Public bug reported:
> 
> This report is moved from systemd to here:
> https://github.com/systemd/systemd/issues/16242
> 
> A qemu-nbd device reports that it can discard a lot of bytes:
> 
> cat /sys/block/nbd0/queue/discard_max_bytes
> 2199023255040

That smells fishy.  It is 0xffffffff * 512.  But in reality, the NBD 
protocol is (currently) capped at 32 bits, so it cannot handle any 
request 4G or larger.

It is not qemu-nbd that populates 
/sys/block/nbd0/queue/discard_max_bytes, but the kernel.  Are you sure 
this is not a bug in the kernel's nbd.ko module, where it may be the 
case that it is reporting -1 as a 32-bit value which then gets 
mistakenly turned into a faulty advertisement?  Can you tweak your 
software to behave as if /dev/nbd0 had a discard_max_bytes of 0xfffff000 
instead?

In fact, to prove the bug is in the kernel's nbd.ko and not in qemu-nbd, 
I created an NBD server using nbdkit:

# modprobe nbd
# nbdkit memory 5G
# nbd-client -b 512 localhost /dev/nbd0
# cat /sys/block/nbd0/queue/discard_max_bytes
2199023255040

Same answer, different nbd server.  So it's not qemu's fault.

> 
> And indeed, discard works with small images:
> 
> $ qemu-img create -f qcow2 /tmp/image.img 2M
> $ sudo qemu-nbd --connect=/dev/nbd0 /tmp/image.img
> $ sudo blkdiscard /dev/nbd0
> 
> but not for bigger ones (still smaller than discard_max_bytes):
> 
> $ qemu-img create -f qcow2 /tmp/image.img 5G
> $ sudo qemu-nbd --connect=/dev/nbd0 /tmp/image.img
> $ sudo blkdiscard /dev/nbd0
> 
> ** Affects: qemu
>       Importance: Undecided
>           Status: New
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322192C97D5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 08:09:59 +0100 (CET)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjznR-0002pz-SH
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 02:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kjzmE-0002Mt-1x
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 02:08:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kjzmB-0007W2-45
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 02:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606806517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQfkYTaNxZ+mwqM3bnjMf/e/oAMI1+TlhrilZZ68On4=;
 b=Ulr2vAf4xQxKx94oGkWNF/UYOrTl5VPNk+KAW6J09W/ER6cnxO8qfmhf0pGd5dca2BNFoG
 FyQmg1SueaGgAJOQYarrzIz5IeKmQAICZugwu7TdLrgzFpk2gjzc+imQuxZfueoUUbH7H4
 Ka3IDssNqz9d5XzB3HLgz3ygHufsfyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-EjrSiOjCOGaQaubvD2D2ng-1; Tue, 01 Dec 2020 02:08:33 -0500
X-MC-Unique: EjrSiOjCOGaQaubvD2D2ng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3B4E100D698;
 Tue,  1 Dec 2020 07:08:31 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEAED5C22B;
 Tue,  1 Dec 2020 07:08:23 +0000 (UTC)
Date: Tue, 1 Dec 2020 08:08:20 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Message-ID: <20201201070820.GO105758@angien.pipo.sk>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.

Hi,

I gave this a try when attempting to implement the libvirt code for this
feature. I've ran into a problem of migration failing right away. The
VM's cpus were running at that point.

QEMU logged the following to stdout/err:

2020-12-01T06:50:42.334062Z qemu-system-x86_64: uffd_register_memory() failed: start=7f2007fff000 len=33554432000 mode=2 errno=22
2020-12-01T06:50:42.334072Z qemu-system-x86_64: ram_write_tracking_start() failed: restoring initial memory state
2020-12-01T06:50:42.334074Z qemu-system-x86_64: uffd_protect_memory() failed: start=7f2007fff000 len=33554432000 mode=0 errno=2
2020-12-01T06:50:42.334076Z qemu-system-x86_64: uffd_unregister_memory() failed: start=7f2007fff000 len=33554432000 errno=22


The migration was started by the following QMP conversation:


QEMU_MONITOR_IO_WRITE: mon=0x7fff9c20c610 buf={"execute":"migrate-set-capabilities","arguments":{"capabilities":[{"capability":"xbzrle","state":false},{"capability":"auto-converge","state":false},{"capability":"rdma-pin-all","state":false},{"capability":"postcopy-ram","state":false},{"capability":"compress","state":false},{"capability":"pause-before-switchover","state":false},{"capability":"late-block-activate","state":false},{"capability":"multifd","state":false},{"capability":"background-snapshot","state":true}]},"id":"libvirt-14"}

QEMU_MONITOR_RECV_REPLY: mon=0x7fff9c20c610 reply={"return": {}, "id": "libvirt-14"}

QEMU_MONITOR_IO_WRITE: mon=0x7fff9c20c610 buf={"execute":"migrate-set-parameters","arguments":{"max-bandwidth":9223372036853727232},"id":"libvirt-15"}

QEMU_MONITOR_RECV_REPLY: mon=0x7fff9c20c610 reply={"return": {}, "id": "libvirt-15"}

QEMU_MONITOR_IO_WRITE: mon=0x7fff9c20c610 buf={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-16"}

QEMU_MONITOR_IO_SEND_FD: mon=0x7fff9c20c610 fd=44 ret=72 errno=0
QEMU_MONITOR_RECV_REPLY: mon=0x7fff9c20c610 reply={"return": {}, "id": "libvirt-16"}

QEMU_MONITOR_IO_WRITE: mon=0x7fff9c20c610 buf={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-17"}

QEMU_MONITOR_RECV_EVENT: mon=0x7fff9c20c610 event={"timestamp": {"seconds": 1606805733, "microseconds": 962424}, "event": "MIGRATION", "data": {"status": "setup"}}
QEMU_MONITOR_RECV_REPLY: mon=0x7fff9c20c610 reply={"return": {}, "id": "libvirt-17"}
QEMU_MONITOR_RECV_EVENT: mon=0x7fff9c20c610 event={"timestamp": {"seconds": 1606805733, "microseconds": 966306}, "event": "MIGRATION_PASS", "data": {"pass": 1}}
QEMU_MONITOR_RECV_EVENT: mon=0x7fff9c20c610 event={"timestamp": {"seconds": 1606805733, "microseconds": 966355}, "event": "MIGRATION", "data": {"status": "active"}}
QEMU_MONITOR_RECV_EVENT: mon=0x7fff9c20c610 event={"timestamp": {"seconds": 1606805733, "microseconds": 966488}, "event": "STOP"}
QEMU_MONITOR_RECV_EVENT: mon=0x7fff9c20c610 event={"timestamp": {"seconds": 1606805733, "microseconds": 970326}, "event": "MIGRATION", "data": {"status": "failed"}}

QEMU_MONITOR_IO_WRITE: mon=0x7fff9c20c610 buf={"execute":"query-migrate","id":"libvirt-18"}

QEMU_MONITOR_RECV_REPLY: mon=0x7fff9c20c610 reply={"return": {"status": "failed"}, "id": "libvirt-18"}
qemuMigrationJobCheckStatus:1685 : operation failed: snapshot job: unexpectedly failed

 $ uname -r
5.8.18-300.fc33.x86_64


created by libvirt with the following patchset applied:

https://gitlab.com/pipo.sk/libvirt/-/commits/background-snapshot

git fetch https://gitlab.com/pipo.sk/libvirt.git background-snapshot

Start the snapshot via:

virsh snapshot-create-as --memspec /tmp/snap.mem --diskspec sdb,snapshot=no --diskspec sda,snapshot=no --no-metadata upstream

Note you can omit --diskspec if you have a diskless VM.

The patches are VERY work in progress as I need to figure out the proper
sequencing to ensure a consistent snapshot.

Note that in cases when qemu can't guarantee that the
background_snapshot feature will work it should not advertise it. We
need a way to check whether it's possible to use it, so we can replace
the existing --live flag with it rather than adding a new one and
shifting the problem of checking whether the feature works to the user.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F12216693
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 08:40:53 +0200 (CEST)
Received: from localhost ([::1]:59036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jshHf-0002L7-Ky
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 02:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1jshFy-0001q7-0k
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 02:39:06 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26477
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1jshFw-0007mu-2a
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 02:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594103942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4IeA19AAOxbAv9Ckd2RJHACoAUWTzLrK855tuEFIuZ8=;
 b=bJjoC0EbC8dUjgG4JEIdBcQGPySylm00h3SDgtSeEh6mZjsGmioOw0RLwDAbwZ121SpA0P
 jzrLUw/u5DUROXBRDQr5yT/o8bIFKIZfIZ6IMUfAHCv4i1X1rmLSZCYnrsRgx5ftWj34Al
 1egAoIqpbq0GG+VJL0CLEbaZvZXaAuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-UyVELUoJP1C5dG3qH2SN0Q-1; Tue, 07 Jul 2020 02:39:01 -0400
X-MC-Unique: UyVELUoJP1C5dG3qH2SN0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1734B107ACF2;
 Tue,  7 Jul 2020 06:39:00 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6FB010013D7;
 Tue,  7 Jul 2020 06:38:56 +0000 (UTC)
Date: Tue, 7 Jul 2020 08:38:53 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/6] migration: introduce savevm, loadvm, delvm QMP
 commands
Message-ID: <20200707063853.GA9048@angien.pipo.sk>
References: <20200702175754.2211821-1-berrange@redhat.com>
 <20200702175754.2211821-3-berrange@redhat.com>
 <fcff0e8b-fd60-2897-0553-49ab24a9b7fa@redhat.com>
 <20200702182452.GP1888119@redhat.com>
 <20200703154933.GE6641@work-vm>
 <20200703160235.GM2213227@redhat.com>
 <20200706161555.GE5052@linux.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20200706161555.GE5052@linux.fritz.box>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:20:54
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 06, 2020 at 18:15:55 +0200, Kevin Wolf wrote:
> Am 03.07.2020 um 18:02 hat Daniel P. Berrangé geschrieben:
> > On Fri, Jul 03, 2020 at 04:49:33PM +0100, Dr. David Alan Gilbert wrote:
> > > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > > On Thu, Jul 02, 2020 at 01:12:52PM -0500, Eric Blake wrote:
> > > > > On 7/2/20 12:57 PM, Daniel P. Berrangé wrote:

[...]

> > migration only does vmstate, not disks. The current blockdev commands
> > are all related to external snapshots, nothing for internal snapshots
> > AFAIK. So we still need commands to load/save internal snapshots of
> > the disk data in the qcow2 files.
> > 
> > So we could look at loadvm/savevm conceptually as a syntax sugar above
> > a migration transport that targets disk images, and blockdev QMP command
> > that can do internal snapshots. Neither of these exist though and feel
> > like a significantly larger amount of work than using existing functionality
> > that is currently working.
> 
> There is blockdev-snapshot-internal-sync, which does a disk-only
> snapshot of a single node. A snapshot of multiple nodes can be taken by
> putting multiple blockdev-snapshot-internal-sync inside a 'transaction'
> command.

Libvirt never implemented support for disk-only internal snapshots as I
didn't think they are worth it. We also made a mistake by using the
VIR_DOMAIN_SNAPSHOT_DISK_ONLY to switch to an external snapshot, so
while the XML can modify the snapshot to be internal it's not very clear
nor user-friendly to force an internal disk only snapshot.

> If we want to build on top of this, we'd have to implement a
> transactionable command for storing only the VM state to a specific
> node. This would probably still be a long-running job.

IMO we really want this also for external snapshots. Driving the
migration as standard migration is really suboptimal especially when the
user wants minimal downtime. Transactioning a post-copy style copy-on
write migration would simplify this a lot. I agree though that this is
for a different conversation.



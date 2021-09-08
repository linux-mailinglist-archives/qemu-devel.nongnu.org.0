Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C58403C79
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:28:16 +0200 (CEST)
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzUl-0000lG-4g
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNzRU-000767-0S
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:24:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNzRS-0003Cc-1g
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631114689;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7YyjVbnsjX6chBrO10o+RIZZjfwnfY/sRQ+SDIhPfg=;
 b=Sf4waFpPLHHofeShTaEI49LMR0ST6FaC865idl4cuMT1vNzS58z+MgmedVqEweCZgObgW4
 46uzRhaNW9RqADuDV48WxF8o45O/xm1br86TMJRqdHNOUhdHF8nNLk+sFJVghCT2kNN16j
 3CHEzwea5mVIoWw0/1T0ln6RUPsv1Os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-3BTQoC_-OaulGy0Bscq-EQ-1; Wed, 08 Sep 2021 11:24:46 -0400
X-MC-Unique: 3BTQoC_-OaulGy0Bscq-EQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AE8F1023F4E;
 Wed,  8 Sep 2021 15:24:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2054B5D9C6;
 Wed,  8 Sep 2021 15:24:42 +0000 (UTC)
Date: Wed, 8 Sep 2021 16:24:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 0/5] Stop adding HMP-only commands, allow QMP for all
Message-ID: <YTjVuEg+wlKPHkAi@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
 <875yvbrtnq.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <875yvbrtnq.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 05:09:13PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > We are still adding HMP commands without any QMP counterparts. This is
> > done because there are a reasonable number of scenarios where the cost
> > of designing a QAPI data type for the command is not justified.
> >
> > This has the downside, however, that we will never be able to fully
> > isolate the monitor code from the remainder of QEMU internals. It is
> > desirable to be able to get to a point where subsystems in QEMU are
> > exclusively implemented using QAPI types and never need to have any
> > knowledge of the monitor APIs.
> >
> > The way to get there is to stop adding commands to HMP only. All
> > commands must be implemented using QMP, and any HMP implementation
> > be a shim around the QMP implementation.
> >
> > We don't want to compromise our supportability of QMP long term though.
> >
> > This series proposes that we relax our requirements around fine grained
> > QAPI data design,
> 
> Specifics?  QMP command returns a string, HMP wrapper prints that
> string?

yes, a command returning a single opaque printf formatted string would
be the common case.  At a more general POV though, the JSON doc received
by the client should be usable "as received", immediately after JSON
de-serialization without needing any further custom parsing on top.

ie if a value needs to be parsed by the client, then it must be split
into multiple distinct values in the QAPI data type design to remove
the need for parsing by the client. 

If a command's design violates that, then it must remain under the
"x-" prefix.  "info registers" is a example because we're printf
formatting each register value into a opaque string. Any client
needing a specific register value would have to scanf parse this
string. The justification for not representing each register as
a distinct QAPI field is that we don't think machines genuinely
need to parse this, as its just adhoc human operator debug info.
So we take the easy option and just printf to a string and put
it under "x-" prefix



> For many HMP commands, a QMP commands with the same name exists, and the
> former is probably a wrapper around the latter.  Same for HMP "info FOO"
> and QMP query-FOO.
> 
> HMP commands without such a match:
> 
>     boot_set
>     change
>     commit
>     cpu
>     delvm
>     drive_add
>     drive_del
>     exit_preconfig
>     gdbserver
>     gpa2hpa
>     gpa2hva
>     gva2gpa
>     help
>     hostfwd_add
>     hostfwd_remove
>     i
>     info
>     info capture
>     info cmma
>     info cpus
>     info history
>     info ioapic
>     info irq
>     info jit
>     info lapic
>     info mem
>     info mtree
>     info network
>     info numa
>     info opcount
>     info pic
>     info profile
>     info qdm
>     info qom-tree
>     info qtree
>     info ramblock
>     info rdma
>     info registers
>     info roms
>     info skeys
>     info snapshots
>     info sync-profile
>     info tlb
>     info trace-events
>     info usb
>     info usbhost
>     info usernet
>     loadvm
>     log
>     logfile
>     mce
>     migrate_set_capability
>     migrate_set_parameter
>     migration_mode
>     mouse_button
>     mouse_move
>     mouse_set
>     nmi
>     o
>     pcie_aer_inject_error
>     print
>     qemu-io
>     savevm
>     sendkey
>     singlestep
>     snapshot_blkdev
>     snapshot_blkdev_internal
>     snapshot_delete_blkdev_internal
>     stopcapture
>     sum
>     sync-profile
>     trace-event
>     trace-file
>     watchdog_action
>     wavcapture
>     x
>     xp
> 
> This is 77 out of 170 HMP commands.  I was hoping for fewer.

Wow, yes, I'm surprised ! A few of those do indeed have QMP
equivalents, but with slight differences eg savevm ->
snapshot-save, but clearly we have a big list regardless


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1C31C21D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:05:18 +0100 (CET)
Received: from localhost ([::1]:59372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBjBN-0006HE-Uc
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lBj7r-0003Yf-7s
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:01:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lBj7n-0003aT-PL
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613415695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ageun29/WLwWzAIlZCjc5L+xsxJpPzwcix/hfqXv6Kk=;
 b=g8mLjtrAP9i8yYHfuOChlCWtwtxzKcHi5xavjvYJhsegnHEkjuUaJ6suw5dG0X43KLleUN
 uhwmtgW+5Co583izOOU4F74iVK66FOO/pkiF+zPfE0dkLoOOwvYhv5XZ9kJ3vjAO4As76+
 byNHZx1rhWzns9r4P8eP0Qf66KXxx44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-wjLutm-oMlun9SlCXeAesA-1; Mon, 15 Feb 2021 14:01:33 -0500
X-MC-Unique: wjLutm-oMlun9SlCXeAesA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CA3B85B66C;
 Mon, 15 Feb 2021 19:01:32 +0000 (UTC)
Received: from work-vm (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D42D95C233;
 Mon, 15 Feb 2021 19:01:30 +0000 (UTC)
Date: Mon, 15 Feb 2021 19:01:28 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 00/33] migration: capture error reports into Error object
Message-ID: <YCrFCHUAs1rWiQas@work-vm>
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204182249.GO3039@work-vm>
 <20210204190927.GB903389@redhat.com>
 <20210208132903.GH3032@work-vm>
 <20210208134206.GH1141037@redhat.com> <YCq/jV1wa4EiVZQK@work-vm>
 <20210215185822.GM1542881@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210215185822.GM1542881@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrang� (berrange@redhat.com) wrote:
> On Mon, Feb 15, 2021 at 06:38:05PM +0000, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrang� (berrange@redhat.com) wrote:
> > > On Mon, Feb 08, 2021 at 01:29:03PM +0000, Dr. David Alan Gilbert wrote:
> > > > * Daniel P. Berrang� (berrange@redhat.com) wrote:
> > > > > On Thu, Feb 04, 2021 at 06:22:49PM +0000, Dr. David Alan Gilbert wrote:
> > > > > > * Daniel P. Berrang� (berrange@redhat.com) wrote:
> > > > > > > Due to its long term heritage most of the migration code just invokes
> > > > > > > 'error_report' when problems hit. This was fine for HMP, since the
> > > > > > > messages get redirected from stderr, into the HMP console. It is not
> > > > > > > OK for QMP because the errors will not be fed back to the QMP client.
> > > > > > > 
> > > > > > > This wasn't a terrible real world problem with QMP so far because
> > > > > > > live migration happens in the background, so at least on the target side
> > > > > > > there is not a QMP command that needs to capture the incoming migration.
> > > > > > > It is a problem on the source side but it doesn't hit frequently as the
> > > > > > > source side has fewer failure scenarios. None the less on both sides it
> > > > > > > would be desirable if 'query-migrate' can report errors correctly.
> > > > > > > With the introduction of the load-snapshot QMP commands, the need for
> > > > > > > error reporting becomes more pressing.
> > > > > > > 
> > > > > > > Wiring up good error reporting is a large and difficult job, which
> > > > > > > this series does NOT complete. The focus here has been on converting
> > > > > > > all methods in savevm.c which have an 'int' return value capable of
> > > > > > > reporting errors. This covers most of the infrastructure for controlling
> > > > > > > the migration state serialization / protocol.
> > > > > > > 
> > > > > > > The remaining part that is missing error reporting are the callbacks in
> > > > > > > the VMStateDescription struct which can return failure codes, but have
> > > > > > > no "Error **errp" parameter. Thinking about how this might be dealt with
> > > > > > > in future, a big bang conversion is likely non-viable. We'll probably
> > > > > > > want to introduce a duplicate set of callbacks with the "Error **errp"
> > > > > > > parameter and convert impls in batches, eventually removing the
> > > > > > > original callbacks. I don't intend todo that myself in the immediate
> > > > > > > future.
> > > > > > > 
> > > > > > > IOW, this patch series probably solves 50% of the problem, but we
> > > > > > > still do need the rest to get ideal error reporting.
> > > > > > > 
> > > > > > > In doing this savevm conversion I noticed a bunch of places which
> > > > > > > see and then ignore errors. I only fixed one or two of them which
> > > > > > > were clearly dubious. Other places in savevm.c where it seemed it
> > > > > > > was probably ok to ignore errors, I've left using error_report()
> > > > > > > on the basis that those are really warnings. Perhaps they could
> > > > > > > be changed to warn_report() instead.
> > > > > > > 
> > > > > > > There are alot of patches here, but I felt it was easier to review
> > > > > > > for correctness if I converted 1 function at a time. The series
> > > > > > > does not neccessarily have to be reviewed/appied in 1 go.
> > > > > > 
> > > > > > After this series, what do my errors look like, and where do they end
> > > > > > up?
> > > > > > Do I get my nice backtrace shwoing that device failed, then that was
> > > > > > part of that one...
> > > > > 
> > > > > It hasn't modified any of the VMStateDescription callbacks so any
> > > > > of the per-device logic that was printing errors will still be using
> > > > > error_report to the console as before.
> > > > > 
> > > > > The errors that have changed (at this stage) are only the higher
> > > > > level ones that are in the generic part of the code. Where those
> > > > > errors mentioned a device name/ID they still do.
> > > > > 
> > > > > In some of the parts I've modified there will have been multiple
> > > > > error_reports collapsed into one error_setg() but the ones that
> > > > > are eliminated are high level generic messages with no useful
> > > > > info, so I don't think loosing those is a problem per-se.
> > > > > 
> > > > > The example that I tested was the case where we load a snapshot
> > > > > under a different config that we saved it with. This is the scenario
> > > > > that gave the non-deterministic ordering in the iotest you disabled
> > > > > from my previous series.
> > > > > 
> > > > > In that case, we changed from:
> > > > > 
> > > > >   qemu-system-x86_64: Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices
> > > > >   {"return": [{"current-progress": 1, "status": "concluded", "total-progress": 1, "type": "snapshot-load", "id": "load-err-stderr", "error": "Error -22 while loading VM state"}]}
> > > > > 
> > > > > To
> > > > > 
> > > > >   {"return": [{"current-progress": 1, "status": "concluded", "total-progress": 1, "type": "snapshot-load", "id": "load-err-stderr", "error": "Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices"}]}
> > > > > 
> > > > > From a HMP loadvm POV, this means instead of seeing
> > > > > 
> > > > >   (hmp)  loadvm foo
> > > > >   Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices
> > > > >   Error -22 while loading VM state
> > > > > 
> > > > > You will only see the detailed error message
> > > > > 
> > > > >   (hmp)  loadvm foo
> > > > >   Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices
> > > > > 
> > > > > In this case I think loosing the "Error -22 while loading VM state"
> > > > > is fine, as it didn't add value IMHO.
> > > > > 
> > > > > 
> > > > > If we get around to converting the VMStateDescription callbacks to
> > > > > take an error object, then I think we'll possibly need to stack the
> > > > > error message from the callback, with the higher level message.
> > > > > 
> > > > > Do you have any familiar/good examples of error message stacking I
> > > > > can look at ?  I should be able to say whether they would be impacted
> > > > > by this series or not - if they are, then I hopefully only threw away
> > > > > the fairly useless high level messages, like the "Error -22" message
> > > > > above.
> > > > 
> > > > Can you try migrating:
> > > >   ./x86_64-softmmu/qemu-system-x86_64 -M pc -nographic -device virtio-rng,disable-modern=true
> > > > to
> > > >   ./x86_64-softmmu/qemu-system-x86_64 -M pc -nographic -device virtio-rng
> > > > 
> > > > what I currently get is:
> > > > qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x6 read: 0 device: 10 cmask: 10 wmask: 0 w1cmask:0
> > > > qemu-system-x86_64: Failed to load PCIDevice:config
> > > > qemu-system-x86_64: Failed to load virtio-rng:virtio
> > > > qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:04.0/virtio-rng'
> > > > qemu-system-x86_64: load of migration failed: Invalid argument
> > > 
> > > After my patches the very last line is gone.
> > > 
> > > So, still reporting using  error_report() is the first 3:
> > > 
> > >  qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x6 read: 0 device: 10 cmask: 10 wmask: 0 w1cmask:0
> > >  qemu-system-x86_64: Failed to load PCIDevice:config
> > >  qemu-system-x86_64: Failed to load virtio-rng:virtio
> > > 
> > > Then reported in process_incoming_migration_co() using the message
> > > populated in the Error object, using error_report_err():
> > > 
> > >  qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:04.0/virtio-rng'
> > > 
> > > Finally, this is no longer reported:
> > > 
> > >  qemu-system-x86_64: load of migration failed: Invalid argument
> > > 
> > > So in this case we've not lost any useful information
> > 
> > One thing to check, and I *think* you're OK, but we have one place where
> > we actually check the error number:
> > 
> > migration.c:
> > 3414 static MigThrError migration_detect_error(MigrationState *s)
> > ...
> > 3426     /* Try to detect any file errors */
> > 3427     ret = qemu_file_get_error_obj(s->to_dst_file, &local_error);
> > 3428     if (!ret) {
> > 3429         /* Everything is fine */
> > 3430         assert(!local_error);
> > 3431         return MIG_THR_ERR_NONE;
> > 3432     }
> > 3433 
> > 3434     if (local_error) {
> > 3435         migrate_set_error(s, local_error);
> > 3436         error_free(local_error);
> > 3437     }
> > 3438 
> > 3439     if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret == -EIO) {
> > 3440         /*
> > 3441          * For postcopy, we allow the network to be down for a
> > 3442          * while. After that, it can be continued by a
> > 3443          * recovery phase.
> > 3444          */
> > 3445         return postcopy_pause(s);
> > 3446     } else {
> > 
> > This is to go into postcopy pause if the network connection broke (but
> > not if for example a device moaned about being in an invalid state)
> > 
> > If I read this correctly, file errors are still being preserved - is
> > that correct?
> 
> Yes, in places where QemuFile is reporting an actual I/O error I've
> tried to preserve that. Only removed setting of fake I/O errors. So
> if anything, we ought to get more accurate at detecting the recoverable
> scenarios once we fully cleanup errors.

OK, good.

Dave

> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



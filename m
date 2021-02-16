Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B68831D101
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:33:45 +0100 (CET)
Received: from localhost ([::1]:49030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC66S-0003di-3p
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC654-0002Um-4L
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:32:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC651-0007R3-W4
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613503934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNQzMYNAqpweZSJ2l6hB5W+ppg4Uxm63rFMR3JJFyAA=;
 b=b6wRKGglr2JZpZY89Q/VGt6sKc8EiEaWeKlpkb/GOC6Gv2kEfe+9EC9huPGweHv62/+JTa
 BR/2RWtv+fSA42/sc3azYOLhf87xRCZ3ls1JGp4ROW1tNSDhf40MRj4MKrlRkSNURlT+4u
 J48EPUklNFit/ETCjMvahT/+51IWF20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-yGW7nGr1NJWmrXRBheGRYg-1; Tue, 16 Feb 2021 14:32:09 -0500
X-MC-Unique: yGW7nGr1NJWmrXRBheGRYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A495B427C1;
 Tue, 16 Feb 2021 19:32:08 +0000 (UTC)
Received: from work-vm (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55A945D9D3;
 Tue, 16 Feb 2021 19:32:07 +0000 (UTC)
Date: Tue, 16 Feb 2021 19:32:04 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 00/33] migration: capture error reports into Error object
Message-ID: <YCwdtMuUSSSg3j1K@work-vm>
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204182249.GO3039@work-vm>
 <20210204190927.GB903389@redhat.com>
 <20210208132903.GH3032@work-vm>
 <20210208134206.GH1141037@redhat.com> <YCq/jV1wa4EiVZQK@work-vm>
 <20210215185822.GM1542881@redhat.com> <YCrFCHUAs1rWiQas@work-vm>
 <YCuQzCs/DPNkXS0G@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YCuQzCs/DPNkXS0G@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Mon, Feb 15, 2021 at 07:01:28PM +0000, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Mon, Feb 15, 2021 at 06:38:05PM +0000, Dr. David Alan Gilbert wrote:
> > > > One thing to check, and I *think* you're OK, but we have one place where
> > > > we actually check the error number:
> > > > 
> > > > migration.c:
> > > > 3414 static MigThrError migration_detect_error(MigrationState *s)
> > > > ...
> > > > 3426     /* Try to detect any file errors */
> > > > 3427     ret = qemu_file_get_error_obj(s->to_dst_file, &local_error);
> > > > 3428     if (!ret) {
> > > > 3429         /* Everything is fine */
> > > > 3430         assert(!local_error);
> > > > 3431         return MIG_THR_ERR_NONE;
> > > > 3432     }
> > > > 3433 
> > > > 3434     if (local_error) {
> > > > 3435         migrate_set_error(s, local_error);
> > > > 3436         error_free(local_error);
> > > > 3437     }
> > > > 3438 
> > > > 3439     if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret == -EIO) {
> > > > 3440         /*
> > > > 3441          * For postcopy, we allow the network to be down for a
> > > > 3442          * while. After that, it can be continued by a
> > > > 3443          * recovery phase.
> > > > 3444          */
> > > > 3445         return postcopy_pause(s);
> > > > 3446     } else {
> > > > 
> > > > This is to go into postcopy pause if the network connection broke (but
> > > > not if for example a device moaned about being in an invalid state)
> > > > 
> > > > If I read this correctly, file errors are still being preserved - is
> > > > that correct?
> > > 
> > > Yes, in places where QemuFile is reporting an actual I/O error I've
> > > tried to preserve that. Only removed setting of fake I/O errors. So
> > > if anything, we ought to get more accurate at detecting the recoverable
> > > scenarios once we fully cleanup errors.
> > 
> > OK, good.
> 
> One scenario to possibly check though is that in a few places we used
> error_report_err() but didn't immediately return an error code back to
> the caller, instead carrying on doing other calls. It is possible that
> we thus reported an error about bad data, and then later hit the EIO
> check for QemuFile.

That's generally OK; it gets pretty painful to do the qemu file checks
after every read.

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



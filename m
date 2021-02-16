Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC75C31C822
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 10:32:22 +0100 (CET)
Received: from localhost ([::1]:56290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBwiT-0001wx-Ie
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 04:32:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBwhH-0001W5-Fo
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:31:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBwhF-00063q-Lu
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613467864;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+lQgNRplfpEJi+etHC3cyJHEa5nETZejY5e9/6unqY=;
 b=HZuXJnR44rflXEE1dcxpRTDDC1ZeHTc3zEqQwE6gjYWFhmGXcjK+2VX3z1/aZJDjM8Ypki
 9r2GCXH8h5FxPNhgiMEXl+wbp/1uOEMHq1tJOclrhaU/22a2zG3kv0kirMqIdaoTAsRcZ7
 gXUjvGdy57CzGbbiTHhANUvghpli0XQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-Vc84G-yJP_a3V2UpkLJ8wA-1; Tue, 16 Feb 2021 04:30:57 -0500
X-MC-Unique: Vc84G-yJP_a3V2UpkLJ8wA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4C1D192AB88;
 Tue, 16 Feb 2021 09:30:56 +0000 (UTC)
Received: from redhat.com (ovpn-112-215.ams2.redhat.com [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B61B57;
 Tue, 16 Feb 2021 09:30:55 +0000 (UTC)
Date: Tue, 16 Feb 2021 09:30:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 00/33] migration: capture error reports into Error object
Message-ID: <YCuQzCs/DPNkXS0G@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204182249.GO3039@work-vm>
 <20210204190927.GB903389@redhat.com>
 <20210208132903.GH3032@work-vm>
 <20210208134206.GH1141037@redhat.com> <YCq/jV1wa4EiVZQK@work-vm>
 <20210215185822.GM1542881@redhat.com> <YCrFCHUAs1rWiQas@work-vm>
MIME-Version: 1.0
In-Reply-To: <YCrFCHUAs1rWiQas@work-vm>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 07:01:28PM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Mon, Feb 15, 2021 at 06:38:05PM +0000, Dr. David Alan Gilbert wrote:
> > > One thing to check, and I *think* you're OK, but we have one place where
> > > we actually check the error number:
> > > 
> > > migration.c:
> > > 3414 static MigThrError migration_detect_error(MigrationState *s)
> > > ...
> > > 3426     /* Try to detect any file errors */
> > > 3427     ret = qemu_file_get_error_obj(s->to_dst_file, &local_error);
> > > 3428     if (!ret) {
> > > 3429         /* Everything is fine */
> > > 3430         assert(!local_error);
> > > 3431         return MIG_THR_ERR_NONE;
> > > 3432     }
> > > 3433 
> > > 3434     if (local_error) {
> > > 3435         migrate_set_error(s, local_error);
> > > 3436         error_free(local_error);
> > > 3437     }
> > > 3438 
> > > 3439     if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret == -EIO) {
> > > 3440         /*
> > > 3441          * For postcopy, we allow the network to be down for a
> > > 3442          * while. After that, it can be continued by a
> > > 3443          * recovery phase.
> > > 3444          */
> > > 3445         return postcopy_pause(s);
> > > 3446     } else {
> > > 
> > > This is to go into postcopy pause if the network connection broke (but
> > > not if for example a device moaned about being in an invalid state)
> > > 
> > > If I read this correctly, file errors are still being preserved - is
> > > that correct?
> > 
> > Yes, in places where QemuFile is reporting an actual I/O error I've
> > tried to preserve that. Only removed setting of fake I/O errors. So
> > if anything, we ought to get more accurate at detecting the recoverable
> > scenarios once we fully cleanup errors.
> 
> OK, good.

One scenario to possibly check though is that in a few places we used
error_report_err() but didn't immediately return an error code back to
the caller, instead carrying on doing other calls. It is possible that
we thus reported an error about bad data, and then later hit the EIO
check for QemuFile.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



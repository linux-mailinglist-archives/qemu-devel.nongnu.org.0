Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CC530FCF8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:35:57 +0100 (CET)
Received: from localhost ([::1]:38378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kQ0-0004v5-Ee
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7k0W-0004oM-Tu
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:09:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7k0U-00023s-Op
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612465773;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uH9Ha2WhNs1LwMFTD5Y7fBIZ2XyzwIc5mbELYuyYPkc=;
 b=R7yDtx3emzBnWUgsueHApcuRfedfZJlMhYXQaokP4GNMORPLk75qnAe73S016ODaBeDu+0
 NIyqxnVP1nffbqS58yTgvnkoleZY6qznsg7GLZdjH4stJ6x5+10GnnNcdSV62rz52bNMrF
 yWbDZMaiQ9/Dzl7mN/HCT8ASsqWjOSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-0Ydc1Jn0MsmLHbqHoRVAEg-1; Thu, 04 Feb 2021 14:09:32 -0500
X-MC-Unique: 0Ydc1Jn0MsmLHbqHoRVAEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E3A4801964;
 Thu,  4 Feb 2021 19:09:31 +0000 (UTC)
Received: from redhat.com (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D85B75D9CC;
 Thu,  4 Feb 2021 19:09:29 +0000 (UTC)
Date: Thu, 4 Feb 2021 19:09:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 00/33] migration: capture error reports into Error object
Message-ID: <20210204190927.GB903389@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204182249.GO3039@work-vm>
MIME-Version: 1.0
In-Reply-To: <20210204182249.GO3039@work-vm>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 06:22:49PM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > Due to its long term heritage most of the migration code just invokes
> > 'error_report' when problems hit. This was fine for HMP, since the
> > messages get redirected from stderr, into the HMP console. It is not
> > OK for QMP because the errors will not be fed back to the QMP client.
> > 
> > This wasn't a terrible real world problem with QMP so far because
> > live migration happens in the background, so at least on the target side
> > there is not a QMP command that needs to capture the incoming migration.
> > It is a problem on the source side but it doesn't hit frequently as the
> > source side has fewer failure scenarios. None the less on both sides it
> > would be desirable if 'query-migrate' can report errors correctly.
> > With the introduction of the load-snapshot QMP commands, the need for
> > error reporting becomes more pressing.
> > 
> > Wiring up good error reporting is a large and difficult job, which
> > this series does NOT complete. The focus here has been on converting
> > all methods in savevm.c which have an 'int' return value capable of
> > reporting errors. This covers most of the infrastructure for controlling
> > the migration state serialization / protocol.
> > 
> > The remaining part that is missing error reporting are the callbacks in
> > the VMStateDescription struct which can return failure codes, but have
> > no "Error **errp" parameter. Thinking about how this might be dealt with
> > in future, a big bang conversion is likely non-viable. We'll probably
> > want to introduce a duplicate set of callbacks with the "Error **errp"
> > parameter and convert impls in batches, eventually removing the
> > original callbacks. I don't intend todo that myself in the immediate
> > future.
> > 
> > IOW, this patch series probably solves 50% of the problem, but we
> > still do need the rest to get ideal error reporting.
> > 
> > In doing this savevm conversion I noticed a bunch of places which
> > see and then ignore errors. I only fixed one or two of them which
> > were clearly dubious. Other places in savevm.c where it seemed it
> > was probably ok to ignore errors, I've left using error_report()
> > on the basis that those are really warnings. Perhaps they could
> > be changed to warn_report() instead.
> > 
> > There are alot of patches here, but I felt it was easier to review
> > for correctness if I converted 1 function at a time. The series
> > does not neccessarily have to be reviewed/appied in 1 go.
> 
> After this series, what do my errors look like, and where do they end
> up?
> Do I get my nice backtrace shwoing that device failed, then that was
> part of that one...

It hasn't modified any of the VMStateDescription callbacks so any
of the per-device logic that was printing errors will still be using
error_report to the console as before.

The errors that have changed (at this stage) are only the higher
level ones that are in the generic part of the code. Where those
errors mentioned a device name/ID they still do.

In some of the parts I've modified there will have been multiple
error_reports collapsed into one error_setg() but the ones that
are eliminated are high level generic messages with no useful
info, so I don't think loosing those is a problem per-se.

The example that I tested was the case where we load a snapshot
under a different config that we saved it with. This is the scenario
that gave the non-deterministic ordering in the iotest you disabled
from my previous series.

In that case, we changed from:

  qemu-system-x86_64: Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices
  {"return": [{"current-progress": 1, "status": "concluded", "total-progress": 1, "type": "snapshot-load", "id": "load-err-stderr", "error": "Error -22 while loading VM state"}]}

To

  {"return": [{"current-progress": 1, "status": "concluded", "total-progress": 1, "type": "snapshot-load", "id": "load-err-stderr", "error": "Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices"}]}

From a HMP loadvm POV, this means instead of seeing

  (hmp)  loadvm foo
  Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices
  Error -22 while loading VM state

You will only see the detailed error message

  (hmp)  loadvm foo
  Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices

In this case I think loosing the "Error -22 while loading VM state"
is fine, as it didn't add value IMHO.


If we get around to converting the VMStateDescription callbacks to
take an error object, then I think we'll possibly need to stack the
error message from the callback, with the higher level message.

Do you have any familiar/good examples of error message stacking I
can look at ?  I should be able to say whether they would be impacted
by this series or not - if they are, then I hopefully only threw away
the fairly useless high level messages, like the "Error -22" message
above.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



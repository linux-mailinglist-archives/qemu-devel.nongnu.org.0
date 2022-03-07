Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059AE4CFDD4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:07:56 +0100 (CET)
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRC9b-0004Ls-2p
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRC2F-0005rK-Hr
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:00:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRC2C-0004yT-4o
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646654414;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSiEdxQMiJSApP0ixUXjjxagxieGuHwRmh3CVHziFG8=;
 b=NGf2JG1AuZm+K9FdbhcKkOFMUtdD7cE4Ccktwt+WeMMjSco1ST6Vlw7k4i5Mb1261xbypX
 ulJX4XEMYaNwIrOhtAl272Eh2E8qNUy58HXeWdmQ9W8w2lmXljgleFhP1nKsRuyBa+X3pk
 9xsZQ+m3PBJBk6/sJysoOei4mbuFAt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-B0Sd_8gnPmGr0WtXBV0Kbg-1; Mon, 07 Mar 2022 07:00:09 -0500
X-MC-Unique: B0Sd_8gnPmGr0WtXBV0Kbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2005851DC;
 Mon,  7 Mar 2022 12:00:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94BCB23781;
 Mon,  7 Mar 2022 12:00:06 +0000 (UTC)
Date: Mon, 7 Mar 2022 12:00:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: starting to look at qemu savevm performance, a first regression
 detected
Message-ID: <YiXzw8pF9If2/M7M@redhat.com>
References: <8826b03d-e5e9-0e65-cab7-ea1829f48e6c@suse.de>
 <YiXQHIWtHx5BocxK@redhat.com>
 <62ba8b1e-d641-5b10-c1b3-54b7d5a652e7@suse.de>
 <YiXVh1P4oJNuEtFM@redhat.com>
 <1f70a086-2b72-bd83-414b-476f5e6d0094@suse.de>
MIME-Version: 1.0
In-Reply-To: <1f70a086-2b72-bd83-414b-476f5e6d0094@suse.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 12:19:22PM +0100, Claudio Fontana wrote:
> On 3/7/22 10:51 AM, Daniel P. Berrangé wrote:
> > On Mon, Mar 07, 2022 at 10:44:56AM +0100, Claudio Fontana wrote:
> >> Hello Daniel,
> >>
> >> On 3/7/22 10:27 AM, Daniel P. Berrangé wrote:
> >>> On Sat, Mar 05, 2022 at 02:19:39PM +0100, Claudio Fontana wrote:
> >>>>
> >>>> Hello all,
> >>>>
> >>>> I have been looking at some reports of bad qemu savevm performance in large VMs (around 20+ Gb),
> >>>> when used in libvirt commands like:
> >>>>
> >>>>
> >>>> virsh save domain /dev/null
> >>>>
> >>>>
> >>>>
> >>>> I have written a simple test to run in a Linux centos7-minimal-2009 guest, which allocates and touches 20G mem.
> >>>>
> >>>> With any qemu version since around 2020, I am not seeing more than 580 Mb/Sec even in the most ideal of situations.
> >>>>
> >>>> This drops to around 122 Mb/sec after commit: cbde7be900d2a2279cbc4becb91d1ddd6a014def .
> >>>>
> >>>> Here is the bisection for this particular drop in throughput:
> >>>>
> >>>> commit cbde7be900d2a2279cbc4becb91d1ddd6a014def (HEAD, refs/bisect/bad)
> >>>> Author: Daniel P. Berrangé <berrange@redhat.com>
> >>>> Date:   Fri Feb 19 18:40:12 2021 +0000
> >>>>
> >>>>     migrate: remove QMP/HMP commands for speed, downtime and cache size
> >>>>     
> >>>>     The generic 'migrate_set_parameters' command handle all types of param.
> >>>>     
> >>>>     Only the QMP commands were documented in the deprecations page, but the
> >>>>     rationale for deprecating applies equally to HMP, and the replacements
> >>>>     exist. Furthermore the HMP commands are just shims to the QMP commands,
> >>>>     so removing the latter breaks the former unless they get re-implemented.
> >>>>     
> >>>>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>>>     Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> >>>
> >>> That doesn't make a whole lot of sense as a bisect result.
> >>> How reliable is that bisect end point ? Have you bisected
> >>> to that point more than once ?
> >>
> >> I did run through the bisect itself only once, so I'll double check that.
> >> The results seem to be reproducible almost to the second though, a savevm that took 35 seconds before the commit takes 2m 48 seconds after.
> >>
> >> For this test I am using libvirt v6.0.0.

I've just noticed this.  That version of libvirt is 2 years old and
doesn't have full support for migrate_set_parameters.


> 2022-03-07 10:47:20.145+0000: 134386: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7fa4380028a0 buf={"execute":"migrate_set_speed","arguments":{"value":9223372036853727232},"id":"libvirt-19"}^M
>  len=93 ret=93 errno=0
> 2022-03-07 10:47:20.146+0000: 134386: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7fa4380028a0 reply={"id": "libvirt-19", "error": {"class": "CommandNotFound", "desc": "The command migrate_set_speed has not been found"}}
> 2022-03-07 10:47:20.147+0000: 134391: error : qemuMonitorJSONCheckError:412 : internal error: unable to execute QEMU command 'migrate_set_speed': The command migrate_set_speed has not been found

We see the migrate_set_speed failing and libvirt obviously ignores that
failure.

In current libvirt migrate_set_speed is not used as it properly
handles migrate_set_parameters AFAICT.

I think you just need to upgrade libvirt if you want to use this
newer QEMU version

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



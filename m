Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3202665FD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 19:19:32 +0200 (CEST)
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGmhv-0007St-9Q
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 13:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kGmgx-0006zn-7d
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 13:18:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53681
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kGmgv-0007gg-J5
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 13:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599844708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wG/b8c0TirnKfH7WY60P5yOErYcFLhvSzQJAdHnIYYQ=;
 b=WQfHsRxJps9n1QVS1av4uEeYisUW7FC/jN9JGHBCWgrZbSyH0Vmu//hjBZ3JrAhNPIgpqU
 dxZuZvyR2Fwt3iOyYfu8X4mHGLRoK4Xh25z+L+LSkJ51FBoKzpBG9W8v/anymbKvB6k/6x
 1zRT0I65K6+l5E+9xdhhSiDeCJHxH/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-E99DHro1NXKxmdaHQfzheA-1; Fri, 11 Sep 2020 13:18:26 -0400
X-MC-Unique: E99DHro1NXKxmdaHQfzheA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 384461091063;
 Fri, 11 Sep 2020 17:18:25 +0000 (UTC)
Received: from work-vm (ovpn-113-52.ams2.redhat.com [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9718575125;
 Fri, 11 Sep 2020 17:18:11 +0000 (UTC)
Date: Fri, 11 Sep 2020 18:18:09 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V1 05/32] savevm: QMP command for cprload
Message-ID: <20200911171809.GM3310@work-vm>
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
 <1596122076-341293-6-git-send-email-steven.sistare@oracle.com>
 <654553cb-e071-0498-fe66-78ddda3942e9@redhat.com>
 <c135f2e5-10d5-81f5-7251-cead777428aa@oracle.com>
MIME-Version: 1.0
In-Reply-To: <c135f2e5-10d5-81f5-7251-cead777428aa@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 03:40:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steven Sistare (steven.sistare@oracle.com) wrote:
> On 7/30/2020 12:14 PM, Eric Blake wrote:
> > On 7/30/20 10:14 AM, Steve Sistare wrote:
> >> Provide the cprload QMP command.  The VM is created from the file produced
> >> by the cprsave command.  Guest RAM is restored in-place from the shared
> >> memory backend file, and guest block devices are used as is.  The contents
> >> of such devices must not be modified between the cprsave and cprload
> >> operations.  If the VM was running at cprsave time, then VM execution
> >> resumes.
> > 
> > Is it always wise to unconditionally resume, or might this command need an additional optional knob that says what state (paused or running) to move into?
> 
> This can already be done.  Issue a stop command before cprsave, then cprload will finish in a
> paused state.
> 
> Also, cprsave re-execs and leaves the guest in a paused state.  One can
> 
> send device add commands, then send cprload which continues
> .

You're suffering here because you're reinventing stuff rather than
reusing existing migration paths.
With the existing migration code we require the qemu
to be started with -incoming ... so we know it's in a clean
state ready for being loaded, and we've already got the -S
mechanism that dictates whether or not the VM autostarts
(regardless of the saved state in the image).  The management
layers find this pretty useful if they need to wire some networking
or storage up at the point they know they've got a VM image that's
loaded OK.

Dave

> 
> >> Syntax:
> >>    {'command':'cprload', 'data':{'file':'str'}}
> >>
> >> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >> Signed-off-by: Maran Wilson <maran.wilson@oracle.com>
> >> ---
> > 
> >> +++ b/qapi/migration.json
> >> @@ -1635,3 +1635,14 @@
> >>   ##
> >>   { 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'str' } }
> >>   +##
> >> +# @cprload:
> >> +#
> >> +# Start virtual machine from checkpoint file that was created earlier using
> >> +# the cprsave command.
> >> +#
> >> +# @file: name of checkpoint file
> >> +#
> >> +# Since 5.0
> > 
> > another 5.2 instance. I'll quit pointing it out for the rest of the series.
> 
> Will find and fix all, thanks.
> 
> - Steve
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



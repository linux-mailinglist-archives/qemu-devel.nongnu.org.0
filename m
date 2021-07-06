Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408243BCAF7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:51:29 +0200 (CEST)
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ifo-0002Cv-9t
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0iIX-0001QZ-Na
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:27:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0iIU-0008LV-9r
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625567240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIvH/MoXJgT2UsWnbpnadiya5h6CjCfDsIPCoNBpxpY=;
 b=C1+fBM87VLzRgFP6+BCVtZMS1y3kxi02EOJ5OD4gnhl0dLMIeI55do/JHnQz/MRjtNbfSC
 rvm4dN+GF2Z7QyxrB1coUrV8HRYvNfgWhOOdjKh8rd8x8kn2TH07TJoV4v4SLM4cfWGMvi
 wFWJBNB9rLrKL5LyMt/B7tLMdakOCaU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-sWZK8Fy6Ne2kGv9GYJZEPQ-1; Tue, 06 Jul 2021 06:27:19 -0400
X-MC-Unique: sWZK8Fy6Ne2kGv9GYJZEPQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n11-20020a05600c3b8bb02901ec5ef98aa0so3517495wms.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=nIvH/MoXJgT2UsWnbpnadiya5h6CjCfDsIPCoNBpxpY=;
 b=loIc+2abLrwyeMxaQTqNPHC7ZlInOyZtWLLKerY/vx+fCGfh5q5G5NhFYrbBvrBEO/
 xz6/HD/LY/YphCjapRlSzD0aVJHxS9014n4Q1R4pLoTMUD9pSwENVZSoNnkpFcyvnSNj
 hKTcq0I2b31l5SPFnVSpLrizsOr7OlrErnsKa6Djfv4Q3ifg40GX478nHlSEBITL+Wo1
 FCZPd0AJZqx42iU9U6ztDTOde0iWqxK79xLVsEI4UuNXhbIV8clqZACjMQw6LqTkkEnx
 6eznbQIYMZucNaKsmkhV1vA+1aBEdUng3QBOz38eGi+SkP6c2SPWWFEqY1HFCkoWCxYX
 5UNA==
X-Gm-Message-State: AOAM533uy6l46lvP8iuu5E1hsypYJPEDnzqW3uE58NHKz5m7CmCr8fK+
 xVnK6xiYvWSmKeucM9PIc56XOyRfd+gaUkBGWzQbZm1dXk+8+xC/C2dViUyFebUfJ9c3MtpgrXb
 cnxtsGm/UnrDC6Xo=
X-Received: by 2002:a5d:5742:: with SMTP id q2mr20370164wrw.256.1625567238451; 
 Tue, 06 Jul 2021 03:27:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHd6OZrBgxTE2W6EBHdF8XDXdW2Dns4VgR6HlVM11JQ1Nx4yijUOZpoBGSUxpEYRV+DKEL0w==
X-Received: by 2002:a5d:5742:: with SMTP id q2mr20370133wrw.256.1625567238244; 
 Tue, 06 Jul 2021 03:27:18 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id g15sm15973970wrs.50.2021.07.06.03.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:27:17 -0700 (PDT)
Date: Tue, 6 Jul 2021 11:27:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH 1/2] qapi/run-state: Add a new shutdown cause
 'migration-completed'
Message-ID: <YOQwA27sg5SOQspC@work-vm>
References: <20210705123653.1315-1-jiangkunkun@huawei.com>
 <20210705123653.1315-2-jiangkunkun@huawei.com>
 <YOL/kw0lxn2ggGx4@redhat.com>
 <7b8324e9-85d8-1b14-4e63-308ea2563d56@huawei.com>
MIME-Version: 1.0
In-Reply-To: <7b8324e9-85d8-1b14-4e63-308ea2563d56@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kunkun Jiang (jiangkunkun@huawei.com) wrote:
> Hi Daniel,
> 
> On 2021/7/5 20:48, Daniel P. Berrangé wrote:
> > On Mon, Jul 05, 2021 at 08:36:52PM +0800, Kunkun Jiang wrote:
> > > In the current version, the source QEMU process does not automatic
> > > exit after a successful migration. Additional action is required,
> > > such as sending { "execute": "quit" } or ctrl+c. For simplify, add
> > > a new shutdown cause 'migration-completed' to exit the source QEMU
> > > process after a successful migration.
> > IIUC, 'STATUS_COMPLETED' state is entered on the source host
> > once it has finished sending all VM state, and thus does not
> > guarantee that the target host has successfully received and
> > loaded all VM state.
> Thanks for your reply.
> 
> If the target host doesn't successfully receive and load all VM state,
> we can send { "execute": "cont" } to resume the soruce in time to
> ensure that VM will not lost?

Yes, that's pretty common at the moment;  the failed migration can
happen at lots of different points:
  a) The last part of the actual migration stream/loading the devices
    - that's pretty easy, since the destination hasn't actually got
    the full migration stream.

  b) If the migration itself completes, but then the management system
    then tries to reconfigure the networking/storage on the destination,
    and something goes wrong in that, then it can roll that back and
    cont on the source.

So, it's a pretty common type of failure/recovery  - the management
application has to be a bit careful not to do anything destructive
until as late as possible, so it knows it can switch back.

> > Typically a mgmt app will need to directly confirm that the
> > target host QEMU has succesfully started running, before it
> > will tell the source QEMU to quit.
> 'a mgmt app', such as libvirt?

Yes, it's currently libvirt that does that; but any of the control
things could (it's just libvirt has been going long enough so it knows
about lots and lots of nasty cases of migration failure, and recovering
properly).

Can you explain why did you want to get the source to automatically
quit?  In a real setup where does it help?

Dave


> Thanks,
> Kunkun Jiang
> > So, AFAICT, this automatic exit after STATUS_COMPLETED is
> > not safe and could lead to total loss of the running VM in
> > error scenarios.
> > 
> > 
> > 
> > > Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> > > ---
> > >   migration/migration.c | 1 +
> > >   qapi/run-state.json   | 4 +++-
> > >   2 files changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index 4228635d18..16782c93c2 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -3539,6 +3539,7 @@ static void migration_iteration_finish(MigrationState *s)
> > >       case MIGRATION_STATUS_COMPLETED:
> > >           migration_calculate_complete(s);
> > >           runstate_set(RUN_STATE_POSTMIGRATE);
> > > +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_MIGRATION_COMPLETED);
> > >           break;
> > >       case MIGRATION_STATUS_ACTIVE:
> > > diff --git a/qapi/run-state.json b/qapi/run-state.json
> > > index 43d66d700f..66aaef4e2b 100644
> > > --- a/qapi/run-state.json
> > > +++ b/qapi/run-state.json
> > > @@ -86,12 +86,14 @@
> > >   #                   ignores --no-reboot. This is useful for sanitizing
> > >   #                   hypercalls on s390 that are used during kexec/kdump/boot
> > >   #
> > > +# @migration-completed: Reaction to the successful migration
> > > +#
> > >   ##
> > >   { 'enum': 'ShutdownCause',
> > >     # Beware, shutdown_caused_by_guest() depends on enumeration order
> > >     'data': [ 'none', 'host-error', 'host-qmp-quit', 'host-qmp-system-reset',
> > >               'host-signal', 'host-ui', 'guest-shutdown', 'guest-reset',
> > > -            'guest-panic', 'subsystem-reset'] }
> > > +            'guest-panic', 'subsystem-reset', 'migration-completed'] }
> > >   ##
> > >   # @StatusInfo:
> > > -- 
> > > 2.23.0
> > > 
> > > 
> > Regards,
> > Daniel
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



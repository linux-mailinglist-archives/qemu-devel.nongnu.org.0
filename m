Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5234D391C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 19:46:32 +0100 (CET)
Received: from localhost ([::1]:56630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1KR-0008ER-Nv
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 13:46:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nS1Ei-0006DM-9V
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:40:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nS1Ec-0008J5-PI
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646851230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VuTV0vDnwsYjLKTe6NfNr8NVAVxllktAzg40zB75GzI=;
 b=enMfojWwqLqstpIQ/0iLYakOzNh0G8lkNX1h10dJGyVhhONnOuj8VWagjDixM81HxN4DKK
 64f/FNwf3C6EEv2nb49xY766Lbtm5gX4LIX/6rm6j2MkKrIpQRMVt62I+WzvveVR3Oi0cr
 3mCewTPBnLSDryWchlpoVDx6CQ99fKU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-K6-drzOCMVuJO2XI1otJBA-1; Wed, 09 Mar 2022 13:39:48 -0500
X-MC-Unique: K6-drzOCMVuJO2XI1otJBA-1
Received: by mail-wr1-f71.google.com with SMTP id
 z16-20020adff1d0000000b001ef7dc78b23so1036900wro.12
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 10:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VuTV0vDnwsYjLKTe6NfNr8NVAVxllktAzg40zB75GzI=;
 b=sdk7ls/YxNSHN/duJtfiix/esJDgD0U/5F+KutUcoHfkbqja70HI0QILeKM9FMh7yk
 ZdzlVDprMhPhRo7+Otp9ISIJJEZBugVVUeCmeDniDSnJQo4xVjiLvvq5rbVoFSOPEp1W
 wXd+QLSRGcHWlQlbI7ZtjeZmCkppLhky6nhZfBmeJL0EAC97mXBdd5BcUtcSMfgeRwGr
 yCBttCRfGPmgVYprvgqWYh+Cl0YhrDg/IRYKfAFmqV2x8NfcZUIBzfTNRvJCZekYxIlO
 /SCRHnkmQU/G9EtTRMhMDMLJ3/A3yL04CeXTeuODnuAhR4Yky5YOFus80jjmBwaeZwR8
 e98g==
X-Gm-Message-State: AOAM533EAA7wrF9tjOGPCZvuVDfykUhBE5d7MYZuNMYMCtfC7rlFTv/k
 nguzpAFho8hRg88GHwIsc5CzSeX4OKunI8YexNSTaE/YAJkhta7v0e76Vot/rrLg4Z4WF4DktjO
 1bARMNqPz+LlusPk=
X-Received: by 2002:a05:600c:42c1:b0:389:8310:1128 with SMTP id
 j1-20020a05600c42c100b0038983101128mr591954wme.3.1646851187247; 
 Wed, 09 Mar 2022 10:39:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwdOoxf1Z1bTZhEVuYi8Uztjf8Yp/qg+SvTo0clRENItjPSaDw68ogr8mRTPAWz/l9ezRy5A==
X-Received: by 2002:a05:600c:42c1:b0:389:8310:1128 with SMTP id
 j1-20020a05600c42c100b0038983101128mr591933wme.3.1646851186993; 
 Wed, 09 Mar 2022 10:39:46 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm5961322wmr.8.2022.03.09.10.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 10:39:46 -0800 (PST)
Date: Wed, 9 Mar 2022 18:39:44 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: bad virsh save /dev/null performance (600 MiB/s max)
Message-ID: <Yij0cJ3ioN6aiKgA@work-vm>
References: <5f318297-51c0-366b-758b-733ba27684ba@suse.de>
 <YiX4gfBtgDq/uZpu@redhat.com>
 <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
 <YiX6XSlVNw183PTV@work-vm>
 <51b486fc-2c71-e1c6-6412-d462234d67fb@suse.de>
 <YiiS9HnS0LsiY2Hb@work-vm> <YiiU2gCbnJOgpZxp@redhat.com>
 <700779ea-4274-7872-6022-d32457a00160@suse.de>
 <47786b29-b1a2-1f6a-568d-b61398e0f641@suse.de>
 <Yijz9hzJFJoMo7vE@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yijz9hzJFJoMo7vE@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: Jim Fehlig <jfehlig@suse.com>, Juan Quintela <quintela@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Mar 09, 2022 at 07:27:12PM +0100, Claudio Fontana wrote:
> > 
> > One difference I could see looking at the qmp commands issued by libvirt in the "virsh save" case,
> > is "detach:true" in the migration command (which seems to have no effect in qemu),
> 
> That is a bug in libvirt - it should not be setting that in QMP.
> 
> To quote the QAPI spec for 'migrate'
> 
>   # @detach: this argument exists only for compatibility reasons and
>   #          is ignored by QEMU
> 
> 
> > 
> > 
> > and maybe more interestingly this stuff about the "fd":
> > 
> > 
> > 2022-03-09 17:29:34.247+0000: 20390: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7faa9003ebf0 msg={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-390"}^M
> >  fd=34
> > 2022-03-09 17:29:34.247+0000: 20387: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7faa9003ebf0 buf={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-390"}^M
> >  len=73 ret=73 errno=0
> > 2022-03-09 17:29:34.247+0000: 20387: info : qemuMonitorIOWrite:457 : QEMU_MONITOR_IO_SEND_FD: mon=0x7faa9003ebf0 fd=34 ret=73 errno=0
> > 2022-03-09 17:29:34.248+0000: 20387: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7faa9003ebf0 reply={"return": {}, "id": "libvirt-390"}
> > 2022-03-09 17:29:34.249+0000: 20390: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7faa9003ebf0 msg={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-391"}^M
> >  fd=-1
> > 2022-03-09 17:29:34.249+0000: 20387: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7faa9003ebf0 buf={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-391"}^M
> >  len=113 ret=113 errno=0
> > 
> > 
> > in qemu I am currently looking at the code in migration/socket.c
> > vs the code in migration/fd.c , wonder if the difference would
> > stem from there..
> 
> When saving to a file, libvirt passes in a pre-opened FD for
> QEU to use. IIRC this should always be a pipe FD connected to
> libvirt's iohelper program, sometimes indirectly via a compression
> program.

In which case, what is a simple 'top' showing on the system?

Dave

> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



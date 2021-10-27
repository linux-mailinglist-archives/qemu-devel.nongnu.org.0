Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF23243C587
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:50:53 +0200 (CEST)
Received: from localhost ([::1]:47466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfee4-0006cr-Ac
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfeYh-0002FC-DY
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:45:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfeYW-0003j0-UQ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635324304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=obbha5kqgzDPVtkCGfRRsF1Asrt2XmEA1EVvLtNMDQY=;
 b=UxM+VhXvnl28y1kwGKSwCSn8fpKkI2pxeHDi/AspvJCKZejwgpZiRdlB+JK5owN+BBs1+p
 jmbCCEDESPBBlxdNDivkihz/pJtV8O898fOFHgooKXukfD/lFjwGJWS+WcryLJ7FtUfhOL
 vwVlGyFnPtI+KY6OLoZ6ElLfkm1TEzo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-JqPJQ1LsMJqdUzfRgus1Ng-1; Wed, 27 Oct 2021 04:45:01 -0400
X-MC-Unique: JqPJQ1LsMJqdUzfRgus1Ng-1
Received: by mail-wr1-f72.google.com with SMTP id
 s9-20020adfecc9000000b001726822ce9fso219740wro.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 01:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=obbha5kqgzDPVtkCGfRRsF1Asrt2XmEA1EVvLtNMDQY=;
 b=BKI9WkIu/ltlHnwbW9hCdK8UVqrRcgWVKPvHdl5TjOWXuxrJdnm39E8bPhxE8IJUT/
 847sOODKovFLUfSNj0t6TzYIflmcjYAq96rzV7/Qu8jswMMxmsYNxDzDGlHMeILCkD3s
 /j4t+evY6Odbb3222KQyiA5JHBPyzQEyiEWH/MhEwqGN/4Tq2rpsgAL9rcs9pA7aIi7l
 ykVko66x6LktpNsinNCKuLUPtKnTaqzzyU0Ni3vpRTxTkP1CSLseigc727hNRY+q7rm6
 FFLFOYH+QGKpfiCgaqLpl4p+K12o3L4RhOeS89WQDl1OT/s7Ef40xUqXcMPkJCLQdlPN
 jhyg==
X-Gm-Message-State: AOAM532J8V1BRMpNpt78+ghgKen1Ix8dvaigFvmk9yCCdxrvAmxaoR/a
 ymiifrH3wr3uuig445uE9rFO1lxQ4psmu/DAZjrVuFnmb3Yg4+V/vEONrOso/QRkh+NEAFOJIyQ
 QzDvRqxvQkBSG7Ow=
X-Received: by 2002:a1c:7911:: with SMTP id l17mr4423266wme.138.1635324300401; 
 Wed, 27 Oct 2021 01:45:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRjTarAK33qi7U7IdsCfxjDSyV2x+pUWJBz/qg5GeBKYn6QxO0AoTGt6yBZRQ0aq6J6wD07g==
X-Received: by 2002:a1c:7911:: with SMTP id l17mr4423243wme.138.1635324300232; 
 Wed, 27 Oct 2021 01:45:00 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id l2sm2962848wmc.3.2021.10.27.01.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 01:44:59 -0700 (PDT)
Date: Wed, 27 Oct 2021 09:44:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
Message-ID: <YXkRiQUWZabW/nuY@work-vm>
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <87k0i6d5l5.fsf@dusky.pond.sub.org> <YXfV4vf5+YLFXYbA@work-vm>
 <87mtmwja2a.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87mtmwja2a.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Stefan Reiter <s.reiter@proxmox.com>, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> 
> > * Markus Armbruster (armbru@redhat.com) wrote:
> >> I'm done reviewing.  David, care to have another look at the HMP part?
> >
> > Yep, looking good to me - is that going via qmp, hmp, or vnc ?
> 
> Either is fine with me.
> 
> David, Gerd, do you have anything queued up already?

No I've also got nothing else at th emoment.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



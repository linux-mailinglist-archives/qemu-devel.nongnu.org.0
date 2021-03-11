Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F0E337328
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:56:15 +0100 (CET)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKrO-0006P5-I2
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKm7-0001pC-Ap
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:50:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKm4-0007g7-1x
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615467043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64sb0FR/qvTm1FUfBIDACbYwJoxObAJb4OctQ7tBR6I=;
 b=FGdZolcX3bqQIu/9hehFl/7UDM1xBrYF8kJQejV5kLOA5YCO9QKE2iTDxPtIq5B/VY1J+T
 jLUtTIyQImUwqCwCFzl9afm8tbYraaSnRSX9zQkSdER67HoOzDrALl6foQwwWyg9qeF3mg
 mSit0zLbzdO2lLEYE9dzptJGTg7cgI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-KeUM0yk6NEGVdv6hVtN4iw-1; Thu, 11 Mar 2021 07:50:41 -0500
X-MC-Unique: KeUM0yk6NEGVdv6hVtN4iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F88C800D55;
 Thu, 11 Mar 2021 12:50:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDEB010016FD;
 Thu, 11 Mar 2021 12:50:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 44180180087E; Thu, 11 Mar 2021 13:50:38 +0100 (CET)
Date: Thu, 11 Mar 2021 13:50:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 2/2] coreaudio: Handle output device change
Message-ID: <20210311125038.fdtnnpiskl62nxko@sirius.home.kraxel.org>
References: <20210301114554.9430-1-akihiko.odaki@gmail.com>
 <20210301114554.9430-2-akihiko.odaki@gmail.com>
 <20210303092700.xnvsdzn7ykpzkvvu@sirius.home.kraxel.org>
 <CAMVc7JXtmowah7f8DyW3_hgze6622_zF5dVeAE8mXu4sGMenoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JXtmowah7f8DyW3_hgze6622_zF5dVeAE8mXu4sGMenoQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 10:20:20PM +0900, Akihiko Odaki wrote:
> 2021年3月3日(水) 18:27 Gerd Hoffmann <kraxel@redhat.com>:
> >
> >   Hi,
> >
> > >      status = coreaudio_get_voice(&core->outputDeviceID);
> > >      if (status != kAudioHardwareNoError) {
> > > -        coreaudio_logerr2 (status, typ,
> > > -                           "Could not get default output Device\n");
> > > -        return -1;
> > > +        coreaudio_playback_logerr (status,
> > > +                                   "Could not get default output Device\n");
> > > +        return status;
> >
> > This "pass status code to caller" change can and should be splitted to a
> > separate patch.
> >
> > Likewise with the logging changes.
> >
> > That makes the patch with the actual functional change to deal with the
> > device changes smaller and easier to review.
> >
> > thanks,
> >   Gerd
> >
> 
> Actually the code was extracted from coreaudio_init_out to
> init_out_device in this patch.

It is likewise good practice to handle such refactorings as separate
patch, i.e. have a patch which reorganizes the code (in this case move
code to the new init_out_device() function) without functional change,
then go add the new handle_voice_change which fixes the actual issue
in the next patch.  Finally send the two (or more) changes as patch
series.

take care,
  Gerd



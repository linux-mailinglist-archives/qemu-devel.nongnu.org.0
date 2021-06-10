Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4473A248C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:33:42 +0200 (CEST)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEG5-0001Xh-SR
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrEEn-0000rV-Dk
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrEEk-0002zT-8t
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623306736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=57DeSckaV8goNshj2i242foXZ0PRtEbSwYubX1AqMe8=;
 b=FLE2yppL3NRUQHI3DvwlbScefozzUj5bVXmrWhvHlC8F/my954nXEbIs5ZY7JLPwwfPMLY
 gJOLF4Mu8pY3OlAMIBB1MWmGQPRiuJJZW0EKYIt4usUDvcC7OwOMAkzvRZ9NIXfdk/VySk
 f8vK+SA2JvgYs+Y/ftoy5buAS65l+j8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-tCmAtuoHPqafTGYztXOrQQ-1; Thu, 10 Jun 2021 02:32:14 -0400
X-MC-Unique: tCmAtuoHPqafTGYztXOrQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 819BA10C1ADC
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:32:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C74D118A9E;
 Thu, 10 Jun 2021 06:32:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 296C218000B2; Thu, 10 Jun 2021 08:32:05 +0200 (CEST)
Date: Thu, 10 Jun 2021 08:32:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 00/13] [RfC] fix tracing for modules
Message-ID: <20210610063205.aabxmgionkj7ae7p@sirius.home.kraxel.org>
References: <20210601132414.432430-1-kraxel@redhat.com>
 <YMDaxBVivnksvA/7@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YMDaxBVivnksvA/7@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 04:14:12PM +0100, Stefan Hajnoczi wrote:
> On Tue, Jun 01, 2021 at 03:24:01PM +0200, Gerd Hoffmann wrote:
> > First version that actually works.  Only qxl covered for this RfC,
> > other modules will follow once the basics are hashed out.
> > 
> > v4:
> >  - rebase to latest master.
> >  - fix systemtap tracing.
> >  - also cover virtio-gpu modules.
> >  - pick up some review tags.
> >  - misc minor tweaks.
> > 
> > v3:
> >  - handle initialization of modular tracepoints.
> > 
> > TODO:
> > Enabling modular tracepoints via -trace cmd line doesn't work yet.
> > Guess we need to store the list somewhere for later re-processing.
> > Error handling is tricky, specifically the "tracepoint doesn't exist"
> > error.  Suggestions / ideas are welcome.
> 
> Excellent! I think we discussed these TODOs in the past. Can we merge
> this series in close to its current form or does it degrade the tracing
> experience (e.g. does the -trace command-line no longer work for
> trace-events files that were split off into modules)?

Main focus for v4 was to make stap work.
The cmd line issue is still there.

Patches 1-5 can be cherry-picked without breaking something.

take care,
  Gerd



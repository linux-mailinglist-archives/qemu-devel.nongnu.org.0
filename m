Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C123B3C2227
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 12:22:32 +0200 (CEST)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1neQ-0008VZ-Dz
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 06:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1ndN-0007Y3-RI
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 06:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1ndK-0005pT-TK
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 06:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625826081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ZvMpJcWB1tU1qiFHSMbq+EbvuSTC6dw+HjPcewkCE8=;
 b=CVOBqeBeW9yaK7Pezr6Y3xVuOg+pf6pFEkcpQr7MTEJ5kYKTMSiBDjNeJxn3onsJhSIsdo
 zzuVT/s1zdW/jaYJBJP0PT/nZiAmAWVPah2T17Ww5oeBiy+FcslGkT78+qHikfhuKhD+uT
 asAUBrrNcLk9KVOFVrIbpvAH58LghSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-L2Czgdn4MJ-2jljgVKfPxA-1; Fri, 09 Jul 2021 06:21:20 -0400
X-MC-Unique: L2Czgdn4MJ-2jljgVKfPxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A0FF100C661;
 Fri,  9 Jul 2021 10:21:19 +0000 (UTC)
Received: from redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 077CC5D9C6;
 Fri,  9 Jul 2021 10:21:14 +0000 (UTC)
Date: Fri, 9 Jul 2021 12:21:09 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
Message-ID: <YOgjFRNxUH2GUXyN@redhat.com>
References: <YObtGbd5jlQNUbn0@redhat.com>
 <77F23D4A-18B3-4367-9D4E-9710FA6269B2@kamp.de>
MIME-Version: 1.0
In-Reply-To: <77F23D4A-18B3-4367-9D4E-9710FA6269B2@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block <qemu-block@nongnu.org>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.07.2021 um 20:23 hat Peter Lieven geschrieben:
> Am 08.07.2021 um 14:18 schrieb Kevin Wolf <kwolf@redhat.com>:
> > Am 07.07.2021 um 20:13 hat Peter Lieven geschrieben:
> >>> Am 06.07.2021 um 17:25 schrieb Kevin Wolf <kwolf@redhat.com>:
> >>> Am 06.07.2021 um 16:55 hat Peter Lieven geschrieben:
> >>>> I will have a decent look after my vacation.
> >>> 
> >>> Sounds good, thanks. Enjoy your vacation!
> >> 
> >> As I had to fire up my laptop to look into another issue anyway, I
> >> have sent two patches for updating MAINTAINERS and to fix the int vs.
> >> bool mix for task->complete.
> > 
> > I think you need to reevaluate your definition of vacation. ;-)
> 
> Lets talk about this when the kids are grown up. Sometimes sending
> patches can be quite relaxing :-)

Heh, fair enough. :-)

> > But thanks anyway.
> > 
> >> As Paolos fix (5f50be9b5) is relatively new and there are maybe other
> >> non obvious problems when removing the BH indirection and we are close
> >> to soft freeze I would leave the BH removal change for 6.2.
> > 
> > Sure, code cleanups aren't urgent.
> 
> Isn’t the indirection also a slight performance drop?

Yeah, I guess technically it is, though I doubt it's measurable.

Kevin



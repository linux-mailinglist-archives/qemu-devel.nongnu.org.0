Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F94365298
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 08:51:48 +0200 (CEST)
Received: from localhost ([::1]:35552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkEd-0002AY-Cb
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 02:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lYkDI-0001de-JD
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 02:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lYkDE-0002Ec-GD
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 02:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618901419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c2E7dHzBE/IS/SrBdzAAKlk9dHTx3DVbfB77qjD8QZo=;
 b=LPztrvq6oNKH8BfiVrpiiLsrrzq8LmABtOF5LNOsNbRc7zxYvrCCYqUHcITgQ34i2teYzK
 CI3p6oxAgPc4nY+VXHgs6lqICetNTGKaRxKua/KaEgbTBeZuB6/o40pL/t0JyD+BJARVvy
 0SRfQytoNLQfqLNxazcPbranJCylwRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-FBXPCxXiO0-0jLwAf9xQyw-1; Tue, 20 Apr 2021 02:50:01 -0400
X-MC-Unique: FBXPCxXiO0-0jLwAf9xQyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 887D787A826;
 Tue, 20 Apr 2021 06:50:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-62.ams2.redhat.com [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D15A60C5F;
 Tue, 20 Apr 2021 06:49:59 +0000 (UTC)
Date: Tue, 20 Apr 2021 08:49:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [RFC PATCH 0/2] qemu-img convert: Fix sparseness detection
Message-ID: <YH55lVoBm49Kfkmq@merkur.fritz.box>
References: <YH14BcdHL3swf9Q2@merkur.fritz.box>
 <A540D5C1-F0D5-4D82-B048-11BDB550D346@kamp.de>
MIME-Version: 1.0
In-Reply-To: <A540D5C1-F0D5-4D82-B048-11BDB550D346@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: qemu-devel@nongnu.org, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.04.2021 um 19:12 hat Peter Lieven geschrieben:
> 
> 
> Von meinem iPhone gesendet
> 
> > Am 19.04.2021 um 14:31 schrieb Kevin Wolf <kwolf@redhat.com>:
> > 
> > ﻿Am 19.04.2021 um 11:13 hat Peter Lieven geschrieben:
> >> 
> >> 
> >>>> Am 19.04.2021 um 10:36 schrieb Peter Lieven <pl@kamp.de>:
> >>> 
> >>> 
> >>> 
> >>>> Am 15.04.2021 um 17:22 schrieb Kevin Wolf <kwolf@redhat.com>:
> >>>> 
> >>>> Peter, three years ago you changed 'qemu-img convert' to sacrifice some
> >>>> sparsification in order to get aligned requests on the target image. At
> >>>> the time, I thought the impact would be small, but it turns out that
> >>>> this can end up wasting gigabytes of storagee (like converting a fully
> >>>> zeroed 10 GB image taking 2.8 GB instead of a few kilobytes).
> >>>> 
> >>>> https://bugzilla.redhat.com/show_bug.cgi?id=1882917
> >>>> 
> >>>> I'm not entirely sure how to attack this best since this is a tradeoff,
> >>>> but maybe the approach in this series is still good enough for the case
> >>>> that you wanted to fix back then?
> >>>> 
> >>>> Of course, it would be possible to have a more complete fix like looking
> >>>> forward a few blocks more before writing data, but that would probably
> >>>> not be entirely trivial because you would have to merge blocks with ZERO
> >>>> block status with DATA blocks that contain only zeros. I'm not sure if
> >>>> it's worth this complication of the code.
> >>> 
> >>> I will try to look into this asap.
> >> 
> >> Besides from the reproducer described in the ticket, I retried my old
> >> conversion test in our environment:
> >> 
> >> Before commit 8dcd3c9b91: reads 4608 writes 14959
> >> After commit 8dcd3c9b91: reads 0 writes 14924
> >> With Kevins patch: reads 110 writes 14924
> >> 
> >> I think this is a good result if it avoids other issues.
> > 
> > Sounds like a promising way to make the tradeoff. Thanks for testing!
> 
> is this sth for 6.0-rc4?

No, certainly not. It would be for the first 6.1 pull request.

Kevin



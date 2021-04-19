Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ACF364063
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 13:24:28 +0200 (CEST)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYS0w-00081A-M3
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 07:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lYRzO-0007O3-No
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 07:22:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lYRzM-0003iR-HQ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 07:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618831367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4mISCfEW17AiuN5x9TyWLJaZ7ZVztBpBxGnRjW9Rtws=;
 b=cWA74Lnx3RVLLnIS0qrERV6vaWTwAh9GDMF/eSQwoCwxhMyi5ujlYSeCCRcFXG6qz3O0yQ
 +8b+BcyNk1aZsavO8CQs2wBT0y05E+wJv7cXgbnZjdEmEGGEgEd93Ko0nUV+lHUa6wy/hJ
 VKmphkg+HHfgybxiMrozazQPq5xIzRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-qZSd-_BXOt2W047dfLuasA-1; Mon, 19 Apr 2021 07:22:45 -0400
X-MC-Unique: qZSd-_BXOt2W047dfLuasA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A55A593BA;
 Mon, 19 Apr 2021 11:22:44 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-122.ams2.redhat.com [10.36.114.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A67A9CA0;
 Mon, 19 Apr 2021 11:22:42 +0000 (UTC)
Date: Mon, 19 Apr 2021 13:22:41 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [RFC PATCH 0/2] qemu-img convert: Fix sparseness detection
Message-ID: <YH1oAc1gE1BYvtzf@merkur.fritz.box>
References: <20210415152214.279844-1-kwolf@redhat.com>
 <07747AB5-5BCE-49EE-A3AB-03AA7B6211F8@kamp.de>
MIME-Version: 1.0
In-Reply-To: <07747AB5-5BCE-49EE-A3AB-03AA7B6211F8@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.04.2021 um 10:36 hat Peter Lieven geschrieben:
> 
> 
> > Am 15.04.2021 um 17:22 schrieb Kevin Wolf <kwolf@redhat.com>:
> > 
> > Peter, three years ago you changed 'qemu-img convert' to sacrifice some
> > sparsification in order to get aligned requests on the target image. At
> > the time, I thought the impact would be small, but it turns out that
> > this can end up wasting gigabytes of storagee (like converting a fully
> > zeroed 10 GB image taking 2.8 GB instead of a few kilobytes).
> > 
> > https://bugzilla.redhat.com/show_bug.cgi?id=1882917
> > 
> > I'm not entirely sure how to attack this best since this is a tradeoff,
> > but maybe the approach in this series is still good enough for the case
> > that you wanted to fix back then?
> > 
> > Of course, it would be possible to have a more complete fix like looking
> > forward a few blocks more before writing data, but that would probably
> > not be entirely trivial because you would have to merge blocks with ZERO
> > block status with DATA blocks that contain only zeros. I'm not sure if
> > it's worth this complication of the code.
> 
> I will try to look into this asap.
> 
> Is there a hint which FS I need to set the extent hint when creating
> the raw image? I was not able to do that.

Grepping the current kernel source, it seems extent size hints still
work only on XFS. But I don't think it's necessary for reproducing this
bug. In fact, disabling the extent size hint should cause a lot more
fragmentation, which should make the problem more visible.

Kevin



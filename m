Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB4731CEDD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:19:59 +0100 (CET)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC410-0002zk-32
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lC3WP-00007o-AG
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:48:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lC3WL-0007g2-G9
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613494095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kL/uBK09q6xWj4/bfhTcoa4DVJCMJU+nmRGhYmy1N2s=;
 b=Dzy0ZKd6cGgTDWr9cWvLM6A81wDLYPLIHweKKWByjStAUzC1HMmfJ7eR76I5PXNqLqP29C
 0Hwb6RDlNmytS6IOI7aVsNcmIv0JJh54XDxFD+oFTpMky7AOc8R6zRyzDenPhVt+3KQnPe
 c+tsmptPxtPttQThxvxBLmKrxp+vyBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-6q3nd4YLOlSS2n0iFUWWsQ-1; Tue, 16 Feb 2021 11:48:11 -0500
X-MC-Unique: 6q3nd4YLOlSS2n0iFUWWsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 675BB107ACC7;
 Tue, 16 Feb 2021 16:48:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-159.ams2.redhat.com [10.36.113.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F00C71981B;
 Tue, 16 Feb 2021 16:48:08 +0000 (UTC)
Date: Tue, 16 Feb 2021 17:48:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [RFC PATCH v2 0/4] Allow changing bs->file on reopen
Message-ID: <20210216164807.GC5282@merkur.fritz.box>
References: <cover.1612809837.git.berto@igalia.com>
 <20210210172657.GJ5144@merkur.fritz.box>
 <w514kic2cmf.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
In-Reply-To: <w514kic2cmf.fsf@maestria.local.igalia.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, pkrempa@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.02.2021 um 17:36 hat Alberto Garcia geschrieben:
> On Wed 10 Feb 2021 06:26:57 PM CET, Kevin Wolf wrote:
> 
> > You have a test case for adding a throttling filter. Can we also
> > remove it again or is there still a problem with that? I seem to
> > remember that that was a bit trickier, though I'm not sure what it
> > was. Was it that we can't have the throttle node without a file, so it
> > would possibly still have permission conflicts?
> 
> There is no problem with removing the filter anymore. See here for a
> description of the original problem:
> 
> https://lists.gnu.org/archive/html/qemu-block/2020-12/msg00090.html

Ah, nice. Can we just add removing the filter again to the test then?

> But this series is based on Vladimir's branch ("update graph permissions
> update") which reworks how the permissions are calculated on reopen and
> solves the issue.

Yes, I'm aware of this. I still hope we can get a stable blockdev-reopen
for 6.0.

Kevin



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCA631CF9F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:53:00 +0100 (CET)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC4Wx-0003UC-Po
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lC4VO-0002ug-0k
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:51:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lC4VI-00038T-3r
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613497874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+tyxUS8yK/U/81cDPBP0ohl6NmXuvQnnSkeMxFUH7xQ=;
 b=fj2tBizO1V0ETXyqNB4oxd7hBiSzRK5npywPKHJHUQxrwLy1To8YBqkXP3nyvpc90h1/vU
 lZW5y7fRYz2fO92kC/VoiCgt6OaOsrxhYN0VoPftN0wATu7xG+68/s1YkHN4UxLiGuxyTV
 2WC4dHPTIybR8LMIMBG+2g6B4krzmyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-aHPrGPS3Oz-7zCL4fK70sw-1; Tue, 16 Feb 2021 12:51:12 -0500
X-MC-Unique: aHPrGPS3Oz-7zCL4fK70sw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3CE26DD24;
 Tue, 16 Feb 2021 17:51:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-159.ams2.redhat.com [10.36.113.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4019819D6C;
 Tue, 16 Feb 2021 17:51:07 +0000 (UTC)
Date: Tue, 16 Feb 2021 18:51:06 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [RFC PATCH v2 0/4] Allow changing bs->file on reopen
Message-ID: <20210216175106.GD5282@merkur.fritz.box>
References: <cover.1612809837.git.berto@igalia.com>
 <20210210172657.GJ5144@merkur.fritz.box>
 <w514kic2cmf.fsf@maestria.local.igalia.com>
 <20210216164807.GC5282@merkur.fritz.box>
 <w511rdf3oxp.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
In-Reply-To: <w511rdf3oxp.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, pkrempa@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.02.2021 um 18:25 hat Alberto Garcia geschrieben:
> On Tue 16 Feb 2021 05:48:07 PM CET, Kevin Wolf wrote:
> 
> >> There is no problem with removing the filter anymore. See here for a
> >> description of the original problem:
> >> 
> >> https://lists.gnu.org/archive/html/qemu-block/2020-12/msg00090.html
> >
> > Ah, nice. Can we just add removing the filter again to the test then?
> 
> That is already in this series, see patch #2.

Oh, indeed. I missed the second reopen, probably expected the code to be
longer than that. :-)

Kevin



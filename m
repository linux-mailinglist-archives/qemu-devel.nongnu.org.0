Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6604544C034
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 12:37:29 +0100 (CET)
Received: from localhost ([::1]:42770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkluy-0008I5-IP
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 06:37:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mklu0-0007RC-6l
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:36:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mkltw-0007zW-J8
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636544183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=77WUx4roxViNtrFIQRMtwmiMrPZhVAvV6MXWqt0uh0I=;
 b=fdjfDf9JWrU12wq34SE5250szr/kEOyiM5xcWpHPOT44ojDchXqXbscPBLCPvswAqOe9zf
 2RhPSVz1plamigx1e2HD+/i20gZSI7lB7T4FQgs6viQ+gEDHRD+vaLKrieieNzlcutR+zL
 7z3JJWHPMUmgx3CvH7KFxYWU4wu+r7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-ZZbEqrqiN7af5IFRHYMylg-1; Wed, 10 Nov 2021 06:36:20 -0500
X-MC-Unique: ZZbEqrqiN7af5IFRHYMylg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4056A19067E6;
 Wed, 10 Nov 2021 11:36:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 202CD5D9DE;
 Wed, 10 Nov 2021 11:36:17 +0000 (UTC)
Date: Wed, 10 Nov 2021 12:36:16 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: qemu-img.c possibly overflowing shifts by BDRV_SECTOR_BITS
Message-ID: <YYuusGM1Nn7Dhpv9@redhat.com>
References: <CAFEAcA_LUNY7NRt=vDeoHDgaeBYZTzVEx8i8Ce_KopE8Z4_WpQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_LUNY7NRt=vDeoHDgaeBYZTzVEx8i8Ce_KopE8Z4_WpQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.11.2021 um 20:07 hat Peter Maydell geschrieben:
> Hi; Coverity is complaining about some of the places in qemu-img.c
> where it takes a 32-bit variable and shifts it left by BDRV_SECTOR_BITS
> to convert a sector count to a byte count, because it's doing the
> shift in 32-bits rather than 64 and so Coverity thinks there might
> be overflow (CID 1465221, 1465219). Is it right and we need extra
> casts to force the shift to be done in 64 bits, or is there some
> constraint that means we know the sector counts are always small
> enough that the byte count is 2GB or less ?

These are false positives. n is limited to BDRV_REQUEST_MAX_SECTORS
already when it starts out in convert_iteration_sectors() (which is
enough to make the calculation safe), but for the specific code path, I
think it's even guaranteed to be further limited to s->buf_sectors which
is 16 MB at most (MAX_BUF_SECTORS in qemu-img.c).

Kevin



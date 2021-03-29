Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AFF34D48A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:09:46 +0200 (CEST)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQuSX-0004sE-1H
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lQuQv-0003tm-Dr
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lQuQu-0002Ny-0M
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617034083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qar037yYG3JhZLfmr/xKEJGeP7DW5jegSrURUbWp+8=;
 b=ixeyWDCzlyOXUtxhGdCRuwXnYQAj4cpCco4R9eZQ5smktbJyqlCUaTwHaTsoIsfemgCJjc
 a65uxQXbwxl78beFt8oWTmecjp8zVShpRESd7KPNwnWy/Noi5yz7TJ7d9O9BAa02ovri2e
 qakfI/EKr9xO5LyKgJ8PVpYULXTNEfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-20gtP2MtNGSpmPl9PIgdAg-1; Mon, 29 Mar 2021 12:07:59 -0400
X-MC-Unique: 20gtP2MtNGSpmPl9PIgdAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B52991005D57;
 Mon, 29 Mar 2021 16:07:58 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-119.ams2.redhat.com
 [10.36.113.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 009C860CE6;
 Mon, 29 Mar 2021 16:07:57 +0000 (UTC)
Subject: Re: [PATCH] iotests/046: Filter request length
To: qemu-block@nongnu.org
References: <20200918153323.108932-1-mreitz@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ed9b3160-53ee-6718-d57b-7e5e824778f8@redhat.com>
Date: Mon, 29 Mar 2021 18:07:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20200918153323.108932-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.09.20 17:33, Max Reitz wrote:
> For its concurrent requests, 046 has always filtered the offset,
> probably because concurrent requests may settle in any order.  However,
> it did not filter the request length, and so if requests with different
> lengths settle in an unexpected order (notably the longer request before
> the shorter request), the test fails (for no good reason).
> 
> Filter the length, too.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
> This has annoyed me for quite some time now, but when rebasing (and
> testing) my FUSE export series, it became apparent that on a FUSE export
> qcow2 images with -o compat=0.10 always fail this test (because the
> first 56k request settles before its accompanying 8k request), so now
> I'm forced to do something about it.
> ---
>   tests/qemu-iotests/046     |   3 +-
>   tests/qemu-iotests/046.out | 104 ++++++++++++++++++-------------------
>   2 files changed, 54 insertions(+), 53 deletions(-)

Applied to my block branch.

Max



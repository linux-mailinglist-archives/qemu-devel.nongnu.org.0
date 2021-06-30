Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6663B824D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 14:42:11 +0200 (CEST)
Received: from localhost ([::1]:50294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyZXe-0006e7-B8
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 08:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lyZVV-0005KH-SY
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 08:39:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lyZVS-0006EH-Pn
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 08:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625056793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+Tu0xdCheZB2VCnde20jQg/MtOxaHPTyqRRNBxJQqE=;
 b=Z8hy5oGIP6xQHouMFxXV12k4uEeMt/Y0ok9B8df6iyHzmSBIWBC6ccwxYHVpPQxma2VwHo
 nAs5zK2cvmDtP6Tklf4cZ4GL08EoBw6JJmXz2Wbtx9jEGB9KHWfjhbBfps7Ckjf7eWBtU0
 dyP9fJY5i69G55eVeUiwFtdn7SoaeNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-EiJABOogP_iLZQ_hnouYFg-1; Wed, 30 Jun 2021 08:39:50 -0400
X-MC-Unique: EiJABOogP_iLZQ_hnouYFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86EAE804140;
 Wed, 30 Jun 2021 12:39:49 +0000 (UTC)
Received: from redhat.com (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5C04E716;
 Wed, 30 Jun 2021 12:39:44 +0000 (UTC)
Date: Wed, 30 Jun 2021 14:39:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: Re: [PATCH 0/7] vhost-user-blk: Implement reconnection during realize
Message-ID: <YNxmD0H3Pblc1MBv@redhat.com>
References: <20210609154658.350308-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609154658.350308-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.06.2021 um 17:46 hat Kevin Wolf geschrieben:
> My previous series removed the broken implementation of automatic
> reconnection during .realize(). This series adds some error reporting
> improvements that allow distinguishing cases where reconnecting could
> help from permanent errors, and then uses it to re-implement the
> automatic reconnection during .realize(), as was requested during review
> of the previous series.
> 
> Kevin Wolf (7):
>   vhost: Add Error parameter to vhost_dev_init()
>   vhost: Distinguish errors in vhost_backend_init()
>   vhost: Return 0/-errno in vhost_dev_init()
>   vhost-user-blk: Add Error parameter to vhost_user_blk_start()
>   vhost: Distinguish errors in vhost_dev_get_config()
>   vhost-user-blk: Factor out vhost_user_blk_realize_connect()
>   vhost-user-blk: Implement reconnection during realize

Thanks for the review, fixed up the series according to the minor
comments you had and applied it to my block branch.

Kevin



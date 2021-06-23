Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0173B18DD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 13:27:40 +0200 (CEST)
Received: from localhost ([::1]:60702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw12i-0004iV-1P
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 07:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lw11H-0003v1-1B
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lw11F-0002yK-IJ
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624447568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MTD1ACiGQHFjhY8RQKo/t4uMLhEOLRXuwT7fz0j/jGc=;
 b=CH2zCp6hjZcLDjVZnmI6z63LnhcND/tMQcwH+Z6ayS5jLxlTnz0UGefx6qP8dnsOCWWdpi
 y16DcBaDwecVd6WOosDHtpzd8GszdI41W0juyGUlf4SCA9JCZIbJMAurGiBXLH0ONA7wmp
 KEyBQNxwowWKmCSi0IwAC9x1g4CF/xo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-gvyJ236OMlWLZwQH80RskA-1; Wed, 23 Jun 2021 07:26:07 -0400
X-MC-Unique: gvyJ236OMlWLZwQH80RskA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 354DF804144;
 Wed, 23 Jun 2021 11:26:06 +0000 (UTC)
Received: from redhat.com (ovpn-114-45.ams2.redhat.com [10.36.114.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB2FD3AE1;
 Wed, 23 Jun 2021 11:26:04 +0000 (UTC)
Date: Wed, 23 Jun 2021 13:26:03 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] block: BDRV_O_NO_IO for backing file on creation
Message-ID: <YNMaS6ER8bpF1o6f@redhat.com>
References: <20210622140030.212487-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622140030.212487-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.06.2021 um 16:00 hat Max Reitz geschrieben:
> When creating an image file with a backing file, we generally try to
> open the backing file (unless -u was specified), mostly to verify that
> it is there, but also to get the file size if none was specified for the
> new image.
> 
> For neither of these things do we need data I/O, and so we can pass
> BDRV_O_NO_IO when opening the backing file.  This allows us to open even
> encrypted backing images without requiring the user to provide a secret.
> 
> This makes the -u switch in iotests 189 and 198 unnecessary (and the
> $size parameter), so drop it, because this way we get regression tests
> for this patch here.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/441
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Thanks, applied to the block branch.

Kevin



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD73E49F8C5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:53:16 +0100 (CET)
Received: from localhost ([::1]:58206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDPoZ-0005NK-F6
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:53:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDPjv-00039E-MF
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:48:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDPju-0002vw-27
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YuqKvjEoItyfTCGLd3plRRQiAVe/xCkr9wpSIklybGI=;
 b=UFBgkMhZSUaHh5MWmwArmMPBaT1vHOHx/0pG3nMXd40+edC9GIgy//2elenO5ZUXoQzncs
 4HV9BqWRt57FgBxAkb6TVQOZqZSg+W9vuxKO8uUO3TF07E7Yj9fFvtpYFlqUYA2ktX02Ny
 1Ft1bhgtRVvYfdqfrpxJmzvqLzCoILo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-iV2Rm5wGPYOVuio3zhOVqQ-1; Fri, 28 Jan 2022 06:48:18 -0500
X-MC-Unique: iV2Rm5wGPYOVuio3zhOVqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79A4B1006AA0;
 Fri, 28 Jan 2022 11:48:17 +0000 (UTC)
Received: from localhost (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D894922DE7;
 Fri, 28 Jan 2022 11:48:16 +0000 (UTC)
Date: Fri, 28 Jan 2022 11:48:15 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: Block alignment of qcow2 compress driver
Message-ID: <20220128114815.GQ1127@redhat.com>
References: <20220128110732.GA19514@redhat.com>
 <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, eblake@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 12:39:11PM +0100, Hanna Reitz wrote:
> So I actually don’t know why it works for you.  OTOH, I don’t
> understand why the block size affects you over NBD, because I would
> have expected qemu to internally auto-align requests when they are
> not aligned (in bdrv_co_pwritev_part()).

I checked it again and my hack definitely fixes nbdcopy.  But maybe
that's expected if qemu-nbd is auto-aligning requests?  (I'm only
accessing the block layer through qemu-nbd, not with qemu-io)

> Like, when I set the NBD
> block driver’s alignment to 512[2], the following still succeeds:

Did you just patch that line in the code or is there a qemu-nbd
option/image-opts to do this?

Rich.

> [1] https://gitlab.com/qemu-project/qemu/-/blob/master/block/qcow2.c#L4662
> [2] https://gitlab.com/qemu-project/qemu/-/blob/master/block/nbd.c#L1918

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56B130A77F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:22:56 +0100 (CET)
Received: from localhost ([::1]:56100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YEJ-00014B-QT
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6YCC-0008VH-4Q
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:20:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6YC8-0007nl-IA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612182038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JG7DZ8H9JGX+c6rqLeL9+Q3uniBtia6x2bWqYpZ2iKk=;
 b=Os1xYRNNQG2BsKy4YXHkjQT2c2z+K+1ZI03TVNCCAnp2WhR+HJHlVSCkECSoEG478KwyWa
 C1cXmN7zM1VAYmviXb7yBrerP8NQjnnjw6oNFWc4sg4NhyjnM5QGdzi0x5vISxjfZbbnAZ
 OWRo8K1ivWVdQKsgJDwQn9FvX8dv1+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-yIqKxyngNQS07g8ck9lEEw-1; Mon, 01 Feb 2021 07:20:36 -0500
X-MC-Unique: yIqKxyngNQS07g8ck9lEEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA8B1800D62;
 Mon,  1 Feb 2021 12:20:35 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D965D735;
 Mon,  1 Feb 2021 12:20:31 +0000 (UTC)
Date: Mon, 1 Feb 2021 13:20:30 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v3 2/2] block: move blk_exp_close_all() to qemu_cleanup()
Message-ID: <20210201122030.GB13157@merkur.fritz.box>
References: <20210121170700.59734-1-slp@redhat.com>
 <20210121170700.59734-3-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121170700.59734-3-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.01.2021 um 18:07 hat Sergio Lopez geschrieben:
> Move blk_exp_close_all() from bdrv_close() to qemu_cleanup(), before
> bdrv_drain_all_begin().
> 
> Export drivers may have coroutines yielding at some point in the block
> layer, so we need to shut them down before draining the block layer,
> as otherwise they may get stuck blk_wait_while_drained().
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1900505
> Signed-off-by: Sergio Lopez <slp@redhat.com>

This patch loses the call in qemu-nbd and qemu-storage-daemon.

Kevin



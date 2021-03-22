Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0273448FA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:15:13 +0100 (CET)
Received: from localhost ([::1]:38582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMGu-0001EU-MQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lOMEh-0008UY-AT
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lOMEe-0005IP-ON
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616425971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GD7ogjqj9wCF146CqkXH/J1L4x60zwnh8dUjYLqYjYo=;
 b=JgDjPqzdjWvNfndgmoRRYHcZGKG2cMg7syH7qdjYsZz73tAH98psQ29vJgQkgD/ARqvwdu
 OK/9XabMPIAXmJjZ85nNGKkMudi9aawrG616OzQn6vp6ZEDet9moiJCimnV3jmFaBphpan
 /nJsta2VNEcx9O8BcHzSh3t/aRGaRB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299--4RF6PZNNYKOxTO0TY12Mw-1; Mon, 22 Mar 2021 11:12:48 -0400
X-MC-Unique: -4RF6PZNNYKOxTO0TY12Mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96BD6100A641;
 Mon, 22 Mar 2021 15:12:47 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B242619C78;
 Mon, 22 Mar 2021 15:12:46 +0000 (UTC)
Date: Mon, 22 Mar 2021 16:12:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Patrik =?utf-8?B?SmFub3XFoWVr?= <pj@patrikjanousek.cz>
Subject: Re: [PATCH 2/2] qapi: implementation of the block-dirty-bitmap-dump
 command
Message-ID: <YFiz7b0DKfqwEkqM@merkur.fritz.box>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <20210320093235.461485-3-pj@patrikjanousek.cz>
MIME-Version: 1.0
In-Reply-To: <20210320093235.461485-3-pj@patrikjanousek.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: qemu-devel@nongnu.org, lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.03.2021 um 10:32 hat Patrik Janoušek geschrieben:
> Currently, dirty bitmaps are for internal use only and there is
> no support for accessing their content from third party-apps.
> This patch implements new command block-dirty-bitmap-dump, which
> returns content of the dirty bitmap encoded in base64. This is
> very useful especially in combination with a drive that uses raw
> format because third-party apps can easily use it to create
> incremental or differential backup.
> 
> Signed-off-by: Patrik Janoušek <pj@patrikjanousek.cz>

People have already pointed you to NBD to get the block dirty status
(and they are right), but I think nobody has explained yet why we
decided against a QMP command to return bitmaps.

The problem is that disk images can be huge, and this means that dirty
bitmaps describing them get pretty large, too. So your new QMP command
ends up reading many megabytes from disk and sending it to the socket.
While it's doing all of this I/O, QEMU is blocked and the guest may
appear to be hanging until it completes.

The client would also have to download the whole bitmap even if it is
only interested in specific blocks. (This may or may not be relevant for
you specific use case.)

With the NBD export, the client can query a specific block range and its
request is processed asynchronously in the background while the guest
and the QMP monitor are still available.

Kevin



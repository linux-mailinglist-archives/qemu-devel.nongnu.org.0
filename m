Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD42D14D1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 16:35:47 +0100 (CET)
Received: from localhost ([::1]:54828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmIYE-0006RJ-GF
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 10:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmIVE-00055Y-5E
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:32:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmIV7-0006qv-OD
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:32:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607355152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wqoUa7IsCymMsFv1L9iJTFZyeRuAAJO8oRopI0PqkNE=;
 b=fTfHGwx/gEma8GrHJyGlQ/bJPWxWb7LVhWyncOIiKISltfYZ//YeiBe9rtmZoOYvKFHkbD
 gSyv2/WJMB6bB9ESW0341479iIuWB14yj4q6MVmhO2rEaG1YYLcysLZ6p/+ZaZmH7Tp0GB
 Rl080LC6GQGJwRShBaI+F9vUZu2okEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-2XsX8FkTNsWrJiugXnKw2A-1; Mon, 07 Dec 2020 10:32:31 -0500
X-MC-Unique: 2XsX8FkTNsWrJiugXnKw2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D24A0800D53;
 Mon,  7 Dec 2020 15:32:29 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-161.ams2.redhat.com [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 703A35D9D0;
 Mon,  7 Dec 2020 15:32:28 +0000 (UTC)
Date: Mon, 7 Dec 2020 16:32:27 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Li Feng <fengli@smartx.com>
Subject: Re: [PATCH v2] file-posix: check the use_lock before setting the
 file lock
Message-ID: <20201207153227.GC5281@merkur.fritz.box>
References: <1607341446-85506-1-git-send-email-fengli@smartx.com>
MIME-Version: 1.0
In-Reply-To: <1607341446-85506-1-git-send-email-fengli@smartx.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lifeng1519@gmail.com, kyle@smartx.com,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.12.2020 um 12:44 hat Li Feng geschrieben:
> The scenario is that when accessing a volume on an NFS filesystem
> without supporting the file lock,  Qemu will complain "Failed to lock
> byte 100", even when setting the file.locking = off.
> 
> We should do file lock related operations only when the file.locking is
> enabled, otherwise, the syscall of 'fcnctl' will return non-zero.
> 
> Signed-off-by: Li Feng <fengli@smartx.com>

Thanks, applied to the block branch.

Kevin



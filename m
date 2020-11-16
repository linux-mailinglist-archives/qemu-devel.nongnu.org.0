Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7163F2B4638
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 15:50:03 +0100 (CET)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kefpS-00018X-IR
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 09:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kefoQ-0000bW-5g
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:48:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kefoO-0004ty-NH
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605538136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PjYTiBKDmsw2qE5Qwk0wxbG0G0VJaP1Bz3RFRSIMZic=;
 b=WlKN19tchLrRuAvlfKAIMmZ52sPFpGOlPZklLpHV7jR5lBwZV95FlN0F5oj5ga7gPF+GXC
 e/OiylFPb4JZIU7WDuh1XUJAo6/2q6fnb7bAuaY4PecXkj9ciiUKH65a6hDeVRiOsuLgvf
 dcj+Vh05W4gxxdcAmlbEuaP0Tx244g4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-3DLlOo4eMUGtUUBPQXLA8Q-1; Mon, 16 Nov 2020 09:48:52 -0500
X-MC-Unique: 3DLlOo4eMUGtUUBPQXLA8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B54DF8015AA;
 Mon, 16 Nov 2020 14:48:50 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-254.ams2.redhat.com [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C61755C269;
 Mon, 16 Nov 2020 14:48:48 +0000 (UTC)
Date: Mon, 16 Nov 2020 15:48:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 1/2] file-posix: allow -EBUSY errors during write zeros
 on raw block devices
Message-ID: <20201116144847.GB18526@merkur.fritz.box>
References: <20201111153913.41840-1-mlevitsk@redhat.com>
 <20201111153913.41840-2-mlevitsk@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111153913.41840-2-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jan Kara <jack@suse.cz>, qemu-block@nongnu.org,
 "Darrick J . Wong" <darrick.wong@oracle.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.11.2020 um 16:39 hat Maxim Levitsky geschrieben:
> On Linux, fallocate(fd, FALLOC_FL_PUNCH_HOLE) when it is used on a block device,
> without O_DIRECT can return -EBUSY if it races with another write to the same page.
> 
> Since this is rare and discard is not a critical operation, ignore this error
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>

I'm applying this one for 5.2, it certainly shouldn't hurt and makes
things work at least, even if possibly not in the optimal way.

Patch 2 seems to be a bit less obvious and discussion is ongoing, so
that's probably more 6.0 material.

Kevin



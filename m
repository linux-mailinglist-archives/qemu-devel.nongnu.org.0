Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACBD30AB6F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:33:40 +0100 (CET)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bCt-0002Au-V3
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6bB5-0000Um-KK
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:31:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6bB3-0008MS-5v
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612193504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ekzvSnkHfS1y8pUviQR0fS+C99lEJ3TR3nap/rSYm+I=;
 b=GesjYQQ1CEJvw4XfUz3c59Ne88/AHF8/RRDh9gDSPmkbiRiZ5YEt0n6GICvScr+5J5xRTu
 eQuTX1hjCbIUaNJyAQFmSHB3mNxxuytoYWo5WI/0XKQUgNGK+x1CyNV41hSCIqeiFRstov
 DCmeYgSvCVIrLufqmS5gYTiLM7AdOto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-NXRlhxvJMxOH0zGfflrfmg-1; Mon, 01 Feb 2021 10:31:40 -0500
X-MC-Unique: NXRlhxvJMxOH0zGfflrfmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE087800D53;
 Mon,  1 Feb 2021 15:31:39 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB9A739A64;
 Mon,  1 Feb 2021 15:31:35 +0000 (UTC)
Date: Mon, 1 Feb 2021 16:31:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v4 0/2] nbd/server: Quiesce coroutines on context switch
Message-ID: <20210201153134.GE13157@merkur.fritz.box>
References: <20210201125032.44713-1-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210201125032.44713-1-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2021 um 13:50 hat Sergio Lopez geschrieben:
> This series allows the NBD server to properly switch between AIO contexts,
> having quiesced recv_coroutine and send_coroutine before doing the transition.
> 
> We need this because we send back devices running in IO Thread owned contexts
> to the main context when stopping the data plane, something that can happen
> multiple times during the lifetime of a VM (usually during the boot sequence or
> on a reboot), and we drag the NBD server of the correspoing export with it.
> 
> While there, fix also a problem caused by a cross-dependency between
> closing the export's client connections and draining the block
> layer. The visible effect of this problem was QEMU getting hung when
> the guest request a power off while there's an active NBD client.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>



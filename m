Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BBF27B0F0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 17:31:22 +0200 (CEST)
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMv7W-0007Eh-3n
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 11:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kMv5t-0006Wk-8S
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 11:29:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kMv5q-0006Bj-4g
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 11:29:36 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601306972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWPshNExJ0c5/wl8MK5vZZ9n3lrd25ulo1M7SSk1EZ8=;
 b=TP5axFRp2nGyi5pIE2XcUpRxcHoBqnVwC6kqTuLxXHIHbIeuQx/865PJwkHL7zfHDn+0RT
 sG084olPOkygQ3ShrqgVk/5sD+yTyuxEUArS4jtwVMIYuqa3YlX3n+14W4qk/te9Q6fVjU
 f+59h3Tw0x/etOANGZFzIpBQQMUQVO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-sLcW3_ftOOe_lz3eFL1MCg-1; Mon, 28 Sep 2020 11:29:30 -0400
X-MC-Unique: sLcW3_ftOOe_lz3eFL1MCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2F871018F63;
 Mon, 28 Sep 2020 15:29:29 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-193.ams2.redhat.com [10.36.114.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16FCE1972A;
 Mon, 28 Sep 2020 15:29:25 +0000 (UTC)
Date: Mon, 28 Sep 2020 17:29:23 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: Re: [PATCH v2 00/31] block/export: Add infrastructure and QAPI for
 block exports
Message-ID: <20200928152923.GI5451@linux.fritz.box>
References: <20200924152717.287415-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924152717.287415-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.09.2020 um 17:26 hat Kevin Wolf geschrieben:
> We are planning to add more block export types than just NBD in the near
> future (e.g. vhost-user-blk and FUSE). This series lays the ground for
> this with some generic block export infrastructure and QAPI interfaces
> that will allow managing all of them (for now add/remove/query).
> 
> As a side effect, qemu-storage-daemon can now map --export directly to
> the block-export-add QMP command, similar to other command line options.
> The built-in NBD servers also gains new options that bring it at least a
> little closer to feature parity with qemu-nbd.

Thanks for the review, applied to the block branch.

Kevin



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7181ED11C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 15:45:19 +0200 (CEST)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgThm-000771-0F
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 09:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jgTgx-0006gU-Hf
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 09:44:27 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34324
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jgTgw-0001KJ-34
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 09:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591191864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CKLzVt/Gh+oM49y0VREWENyT5r6lsGyXbSKoLrfrQRc=;
 b=e3PSKTUgNryvoZ+SyXTBTNJ1CPssSo3c+YUP8i+fQ6l24WXWjFafaM41nXSP2Yh4X6ZbPv
 2/WbBLy9ktzdTsf22D9glJcpAtfbf7PXnNeLgmufWHBp6CcMePqLaWtanBqIeUwzz8IqP4
 v/mvd/S11n7E2jYVO9kidiJXEKTHw4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-b9pIAmgnMbqkyr8W8E3gkw-1; Wed, 03 Jun 2020 09:44:16 -0400
X-MC-Unique: b9pIAmgnMbqkyr8W8E3gkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D52558018AC;
 Wed,  3 Jun 2020 13:44:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63A445D9CD;
 Wed,  3 Jun 2020 13:44:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C6CD1747D; Wed,  3 Jun 2020 15:44:04 +0200 (CEST)
Date: Wed, 3 Jun 2020 15:44:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH] ati-vga: increment mm_index in ati_mm_read/write
Message-ID: <20200603134404.xdb2koul7fatv4ez@sirius.home.kraxel.org>
References: <20200603124732.1137892-1-ppandit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200603124732.1137892-1-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:12:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, Yi Ren <c4tren@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Ren Ding <rding@gatech.edu>,
 Hanqing Zhao <hanqing@gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 03, 2020 at 06:17:32PM +0530, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> While accessing VGA registers via ati_mm_read/write routines,
> a guest may set 's->regs.mm_index' such that it leads to infinite
> recursion.

Lovely.

> Increment the mm_index value to avoid it.

Hmm, why modify mm_index?  Shouldn't we just check it is non-zero
before calling ati_mm_read/ati_mm_write?

cheers,
  Gerd



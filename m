Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E5E2CA6D8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:19:34 +0100 (CET)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7RF-0003wd-RV
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kk7PP-0002dE-GR
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:17:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kk7PM-0002gj-7S
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606835854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vf1pHSXqW2kTMOI+THppHZgs8FsylRSw3JMerFCIyrg=;
 b=N6hIUasQvzPpw0NRcxmuVdkbskSJ9nrYe+Vg2OASFT2GC2Bmtv1t2R+AUBTFRx7yZlxtxf
 zqgwPzTd1h+5BIeZMsH/zQkyRpTS1epyzCElwtNWsqBB2s2OSP4LsY/uGUt8Y/W6t/mCPl
 0MoKtzdsOjDot8vI9GwfoX3vEm4VIJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-mnZGpu32O-uYxNA3EhQaHA-1; Tue, 01 Dec 2020 10:17:33 -0500
X-MC-Unique: mnZGpu32O-uYxNA3EhQaHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 322598030A0;
 Tue,  1 Dec 2020 15:17:32 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-225.ams2.redhat.com [10.36.112.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 534CE18A50;
 Tue,  1 Dec 2020 15:17:31 +0000 (UTC)
Date: Tue, 1 Dec 2020 16:17:29 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH] ide: atapi: assert that the buffer pointer is in range
Message-ID: <20201201151729.GA6264@merkur.fritz.box>
References: <20201201120926.56559-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201201120926.56559-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.12.2020 um 13:09 hat Paolo Bonzini geschrieben:
> A case was reported where s->io_buffer_index can be out of range.
> The report skimped on the details but it seems to be triggered
> by s->lba == -1 on the READ/READ CD paths (e.g. by sending an
> ATAPI command with LBA = 0xFFFFFFFF).  For now paper over it
> with assertions.  The first one ensures that there is no overflow
> when incrementing s->io_buffer_index, the second checks for the
> buffer overrun.
> 
> Note that the buffer overrun is only a read, so I am not sure
> if the assertion failure is actually less harmful than the overrun.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I don't think reading LBA 0xFFFFFFFF from a CD image would ever be
valid (or at least I have never seen an 8 TB CD...), so it's probably a
malicious guest. Assertion failure seems okay to me, guests have already
enough ways to kill themselves, so it feels slightly preferable to an
information leak.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E926AE230
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:23:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYDm-0001NG-TN; Tue, 07 Mar 2023 09:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZYDk-0001Mt-Ut
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:23:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZYDj-0005f0-Ht
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678198994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F5jPeF9DCRQk3ffY6c3m4Wi0+NGPtQHAUEr0OktF0J8=;
 b=XA/nZhky3w+Tb+yYn5R74JOZqlZXQzlkf4gkICXQMYOUW/qIHrS4DJFTarU4TuchP2pUDB
 pENjfdEjE9vbJOgnQ8bbRQEm8MYPlBg4bMB7JbEZx2KVhGqK246X+kAE8kYxze1iBPAFFz
 3VA2dxfXevDDNjo3RCDDiDu9p+kA4GI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-W32IzHwOPtG7GU5er0HVoA-1; Tue, 07 Mar 2023 09:23:11 -0500
X-MC-Unique: W32IzHwOPtG7GU5er0HVoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 709C7185A7A4;
 Tue,  7 Mar 2023 14:23:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D22BC4014D1B;
 Tue,  7 Mar 2023 14:23:10 +0000 (UTC)
Date: Tue, 7 Mar 2023 15:23:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] block/fuse: Let PUNCH_HOLE write zeroes
Message-ID: <ZAdIzcpQFM/T9idD@redhat.com>
References: <20230227104725.33511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227104725.33511-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 27.02.2023 um 11:47 hat Hanna Czenczek geschrieben:
> Hi,
> 
> https://gitlab.com/qemu-project/qemu/-/issues/1507 reports a bug in FUSE
> exports: fallocate(PUNCH_HOLE) is implemented with blk_pdiscard(), but
> its man page documents that a successful call will result in the data
> being read as zero.  blk_pdiscard() does not guarantee this, so we must
> use blk_pwrite_zeroes() instead (with MAY_UNMAP | NO_FALLBACK, which
> differentiates it from fallocate(ZERO_RANGE)).
> 
> Patch 2 adds a regression test.

Thanks, applied to the block branch.

Kevin



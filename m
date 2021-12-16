Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39210476E77
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:03:12 +0100 (CET)
Received: from localhost ([::1]:38810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnbT-00059f-Bq
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:03:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mxnXt-0001k7-Jn
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mxnXs-00046q-9x
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639648767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6YTcbFwNyRDAH0UYWa5XAWrCXkHZJJ4znOTbktUoI6o=;
 b=ExbvTP0XmYxge5CmtUMGDfo60TMv1MOWNM/z4YFc50mkToApRSWx9fzLSPhoKpoBL2rYgy
 neKAP0d4xJ3fHGNLlX7I0o9xH6bG+eKUyhOp0TwTDA50AbqP18IXFnTzc6K3pMyHUKfCpT
 7/gH5UfHXsW2NjXbGqFuxPoWM29+U5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-I6Icm8AlMnSKR5ZXoiCf5g-1; Thu, 16 Dec 2021 04:59:24 -0500
X-MC-Unique: I6Icm8AlMnSKR5ZXoiCf5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E66F8015CD;
 Thu, 16 Dec 2021 09:59:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D82BF9231A;
 Thu, 16 Dec 2021 09:59:21 +0000 (UTC)
Date: Thu, 16 Dec 2021 10:59:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] block/file-posix: Simplify the XFS_IOC_DIOINFO handling
Message-ID: <YbsN+C/rNx6xE2Un@redhat.com>
References: <20211215125824.250091-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215125824.250091-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.12.2021 um 13:58 hat Thomas Huth geschrieben:
> The handling for the XFS_IOC_DIOINFO ioctl is currently quite excessive:
> This is not a "real" feature like the other features that we provide with
> the "--enable-xxx" and "--disable-xxx" switches for the configure script,
> since this does not influence lots of code (it's only about one call to
> xfsctl() in file-posix.c), so people don't gain much with the ability to
> disable this with "--disable-xfsctl".
> It's also unfortunate that the ioctl will be disabled on Linux in case
> the user did not install the right xfsprogs-devel package before running
> configure. Thus let's simplify this by providing the ioctl definition
> on our own, so we can completely get rid of the header dependency and
> thus the related code in the configure script.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, applied to the block branch.

Kevin



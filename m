Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034C64A6814
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:37:27 +0100 (CET)
Received: from localhost ([::1]:47926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1mB-0006mL-3O
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:37:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEzFt-0006ew-Ad
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:55:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEzFp-0005y2-Ro
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643745342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPLg6WBjm76jRCDmnYq4alociC7JXa7Rukoy1JsXJlA=;
 b=JayR3z/Jc3z41xc1qkjar7cy1GqlXV233XNk4XKQ/JzPbOpqwdVT04KBn0nwoLMQq6ER7Y
 Xn0lqHbbhAvaXI5YhoQYzFwd2LmkSTQcp33NAYstPhXxS4MH9VQH9j0QwIjLjZnbLv/YXV
 PiVghIM8PIAnI9ttvYy5Ji+W+ODV9qw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-6rne3ZbXO9m_e0dAk00QVg-1; Tue, 01 Feb 2022 14:52:43 -0500
X-MC-Unique: 6rne3ZbXO9m_e0dAk00QVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F38D31091DA2;
 Tue,  1 Feb 2022 19:52:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFAB91971F;
 Tue,  1 Feb 2022 19:52:09 +0000 (UTC)
Date: Tue, 1 Feb 2022 20:52:08 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 15/25] block: fix FreeBSD build failure with fallocate
Message-ID: <YfmPaKIR58h5wdzf@redhat.com>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
 <20220201182050.15087-16-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220201182050.15087-16-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, Hanna Reitz <hreitz@redhat.com>, berrange@redhat.com,
 stefanha@redhat.com, "open list:FUSE block device..." <qemu-block@nongnu.org>,
 crosa@redhat.com, qemu-devel@nongnu.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com, aurelien@aurel32.net,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2022 um 19:20 hat Alex Bennée geschrieben:
> We already use the CONFIG_FALLOCATE_PUNCH_HOLE symbol elsewhere in the
> code so use it here.
> 
> Fixes: 4ca37a96a7 ("fuse: (Partially) implement fallocate()")
> Cc: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

I think this addresses the same issue as Phil's series?

https://lists.gnu.org/archive/html/qemu-block/2022-02/msg00016.html

It's in the pull request I sent earlier today.

Kevin



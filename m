Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDEA2F9BDC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:26:00 +0100 (CET)
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1QnP-0004IB-7Q
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1l1QlV-0003PS-Nd
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:24:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1l1QlT-0006Tc-IR
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610961838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aDneINiRQjSa5gMcwdL/kQa0jeJfs8cpgG2iyN1+TX4=;
 b=TQayz3PEcusXABLX62Esp8L5ng0tIvSR3zgYfaqHDj8GSPxKomyHDBkQFLDpbkoj6b5+ZX
 c2ZEN1MKj475E4zOCkqq+d9dCCxGvhYDIVbZjpggRlqemr+aKEzsw06BQYPBXffRbH2gA4
 CuPHdriR1L0c8FG3j/ZkA0vGfkhOm70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-s9UFz1dfP4ScoWYBgmWVKQ-1; Mon, 18 Jan 2021 04:23:55 -0500
X-MC-Unique: s9UFz1dfP4ScoWYBgmWVKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BC4D801817;
 Mon, 18 Jan 2021 09:23:54 +0000 (UTC)
Received: from lws.brq.redhat.com (unknown [10.40.195.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10D923828;
 Mon, 18 Jan 2021 09:23:51 +0000 (UTC)
Date: Mon, 18 Jan 2021 10:23:49 +0100
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 0/2] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
Message-ID: <20210118092349.4wgzoljhwqnhsjgu@lws.brq.redhat.com>
References: <20210115151126.3334333-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210115151126.3334333-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Prasad J Pandit <ppandit@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 04:11:24PM +0100, Philippe Mathieu-Daudé wrote:
> I had a look at the patch from Miroslav trying to silence a
> compiler warning which in fact is a nasty bug. Here is a fix.
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg772735.html
> 
> v2: Restrict tests so they don't fail when device aren't available
> 
> Based-on: <20210115150936.3333282-1-philmd@redhat.com>
>           "tests/qtest: Fixes fuzz-tests"
> 
> Philippe Mathieu-Daudé (2):
>   net/eth: Simplify _eth_get_rss_ex_dst_addr()
>   net/eth: Fix stack-buffer-overflow in _eth_get_rss_ex_dst_addr()
> 
>  net/eth.c                      | 37 +++++++++++-------------
>  tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                    |  1 +
>  tests/qtest/meson.build        |  1 +
>  4 files changed, 72 insertions(+), 20 deletions(-)
>  create mode 100644 tests/qtest/fuzz-e1000e-test.c
> 
> -- 
> 2.26.2
> 
> 
>
Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>



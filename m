Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238FF33083C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:41:32 +0100 (CET)
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9a7-0008Dt-72
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJ9Xa-0007cx-IP
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:38:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJ9XV-0003y7-W7
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615185524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mBy7L/RHsPpXYQRAnkRKYRDggcuTVK5UQXCVhk9Xv7I=;
 b=g/DWzOd7tBd6BsGhkXEgBmyTZbL36Tmem8R+C1DYg4eXbygeBDAjQu1RqxhZD3M+B5o9hm
 N8zPxRL2SvCh9Jy5PxqC9Ch3QcloUwwG2q6qAsSp3CffurbKlDnW3RgWwBfZpNTjYiVfXe
 JMcY+f4HWQ2QhztjJQMDXqv1FydzSiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-QcGyJ0-HNRe2K6xRDO4m7A-1; Mon, 08 Mar 2021 01:38:40 -0500
X-MC-Unique: QcGyJ0-HNRe2K6xRDO4m7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AA141005D4C;
 Mon,  8 Mar 2021 06:38:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-143.ams2.redhat.com [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2B6A19709;
 Mon,  8 Mar 2021 06:38:23 +0000 (UTC)
Subject: Re: [PATCH v3 03/12] libqtest: add qtest_kill_qemu()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210223144653.811468-1-stefanha@redhat.com>
 <20210223144653.811468-4-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <14ed58af-15b1-36cb-2a00-be653d574a61@redhat.com>
Date: Mon, 8 Mar 2021 07:38:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210223144653.811468-4-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/2021 15.46, Stefan Hajnoczi wrote:
> Tests that manage multiple processes may wish to kill QEMU before
> destroying the QTestState. Expose a function to do that.
> 
> The vhost-user-blk-test testcase will need this.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>   tests/qtest/libqos/libqtest.h | 11 +++++++++++
>   tests/qtest/libqtest.c        |  7 ++++---
>   2 files changed, 15 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



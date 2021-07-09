Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462273C2A04
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:05:09 +0200 (CEST)
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1wkF-0002qC-Rk
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1wjQ-0002BK-JD
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:04:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1wjN-0004qy-DF
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625861051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5FggxqBOH8EV+3+Cyw3i6NbKfM0D4ArGZ5aVp59qCLI=;
 b=RB3/Hi7CxOmietPJfa8t/cAKhHfHx5qg1psHHp3qBdFnEC/H0kHnhft3fEg0OV6JGXQPtE
 d5kWThFhKlsdBTxUbiPKdBtQbJe4UWzEj3EmAYKRvI4yFYKPfuGTpmWPqIpFLbfYY6jkhj
 NdRZC5Yf3KbMgTQ6sxX6i+AEI18YbbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446--975xoIgO2yPa5rjb-98dA-1; Fri, 09 Jul 2021 16:04:10 -0400
X-MC-Unique: -975xoIgO2yPa5rjb-98dA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B786619253CB;
 Fri,  9 Jul 2021 20:04:09 +0000 (UTC)
Received: from localhost (unknown [10.22.9.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71C7460C04;
 Fri,  9 Jul 2021 20:04:09 +0000 (UTC)
Date: Fri, 9 Jul 2021 16:04:08 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/i386: Use cpu_breakpoint_test in breakpoint_handler
Message-ID: <20210709200408.xidr5sm6gy5oeu6y@habkost.net>
References: <20210620062317.1399034-1-richard.henderson@linaro.org>
 <c0e97e2b-44e0-b1dc-e629-cbb6bb319502@linaro.org>
MIME-Version: 1.0
In-Reply-To: <c0e97e2b-44e0-b1dc-e629-cbb6bb319502@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 09:00:30AM -0700, Richard Henderson wrote:
> Ping.
> 
> On 6/19/21 11:23 PM, Richard Henderson wrote:
> > The loop is performing a simple boolean test for the existence
> > of a BP_CPU breakpoint at EIP.  Plus it gets the iteration wrong,
> > if we happen to have a BP_GDB breakpoint at the same address.
> > 
> > We have a function for this: cpu_breakpoint_test.
> > 
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

cpu_breakpoint_test() logic matches the existing code being
replaced, so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I wouldn't have objected if you simply merged this without
waiting for review from others, though.  I believe you know this
code better than anybody else.

-- 
Eduardo



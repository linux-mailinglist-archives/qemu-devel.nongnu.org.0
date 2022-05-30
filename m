Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AC5537B60
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:24:41 +0200 (CEST)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfNw-00063E-84
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nvfGJ-0008ES-Pa
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:16:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nvfGH-0001ZH-Ez
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653916604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pXjQ9vmsK1jrs+oY3W5RuG8eiQPqjg8rsjcg3rZp4/k=;
 b=XAEbchJ0DwBM4FlVbaUD0oKYHoMcpVEKl27nYIqxaChHOmNqnQvxQrDzklWRHuB1UcRuRG
 1SZ6zXiQTdo6bHvt8qL7nYJawhrOndB6k8NqJyXVYQ4H65gRG7kcnVl1XISVZPjqMZccvh
 obrV6B+5Q8Cvxj3jmMHjy3L7aIbRfII=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-iXfOpONuMOmSvGqCY62nMQ-1; Mon, 30 May 2022 09:16:43 -0400
X-MC-Unique: iXfOpONuMOmSvGqCY62nMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A1703C14CC0;
 Mon, 30 May 2022 13:16:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B48602166B2A;
 Mon, 30 May 2022 13:16:41 +0000 (UTC)
Date: Mon, 30 May 2022 15:16:40 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] aio_wait_kick: add missing memory barrier
Message-ID: <YpTDuNQ3Y2iEbPI5@redhat.com>
References: <20220524173054.12651-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524173054.12651-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.05.2022 um 19:30 hat Emanuele Giuseppe Esposito geschrieben:
> It seems that aio_wait_kick always required a memory barrier
> or atomic operation in the caller, but nobody actually
> took care of doing it.
> 
> Let's put the barrier in the function instead, and pair it
> with another one in AIO_WAIT_WHILE. Read aio_wait_kick()
> comment for further explanation.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Thanks, applied to the block branch.

Kevin



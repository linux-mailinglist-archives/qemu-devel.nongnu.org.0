Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714213BBA3A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:34:16 +0200 (CEST)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KzX-0005C8-Bq
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0Kuk-00089r-EA
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:29:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0Kui-0000UB-0w
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625477350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jC3+jjHzZH1tAsFAkJ03EHpITsGLdRn5ZoqXlRmDJpQ=;
 b=h8dfexhqdMFaurq3BlI2W8BZe4PlIbFE+q2h4jb5HgHG2DLXBviU5uUek5VOnjzRmuFKuC
 ySm7IgmVL8Eu+P4RLedR1YlH175CXmphZ5gk18+UMBikVj1nSBY0TOpBzvRUUyC6RHW96W
 8DYL1Lnu7G6y70v4x9aZE0151ukuMPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-GZBIbHYeMWWng1afuYjlKg-1; Mon, 05 Jul 2021 05:29:07 -0400
X-MC-Unique: GZBIbHYeMWWng1afuYjlKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C076010C1ADC;
 Mon,  5 Jul 2021 09:29:05 +0000 (UTC)
Received: from localhost (ovpn-112-39.ams2.redhat.com [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F309060C82;
 Mon,  5 Jul 2021 09:29:01 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
In-Reply-To: <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>
Organization: Red Hat GmbH
References: <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 05 Jul 2021 11:29:00 +0200
Message-ID: <87tul9hzxf.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
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
Cc: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>, iii@linux.ibm.com,
 david@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21 2021, Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com> wrote:

> qemu-s390x signals with SIGILL on compare-and-trap instructions. This
> breaks OpenJDK which expects SIGFPE in its implementation of implicit
> exceptions.
>
> This patch depends on [PATCH v3 0/2] target/s390x: Fix SIGILL psw.addr
> reporting.
> https://lore.kernel.org/qemu-devel/20210602002210.3144559-1-iii@linux.ibm.com/
>
> Based-on: 20210602002210.3144559-1-iii@linux.ibm.com
>
> Jonathan Albrecht (2):
>   linux-user/s390x: signal with SIGFPE on compare-and-trap
>   tests/tcg: Test that compare-and-trap raises SIGFPE
>
>  linux-user/s390x/cpu_loop.c     |  19 +++---
>  tests/tcg/s390x/Makefile.target |   1 +
>  tests/tcg/s390x/trap.c          | 100 ++++++++++++++++++++++++++++++++
>  3 files changed, 111 insertions(+), 9 deletions(-)
>  create mode 100644 tests/tcg/s390x/trap.c

Assuming that this will also go through the linux-user tree:

Acked-by: Cornelia Huck <cohuck@redhat.com>



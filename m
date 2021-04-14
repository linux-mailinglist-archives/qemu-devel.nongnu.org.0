Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AE035EF8F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:39:45 +0200 (CEST)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWb3o-00075J-My
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lWb2e-0006du-5B
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:38:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lWb2b-0007sq-AS
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618389507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNJfulfk7xHSXhTp76n1+I9DIQ25YH4OUu8727qQjbc=;
 b=BXWYZGE+Dek4HiAcp5cVaqU7AJCu58CDytDsPt27Tc1tDq/JaOLBKeCT1MaUtH2xdEkfnv
 u70cbIVS5Loof4wJFKQu9a3l+O4qV3JHNizG+L5tC8j8CHjHSkl7pl1aLf1yk13ZjPhyIQ
 j3Mz3T0vR4NsBhJVJUpAqfbASq3xjm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-zB2bzFKrPfKPgNvKGHsyNw-1; Wed, 14 Apr 2021 04:38:22 -0400
X-MC-Unique: zB2bzFKrPfKPgNvKGHsyNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1796383DD28;
 Wed, 14 Apr 2021 08:38:21 +0000 (UTC)
Received: from gondolin (ovpn-113-114.ams2.redhat.com [10.36.113.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C34C45D9D0;
 Wed, 14 Apr 2021 08:38:15 +0000 (UTC)
Date: Wed, 14 Apr 2021 10:38:13 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v2] target/s390x: Fix translation exception on illegal
 instruction
Message-ID: <20210414103813.2595508b.cohuck@redhat.com>
In-Reply-To: <20210413165257.21426-1-iii@linux.ibm.com>
References: <20210413165257.21426-1-iii@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Apr 2021 18:52:57 +0200
Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
> happens is:
> 
> * uretprobe maps a userspace page containing an invalid instruction.
> * uretprobe replaces the target function's return address with the
>   address of that page.
> * When tb_gen_code() is called on that page, tb->size ends up being 0
>   (because the page starts with the invalid instruction), which causes
>   virt_page2 to point to the previous page.
> * The previous page is not mapped, so this causes a spurious
>   translation exception.
> 
> The bug is that tb->size must never be 0: even if there is an illegal
> instruction, the instruction bytes that have been looked at must count
> towards tb->size. So adjust s390x's translate_one() to act this way
> for both illegal instructions and instructions that are known to
> generate exceptions.
> 
> Also add an assertion to tb_gen_code() in order to detect such
> situations in future.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> 
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.html
> v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size == 0
>           in tb_gen_code().
> 
>  accel/tcg/translate-all.c |  1 +
>  target/s390x/translate.c  | 16 +++++++++++-----
>  2 files changed, 12 insertions(+), 5 deletions(-)

I assume this bug is not usually hit during normal usage, right? It's
probably not release critical, so I'll line it up for 6.1 instead.



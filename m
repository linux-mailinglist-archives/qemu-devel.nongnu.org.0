Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D4313C3E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:05:21 +0100 (CET)
Received: from localhost ([::1]:48950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AuW-0005dJ-0w
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l94lz-0002S8-CN
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l94lx-0002wc-5c
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Xn4UxVQ7ldjYhiSd47ntBfzTIV2nNEkZ4jPTS9uxFg=;
 b=OjKHQvtLHUqKJEMc1KYuprTqGNaBJ5R2dMzj3HeJK7feOm8+vKY5ximO99tk/R8fBW+qtx
 p+/zdAUEDSvw5xmRk1Ci2etee4fZL5IaKvLXMmmq0ADYRT9CJSx5AGjYLohCpwY1wjInM8
 GufX2h5hT3qOg8D5PZ5Cov6Zi3OW2f4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-iKRHhICZOi-GuMgFtk4YKw-1; Mon, 08 Feb 2021 06:32:00 -0500
X-MC-Unique: iKRHhICZOi-GuMgFtk4YKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D51B5236;
 Mon,  8 Feb 2021 11:31:59 +0000 (UTC)
Received: from gondolin (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B578A6ACE5;
 Mon,  8 Feb 2021 11:31:46 +0000 (UTC)
Date: Mon, 8 Feb 2021 12:31:44 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3] target/s390x/arch_dump: Fix warning for the name
 field in the PT_NOTE section
Message-ID: <20210208123144.68f6144d.cohuck@redhat.com>
In-Reply-To: <20210205093921.848260-1-thuth@redhat.com>
References: <20210205093921.848260-1-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  5 Feb 2021 10:39:21 +0100
Thomas Huth <thuth@redhat.com> wrote:

> There is a compiler warning with GCC 9.3 when compiling with
> the -fsanitize=thread compiler flag:
> 
>  In function 'strncpy',
>     inlined from 's390x_write_elf64_notes' at ../target/s390x/arch_dump.c:219:9:
>  /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
>   '__builtin_strncpy' specified bound 8 equals destination size
>   [-Werror=stringop-truncation]
> 
> Since the name should always be NUL-terminated, let's use g_strlcpy() to
> silence this warning. And while we're at it, also add an assert() to make
> sure that the provided names always fit the size field (which is fine for
> the current callers, the function is called once with "CORE" and once with
> "LINUX" as a name).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v3: Do not touch the namesz field
> 
>  target/s390x/arch_dump.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks, applied.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265FB2F2DD9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:25:57 +0100 (CET)
Received: from localhost ([::1]:44700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHoC-0006yP-3x
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzH5y-0005Gs-Ry
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:40:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzH5x-0001cn-72
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610448012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLwhM6HBZdsA/zDqK/j1nDQCM3EK/9a9zXmTHeIPJ4I=;
 b=bH8JvAxrn6mtWZ1emsoH6K2f8vHkKahmJZag0q6NA2SDaIyYNwHhGqxxm6Jj8btetwfLw7
 B64x7/CSkRUqMXqNhfQQ4BHwacnRCENQ8YYQpIu9sCHtV4A8gfgi2h/vzggF7xNwL+grCk
 nraBcDRLGCsfeMoLtgHNX7uCUSsgEBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-o7GTrRZhM0qUGHafsH8pfw-1; Tue, 12 Jan 2021 05:40:10 -0500
X-MC-Unique: o7GTrRZhM0qUGHafsH8pfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7547115723;
 Tue, 12 Jan 2021 10:40:09 +0000 (UTC)
Received: from gondolin (ovpn-114-102.ams2.redhat.com [10.36.114.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8349860BE2;
 Tue, 12 Jan 2021 10:40:04 +0000 (UTC)
Date: Tue, 12 Jan 2021 11:40:02 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 0/5] s390x/tcg: fix booting Linux kernels compiled
 with clang-11 and clang-12
Message-ID: <20210112114002.6cbec9d0.cohuck@redhat.com>
In-Reply-To: <20210111163845.18148-1-david@redhat.com>
References: <20210111163845.18148-1-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Thomas Huth <thuth@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 17:38:40 +0100
David Hildenbrand <david@redhat.com> wrote:

> This series fixes booting current upstream Linux kernel compiled by
> clang-11 and clang-12 under TCG.
> 
> Latest version of the patches available at:
> git@github.com:davidhildenbrand/qemu.git clang
> 
> v2 -> v3:
> - Add 'tests/tcg/s390x: Fix EXRL tests'
> -- "make check-tcg" with v2 revealed two buggy tests
> - Added RB's/Tested-by's
> 
> v1 -> v2:
> - Add 's390x/tcg: Don't ignore content in r0 when not specified via "b" or
>   "x"'
> - Add 's390x/tcg: Ignore register content if b1/b2 is zero when handling
>   EXEUTE'
> - "s390x/tcg: Fix ALGSI"
> -- Fixup subject
> - "s390x/tcg: Fix RISBHG"
> -- Rephrase description, stating that it fixes clang-11
> 
> David Hildenbrand (5):
>   s390x/tcg: Fix ALGSI
>   s390x/tcg: Fix RISBHG
>   s390x/tcg: Don't ignore content in r0 when not specified via "b" or
>     "x"
>   tests/tcg/s390x: Fix EXRL tests
>   s390x/tcg: Ignore register content if b1/b2 is zero when handling
>     EXECUTE
> 
>  target/s390x/insn-data.def  | 10 +++++-----
>  target/s390x/mem_helper.c   |  4 ++--
>  target/s390x/translate.c    | 33 +++++++++++++++++----------------
>  tests/tcg/s390x/exrl-trt.c  |  8 ++++----
>  tests/tcg/s390x/exrl-trtr.c |  8 ++++----
>  5 files changed, 32 insertions(+), 31 deletions(-)
> 

Thanks, applied.



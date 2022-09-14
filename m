Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F255B881E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:23:02 +0200 (CEST)
Received: from localhost ([::1]:52160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRPv-0004Or-38
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oYQvl-0007w8-RM
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:51:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oYQvj-0008SV-2c
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663156306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YQuyzoQjyf+t8qK2ihyfaiba6RXXZQns41Z0hlq3B0M=;
 b=QLYK6x8OWHp9cghnMGfPkljCec4PE4n54ImixnqAY03S3qEo4RgVTcGQBuSc0mWDkCVNN3
 ysFJu7kqXKh2OvHsLudd7fHi504tMVjDgKhgGqH6v8xvtfSvcfn79MESphaqOreBfJ6b3R
 PZSAgHuE4uSVeRdZSlaZoONtYOF5E8k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-GJfG10qAN4eiv2G_yrNMzA-1; Wed, 14 Sep 2022 07:51:41 -0400
X-MC-Unique: GJfG10qAN4eiv2G_yrNMzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D3BB3C10232;
 Wed, 14 Sep 2022 11:51:40 +0000 (UTC)
Received: from localhost (unknown [10.39.195.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 131A040C83EB;
 Wed, 14 Sep 2022 11:51:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Huth
 <thuth@redhat.com>, David Hildenbrand <david@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Janosch Frank <frankja@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/1] s390x/tcg: Fix opcode for lzrf
In-Reply-To: <20220914105750.767697-1-borntraeger@linux.ibm.com>
Organization: Red Hat GmbH
References: <20220914105750.767697-1-borntraeger@linux.ibm.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Wed, 14 Sep 2022 13:51:38 +0200
Message-ID: <871qse5g39.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Sep 14 2022, Christian Borntraeger <borntraeger@linux.ibm.com> wrote:

> Fix the opcode for Load and Zero Rightmost Byte (32).

Fixes: c2a5c1d718ea ("target/s390x: Implement load-and-zero-rightmost-byte insns")

>
> Cc: qemu-stable@nongnu.org
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>  target/s390x/tcg/insn-data.def | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>



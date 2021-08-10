Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AC43E59E7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:27:10 +0200 (CEST)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQqb-00018c-UQ
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDQpZ-00007g-08
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:26:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDQpX-0004Q3-KI
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628598363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xAyMmUbw9JR5mk++cqi7AQQUEo2Qi9zVSMzx5e9xEA0=;
 b=FVuHyDMhZDsXjKrSAVOW75l/12Vdk3iXmi9+Np4TLpeq2TrZrn5Viq3kraLp46FGkhcrgl
 1KlT3SljZAmGmu188Gy0FWIfRtrHfd4qCmcZgHQaMCDBy9cS3C6kAvMGvpz+YuEl9DDOsg
 PXMRXfYCz1wKR5LUgmQzyJH1uDD33fM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-47ev34J6P7SOuE0RGC1VhQ-1; Tue, 10 Aug 2021 08:26:01 -0400
X-MC-Unique: 47ev34J6P7SOuE0RGC1VhQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 734DA100E421;
 Tue, 10 Aug 2021 12:26:00 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 173FD5D9C6;
 Tue, 10 Aug 2021 12:25:56 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1] s390x/tcg: fix and optimize SPX (SET PREFIX)
In-Reply-To: <20210805125938.74034-1-david@redhat.com>
Organization: Red Hat GmbH
References: <20210805125938.74034-1-david@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 10 Aug 2021 14:25:54 +0200
Message-ID: <87eeb1wkod.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05 2021, David Hildenbrand <david@redhat.com> wrote:

> We not only invalidate the translation of the range 0x0-0x2000, we also
> invalidate the translation of the new prefix range and the translation
> of the old prefix range -- because real2abs would return different
> results for all of these ranges when changing the prefix location.
>
> This fixes the kvm-unit-tests "edat" test that just hangs before this
> patch because we end up clearing the new prefix area instead of the old
> prefix area.
>
> While at it, let's not do anything in case the prefix doesn't change.
>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/tcg/misc_helper.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Thanks, applied.



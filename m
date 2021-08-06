Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1F3E2959
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:19:13 +0200 (CEST)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxse-0003cp-Nf
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mBxrF-0002kz-35
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mBxrD-0007rl-Dw
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628248662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3KrokGQobEziH5K1WZT1yzZSlP305ZqGVWl5Ae4wF88=;
 b=VCzw3BA+39oufUi/rBnP383wC6uSsMcF6eoRGvaYASxJR92kDmCrdEwdvULwxKoaKnVaGk
 RTdzmnXGHhuIwq1RhJdfvqDzWxFwT0KpV6oJ63JDTl9ewwZSoihnAr2f5VZLij24LveSH/
 5XTYdp9SNBvsn3s5gXc/y7/aNA1F188=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-3BQ5e76IOJe7it-1d8aQww-1; Fri, 06 Aug 2021 07:17:39 -0400
X-MC-Unique: 3BQ5e76IOJe7it-1d8aQww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BBA38799ED;
 Fri,  6 Aug 2021 11:17:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17CAA68D9D;
 Fri,  6 Aug 2021 11:17:34 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1] s390x/tcg: fix and optimize SPX (SET PREFIX)
In-Reply-To: <20210805125938.74034-1-david@redhat.com>
Organization: Red Hat GmbH
References: <20210805125938.74034-1-david@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 06 Aug 2021 13:17:32 +0200
Message-ID: <878s1ezusz.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Is this still -rc material? Especially as we are late in the -rc cycle
already.



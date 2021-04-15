Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BA1360F32
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:42:48 +0200 (CEST)
Received: from localhost ([::1]:55776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX48l-0005c2-LV
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lX45Y-0003q4-2D
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:39:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lX45T-00075s-Vr
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618501153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vWO1gZWU09hxFCSjX5sUUWS2VVLAw3+VmP6JjjO9SBA=;
 b=KXhm5JO+MQTdsFQGNrzDRIfWY2Gvqq22Hqmszyh9mIhRp7tCjea7+7SJXG0dMIT1xPYRXt
 lObNtxTB+I7fwGbW+gTVFlkr7hmKdMpL8CU+Eq+8vtf1Wh4EJns1adpzTNfxIku+k4lUCA
 iJKEHleMCmb68IkoQpmh2EACd5066hU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-IBq1PptdOV-wc52GnhrKEw-1; Thu, 15 Apr 2021 11:39:10 -0400
X-MC-Unique: IBq1PptdOV-wc52GnhrKEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 232608030D6;
 Thu, 15 Apr 2021 15:39:09 +0000 (UTC)
Received: from gondolin (ovpn-112-220.ams2.redhat.com [10.36.112.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7C742AC81;
 Thu, 15 Apr 2021 15:39:02 +0000 (UTC)
Date: Thu, 15 Apr 2021 17:39:00 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v4 0/4] accel/tcg: Make sure that tb->size != 0 after
 translation
Message-ID: <20210415173900.7062f159.cohuck@redhat.com>
In-Reply-To: <20210415130305.28640-1-iii@linux.ibm.com>
References: <20210415130305.28640-1-iii@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 15:03:01 +0200
Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> If arch-specific code generates a translation block of size 0,
> tb_gen_code() may generate a spurious exception.
> 
> Fix s390x (patch 1), ARM (patch 2) and xtensa (patch 3) and add an
> assertion in order to catch such situations earlier (patch 4).
> 
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.html
> v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size == 0
>           in tb_gen_code().
> 
> v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02101.html
> v2 -> v3: Split the common code change into a separate patch, add the
>           ARM patch in order to fix
>           https://gitlab.com/cohuck/qemu/-/jobs/1178409450
> 
> v3: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02332.html
> v3 -> v4: Add the xtensa patch in order to fix
>           https://gitlab.com/cohuck/qemu/-/jobs/1178409540
> 
> Ilya Leoshkevich (4):
>   target/s390x: Fix translation exception on illegal instruction
>   target/arm: Make sure that commpage's tb->size != 0
>   target/xtensa: Make sure that tb->size != 0
>   accel/tcg: Assert that tb->size != 0 after translation
> 
>  accel/tcg/translate-all.c |  1 +
>  target/arm/translate.c    |  1 +
>  target/s390x/translate.c  | 16 +++++++++++-----
>  target/xtensa/translate.c |  3 +++
>  4 files changed, 16 insertions(+), 5 deletions(-)
> 

FWIW, this now has passed CI for me.

If all is good, who will merge it? I can merge through the s390x tree,
if I get acks on the patches for the other architectures, or I can give
my ack on the s390x patch, if somebody else is going to take it.



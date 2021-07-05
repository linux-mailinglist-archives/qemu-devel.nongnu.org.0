Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36C23BBC16
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 13:21:31 +0200 (CEST)
Received: from localhost ([::1]:42822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0MfK-0003L3-PE
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 07:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0MeE-0002Vi-PO
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0MeB-0006W3-Sk
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625484017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezI86F2SjobDZyAeCnqA1jIC0qdYohKgoyBbjfGrNXc=;
 b=a1YKCJnrTz4dSdkXQmMsLo2lLTXzGDkyVe/+N0pk2V/LrbVgaFAH+SWjGa7uOJKEBGBzih
 J+UP75RaHeJrdM8eX82kl6LmQKpiDXQgJjp9cmLQ2kvF553zO9WEEP5F+vA9FOInin0iro
 Zy6N5ZrnOZzVgyo5U8+X3wdw2+gDRIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-gXe5WVFwNQWybR6KO35vvQ-1; Mon, 05 Jul 2021 07:20:16 -0400
X-MC-Unique: gXe5WVFwNQWybR6KO35vvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 438125074C;
 Mon,  5 Jul 2021 11:20:15 +0000 (UTC)
Received: from localhost (ovpn-112-39.ams2.redhat.com [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B23075D6A1;
 Mon,  5 Jul 2021 11:20:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1] s390x/tcg: Fix m5 vs. m4 field for VECTOR MULTIPLY
 SUM LOGICAL
In-Reply-To: <20210705090341.58289-1-david@redhat.com>
Organization: Red Hat GmbH
References: <20210705090341.58289-1-david@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 05 Jul 2021 13:20:09 +0200
Message-ID: <87lf6lhus6.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: qemu-s390x@nongnu.org,
 Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05 2021, David Hildenbrand <david@redhat.com> wrote:

> The element size is located in m5, not in m4. As there is no m4, qemu
> currently crashes with an assertion, trying to lookup that field.
>
> Reproduced and tested via GO, which ends up using VMSL once the
> Vector enhancements facility is around for verifying certificates with
> elliptic curves.
>
> Reported-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/449
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/translate_vx.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied.



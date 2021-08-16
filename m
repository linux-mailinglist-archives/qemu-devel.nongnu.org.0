Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC43ED998
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:12:02 +0200 (CEST)
Received: from localhost ([::1]:54790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeHR-0002mA-Br
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mFeGH-0000bO-QN
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:10:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mFeGE-0003mV-CN
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629126645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LsriYs/iLfVxxPd+UptY82k0CIFSIxqx4XmgLavzs54=;
 b=BFY8xCnb+swKvfUtM/Xt1slm6uDjQxK6QDOjx212Kj1RaXm5upZwW0S1+C1PzEAse7f4zy
 IUx6S9XrC174DY2av/lls3aLfZ0g76eOtq8mZa/XezfhpGKhssMJaPuHxIg4gPF6sSA565
 eVciSzl4euG8qPAETurU/NNuy+lbRnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-2M-voS9yOPGCLHTqhh1ukA-1; Mon, 16 Aug 2021 11:10:44 -0400
X-MC-Unique: 2M-voS9yOPGCLHTqhh1ukA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 233251008060;
 Mon, 16 Aug 2021 15:10:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3BEA1036D2E;
 Mon, 16 Aug 2021 15:10:38 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 04/13] s390x/tcg: check for addressing exceptions for
 RRBE, SSKE and ISKE
In-Reply-To: <20210811090527.30556-5-david@redhat.com>
Organization: Red Hat GmbH
References: <20210811090527.30556-1-david@redhat.com>
 <20210811090527.30556-5-david@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 16 Aug 2021 17:10:37 +0200
Message-ID: <87pmudtogi.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 11 2021, David Hildenbrand <david@redhat.com> wrote:

> Let's replace the ram_size check by a proper physical address space
> check (for example, to prepare for memory hotplug), trigger addressing
> exceptions and trace the return value of the storage key getter/setter.
>
> Provide an helper mmu_absolute_addr_valid() to be used in other context
> soon. Always test for "read" instead of "write" as we are not actually
> modifying the page itself.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/helper.h         |  6 +++---
>  target/s390x/mmu_helper.c     |  8 ++++++++
>  target/s390x/s390x-internal.h |  1 +
>  target/s390x/tcg/mem_helper.c | 36 ++++++++++++++++++++++-------------
>  4 files changed, 35 insertions(+), 16 deletions(-)
>

> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index dd506d8d17..90ac82fdcc 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -28,6 +28,7 @@
>  #include "qemu/int128.h"
>  #include "qemu/atomic128.h"
>  #include "tcg/tcg.h"
> +#include "trace.h"
>  
>  #if !defined(CONFIG_USER_ONLY)
>  #include "hw/s390x/storage-keys.h"
> @@ -2171,15 +2172,15 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
>  /* insert storage key extended */
>  uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
>  {
> -    MachineState *ms = MACHINE(qdev_get_machine());
>      static S390SKeysState *ss;
>      static S390SKeysClass *skeyclass;
>      uint64_t addr = wrap_address(env, r2);
>      uint8_t key;
> +    int rc;
>  
>      addr = mmu_real2abs(env, addr);
> -    if (addr > ms->ram_size) {
> -        return 0;
> +    if (!mmu_absolute_addr_valid(addr, false)) {
> +        trigger_pgm_exception(env, PGM_ADDRESSING);

Don't you need s390_program_interrupt() instead?

>      }
>  
>      if (unlikely(!ss)) {



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03D2F0666
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:22:52 +0100 (CET)
Received: from localhost ([::1]:47304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXs3-0006sT-FH
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyXh3-0001zS-UY
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:11:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyXh1-0000Qg-9c
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610273482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LqgNMSz4GvRUVU1zGKkmx216qxVtinxVJLGSjjl+toU=;
 b=eKvwqgBj1+fWBYfjYjOrvPGkZQZ0KmUydDaO5pceGvfW3yrgddG9x8NwDKcRYy6MqirrYx
 KYEu0hnwfKqKnyfpmgaIteY5rx8WZeucRL9NWRXvbIAMQUgJEwb23mylnFWL9kIJIonuHR
 +bznRj1t/qTV6YjXgn6O6FnGapsUK6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-k-vYe6RtNvGNu84hqces1g-1; Sun, 10 Jan 2021 05:11:19 -0500
X-MC-Unique: k-vYe6RtNvGNu84hqces1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E935F107ACE3;
 Sun, 10 Jan 2021 10:11:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-69.ams2.redhat.com [10.36.112.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6B1450A8B;
 Sun, 10 Jan 2021 10:11:12 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] s390x/tcg: Ignore register content if b1/b2 is
 zero when handling EXECUTE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210108132049.8501-1-david@redhat.com>
 <20210108132049.8501-5-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ad22e887-45b2-4ca1-446e-7b84329cda89@redhat.com>
Date: Sun, 10 Jan 2021 11:11:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210108132049.8501-5-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.255, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/2021 14.20, David Hildenbrand wrote:
> In our EXECUTE fast path, we have to ignore the content of r0, if
> specified by b1 or b2.
> 
> Fixes: d376f123c7de ("target/s390x: Re-implement a few EXECUTE target insns directly")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/mem_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
> index 0108611cc9..1901e9dfc7 100644
> --- a/target/s390x/mem_helper.c
> +++ b/target/s390x/mem_helper.c
> @@ -2473,8 +2473,8 @@ void HELPER(ex)(CPUS390XState *env, uint32_t ilen, uint64_t r1, uint64_t addr)
>               uint32_t d1 = extract64(insn, 32, 12);
>               uint32_t b2 = extract64(insn, 28, 4);
>               uint32_t d2 = extract64(insn, 16, 12);
> -            uint64_t a1 = wrap_address(env, env->regs[b1] + d1);
> -            uint64_t a2 = wrap_address(env, env->regs[b2] + d2);
> +            uint64_t a1 = wrap_address(env, (b1 ? env->regs[b1] : 0) + d1);
> +            uint64_t a2 = wrap_address(env, (b2 ? env->regs[b2] : 0) + d2);

Right, "B" fields need special handling.

Reviewed-by: Thomas Huth <thuth@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F005A2EE992
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:08:18 +0100 (CET)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeOA-0001HZ-26
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxeM1-0008FP-5k
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 18:06:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxeLx-0002pM-Ds
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 18:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610060759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tpJkykzdk5+x6R4ldc0dYJeNI9ywVpTbuA0DlsvtHuE=;
 b=PkosSpEbXaYXk0fX8iKYaOSx5dWqjZt5VmOIxNul4EqMBfWuoEH/VmdS2ap+eGG4nlp4Ud
 DdAy6fYb0PgaHfjQ0vm1yJgTflHALRaAKrX4qMwBB8x9a426kcmstkEN3KWuughlS2Ri3L
 /OhkzVSbG5FVRZqFqR36gCsLnBHGRtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-NdLANhwxN1Sl_sV3cLjbcg-1; Thu, 07 Jan 2021 18:05:58 -0500
X-MC-Unique: NdLANhwxN1Sl_sV3cLjbcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1D5E19251A0;
 Thu,  7 Jan 2021 23:05:56 +0000 (UTC)
Received: from [10.36.112.59] (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB4D419C81;
 Thu,  7 Jan 2021 23:05:55 +0000 (UTC)
Subject: Re: [PATCH] target/s390x: Fix ALGSI
To: qemu-devel@nongnu.org
References: <20210107202135.52379-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <3c2f3348-231c-47ea-3f07-a660ed43f89e@redhat.com>
Date: Fri, 8 Jan 2021 00:05:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210107202135.52379-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.01.21 21:21, David Hildenbrand wrote:
> Looks like something went wrong while touching that line. Instead of "r1"
> we need a new temporary. Also, we have to pass MO_TEQ, to indicate that
> we are working with 64-bit values. Let's revert these changes.
> 
> Fixes: ff26d287bddc ("target/s390x: Improve cc computation for ADD LOGICAL")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/insn-data.def | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
> index 26badb663a..eac5136ee5 100644
> --- a/target/s390x/insn-data.def
> +++ b/target/s390x/insn-data.def
> @@ -76,7 +76,7 @@
>  /* ADD LOGICAL WITH SIGNED IMMEDIATE */
>      D(0xeb6e, ALSI,    SIY,   GIE, la1, i2_32u, new, 0, asi, addu32, MO_TEUL)
>      C(0xecda, ALHSIK,  RIE_d, DO,  r3_32u, i2_32u, new, r1_32, add, addu32)
> -    C(0xeb7e, ALGSI,   SIY,   GIE, la1, i2, r1, 0, asiu64, addu64)
> +    D(0xeb7e, ALGSI,   SIY,   GIE, la1, i2, new, 0, asiu64, addu64, MO_TEQ)
>      C(0xecdb, ALGHSIK, RIE_d, DO,  r3, i2, r1, 0, addu64, addu64)
>  /* ADD LOGICAL WITH SIGNED IMMEDIATE HIGH */
>      C(0xcc0a, ALSIH,   RIL_a, HW,  r1_sr32, i2_32u, new, r1_32h, add, addu32)
> 

Subject should be "s390x/tcg" ...

-- 
Thanks,

David / dhildenb



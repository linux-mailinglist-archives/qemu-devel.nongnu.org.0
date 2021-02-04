Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D030FD18
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:43:51 +0100 (CET)
Received: from localhost ([::1]:32794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kXd-0006Wh-PW
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l7kHL-0006TM-ER
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:26:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l7kHI-0000mu-RH
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612466814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzA6bF2AfWvN7JOpobb80RhLY3ZUPcm/irvy9qYtoJA=;
 b=PH1bm+CE7g5hEFs0l/48uLmJB6vVeS73+KZpCWE+t+fTLHpwfs1ZUoU9rGWt8Ai132J+i+
 V+fVfkZwrcfqXUltPdgApjZCWKMW9k0w+z5GTY44VhKM9mHjC7TOqGF59bgDah3SuCixhH
 0CPKCt3GNohHTSI4H/+8kqt2ehSwGhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-oGzIELw_Ot2-TCoLUVti9g-1; Thu, 04 Feb 2021 14:25:18 -0500
X-MC-Unique: oGzIELw_Ot2-TCoLUVti9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF836DF8A4;
 Thu,  4 Feb 2021 19:25:17 +0000 (UTC)
Received: from [10.36.113.146] (ovpn-113-146.ams2.redhat.com [10.36.113.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01BC65C257;
 Thu,  4 Feb 2021 19:25:15 +0000 (UTC)
Subject: Re: [PATCH] tcg/s390: Fix compare instruction from extended-immediate
 facility
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210204182902.1742826-1-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <fb601524-f90d-ec3b-b43d-634dfd7b5f03@redhat.com>
Date: Thu, 4 Feb 2021 20:25:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210204182902.1742826-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Richard W . M . Jones" <rjones@redhat.com>, qemu-s390x@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.02.21 19:29, Philippe Mathieu-Daudé wrote:
> The code is currently comparing c2 to the type promotion of
> uint32_t and int32_t. That is, the conversion rules are as:
> 
>    (common_type) c2 == (common_type) (uint32_t)
>                          (is_unsigned
>                          ? (uint32_t)c2
>                          : (uint32_t)(int32_t)c2)
> 
> In the signed case we lose the desired sign extensions because
> of the argument promotion rules of the ternary operator.
> 
> Solve the problem by doing the round-trip parsing through the
> intermediate type and back to the desired common type (all at
> one expression).
> 
> Fixes: a534bb15f30 ("tcg/s390: Use constant pool for cmpi")
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tcg/s390/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
> index b67470137c4..695d7ee6523 100644
> --- a/tcg/s390/tcg-target.c.inc
> +++ b/tcg/s390/tcg-target.c.inc
> @@ -1067,7 +1067,7 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
>                   op = (is_unsigned ? RIL_CLFI : RIL_CFI);
>                   tcg_out_insn_RIL(s, op, r1, c2);
>                   goto exit;
> -            } else if (c2 == (is_unsigned ? (uint32_t)c2 : (int32_t)c2)) {
> +            } else if (c2 == (is_unsigned ? (TCGArg)(uint32_t)c2 : (TCGArg)(int32_t)c2)) {
>                   op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
>                   tcg_out_insn_RIL(s, op, r1, c2);
>                   goto exit;
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F652FC0D5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:24:22 +0100 (CET)
Received: from localhost ([::1]:50752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xY5-0002TN-7K
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l1wcp-0000SR-Jh
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 14:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l1wcm-0008OX-V3
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 14:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611084306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V2MUv7XT/WcD9+xWhCf4/wyDlLIKi2BOAJDEmen8BLE=;
 b=fpDLOvmFg+m1SH1yBRLIU83lgzNCiqdobYI8QKhuFxGElWlc6W3tneJjfLOhJ6Erxip/jZ
 NEDaW4bV6NfS6o6el5pl56m0IX6RlATln1vyqLsu9dgSr/WqlGoBCSxEiBicsbmQaXGi05
 LL2XOvLaztQ2NF1cAxpbCN2cZskv0fM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-xH7uCOnWMuCs3Hb3mNL-Ww-1; Tue, 19 Jan 2021 14:25:04 -0500
X-MC-Unique: xH7uCOnWMuCs3Hb3mNL-Ww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D1F0801817;
 Tue, 19 Jan 2021 19:25:03 +0000 (UTC)
Received: from [10.36.114.143] (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEFB910023AE;
 Tue, 19 Jan 2021 19:25:02 +0000 (UTC)
Subject: Re: [PATCH 2/2] tcg: Optimize inline dup_const for MO_64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210119185542.628456-1-richard.henderson@linaro.org>
 <20210119185542.628456-3-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <93d2fbc4-6fdb-6b42-5a0c-65110430b4bc@redhat.com>
Date: Tue, 19 Jan 2021 20:25:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210119185542.628456-3-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.01.21 19:55, Richard Henderson wrote:
> Avoid the out-of-line function call for immediate MO_64.
> In addition, diagnose all invalid constants at compile-time.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 504c5e9bb0..c5a9d65d5f 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -1325,7 +1325,8 @@ uint64_t dup_const(unsigned vece, uint64_t c);
>       ? (  (VECE) == MO_8  ? 0x0101010101010101ull * (uint8_t)(C)   \
>          : (VECE) == MO_16 ? 0x0001000100010001ull * (uint16_t)(C)  \
>          : (VECE) == MO_32 ? 0x0000000100000001ull * (uint32_t)(C)  \
> -        : dup_const(VECE, C))                                      \
> +        : (VECE) == MO_64 ? (uint64_t)(C)                          \
> +        : (qemu_build_not_reached_always(), 0))                    \
>       : dup_const(VECE, C))
>  
>  
> 

Looks good to me!

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



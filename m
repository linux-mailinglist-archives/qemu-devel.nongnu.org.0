Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103B830FA8C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:03:28 +0100 (CET)
Received: from localhost ([::1]:39800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iyV-0002Wk-5g
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7hww-0004b5-Il
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:57:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7hwr-00040G-BP
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612457860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjVmr7ogMcqtDN0U+lfSs3nyHRuJ/cxhhtE5KfHBiQo=;
 b=bUuTmFU7hKb5Z5tehLdtudg5KB4SZkVgjON+7wiN4xoEtGawV75v7PnrfZ/wwPK9pt2xXO
 PKA98egSX87R6pyQhvssJElJUWRP7UPYQhb6pQ4ZNH+b7amy4P9kxvQzNFiPbCFPNo4y3E
 kPNZ3ufAmizKhP35mxGvb0tD6E3lMPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-FgMlSgb-PnOQh9oqdpT4nA-1; Thu, 04 Feb 2021 11:57:38 -0500
X-MC-Unique: FgMlSgb-PnOQh9oqdpT4nA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C25480196C;
 Thu,  4 Feb 2021 16:57:37 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62C7E5C3FD;
 Thu,  4 Feb 2021 16:57:33 +0000 (UTC)
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
To: David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <28457ae1-7e9b-4428-cb10-3b79ebeac8d0@linaro.org>
 <19D304C1-6401-4D16-AB54-DD19C978D04D@redhat.com>
 <db32a1f5-ad73-a341-f5e7-1c8f592d3d5b@redhat.com>
 <bd7154e1-4d6c-5b98-9e80-ec04f8476373@redhat.com>
 <20210204090351.GN30079@redhat.com> <20210204092916.GS27779@redhat.com>
 <b94570e3-9f87-d259-a338-adef1d552d1a@redhat.com>
 <e1bc591d-009f-3b0f-83a0-36095efff7ee@amsat.org>
 <74c25c22-eacd-1120-80d4-f721ca9a87ba@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <27958d7a-4908-4ff3-5fd4-c4d34ba18d24@redhat.com>
Date: Thu, 4 Feb 2021 10:57:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <74c25c22-eacd-1120-80d4-f721ca9a87ba@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 10:29 AM, David Hildenbrand wrote:

>> +++ b/tcg/s390/tcg-target.c.inc
>> @@ -1094,10 +1094,16 @@ static int tgen_cmp(TCGContext *s, TCGType type,
>> TCGCond c, TCGReg r1,
>>                   op = (is_unsigned ? RIL_CLFI : RIL_CFI);
>>                   tcg_out_insn_RIL(s, op, r1, c2);
>>                   goto exit;
>> -            } else if (c2 == (is_unsigned ? (uint32_t)c2 :
>> (int32_t)c2)) {
>> -                op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
>> -                tcg_out_insn_RIL(s, op, r1, c2);
>> -                goto exit;
>> +            } else if (is_unsigned) {
>> +                if (c2 == (uint32_t)c2) {
>> +                    tcg_out_insn_RIL(s, RIL_CLGFI, r1, c2);
>> +                    goto exit;
>> +                }
>> +            } else {
>> +                if (c2 == (int32_t)c2) {
>> +                    tcg_out_insn_RIL(s, RIL_CGFI, r1, c2);
>> +                    goto exit;
>> +                }
>>               }
>>           }
>> ---
>>
> 
> This works as well I think. Broken casting.
> 
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
> index 8517e55232..f41ca02492 100644
> --- a/tcg/s390/tcg-target.c.inc
> +++ b/tcg/s390/tcg-target.c.inc
> @@ -1094,7 +1094,7 @@ static int tgen_cmp(TCGContext *s, TCGType type,
> TCGCond c, TCGReg r1,
>                  op = (is_unsigned ? RIL_CLFI : RIL_CFI);
>                  tcg_out_insn_RIL(s, op, r1, c2);
>                  goto exit;
> -            } else if (c2 == (is_unsigned ? (uint32_t)c2 : (int32_t)c2)) {
> +            } else if (c2 == (is_unsigned ? (TCGArg)(uint32_t)c2 :
> (TCGArg)(int32_t)c2)) {

Yes, that also solves your problem in fewer lines of code, by doing the
round-trip parsing through the intermediate type and back to the desired
common type all at one expression, rather than separated at two
different points where intermediate type promotion rules interfere with
the work.

>                  op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
> 
> (int32_t)c2 will be converted to (uint32_t) first, then to (TCGArg).
> Which is different than casting directly from (int32_t)c2 to (TCGArg).

Yep, the broken version was losing out on the desired sign extensions
because of the argument promotion rules of ?:

> 
> Nasty.
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



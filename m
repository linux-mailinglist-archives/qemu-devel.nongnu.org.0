Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A230F79F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:24:58 +0100 (CET)
Received: from localhost ([::1]:54330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hRB-0008FN-G1
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l7hFm-0004St-2R
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:13:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l7hFi-0000Px-3a
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612455185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyjRzr7ybR/L6ifpQjartm9dbSQS0TNJYiXSww3NPVM=;
 b=gCiAUnDgeqwzvqW2dmbAadFTPBKoHB9sgzh5EmOwDQjs7u1bY+/gxHZJLtuOaafDbIdE8C
 QiDuXb7sDvR7ZVACtNV9oZPFQds5DJp9NPRp41VhWxA6YN5NyUmJrHDxFJUHFb8YIaLAyz
 KFqF+ZJ3S6AshsceAhRUQKA65CtkjbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-ZUl1HYKMMJSkEX-kx0PTvw-1; Thu, 04 Feb 2021 11:12:59 -0500
X-MC-Unique: ZUl1HYKMMJSkEX-kx0PTvw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FD0085B6C5;
 Thu,  4 Feb 2021 16:12:58 +0000 (UTC)
Received: from [10.36.113.146] (ovpn-113-146.ams2.redhat.com [10.36.113.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C2295DEC1;
 Thu,  4 Feb 2021 16:12:56 +0000 (UTC)
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <28457ae1-7e9b-4428-cb10-3b79ebeac8d0@linaro.org>
 <19D304C1-6401-4D16-AB54-DD19C978D04D@redhat.com>
 <db32a1f5-ad73-a341-f5e7-1c8f592d3d5b@redhat.com>
 <bd7154e1-4d6c-5b98-9e80-ec04f8476373@redhat.com>
 <20210204090351.GN30079@redhat.com> <20210204092916.GS27779@redhat.com>
 <b94570e3-9f87-d259-a338-adef1d552d1a@redhat.com>
 <e1bc591d-009f-3b0f-83a0-36095efff7ee@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <70038b42-cc4c-978a-0926-f2a786ed4f74@redhat.com>
Date: Thu, 4 Feb 2021 17:12:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e1bc591d-009f-3b0f-83a0-36095efff7ee@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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

On 04.02.21 17:04, Philippe Mathieu-Daudé wrote:
> On 2/4/21 10:37 AM, David Hildenbrand wrote:
>> On 04.02.21 10:29, Richard W.M. Jones wrote:
>>>>> commit 8f17a975e60b773d7c366a81c0d9bbe304f30859
>>>>> Author: Richard Henderson <richard.henderson@linaro.org>
>>>>> Date:   Mon Mar 30 19:52:02 2020 -0700
>>>>>
>>>>>       tcg/optimize: Adjust TempOptInfo allocation
>>>>>
>>>>> The image boots just fine on s390x/TCG as well.
>>>>
>>>> Let me try this in a minute on my original test machine.
>>>
>>> I got the wrong end of the stick as David pointed out in the other email.
>>>
>>> However I did test things again this morning (all on s390 host), and
>>> current head (1ed9228f63ea4b) fails same as before ("mount" command
>>> fails).
>>>
>>> Also I downloaded:
>>>
>>>    
>>> https://dl.fedoraproject.org/pub/fedora-secondary/releases/33/Cloud/s390x/images/Fedora-Cloud-Base-33-1.2.s390x.qcow2
>>>
>>>
>>> and booted it on 1ed9228f63ea4b using this command:
>>>
>>>     $ ~/d/qemu/build/s390x-softmmu/qemu-system-s390x -machine accel=tcg
>>> -m 2048 -drive
>>> file=Fedora-Cloud-Base-33-1.2.s390x.qcow2,format=qcow2,if=virtio
>>> -serial stdio
>>>
>>> Lots of core dumps inside the guest, same as David saw.
>>>
>>> I then reset qemu back to 8f17a975e60b773d ("tcg/optimize: Adjust
>>> TempOptInfo allocation"), rebuilt qemu, tested the same command and
>>> cloud image, and that booted up much happier with no failures or core
>>> dumps.
>>>
>>> Isn't it kind of weird that this would only affect an s390 host?  I
>>> don't understand why the host would make a difference if we're doing
>>> TCG.
>>
>> I assume an existing BUG in the s390x TCG backend ... which makes it
>> harder to debug :)
> 
> This seems to fix it:
> 
> -- >8 --
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
> index 8517e552323..32d03dbfbaf 100644
> --- a/tcg/s390/tcg-target.c.inc
> +++ b/tcg/s390/tcg-target.c.inc
> @@ -1094,10 +1094,16 @@ static int tgen_cmp(TCGContext *s, TCGType type,
> TCGCond c, TCGReg r1,
>                   op = (is_unsigned ? RIL_CLFI : RIL_CFI);
>                   tcg_out_insn_RIL(s, op, r1, c2);
>                   goto exit;
> -            } else if (c2 == (is_unsigned ? (uint32_t)c2 : (int32_t)c2)) {
> -                op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
> -                tcg_out_insn_RIL(s, op, r1, c2);
> -                goto exit;
> +            } else if (is_unsigned) {
> +                if (c2 == (uint32_t)c2) {
> +                    tcg_out_insn_RIL(s, RIL_CLGFI, r1, c2);
> +                    goto exit;
> +                }
> +            } else {
> +                if (c2 == (int32_t)c2) {
> +                    tcg_out_insn_RIL(s, RIL_CGFI, r1, c2);
> +                    goto exit;
> +                }
>               }
>           }

Indeed, seems to work. Thanks!

... will try to review :)

-- 
Thanks,

David / dhildenb



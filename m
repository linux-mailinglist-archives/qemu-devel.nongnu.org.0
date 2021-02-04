Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F2430F99A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:26:16 +0100 (CET)
Received: from localhost ([::1]:37128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iOV-0004jX-OC
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7hrb-000638-8y
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:52:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7hrX-0001j8-La
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612457531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IuSgxnUnp/fPAXkl4v/A8qaT9ISedOc/NMfD0553Q9M=;
 b=cz8NLO3I4VU5fpuvKd0y0XmYhvZOD1cuSBwU1gPW77tuCEaPziWVB11cWgq0d+W/xlNu0j
 erhVGJYEfZ3+xWAnP0j/x4rTng5ARpXT83Wozz9y8UeVGFoN1keIbpFFuhmYsWTg/U/xFM
 10R2VqVD0yn9GqIKquhRto/zRezx8BU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-dNaMH9tGNhGQQMdKPOBMuQ-1; Thu, 04 Feb 2021 11:52:07 -0500
X-MC-Unique: dNaMH9tGNhGQQMdKPOBMuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0513801960;
 Thu,  4 Feb 2021 16:52:06 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35F6B1981C;
 Thu,  4 Feb 2021 16:52:03 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>, "Richard W.M. Jones"
 <rjones@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
References: <28457ae1-7e9b-4428-cb10-3b79ebeac8d0@linaro.org>
 <19D304C1-6401-4D16-AB54-DD19C978D04D@redhat.com>
 <db32a1f5-ad73-a341-f5e7-1c8f592d3d5b@redhat.com>
 <bd7154e1-4d6c-5b98-9e80-ec04f8476373@redhat.com>
 <20210204090351.GN30079@redhat.com> <20210204092916.GS27779@redhat.com>
 <b94570e3-9f87-d259-a338-adef1d552d1a@redhat.com>
 <e1bc591d-009f-3b0f-83a0-36095efff7ee@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
Message-ID: <2d75544e-a325-aa1a-6b01-ecdd41eb64bf@redhat.com>
Date: Thu, 4 Feb 2021 10:52:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e1bc591d-009f-3b0f-83a0-36095efff7ee@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On 2/4/21 10:04 AM, Philippe Mathieu-Daudé wrote:

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
>                  op = (is_unsigned ? RIL_CLFI : RIL_CFI);
>                  tcg_out_insn_RIL(s, op, r1, c2);
>                  goto exit;
> -            } else if (c2 == (is_unsigned ? (uint32_t)c2 : (int32_t)c2)) {

In this code, you are comparing c2 to the type promotion of uint32_t and
int32_t.  That is, the conversion rules are as if you had done:

(common_type) c2 == (common_type) (uint32_t) (is_unsigned ? (uint32_t)c2
: (uint32_t)(int32_t)c2)

> -                op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
> -                tcg_out_insn_RIL(s, op, r1, c2);
> -                goto exit;
> +            } else if (is_unsigned) {
> +                if (c2 == (uint32_t)c2) {

whereas this is:

(common_type_unsigned)c2 == (common_type_unsigned)(uint32_t)c2

> +                    tcg_out_insn_RIL(s, RIL_CLGFI, r1, c2);
> +                    goto exit;
> +                }
> +            } else {
> +                if (c2 == (int32_t)c2) {

and this is:

(common_type_signed)c2 == (common_type_signed)(int32_t)c2

and the two may indeed use a different type.

I'm not sure (from the context shown here) what the type of c2 was, to
determine what the common types are, but as an example, on my 64-bit system,

(long)-1 == (int32_t)-1

is true (the 64-bit value (long)-1 is equal to the sign-extended 64-bit
value created from the signed 32-bit value (int32_t)-1), while

(unsigned long)-1 == (uint32_t)(int32_t)-1

is false (the 32-bit unsigned value (uint32_t) -1 promotes without sign
extension to the 64-bit (unsigned long) type, and 0xffffffffffffffff is
not equal to 0x00000000ffffffff).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



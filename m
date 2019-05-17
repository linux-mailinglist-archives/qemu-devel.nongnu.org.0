Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A621CC7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 19:47:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRgwt-0004Ja-E2
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 13:47:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hRgsN-0000hX-Jr
	for qemu-devel@nongnu.org; Fri, 17 May 2019 13:42:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hRgsM-0006Be-Ie
	for qemu-devel@nongnu.org; Fri, 17 May 2019 13:42:35 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hRgsM-00069I-BJ
	for qemu-devel@nongnu.org; Fri, 17 May 2019 13:42:34 -0400
Received: by mail-pl1-x644.google.com with SMTP id y3so3684412plp.0
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 10:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aOfF2EQ13WZXMb509asIpfzU0H3bOfgnmBR7DwGRIIQ=;
	b=MvkDo/je4JLeXNfwqT08KawhWL0aSbqWpv8rTqrRJbproDQo89/iU0alXT2FYVAOWA
	y+6WmV91zhy9/ePlZFuwf7gCgbx/O9BPfH8XJV5Wb7knSWPEavOrl2aiXYV8Bzrb/x6C
	J/Wfn1hqH4z+Ez4eWR66jIwYBI0pdEUlFdId1JfZO47UA5nNXLfNZUfO+BwT5sYjMJ25
	RCzSAFJd/cPAScWG8MsDEtdiCYMBZ47xBRCtHkET8ZJczmiPEYa/pOOlEvLXBfiPcMhn
	IR0c6J/Vly4SQzwMS5PLpdvzl8LWHQIv0IREGbi7hGnJ1CYfsYuYdQQ0BjNIoVltylwD
	pLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aOfF2EQ13WZXMb509asIpfzU0H3bOfgnmBR7DwGRIIQ=;
	b=ogeA4xeI56rNH0FiLKDlZHsZbsYagaAnkbDLjI9rxG3RDkZxgMrdpI7sxR/gmwiO9K
	vibrwuwUdXumZVblKDqT2OfSe28+NI8OK5FkDFmzq7a1nBd1J/W7I5mFunkKEvd51tTG
	jNwEs4NA4MC93aKd0rFORN8afLsrql9SSF2o041RiZREG1yAdyZnWqSKkN+z8qk5lDBf
	v86oBobIM0SolceVGf6b72IGQAQarkeeK66Me50say13OVtMOy1QpLob876ZUlqadL4k
	5zG4mg7tKTwgmkAyhF8FHQwKVhO0oyJOII+NZaMJ6VnE9TQEhtLP9dhvshJDHmHQUm1W
	cObg==
X-Gm-Message-State: APjAAAUHmKAhlXecWJF0eGdrRYzV1QDEZmswJPtUS/CyIdl5hqvujd9M
	5xPIhp+hIo7rXiolxM9bk5yjjg==
X-Google-Smtp-Source: APXvYqwo47EH3AWJcPIXRR2A7ZN3xbZFRvcu+F6+P1+aDUplZycE0sauBD5nnTE4e7PMwU1gA4vjRw==
X-Received: by 2002:a17:902:18b:: with SMTP id
	b11mr33236233plb.264.1558114953042; 
	Fri, 17 May 2019 10:42:33 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
	by smtp.gmail.com with ESMTPSA id
	d15sm12786736pfr.179.2019.05.17.10.42.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 10:42:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190515203112.506-1-david@redhat.com>
	<20190515203112.506-3-david@redhat.com>
	<fcce920c-58e3-60ef-ebc0-bcbc2e651e87@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <de30b861-b2ca-c83e-9058-1286047ab3d7@linaro.org>
Date: Fri, 17 May 2019 10:42:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fcce920c-58e3-60ef-ebc0-bcbc2e651e87@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH v1 2/5] s390x/tcg: Implement VECTOR FIND
 ELEMENT EQUAL
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/19 9:47 AM, Richard Henderson wrote:
>     first_equal = n;
>     first_zero = n;
>     for (i = n - 1; i >= 0; --i) {
>         if (data1 == data2) {
>             first_equal = i;
>         }
>         if (data1 == 0) {
>             first_zero = i;
>         }
>     }
> 
> // As an aside, there are bit tricks for the above,
> // but let's stay simple(r) for now.

What the hell, it's not /that/ tricky.


/*
 * Returns a bit set in the MSB of each element that is zero,
 * as defined by the mask M.
 */
static inline uint64_t zero_search(uint64_t a, uint64_t m)
{
    return ~(((a & m) + m) | a | m);
}

/*
 * Returns the byte offset for the first match, or 16 for no match.
 */
static inline int match_index(uint64_t c0, uint64_t c1)
{
    return (c0 ? clz64(c0) : clz64(c1) + 64) >> 3;
}

Use

  dup_const(MO_8, 0x7f)
  dup_const(MO_16, 0x7fff)
  dup_const(MO_32, 0x7fffffff)

for the M parameter for the different element sizes.

    uint64_t a0, a1, b0, b1, e0, e1, z0, z1;

    a0 = s390_vec_read_element64(v2, 0);
    a1 = s390_vec_read_element64(v2, 1);
    b0 = s390_vec_read_element64(v3, 0);
    b1 = s390_vec_read_element64(v3, 1);
    e0 = zero_search(a0 ^ b0, m);
    e1 = zero_search(a1 ^ b1, m);
    first_equal = match_index(e0, e1);

    if (zs) {
        z0 = zero_search(a0, m);
        z1 = zero_search(a1, m);
        first_zero = match_index(z0, z1);
    ...


r~


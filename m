Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631D033B14B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:41:40 +0100 (CET)
Received: from localhost ([::1]:36144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlbP-0000ru-Cq
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLlYp-0007ej-4y
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:38:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLlYn-0001hI-Hi
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615808336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xi87ZN5Yk4mvo2Ho+rUgNUOfwgzAGqT8Cx9cahqqLx4=;
 b=EqxW0EEGx4VLH+y2+4SDEJvsTnr4N0ZAJ/ySAYraBX1SKxPPEwOldgsFcaHVCk2gjCSWMA
 wApPORgR3pd8D5+jWH3Ooca8D64/gclxUzKHZGyXR1jcu8RgdfplOm4yZ3sMshLNrsTyLs
 B+elsXLWPYt4Vyb8Knvz3DcBQz/O1OA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-iQmsjI9JPGmnDM6GE1fU_A-1; Mon, 15 Mar 2021 07:38:54 -0400
X-MC-Unique: iQmsjI9JPGmnDM6GE1fU_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4EDD801817;
 Mon, 15 Mar 2021 11:38:53 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 806C719719;
 Mon, 15 Mar 2021 11:38:53 +0000 (UTC)
Subject: Re: [PATCH] utils: Use fma in qemu_strtosz
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210314234821.1954428-1-richard.henderson@linaro.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5510483b-b38c-ad82-c138-6c757e4dac3a@redhat.com>
Date: Mon, 15 Mar 2021 06:38:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314234821.1954428-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 6:48 PM, Richard Henderson wrote:
> Use fma to simulatneously scale and round up fraction.
> 
> The libm function will always return a properly rounded double precision
> value, which will eliminate any extra precision the x87 co-processor may
> give us, which will keep the output predictable vs other hosts.
> 
> Adding DBL_EPSILON while scaling should help with fractions like
> 12.345, where the closest representable number is actually 12.3449*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  util/cutils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index d89a40a8c3..f7f8e48a68 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -342,7 +342,7 @@ static int do_strtosz(const char *nptr, const char **end,
>          retval = -ERANGE;
>          goto out;
>      }
> -    *result = val * mul + (uint64_t) (fraction * mul);
> +    *result = val * mul + (uint64_t)fma(fraction, mul, DBL_EPSILON);

Don't you need to include <float.h> to get DBL_EPSILON?

More importantly, this patch seems wrong.  fma(a, b, c) performs (a * b)
+ c without intermediate rounding errors, but given our values for a and
b, where mul > 1 in any situation we care about, adding 2^-53 is so much
smaller than a*b that it not going to round the result up to the next
integer.  Don't you want to do fma(fraction, mul, 0.5) instead?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE1733AB05
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 06:33:38 +0100 (CET)
Received: from localhost ([::1]:40170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfrE-0008Jx-PY
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 01:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLfq5-0007tD-Iz
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLfq3-0001CU-7n
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615786341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRB4+vM3plksvateWx4pZqHvzVltYM8Gt0FO6PUa3vI=;
 b=SkSXynzvmZKH0Fn7fZNln1Qtwn88V7zC+ef7lqmpyCvFfBePB+F8BGKmAYzdQoNRZbUBPh
 WkkKHuS4VOX9Henfr1dPfLBfVXOsyAvRiwvhaL6Hf7tudkoja8iC3x1Xpy3yrAnAhpKhnw
 0nYjsq/HAjJfC2c+nJVU6914VdGpbtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-XXFPYbvdNRudmcecyVLBcw-1; Mon, 15 Mar 2021 01:32:19 -0400
X-MC-Unique: XXFPYbvdNRudmcecyVLBcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D931363A8;
 Mon, 15 Mar 2021 05:32:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FE1C46;
 Mon, 15 Mar 2021 05:32:17 +0000 (UTC)
Subject: Re: [PATCH] utils: Use fma in qemu_strtosz
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210314234821.1954428-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8422f58c-743b-e028-a116-b7c3b507e3c9@redhat.com>
Date: Mon, 15 Mar 2021 06:32:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314234821.1954428-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

On 15/03/2021 00.48, Richard Henderson wrote:
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
>   util/cutils.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index d89a40a8c3..f7f8e48a68 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -342,7 +342,7 @@ static int do_strtosz(const char *nptr, const char **end,
>           retval = -ERANGE;
>           goto out;
>       }
> -    *result = val * mul + (uint64_t) (fraction * mul);
> +    *result = val * mul + (uint64_t)fma(fraction, mul, DBL_EPSILON);
>       retval = 0;
>   
>   out:

Will this fix the failure that we're currently seeing with 32-bit builds?

( https://gitlab.com/qemu-project/qemu/-/jobs/1096980112#L3258 for example )

Reviewed-by: Thomas Huth <thuth@redhat.com>



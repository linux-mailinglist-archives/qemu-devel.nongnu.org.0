Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C61BE5B1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 21:31:48 +0200 (CEST)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDD0t-0004pm-Bt
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 15:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCk6-0005zD-Mz
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 15:14:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCk5-0006Hy-Qn
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 15:14:26 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39897)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDCk5-0006Gi-Jr
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 15:14:25 -0400
Received: by mail-pg1-x541.google.com with SMTP id o10so438268pgs.6
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZCLqbqb0sHL/k0voD4Mwzk84sSLB4zVIQgabDIEKYqY=;
 b=v+JMLJ4Ni8O6vzGX4xhzi1jNDGmyMYXvChVMrDaNZduIEJeHe1O1yl30qP1NbMKHke
 E+V/J4kn9mfO8xdCxDOSSYcmysaR03NJEx5jn9JwbWxmFw2yd/RsMszAy6KkH4m4Ufef
 3qAZO7dDOuOo0upCJN3XtCbmsnSVKLVsjgtTOJU9ZOzNtviaGhREal+K8tUrnRFz2LFP
 2ZY8gJ/5IO52Kcly2PyUajprpc5rrkz4qklaERs4J8vF0Cf61SU3kMz6EYIWVbRIyIg8
 ky8y94LeC3BFHSJ9ItMeX6GWpeR0tdmYJBSvt6xwIXHTe1AjNMKpOr9Ybkpwu4Tl/sIw
 0gmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZCLqbqb0sHL/k0voD4Mwzk84sSLB4zVIQgabDIEKYqY=;
 b=oRbnpAcE7Nf7YZmhOmiw5UTMQQVj3wW4GOFPSfGO0ExoH87nJm8sm9L0tNKMyQ32E6
 kJpYQtIWeg8+o3RiFR8Snoi7DP3DY5XWtX5LZiUktxHahfxxutYSfv+hKFPPDjIYWDjZ
 hCL10L1atOjIsy400od9kG0nt5poZOgb2TnnnC/nSzgaW97ecAhoxfs2TtUt292xXVgD
 XEE5ZzFgJglELK5qRzK1GULOkQTPSDdlxOLTVlK+uJCxCzes6F5dXYz/JetH7tMBxG0H
 mj0RJLoea0k1GoG/785B3zKNm1RCHFsoirCHgxd9Rrl9kRD70wSEY35nKofX3AKERDDo
 EhKA==
X-Gm-Message-State: APjAAAXw/+BB6K8jGZekcD3BlhYnBxwHrdWUwAGstmGDNLb9qwtzwYJO
 3KLI9P1YoGSlBPCHP0wp6XiXZg==
X-Google-Smtp-Source: APXvYqz6BsEnq9c489iquvT/ZuYaWiZWat8V1xZp9flGPCUNOXPFzx6aBP76Vb7vkT5FeK5T1xQBwQ==
X-Received: by 2002:a63:4e44:: with SMTP id o4mr879143pgl.103.1569438864471;
 Wed, 25 Sep 2019 12:14:24 -0700 (PDT)
Received: from [172.20.32.216] ([12.206.46.61])
 by smtp.gmail.com with ESMTPSA id f15sm6244913pfd.141.2019.09.25.12.14.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 12:14:23 -0700 (PDT)
Subject: Re: [PATCH v2 3/7] s390x/mmu: Inject DAT exceptions from a single
 place
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190925125236.4043-1-david@redhat.com>
 <20190925125236.4043-4-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <081815de-a662-c658-b961-8d775be129fd@linaro.org>
Date: Wed, 25 Sep 2019 12:14:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925125236.4043-4-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/19 5:52 AM, David Hildenbrand wrote:
> Let's return the PGM from the translation functions on error and inject
> based on that.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/mmu_helper.c | 63 +++++++++++----------------------------
>  1 file changed, 17 insertions(+), 46 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



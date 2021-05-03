Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E510371EC3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:37:51 +0200 (CEST)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcVx-0001cN-9P
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldc9n-0003Mr-0V
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldc9h-0004cb-Lp
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620062088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28DBMls32/HhgQ9ByLKFjFhOMju4twJ7qKtt5PH7twk=;
 b=NRjaD/jlVOPx9bXpenE638rOsdDuHS50woe8BVwYxMiReYDrq1IMm/+6WZWQvCcQZMKq2Y
 j26bqps9pPy0A+rTLEPEnxfIZUaTz1+Fs7OmcEkbzbvSW1xhW0vi4K5Aza99KVQhWhR+HE
 PpSKsc/7b7z35bT8X6On+gV+DQ6/Ls4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-slqAM438MNWcDMGNxrT6xQ-1; Mon, 03 May 2021 13:14:46 -0400
X-MC-Unique: slqAM438MNWcDMGNxrT6xQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so1058530wri.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=28DBMls32/HhgQ9ByLKFjFhOMju4twJ7qKtt5PH7twk=;
 b=Po30DkEwNUp5YnuCMQVUFESOl6qz6QUR4kcYmMLkHFNkCUcUvyrRU01u8K/GveOujJ
 +W4+59SIEnE0792QaNwh+ZAsiORnRK9ccGYJVqI07+r8VaTVAMq/Ff7GOHD+tGuZPjYE
 h9NHrjv9l2MBjd6Y5qT8FHPs4oFMQ0eugQrmhHZ7KfUprCNP0MUnV6gV2c91jU2xGbDv
 5P5RZCABGK4DnP2pZ5pfJDCuDHJ5Q6sjg5TgW1RRNu2esG1+66tYR/HzOKgCMgn9qmdR
 BscrF9M9L5VFdvOnBO+ONX54ZRMrjop/E4P1ILDAUb9YNP7IZB2oNsrcyzpLnpFA9UyX
 CkPg==
X-Gm-Message-State: AOAM530WeLNaeD1scpeHr40/i1ECyFuDPklSPjVU2GiDBdzytSOGDXXs
 7zyrkK8IZchvFS3yGcDmdzepDcDfrIDAvduFD4CrU+XlVRWlWaQ5hw8PkDAS1v1Tb7u1/+bvUNY
 Mbp/JekKV6bm1t34=
X-Received: by 2002:a1c:9817:: with SMTP id a23mr10581869wme.171.1620062085721; 
 Mon, 03 May 2021 10:14:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2QHfd8QZZCPig0iP+6SiO5o4w3KIiB6RDA8xkHcjjEgsKyQUto3XEBcr2k3SzfFNV4xqCNQ==
X-Received: by 2002:a1c:9817:: with SMTP id a23mr10581861wme.171.1620062085607; 
 Mon, 03 May 2021 10:14:45 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id d5sm13581268wrv.43.2021.05.03.10.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 10:14:45 -0700 (PDT)
Subject: Re: [PATCH 3/3] tests: Avoid side effects inside g_assert() arguments
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210503165525.26221-1-peter.maydell@linaro.org>
 <20210503165525.26221-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <16b892e8-6193-31de-dd1b-7fa36e82be19@redhat.com>
Date: Mon, 3 May 2021 19:14:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503165525.26221-4-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 6:55 PM, Peter Maydell wrote:
> For us, assertions are always enabled, but side-effect expressions
> inside the argument to g_assert() are bad style anyway. Fix three
> occurrences in IPMI related tests, which will silence some Coverity
> nits.
> 
> Fixes: CID 1432322, CID 1432287, CID 1432291
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/ipmi-bt-test.c  | 6 ++++--
>  tests/qtest/ipmi-kcs-test.c | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3C2F6026
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:37:10 +0100 (CET)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00w9-0001Nf-MZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00u9-0000Er-Dw
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:35:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00u8-00017f-2R
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:35:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610624103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dcRajHcr1N/4P+S0A0AV0uaR8Tr7mSa4F7XPXvzMBo=;
 b=DVz7XBYs0WPTqily+WqLndL68U+IEt+r7A1jRNwnr00GVQZyfN+xQ2K3zXP8bJ5EPaJ5Yo
 CSeSUPqylRlTIugmrm9GHRaxdID/E35RX2ztX9jRVvNgl/CfkZyZojYi5R1ixP4gU4ZLcL
 C29JdA9M1aaWoJteXSD9hu2HNNMSkPE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-zP5GRu3TOYek972UHsmbJA-1; Thu, 14 Jan 2021 06:35:00 -0500
X-MC-Unique: zP5GRu3TOYek972UHsmbJA-1
Received: by mail-wm1-f72.google.com with SMTP id f18so1806003wmq.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 03:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9dcRajHcr1N/4P+S0A0AV0uaR8Tr7mSa4F7XPXvzMBo=;
 b=dE6083GzV2ZoYp0TcqHQsi0KtiZrv9WVy2/4xXrBK1zTASLOS890NibcQepa8XNB5u
 pxMNFQXNTws5fX4DiYiFYtvXPqXLE54spyqxQVopm8UI8qGPx061Y7Ca+9ZIQlOV7mJT
 /0i1e+gHCmIQ8l4/xlLCU242e/Hx3cGuP9md9pXrB+aB1EB9dy9M3UR8KT4IcBwi7gf4
 us6TmAqmHiIwvJ87K5rnBG/xMkXKa+jVdINhn7dB7gqhBC1MwzOVZy714IK6bINqcjzH
 dB3ihOf0Av7HwO4yeDVJkpyYCAFKsFEto2f6yB70qXs1a9tqjKZ/RfYHS2gOPURnoxm8
 CHWQ==
X-Gm-Message-State: AOAM530Nepv0oKS/0Gzk3PafQJRLOlHAOWOJtOX4nyNmQ52DhjmeAbj3
 LlH9KFo2XnaIwge9PdHvKnWSmess64qlTNXoWEW8m5wOj3lewFqig5w7t695QTqTO8a9cMLL3nm
 9avWFlGhXiTVYXUBAq3SSxs95dvinJuRBCJ/LSIIjtWrSqBDk78qE/L/pK5rSxByR
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr3637197wmh.114.1610624099222; 
 Thu, 14 Jan 2021 03:34:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcgI+3c4QPRIV3lsUo69z6s+JCyFf8l0Cm9CPKfU4PwP3tCicZSWRYvtF8E00NC8ElhI6eWQ==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr3637162wmh.114.1610624098842; 
 Thu, 14 Jan 2021 03:34:58 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u205sm7729569wme.42.2021.01.14.03.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:34:58 -0800 (PST)
Subject: Re: [PATCH 6/9] net: Transfer tabs to spcaes
To: Zhang Han <zhanghan64@huawei.com>, jasowang@redhat.com
References: <20201222082340.67405-1-zhanghan64@huawei.com>
 <20201222082340.67405-7-zhanghan64@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ec8d38ce-180e-4718-d39a-7cedee0a8350@redhat.com>
Date: Thu, 14 Jan 2021 12:34:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222082340.67405-7-zhanghan64@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 hang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/20 9:23 AM, Zhang Han wrote:
> Code indent use spaces instead of tabs.
> 
> Signed-off-by: Zhang Han <zhanghan64@huawei.com>
> ---
>  net/tap-linux.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

FWIW typo "spaces" in subject (no need to repost).



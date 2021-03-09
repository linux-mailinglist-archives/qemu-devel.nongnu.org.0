Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351F33323A5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:09:30 +0100 (CET)
Received: from localhost ([::1]:37360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaEz-0003vY-8n
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJa3f-0008VX-UR
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:57:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJa3e-0004YR-8B
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615287465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXWvbuBVFniX4JX9BiUt02YKZBohAC5KmK2NT6xHghY=;
 b=OY6A2opxabjr0g6F5Ve0HzNVOF3M2RaOrG8wnv5ZUAETrIMXBI1tST/x0GGg4qb98Z+AUy
 Hzk18TtzMiTlLvi0waqBOdXkO/ImFl+kINY5As68EbN7uQ5HajwPSNLKkFAEe5JahbtOVo
 nd/HeP3BNqiGVD2lkaQF567j925cy7o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Qz9um4A4OnG6GNfLRMv5WQ-1; Tue, 09 Mar 2021 05:57:43 -0500
X-MC-Unique: Qz9um4A4OnG6GNfLRMv5WQ-1
Received: by mail-wm1-f70.google.com with SMTP id z26so972563wml.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:57:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hXWvbuBVFniX4JX9BiUt02YKZBohAC5KmK2NT6xHghY=;
 b=J85A24vad3DaXVaNryjH7ye7ZGLEAiO2OvqqnCBoO7jx8I3nf+vTFwmxjjcj7rLJ7Q
 NeGf8JaxnZVkOLaErOp1bvP72mg2fgGGmEWdvjQuU0MWU0Dwo/lSHDD6a7Q7c88qn4ta
 OLN7HDA+KbnjgfWoI8g3WavuzoNbsQVkIkqu3FF8dlv1prRqyxN8fDSD66vb1oUEbVTO
 xWhiu5VgoNuKe2X41aF8ZT/E35UvK5/1iFAJjxNFgZwimtGAUQjAenNF/SGwz874TJGD
 gfssYrvctH7gcWQnzftioFMwC5DiVsMqurv6yYXMsQeuY1Qa/J4LNrzZhMkV7rjkRlgg
 0O5g==
X-Gm-Message-State: AOAM531FNccjblYZPz2qwX2KxT8CPDiVIIiO/dOMHbPgAJuxrQ7iJzVB
 un4NGr4bCjhMGEVFjq4VI5mrr2qES+RIyBJNkt4knfZ2XoB5t89gAw8RWJ7hlbvG0nMC7pGE6Wt
 OMDC/BiAE7QWBgzI=
X-Received: by 2002:adf:8547:: with SMTP id 65mr27775774wrh.269.1615287462363; 
 Tue, 09 Mar 2021 02:57:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEtrTd0dSrSYZeg0Px7Zg01XD1LjrGrEVevFA3G2vMMpx7J3+zriIV6zPzJm0+7xDow1BUQQ==
X-Received: by 2002:adf:8547:: with SMTP id 65mr27775762wrh.269.1615287462248; 
 Tue, 09 Mar 2021 02:57:42 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j125sm3382274wmb.44.2021.03.09.02.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 02:57:41 -0800 (PST)
Subject: Re: [PATCH v3] bsd-user: Add new maintainers
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210308224023.75187-1-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <49ed6b25-8ed1-efab-a0fc-4118451df35f@redhat.com>
Date: Tue, 9 Mar 2021 11:57:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308224023.75187-1-imp@bsdimp.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 11:40 PM, Warner Losh wrote:
> The FreeBSD project has a number of enhancements to bsd-user. These changes have
> evolved over the past 10 year, and aren't currently updated to the latest
> version of qemu due to fluxuations in staffing causing us to fall behind in the
> past. We're working on porting all the changes forward and contributing all the
> changes back to qemu. Add myself as maintainer and Kyle Evans as a reviewer for
> changes. In addition, add a pointer to our github repo in the interim while this
> work is ongoing.

Thanks for this explanation and for doing this!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)



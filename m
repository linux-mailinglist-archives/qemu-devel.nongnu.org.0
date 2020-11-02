Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F62A26CB
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 10:18:03 +0100 (CET)
Received: from localhost ([::1]:33844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZVyU-00058E-28
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 04:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZVxW-00047e-2R
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:17:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZVxU-0003V6-3l
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:17:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604308619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQMV9ZvxKIX641YFiRMCZuHjmOkgGNDRjq3GRDWw8Io=;
 b=ZXPcCimFp4YUiPuo+QJ0wt5qfvC1dlkOAl1+U6QQInvK/EwTTrIeIvGTjnQn4mHAxgORZ7
 zaIRqAmxeIPgfMEnlrXA6xnXOkEkZu0TEQZx+WH9ZJigOWDuROqTdtOIgFeIA42YEHqe9J
 sqYcybpLVHKUcHGtwO/l2NxqgxkFxis=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-qsVS5TgDMWSaLihuJaZLnA-1; Mon, 02 Nov 2020 04:16:56 -0500
X-MC-Unique: qsVS5TgDMWSaLihuJaZLnA-1
Received: by mail-wm1-f72.google.com with SMTP id y21so1391648wmi.7
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 01:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iQMV9ZvxKIX641YFiRMCZuHjmOkgGNDRjq3GRDWw8Io=;
 b=fSwW6jq643fhyMiXgpfSZUDySL2CMEu8D+RC9ZFr6+3ReU7GcrRv5aL9Jv9AOwqU/g
 5TkAGsx3XU8GagSwtvcQamjWwQQiLVB59sqmcgi6cNc1EnDIegRQpGLPbQ3tKQb8aoPl
 xgKKzqlUzf+lCeeQd6cQe8pVD3rvvA2N1Hud/8bvw9Ny3RC5uLRVlomVttqFoLmwhtB9
 DgwAC742kpXhtENVVK5YxC2hgqkeEOndnkBt5oCulvi6Tt6a8xIrnVUzwt95K7LBqSgw
 8RaCHRh+UJPugvjeJ//aJPjzYRLElWTJM6S1BF8o830syijddPdjClaby3j96EJAMhMq
 gfCg==
X-Gm-Message-State: AOAM533lkfnGl8Jn4QKfaA+SFTKrYogVIqf8PvFOwz5xY8Xzq7f7IKrQ
 3oGKUY5dpWHgyG1y9TkZWhPuauyXZKXi35YwZuWrLPPHyHsEbsPeNJwVU1z8NPcYjHafjAqgt5d
 xyFUaBPfXdaf2zBw=
X-Received: by 2002:adf:fc07:: with SMTP id i7mr13825582wrr.223.1604308614848; 
 Mon, 02 Nov 2020 01:16:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxP6IpcuGBA2LvpCKTqvxgRbfd3CD8LYHJ0CSLFbh3ysVvJa5VFdpTRsej9uV8BtFKd/rFpA==
X-Received: by 2002:adf:fc07:: with SMTP id i7mr13825565wrr.223.1604308614699; 
 Mon, 02 Nov 2020 01:16:54 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f7sm22434871wrx.64.2020.11.02.01.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 01:16:53 -0800 (PST)
Subject: Re: [PATCH V2] hw/display/exynos4210_fimd: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>, Peter Maydell <peter.maydell@linaro.org>
References: <5F9F8D88.9030102@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b2945df0-186e-e670-bdfc-34104d8ddf2c@redhat.com>
Date: Mon, 2 Nov 2020 10:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5F9F8D88.9030102@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/20 5:39 AM, AlexChen wrote:
> In exynos4210_fimd_update(), the pointer s is dereferinced before

Typo dereferinced -> dereferenced.

> being check if it is valid, which may lead to NULL pointer dereference.
> So move the assignment to global_width after checking that the s is valid.

Easier to read "after checking 's' is valid."

> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/display/exynos4210_fimd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



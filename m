Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361984A5C8F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:48:13 +0100 (CET)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEsZv-0006D1-PU
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:48:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEsIQ-0003aQ-Q8
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:30:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEsIN-0008P0-Ij
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643718601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L97tYqIp6Wb46FejmGXeLdHOw3OJilCxzQAEsLJHpbw=;
 b=Krr04R6GUlQSsEib5IaIYvHm8dg+UX2MHa7w2+0l1WZneJwGWWIxS4NXue/KPIqEnfZwgm
 kHOgjzrsY2f9rlOCNM9ctDHRXRBu9ofQ7VbSvAIoD7tgNbKuisZyc8p6QTmVpF6vVST+5e
 GfxAAjEtw1jCQAvmNpukKRTuVlF4rm0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-_uVPErK0O5WxZTGzJJOGKg-1; Tue, 01 Feb 2022 07:30:00 -0500
X-MC-Unique: _uVPErK0O5WxZTGzJJOGKg-1
Received: by mail-ed1-f72.google.com with SMTP id
 en7-20020a056402528700b00404aba0a6ffso8600346edb.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 04:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L97tYqIp6Wb46FejmGXeLdHOw3OJilCxzQAEsLJHpbw=;
 b=RaOpE7J0jGTacsNzj11Q0Bm3SwLKcI4rK6h+ZmmjXnbcXNQLyZ9cStSKjl9wiRvLXJ
 +dsOFNclQGpmfB9Zw7nazqKr64ZnBocqAqKT2jwN3b2TtnzRI4x21SFQMw9I7cn52HXk
 ZfuEfh6CBP0w6kaw4TH++jEIH0WCyEHjax8l6zB2f84dkKQ6BX94fWROIdmx+k1RNFCV
 mLAlm47+oONwMK6S1h0Sv4uatdWo+C7tgsa7l9/Vvwi4YzdflW0/1EqbOc0tPHmkgeYF
 XwMn2IuBSjX3Qm7kEaEb7pQHxJ+l2HwCF8Ri4nfIRaik6Hn+lXpDQbqW85d7kfKQWVwX
 OLeg==
X-Gm-Message-State: AOAM530FB0RzPRBsh1IYGRzlizSMDifb5ZKJYu/2Ep93fmVU/TkQO4WE
 ojZxmUNV01aGVHH/4WOb4YN1QQp6p2XYx/+iN4KmDnQc2qv67hrWUmZAaQcN46n3wMfxQqrQ/hI
 ghVP9v7sINy7wF2M=
X-Received: by 2002:a17:907:1c12:: with SMTP id
 nc18mr20827242ejc.669.1643718598818; 
 Tue, 01 Feb 2022 04:29:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx790ZmNNnoNt8coegwmZtBiefl5FlifrGShZ2HgvHcKUkUiyIADOiB6zrLRCfA28vk+dnLFw==
X-Received: by 2002:a17:907:1c12:: with SMTP id
 nc18mr20827229ejc.669.1643718598600; 
 Tue, 01 Feb 2022 04:29:58 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id q5sm6919336ejc.115.2022.02.01.04.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 04:29:58 -0800 (PST)
Message-ID: <d6c0f82a-6620-beb1-4769-438a3986eef8@redhat.com>
Date: Tue, 1 Feb 2022 13:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block.h: remove outdated comment
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220131125615.74612-1-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220131125615.74612-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31.01.22 13:56, Emanuele Giuseppe Esposito wrote:
> The comment "disk I/O throttling" doesn't make any sense at all
> any more. It was added in commit 0563e191516 to describe
> bdrv_io_limits_enable()/disable(), which were removed in commit
> 97148076, so the comment is just a forgotten leftover.
>
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/block/block.h | 1 -
>   1 file changed, 1 deletion(-)

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block



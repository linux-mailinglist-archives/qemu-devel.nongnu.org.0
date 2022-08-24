Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68A459F8E5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:57:50 +0200 (CEST)
Received: from localhost ([::1]:45488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQp13-0000pp-Ay
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQopA-0007YN-SS
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 07:45:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQop5-0005ld-QJ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 07:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661341526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jc8R56YnFWtmAtStQ1irgcCafl7rYLkmpt+zGRmgncY=;
 b=AjUQLocsZnW/J+S7j2eOGICygF31w8jogCngVcd6NsMVxoD4qIo6PE39VR+VsWkA9Mo7NM
 cwIn/R/P1zucZhsOQEeJLg/dLX7qXMYtW3n/coXLMfSZ0WzCUCL1sSVvvhd0AzCfY+vWrh
 byzTEEtespmP5aQfkBxZYRC5wzT33D0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-8f0ZffoMO7ClZkZCUr4GCA-1; Wed, 24 Aug 2022 07:45:25 -0400
X-MC-Unique: 8f0ZffoMO7ClZkZCUr4GCA-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay27-20020a05600c1e1b00b003a5bff0df8dso1693805wmb.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 04:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Jc8R56YnFWtmAtStQ1irgcCafl7rYLkmpt+zGRmgncY=;
 b=nnSEc+c79fh01WyCmZT7xQ6lM2xXyix49rXVyFKYoXLdCUfp2MiG+zgjVdpBwrPcV1
 vIPJt3MKaNOjtfVy0AkCQYrs46aoaEk+rGZXzejPqbaT/9N5CulIIAQ4Mm1146yEvJow
 gw4S2/CW1RCLiDHQBbcgTyWdfDjU9SGx/o+c0OOlpjAc032qZwwfSAKrUxVVNSQ5RM7A
 jCUAwiyax5LRB76BItyeNEDQywSbcUxgnrJjWxNiOBq41vWW4L14ltuG2+cmwnkqRrhV
 yaWxFv9vVSDFmuxItut3+qkJPRQUZLaeH15Q9w9QtNMnc9vWkk3svddQnDesjnQ0tHTs
 odzg==
X-Gm-Message-State: ACgBeo0tjce2lTMNTBVu5Iy+4vZ9u/1jhwpEoQ6xwItbjzRxThm3OwNN
 CynZZklXHnslswLlzyflJNFBXzonLB6aPdIOu10oxpRh4zlQHIIro7qIllpFDnZgPhqR573kgui
 D+QXXQLurvBb7bFQ=
X-Received: by 2002:a1c:44d7:0:b0:3a6:725:c0a7 with SMTP id
 r206-20020a1c44d7000000b003a60725c0a7mr5166515wma.137.1661341524499; 
 Wed, 24 Aug 2022 04:45:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5nDokhu1HJcg4lCkviYmKYpBcEMwVJaxgVl4ZG31lAsTiBIsjEGp0nkqV24OLfrc8DoU682Q==
X-Received: by 2002:a1c:44d7:0:b0:3a6:725:c0a7 with SMTP id
 r206-20020a1c44d7000000b003a60725c0a7mr5166495wma.137.1661341524254; 
 Wed, 24 Aug 2022 04:45:24 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-177.web.vodafone.de.
 [109.43.176.177]) by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c4f4500b003a64f684704sm1880743wmq.40.2022.08.24.04.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 04:45:23 -0700 (PDT)
Message-ID: <e1e69923-326e-2eca-e067-f12e0f308e79@redhat.com>
Date: Wed, 24 Aug 2022 13:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 01/51] tests/qtest: Use g_setenv()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-2-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2022 11.39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Windows does not provide a setenv() API, but glib does.
> Replace setenv() call with the glib version.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/fuzz/generic_fuzz.c | 8 ++++----
>   tests/qtest/libqtest.c          | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



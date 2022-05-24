Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADADB532714
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 12:08:04 +0200 (CEST)
Received: from localhost ([::1]:40340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntRSN-0001up-G4
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 06:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntRLi-00086w-Ns
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntRLg-00029P-Fi
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653386467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9cvOPJjG9q/qR9uxSDaQwdPqRu4khRBoMuhQ5aazI0=;
 b=D8Uum8nDtjaxIHJZ6rpilonB6KT05rnkKDn2puBmEJOOoUPDmq2ahKyuqpK6V+RKIe3vO5
 zOUgs+410iGGZ05Z2dhIAhp+8wag6YuYGZSaMi9ebnYZN+a5NAhkz25fgSGecFZmsEZl5p
 7EOXbCpWIpE60EEmy6fesHP1aQj4PGQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-Gbk2_bX7PaiKTYAkjPPhsQ-1; Tue, 24 May 2022 06:01:06 -0400
X-MC-Unique: Gbk2_bX7PaiKTYAkjPPhsQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l15-20020a05600c1d0f00b003973901d3b4so3820728wms.2
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 03:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x9cvOPJjG9q/qR9uxSDaQwdPqRu4khRBoMuhQ5aazI0=;
 b=KjvjjXKS1KK8R4B5E5kTKXqQyAlgdvRmV5yt7VhTPjAJvuJhx2PQXVFKa5YgNFrYvy
 Fpu7idrd1XCkYcpZaghxClFKmw5xZIHG/Pb6oYuQg2cNZ1vRaCvn6asqXnmOVw3HWAnK
 vRL3T5Isfkq6biooemsJcbszB4xDyG2LVIj3sgdUuntJyDDQUsn+gtQ6iB8UAjJR/Muw
 9C/6XK4WNL2qHsXUtvrzvfkWet9Rg3RDU1eb2RdFa2BAMpJUvmvYcs3bLzZHA+4RLD9f
 6hLYs93ruBp2pE9QvRKRALA8sLAvEIE0A83GJZio0XLXOEFjUvcmAx1CZcXfPqfI8oi2
 ZFSQ==
X-Gm-Message-State: AOAM531AVM+7DkQfedbrzJHsURD3IuwWqYA//BO1PqYI6oT+Z2xdL/Tj
 r4c6NS1MKBT5d31JA60Xw6Vfj9z3C/Th9CeyfCnZLNeRyMcPfgFB7VJJvcIXfUFDeIMMlEk8L9y
 HINqpAZg1EueNXB8=
X-Received: by 2002:a1c:f415:0:b0:397:2db0:ed73 with SMTP id
 z21-20020a1cf415000000b003972db0ed73mr3025657wma.19.1653386465276; 
 Tue, 24 May 2022 03:01:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwtJzs9G9wwE8WULhIs4YYLul5lHcXw7u3JKIRAtuJvmBLGgmagkhcrMIFoMqjCjvobQRzyw==
X-Received: by 2002:a1c:f415:0:b0:397:2db0:ed73 with SMTP id
 z21-20020a1cf415000000b003972db0ed73mr3025633wma.19.1653386465063; 
 Tue, 24 May 2022 03:01:05 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 u22-20020adfa196000000b0020c5253d8dcsm12672599wru.40.2022.05.24.03.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 03:01:04 -0700 (PDT)
Message-ID: <07c48274-4c7c-a695-ffda-fa349b187ba6@redhat.com>
Date: Tue, 24 May 2022 12:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] s390: Typo fix FLOATING_POINT_SUPPPORT_ENH
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, david@redhat.com, richard.henderson@linaro.org
References: <20220523115123.150340-1-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220523115123.150340-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 23/05/2022 13.51, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> One less P needed.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   target/s390x/cpu_features_def.h.inc | 2 +-
>   target/s390x/gen-features.c         | 6 +++---
>   target/s390x/tcg/translate.c        | 8 ++++----
>   3 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

and queued to https://gitlab.com/thuth/qemu/-/commits/s390x-next/



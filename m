Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAABF6A8842
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 19:06:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXnJg-0000Jp-Ht; Thu, 02 Mar 2023 13:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXnJe-0000Dx-Gc
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:06:06 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXnJa-0004sd-QT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:06:06 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so3617124pjz.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 10:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Xk4m6EXnkTI1Us4U4T9afvMJUViuR/jIf8uJdt/75o=;
 b=vMQ0WPjDM4Yk5i7Mx6i+bwCsCeu96iJj6js5ta35GsGddEtsGT/ysq3Z8oea+9quY/
 /CoDnzNhgikmBJiGf+w/tm+XozdK3HCJ3LW1hOfmOIPIc/Cf2hxpMH4u4mR8GvMWb+hV
 UnQ0O4E2+sQrJhh5QxfoOxqr2aHwESie3cSmmdKFP2x/7bVcuDvr7zKER+3j9ztTYu5J
 KZtyuuS1JtsEA9M0RKaGAsawjrecvzyLl7yKqbW9pmKX9TBT3euvbLrbcWxt50DskSgK
 b/+nkchyL5I9DsKiIOwoRZ1tLu/8uQYiwuLrL7qUucbVSWfqIA5LFZ6jcZSe/abIu099
 qlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Xk4m6EXnkTI1Us4U4T9afvMJUViuR/jIf8uJdt/75o=;
 b=C0p42bQrB05pH7qW+VOfYEvGngc1oPw8JpvBN+57znhN41RdDdXU0f+pvu6zZpy7k+
 BVlpR6G3b4paL7d0hpfkt9AMIsADTSwiYL5R4vG8I4NCiXIuHOEd/gph+f7C2Wkt9MbI
 PpMHt+1zpoqK9R8Ax4IeHxLK14XAJiY0W8DPIlQCDecMQEY6dFX0MHQhsCQ4MuDDZu4U
 rAet6BBllsL8URubspnDANsgWgI+H5cYvp8guCLQ2xxkRsg+KlkUYlTdfG10mlyU1XNA
 3/zWzJj+xacw9ueQH3++v4V+K2CQLPQBqksnbbB7X/QN93ixXj10OVZVFlm2m8P7mGZm
 1oeQ==
X-Gm-Message-State: AO0yUKVbsqPIuK04LtKI/0zN+2KAY2JYw4FFvGBlxvr5qpUH4HQzmuAo
 w74ySBRWTq+Axd+NuNGUHnHbCA==
X-Google-Smtp-Source: AK7set80dbPDRPghP1zfGKx2DFKwmyxgKoP2fiK8jm1FjaEyEAAICiP/jkV/OY0gdQAtVRFm0yzXZw==
X-Received: by 2002:a17:902:d4c1:b0:19c:c184:d211 with SMTP id
 o1-20020a170902d4c100b0019cc184d211mr13957217plg.37.1677780360706; 
 Thu, 02 Mar 2023 10:06:00 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:d17e:3ddd:751f:fd5a?
 ([2602:ae:154a:9f01:d17e:3ddd:751f:fd5a])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a1709028c8400b00198ef93d556sm2340plo.147.2023.03.02.10.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 10:06:00 -0800 (PST)
Message-ID: <d7ccd193-657a-70b7-de3a-59fe09913bd6@linaro.org>
Date: Thu, 2 Mar 2023 10:05:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 27/27] target/s390x: Enable TARGET_TB_PCREL
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
 <20230220184052.163465-28-richard.henderson@linaro.org>
 <0a437546-3b18-3a3a-6ffb-afa93a93c170@redhat.com>
 <6840da18-ca5f-db7c-a60a-1f2fb45d806d@redhat.com>
 <5b5522c0-7a14-a5c6-506c-bc2895c3a8e7@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5b5522c0-7a14-a5c6-506c-bc2895c3a8e7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/2/23 03:03, Thomas Huth wrote:
> Could you please have a look at the last patch to see what's going wrong here?

Will do.

> ... and since soft freeze is approaching: Do you want me to queue the remaining patches 
> except the last one, or does the series only make sense as a whole?

Let's defer it all to next cycle.


r~



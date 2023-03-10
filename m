Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9EF6B3E88
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 12:59:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pabOJ-0002Ex-U2; Fri, 10 Mar 2023 06:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pabOG-0002CU-Q0
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:58:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pabOF-0000Fy-54
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678449505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkmqGB/t0RzGwIFVqCpBWsIMpWc5obqYhed38/AvOJ8=;
 b=fOKGSZ8/fzHGFYyOa2Ee0HICKkj/USO57rdWAHmPTw02a3vCMf2pbi9qUvOaYds7ZVjwJl
 ks1bxvW/4jATCwOp1imDLJ/XbO18JmH141iL6cq6qZwWat1tHWa7mUuwPHKBKeeX+q8omV
 WA0U6gnz+baVwMvJdc+dOqJwhk1lvtA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-X86L-3j3Me2b2FbM8KpQJg-1; Fri, 10 Mar 2023 06:58:24 -0500
X-MC-Unique: X86L-3j3Me2b2FbM8KpQJg-1
Received: by mail-wm1-f72.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so3748106wme.9
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 03:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678449503;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tkmqGB/t0RzGwIFVqCpBWsIMpWc5obqYhed38/AvOJ8=;
 b=oKHR3ah2ijo02nUKliQnCEa8ZBeaeJ1qkVuGEH+M9pD6r6PfmzdoD4D8+fFeOYrSZF
 Jf2Wm3E/GOfJWg1x3mMkP5LtdNw54MZQ1j4WOqiTUu1S7sqYQ6AxQWO3TsysoXNpqVif
 vOpouetRzb/DA9yQsSaViC1F1NZmGelXbixO8CMDjfECM96X6qNh5yBHWK0gZ3JbcFIY
 xGYqLq7ETqSLWCra7Wf+T67WKszqQDvxFhkY7rzkBuPuo4V0eAVVU0xHYTAhpg/rhSG4
 CS+EoK7b2DJHheNukd08IAmq2gPRPcqyHDPesEtZRitWkx9RZhIxpb3T0SCa8xS73i1x
 cuAg==
X-Gm-Message-State: AO0yUKX2bukipuk0Zehh2sFO3uIWl2A2aBCRXcqFqq/VdXj60xo/p3oO
 0iOn3r13+cG+cnNUdnqJrZ0DxfHm78NxV86z2+ym4DpYYqpjsy6Viltfdv2Jyjqk282AKUIsh48
 7yqLB8EOJQfuKN30=
X-Received: by 2002:adf:ce87:0:b0:2cc:498d:b902 with SMTP id
 r7-20020adfce87000000b002cc498db902mr15397357wrn.59.1678449503442; 
 Fri, 10 Mar 2023 03:58:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8mEKMuV2O7APaYqQMDzsbJ9caJnWGpO3GhwCk5auOOGIs6edthNnT2NZaf5BAS8sslEB1oAg==
X-Received: by 2002:adf:ce87:0:b0:2cc:498d:b902 with SMTP id
 r7-20020adfce87000000b002cc498db902mr15397346wrn.59.1678449503177; 
 Fri, 10 Mar 2023 03:58:23 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:1100:12e6:ffa5:775d:18ee?
 (p200300cbc707110012e6ffa5775d18ee.dip0.t-ipconnect.de.
 [2003:cb:c707:1100:12e6:ffa5:775d:18ee])
 by smtp.gmail.com with ESMTPSA id
 z10-20020adfd0ca000000b002be099f78c0sm1962753wrh.69.2023.03.10.03.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 03:58:22 -0800 (PST)
Message-ID: <8c41d818-1b49-c063-f63b-b92f234f3ec2@redhat.com>
Date: Fri, 10 Mar 2023 12:58:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] target/s390x: Fix emulation of C(G)HRL
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
References: <20230310114157.3024170-1-nsg@linux.ibm.com>
 <20230310114157.3024170-2-nsg@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230310114157.3024170-2-nsg@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10.03.23 12:41, Nina Schoetterl-Glausch wrote:
> The second operand of COMPARE HALFWORD RELATIVE LONG is a signed
> halfword, it does not have the same size as the first operand.
> 
> Fixes: a7e836d5eb ("target-s390: Convert COMPARE, COMPARE LOGICAL")
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



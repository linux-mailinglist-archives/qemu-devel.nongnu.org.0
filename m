Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7266B3E89
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 12:59:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pabOm-0002Rl-Gc; Fri, 10 Mar 2023 06:59:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pabOk-0002QK-0O
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:58:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pabOi-0000IL-Js
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678449535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hIf8lnQqQlYEUHmJQ1tYvuY/koaGbCf9uJfhPEaYxl4=;
 b=A+Vc38as4Z0ls+6hEF3Q44aXU1oLGkmYzObyUlTxaJnF6S2M1V2p7g2TdEX0L1++0jfgF/
 xGjswEeB2yFMQFysYR2gDDSqaiw3b7hwuTcLBIN09vY/ZcKX1LmEHW3GMhDZvOHOZqgD/q
 yjYgNCYc3yHAvGoO5Lk4rk1t54YhJfU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-nwPLb3qiM3Cc6pSx4wPjvA-1; Fri, 10 Mar 2023 06:58:54 -0500
X-MC-Unique: nwPLb3qiM3Cc6pSx4wPjvA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso1720871wmi.7
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 03:58:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678449533;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hIf8lnQqQlYEUHmJQ1tYvuY/koaGbCf9uJfhPEaYxl4=;
 b=tjYVjRcuALteEIJ04mpcJ7BmrEySYmRdRRbTZZocXFMj6mPNy93UNuzsnWOvIUgtfi
 H88MQW+ieoR9dSOPUbomivdgza91vVcJ3fTY5CL+vcW46qcre5ZfxTWzt4jDIlkLSDG5
 Ug92cZ8NspMBHuCwCC1JtxafxdYZmvpVZ37dWsewUVTswbC3gCqdo+HuY7p6N3v2bRbL
 LRRMvYoN1s8thSb0PRydCZRInr6ow9ofNIO9zPHG0G3Ar6yZKb+XKxonIMU9K4QV/Wnz
 bT8ITMsjeN1c6mJ2a1mPdr83JrG9EPQFwGX7sBstrENNIKkWfeVhk4rx8MvZYC6mstSs
 MdcQ==
X-Gm-Message-State: AO0yUKXT2DByELVWmS72HkiwXqdF4kJDXodNUxF6TC67bIo4RMSaS19b
 RvSfCFX2EyVTHAaUD2gzVpf9pjitTKUNtQS6vJUlWWEpHOd7qrQu704BAnGhlLTR36APR2L3cv3
 MDKced931zndX1B4=
X-Received: by 2002:a05:600c:4f53:b0:3eb:29fe:7343 with SMTP id
 m19-20020a05600c4f5300b003eb29fe7343mr2406532wmq.33.1678449533281; 
 Fri, 10 Mar 2023 03:58:53 -0800 (PST)
X-Google-Smtp-Source: AK7set8pBWYsiV1c/G1W1xM2eLM4ptlKusV4Mef2PIWA1lxZlERsLCbcnDIYWCfOpesb7GF7FmN2ew==
X-Received: by 2002:a05:600c:4f53:b0:3eb:29fe:7343 with SMTP id
 m19-20020a05600c4f5300b003eb29fe7343mr2406516wmq.33.1678449532989; 
 Fri, 10 Mar 2023 03:58:52 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:1100:12e6:ffa5:775d:18ee?
 (p200300cbc707110012e6ffa5775d18ee.dip0.t-ipconnect.de.
 [2003:cb:c707:1100:12e6:ffa5:775d:18ee])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a5d6a44000000b002c70ce264bfsm1985280wrw.76.2023.03.10.03.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 03:58:52 -0800 (PST)
Message-ID: <46215d2e-4da1-8992-ab01-c2572a72b360@redhat.com>
Date: Fri, 10 Mar 2023 12:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] tests/tcg/s390x: Add C(G)HRL test
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
References: <20230310114157.3024170-1-nsg@linux.ibm.com>
 <20230310114157.3024170-3-nsg@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230310114157.3024170-3-nsg@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Test COMPARE HALFWORD RELATIVE LONG instructions.
> Test that the bytes following the second operand do not affect the
> instruction.
> Test the sign extension performed on the second operand.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9868459E720
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 18:24:44 +0200 (CEST)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQWhn-0000PR-Fd
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 12:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQWTb-0008Ci-7G
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 12:10:03 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQWTZ-0007AP-HS
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 12:10:02 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 r14-20020a17090a4dce00b001faa76931beso17692909pjl.1
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 09:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=X8BB0jmGw6MVEHlq5B6OZ9eBbIcvZgml+G1lyXCNYv0=;
 b=XJp/RWKuUTPLmN6AhTCjAwPUggG1Aj2i0a6S1xrAkLv7H49Nj7RHpZF2lZjM4AKL+N
 fCVYNuwKQJubwAQP/j3rcutrTz/8gbRmFmTRf/UfYbQ7W4t+aA5elwBrtOWMi7Be/sIc
 HR+quG1hXIzUcNkM8qSsUp4p+7/1MiKlxYOs95uJmMIK0uIdK/oYbL1MxfHlRlHIEskb
 ObGzK1R/bKerwyKd4oGBTMW31In4ta2slzNjAO9XmIk+cYZHJsf1SE5lj5EBckWUg6qF
 ARAv2H6xCXa2IvhcXqf2v/FlAxcgQHIfu40DegE+uz83cGAWsN4a2wn271FXFVhb8wPm
 yyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=X8BB0jmGw6MVEHlq5B6OZ9eBbIcvZgml+G1lyXCNYv0=;
 b=GfhIKpEoxdkzl47/ND42IKMydwmKBlScPlHn59bwWXnwjqtsjpyB2Y45X+qkXaw6Mq
 SdU37nRt8hzzFQBlfIQrx0GNu+w3ulp+c78tTqj7VfpbxjtVz8xetEuunQLVlJH+iMEN
 4thcGk05osYxy4RQEYaXdfr++p3Z4zbJGdXMr54XygA33Q3JEgxVR+8WQEI7Q0X6TNlx
 tw21VtJsbXbuWuAeaZiH6D9y1Togxtuwr21plEfXt84jpnf2brLeFZpnBEmvGZrIbTDe
 dQx9OC7Ret+UGxLaYuLBiKDTBOXeVkw9yfGgZZhU6KeZoGclD1nLM3dV6EePaxH91k1s
 pMgA==
X-Gm-Message-State: ACgBeo3WI2f9Xd7uRTHS47ijnRwg9raZy++RuXg3uLkOTmm9l/7p2GEj
 ETxshWc5i8j/hKWMrGzPaFsOqA==
X-Google-Smtp-Source: AA6agR6GF0mIfZdTS8numTH+mhqgm4DXXdB59kZMJaarg7/StrZdKbZc8/F7EAdovywUJQaj+l1eaQ==
X-Received: by 2002:a17:902:ecc1:b0:172:dd1f:5b76 with SMTP id
 a1-20020a170902ecc100b00172dd1f5b76mr12444206plh.28.1661270999507; 
 Tue, 23 Aug 2022 09:09:59 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a17090341d000b00172aa97b628sm10661926ple.186.2022.08.23.09.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 09:09:58 -0700 (PDT)
Message-ID: <3680123c-c025-7e8e-342a-def8bf73b134@linaro.org>
Date: Tue, 23 Aug 2022 09:09:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/14] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
 <20220822235803.1729290-4-richard.henderson@linaro.org>
 <104a0560-e1ca-1aca-1ed5-07a00ee74240@redhat.com>
 <4692433b-9592-4de6-bbd5-00d001ff82ad@linaro.org>
In-Reply-To: <4692433b-9592-4de6-bbd5-00d001ff82ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/23/22 08:19, Richard Henderson wrote:
> On 8/23/22 02:19, David Hildenbrand wrote:
>> 1) s390_probe_access() documents to "With nonfault=1, return the PGM_
>> exception that would have been injected into the guest; return 0 if no
>> exception was detected."
>>
>> But in case of CONFIG_USER_ONLY, we return the flags returned by
>> s390_probe_access(), not a PGM__* value. Maybe it doesn't matter,
>> because we'll simply inject a SIGSEGV in any case ...
> 
> I would have said it would matter for MVPG, except that is incorrectly *not* marked as a 
> privileged instruction.  There should be no CONFIG_USER_ONLY case to answer there.

Ho hum, misread that -- only privileged if access key specified (and we do not check or 
support those).


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611EC69B24E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 19:20:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT5LP-0003nE-6V; Fri, 17 Feb 2023 13:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT5LI-0003Zb-Hn
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:20:21 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT5LG-00043z-Fi
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:20:19 -0500
Received: by mail-wr1-x42f.google.com with SMTP id i15so1607641wry.8
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 10:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ryTc64tBaqr0Xe4LXWLcKTCCkRDlwEPvCfVFkdP+ScU=;
 b=GuTqVUwQefWrrS9UsMraUZR/bVJ6PHlUfU1efvYOpGZSmk+rC2+rBteTgLP+X/Oypo
 amRV9LVMnWfaeShGrLKbJ6nnZuSASaqTqm6TP+7Gg4h7cTGRFzoQucfDFGE/tBabnlTf
 VcX256fbv5O5UBmPvnpvWt3QzgFBxLDsaC9Z8su1Zun+VJc7oFquKGnAbHFYPtURGXgk
 tFecMgzAo5RXwE/oyQpRgL5sFDXQPG5jCWHMXp1dUhUAtaVzfvZE74Utw078DdCNBE9r
 QmZnHE/l4Iy/o5Q49KpygTBH3g3qsPt5oMQcsqWAUXdo6cpKyAXyQf4iQW2qmXy2G/Xp
 A2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ryTc64tBaqr0Xe4LXWLcKTCCkRDlwEPvCfVFkdP+ScU=;
 b=yFvcLxvTOrFlUqDhYXntKdunNmjAr332LUzcCdRFE78XM/aTYQ9zF8c7i3qH4PCjBt
 W8ghLM3YiOGgvmbP3SlmQbz3U5iD4maWsFdG6PboNeWdoYZHvN2ODdB0BJp5Ln6e3rje
 +n+nxNGymd9a1+KJHNp5SGpgU+4/esIIqd8/OJbiQjR4LZtk02mrDLcpUfa6LiAS/3Mr
 FG2BeCflMXpm+YE3EJBclNUPUD+rEgpoum7LHOqmAtK+ECgOQU3j32xOxiBAEmTRgcV1
 nAiRXH3rcAauzJNOz4U1VYwfL5QzDFvLAHCLBBKf5pT3FoIVO3DCtmo9uq7rBajQYbB/
 ybsw==
X-Gm-Message-State: AO0yUKXZhp6oK7jtw11NuYtvogaGKmhWHBbGphb4apIFWU4SJwgmGwMD
 JX4VHkfXgeSqnzMMxdDPq4eXzQ==
X-Google-Smtp-Source: AK7set/0JlZlcOjxxCXSzz5y7kYV3fcxOi7pq1dTJtSHY2BNmYHSrY2DGK17KB+2Hs+P4hle3PUFSw==
X-Received: by 2002:a5d:644d:0:b0:2c5:557b:ee8e with SMTP id
 d13-20020a5d644d000000b002c5557bee8emr1360278wrw.17.1676658015777; 
 Fri, 17 Feb 2023 10:20:15 -0800 (PST)
Received: from [192.168.126.175] (217.red-88-29-172.dynamicip.rima-tde.net.
 [88.29.172.217]) by smtp.gmail.com with ESMTPSA id
 a10-20020a5d456a000000b002c559405a1csm4879237wrc.20.2023.02.17.10.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 10:20:15 -0800 (PST)
Message-ID: <6be6bf58-cf92-7068-008e-83f5543a1f01@linaro.org>
Date: Fri, 17 Feb 2023 19:20:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/4] linux-user: fix sockaddr_in6 endianness
Content-Language: en-US
To: Mathis Marion <Mathis.Marion@silabs.com>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230217163527.619486-1-Mathis.Marion@silabs.com>
 <20230217163527.619486-3-Mathis.Marion@silabs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230217163527.619486-3-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/2/23 17:35, Mathis Marion wrote:
> From: Mathis Marion <mathis.marion@silabs.com>
> 
> Fields sin6_flowinfo and sin6_scope_id use the host byte order, so there
> is a conversion to be made when host and target endianness differ.
> 
> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
> ---
>   linux-user/syscall.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



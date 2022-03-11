Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E34D692C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 20:43:59 +0100 (CET)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlB8-00033X-PA
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 14:43:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSl8t-0001VM-T0
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:41:40 -0500
Received: from [2607:f8b0:4864:20::102a] (port=39806
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSl8s-0007kW-F5
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:41:39 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so11946043pjb.4
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 11:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JtflmEVuKWeMD8q+pW6jlGFp7yVRUVZn0LtjAO2YjrQ=;
 b=DfjZX/RqYucKPzVWiATuB+7YMPmtZjAtAIR8t0i4pd56lVNdXijhtoexzG1SvIsBoS
 /H3uXjMUMpTa4Lgurrs0rHJh3GUjAcHpqYjOtDW/Yg3q0O1WhjJpMeVsRToQQBdmYvlC
 lcBE2WlFpr2RXdSR4j6bKOxAFFqMBl5+KLRoNKtpmjkTIf/fkN/DuJg702lwirTHWKC6
 6ZzlHZAfhJzkwH4FVK3vdhLdoTZDqWHPEpvZ8PunIsO1MtdrGUMOUrSbe6hRJAIKJjY6
 6ykHjnRhX26/WhFTCPjFTrb6JtKdLUDkqiXW7A1wYjxtzEy6v0NdgAVtpSQhMhK+tLNk
 8CFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JtflmEVuKWeMD8q+pW6jlGFp7yVRUVZn0LtjAO2YjrQ=;
 b=QyZDT98ZZyUH+h+PPKSiTA0ek884C5I1nlQpxbh7A4MxcoC10eCZHdAaWAJwkbN6wk
 HzVPcY6UEVn5F3p8E6hN0OYGCX9lV9k/vU00H1l1J0ym4CtEL5KxhBSveT2/Jthk3jU/
 I7c4vN3+HxZfhRMRQcwq+UTcFydJKqeDTQZsrN6/B9YTVv3uuOkgGy5Yx/JktsTto+RJ
 DZQZrFUGprPAW359vjzROOKsfqB6kRVYYmwdHmGdTa6lgZKVDF0hxVOl0X0aGdzyWPjM
 tLWx5Qb8EqsDuGjYFy1YKd9TS3W4Zk6ZPJfDdYDPRWdD0cxBglc2ab1GFjTzNQGTIUIB
 P9MQ==
X-Gm-Message-State: AOAM533VTM1sETLzObdbbvE4SZad+7InhcBmdA5B0J9pOnsL+5MWH5Gf
 gPEjRkyl5aGAB5C+hkh0k18t1A==
X-Google-Smtp-Source: ABdhPJzqBpjrcabVj75EPhgDDfraLP/THsU/nyJ7ELg3PL4jPeeXN+oYy8F8OctQn/q6lNz1CE1zgQ==
X-Received: by 2002:a17:903:1247:b0:151:9602:b5a4 with SMTP id
 u7-20020a170903124700b001519602b5a4mr11903764plh.14.1647027696091; 
 Fri, 11 Mar 2022 11:41:36 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056a001acd00b004f7a2f18e61sm178725pfv.137.2022.03.11.11.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 11:41:35 -0800 (PST)
Message-ID: <6de0d42b-7fe6-8ab0-c1a6-277c67228450@linaro.org>
Date: Fri, 11 Mar 2022 11:41:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/9] dump: Introduce shdr_num to decrease complexity
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310110854.2701-1-frankja@linux.ibm.com>
 <20220310110854.2701-4-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310110854.2701-4-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:08, Janosch Frank wrote:
> Let's move from a boolean to a int variable which will later enable us
> to store the number of sections that are in the dump file.
> 
> Signed-off-by: Janosch Frank<frankja@linux.ibm.com>
> ---
>   dump/dump.c           | 24 ++++++++++++------------
>   include/sysemu/dump.h |  2 +-
>   2 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


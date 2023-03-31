Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664D6D1DFE
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 12:25:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piBvx-0002eW-AZ; Fri, 31 Mar 2023 06:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1piBvv-0002eN-7S
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:24:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1piBvt-000848-T9
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680258273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Of8Gb92Y0qFnabSvEPEQDneuJ3DU2OP5iC1mUcqXLHE=;
 b=KAF6R7eZ2kuVcW/KJsedMFZE6goIaQyG0X00Tba+3xEJs9tRjKie7JQAywm90G0+bOHFA4
 ozshPwAx1thzDAivvklCupIFgR5h09ksnSb+P3nxfHdDBHsZwnLmLsGO9q4rRdiJ1KKmLt
 v2/pRH11KW1fDOS6zBfh02rNzWSq1ZE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-QX0h8EXTPsSCJaWKY_iNlA-1; Fri, 31 Mar 2023 06:24:31 -0400
X-MC-Unique: QX0h8EXTPsSCJaWKY_iNlA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l18-20020a05600c1d1200b003ef7b61e2fdso5107470wms.4
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 03:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680258270;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Of8Gb92Y0qFnabSvEPEQDneuJ3DU2OP5iC1mUcqXLHE=;
 b=cply3ldp2Pny9wGO1ra76U46m+s9hYa4Z1qk5ZzD5PHD3r7cIGkTcnpg/qtKPUiwTZ
 n5Ye987pJL9qgR6/opbJZD4pgvg0c3UsUEwXfAV2YvYsFuWScFctkXExbqpMyvL/xlWU
 vUSpEDAo2qF3SvXnQN1P/0rSjT2aBzYiuxo+An4cr8grBafznrc9G5RTbGBcYU6X8dAg
 DP0Zu+9TJ0vWYruNdpuhHWPlDu2gOTNfY4hhyw/WvvhwCdqXB9FDbMvtJnAp9fbufXUH
 AaeFWMC+pNPFJSBMbvssLAddEkP7HxXDNY4rii/n+vQ8kb14+46ihtOeasbvV0GiwiPf
 mPSw==
X-Gm-Message-State: AO0yUKVrOT5uRJ+laxvg6iLxYz+Q6bnqDtdHoHOj1mAWQ2oi0oaUBa52
 sS/f4qkJimdLim6XChRTfruPmClppF51cFRU2P5vngBiK9o9LJhAi6gyYF9arr+YMqrI05QvfjQ
 oRQ/yG2uFj8lQLa4=
X-Received: by 2002:a05:600c:220f:b0:3ed:fc8c:f197 with SMTP id
 z15-20020a05600c220f00b003edfc8cf197mr19830946wml.29.1680258270497; 
 Fri, 31 Mar 2023 03:24:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set/XJX6V5RYv6eI/hSP7eofDz7tMCyz+qocxsoz4mxiaAhMJwXlQ8kFnRrhofh2W8uVZvXFyKg==
X-Received: by 2002:a05:600c:220f:b0:3ed:fc8c:f197 with SMTP id
 z15-20020a05600c220f00b003edfc8cf197mr19830932wml.29.1680258270169; 
 Fri, 31 Mar 2023 03:24:30 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-12.web.vodafone.de.
 [109.43.177.12]) by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c470800b003ef71d7d64asm9513713wmo.6.2023.03.31.03.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 03:24:29 -0700 (PDT)
Message-ID: <f62bf8c8-e196-4a83-265b-5196279de9ac@redhat.com>
Date: Fri, 31 Mar 2023 12:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/3] qtest: Move tpm_util_tis_transmit() into
 tpm-tis-utils.c and rename it
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, clg@kaod.org, ninad@linux.ibm.com,
 joel@jms.id.au, andrew@aj.id.au
References: <20230328171958.3677734-1-stefanb@linux.ibm.com>
 <20230328171958.3677734-3-stefanb@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230328171958.3677734-3-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 28/03/2023 19.19, Stefan Berger wrote:
> To be able to remove tpm_tis_base_addr from test cases that do not really
> need it move the tpm_util_tis_transmit() function into tpm-tis-utils.c and
> rename it to tpm_tis_transmit().
> 
> Fix a locality parameter in a test case on the way.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   tests/qtest/tpm-crb-swtpm-test.c        |  3 --
>   tests/qtest/tpm-crb-test.c              |  3 --
>   tests/qtest/tpm-tis-device-swtpm-test.c |  5 +--
>   tests/qtest/tpm-tis-swtpm-test.c        |  5 +--
>   tests/qtest/tpm-tis-util.c              | 47 ++++++++++++++++++++++++-
>   tests/qtest/tpm-tis-util.h              |  4 +++
>   tests/qtest/tpm-util.c                  | 45 -----------------------
>   tests/qtest/tpm-util.h                  |  3 --
>   8 files changed, 56 insertions(+), 59 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



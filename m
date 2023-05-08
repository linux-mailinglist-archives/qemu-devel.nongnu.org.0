Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7466FB286
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:23:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw1lZ-0000yU-QK; Mon, 08 May 2023 10:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1lW-0000qR-VV
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:23:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1lU-0002vP-Gh
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683555779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8dURj+unJZ30t0vJg9aCVHoc0eodBZvBzCudQAiDTY4=;
 b=KXz+hW+q2hq0oQaSoAQ2hS6a5GjNQRny+gmeBORCwFxEmf9Iz4CZFfYmSjA1T3fDnICPug
 kJMHKLZkK43wTKhDBKBGknt1lELLDUATGnqPU6/uv9Un8fn3WApwT0abGWtCX+soEaxhld
 r4GyiA9arwgsbbYscWkamyk7gJQlMk0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-vdaZ12HkM_WZfqIysa83wg-1; Mon, 08 May 2023 10:22:57 -0400
X-MC-Unique: vdaZ12HkM_WZfqIysa83wg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f2981b8364so2846324f8f.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 07:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683555777; x=1686147777;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8dURj+unJZ30t0vJg9aCVHoc0eodBZvBzCudQAiDTY4=;
 b=Y2Of/Q4YSduElSrbklFu+azDqu0+y+HVycuehdKT/GzylGq2M5AjtMcM2RfQ7qmGL0
 C6Rqi4GpPx7stJuyKT2/tMibUFS9+5a9crWTvQz7jZP0afl1y/FaGUOjwYeKxpcSeqfa
 rm/jmtFn6RnY6cfDBuV/sbAshh2ELEKHzg6lip57NrBDlzBCBD6jC6aqSMkr6h22dlXc
 /Zhv3/btHXL0MNYMsPmQHEmx9V6bwbxxFXOhjbu3p21ghBFFpLcAEgo7Qjg4a6oY9sth
 MQshC3zUTSD3XNLVvanK2eiAS6DybYIZJGi4vqqPchV6UeI/T7aXXJEb+sar9XVrANxg
 HFrA==
X-Gm-Message-State: AC+VfDyZrxOlTDEhAkJ+sPJ2SLNCfTwlkCQ4qFDNU4i+AcjS27KZ5pJg
 90a/gXaSOq5xABpDdqnv0RuCFU9f3q2t3x0D53O304Lp65vKaBzAJV6JYc7UWc5cSNC8Mv1nEpz
 Gw+nyFrt3q6zcFYs=
X-Received: by 2002:adf:dd02:0:b0:2f9:9911:93d1 with SMTP id
 a2-20020adfdd02000000b002f9991193d1mr7751920wrm.24.1683555776806; 
 Mon, 08 May 2023 07:22:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ67/He7uhTSXtTAJ5H7YdD94QWzjipKrSyPJlpW+0DLCvktRAhwJ/LRtLzoCpWTdj4ssFvFsA==
X-Received: by 2002:adf:dd02:0:b0:2f9:9911:93d1 with SMTP id
 a2-20020adfdd02000000b002f9991193d1mr7751906wrm.24.1683555776512; 
 Mon, 08 May 2023 07:22:56 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d4bc8000000b0030631f199f9sm11345183wrt.34.2023.05.08.07.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 07:22:56 -0700 (PDT)
Message-ID: <e46e00b7-9be8-87aa-e6bb-2577ba56ee36@redhat.com>
Date: Mon, 8 May 2023 16:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 82/84] disas: Remove target-specific headers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-83-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503072331.1747057-83-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Maybe add a short description: "This is possible now since we replaced 
'target_ulong' in a preceeding patch" ... or so...

On 03/05/2023 09.23, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/disas/disas.h | 6 ------
>   disas/disas.c         | 3 ++-
>   2 files changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



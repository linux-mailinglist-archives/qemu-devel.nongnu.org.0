Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9693A06C2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 00:28:32 +0200 (CEST)
Received: from localhost ([::1]:47058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqkD1-0002TY-3T
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 18:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkCB-0001bT-5H
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:27:39 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkC8-0002HR-K0
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:27:38 -0400
Received: by mail-pg1-x52c.google.com with SMTP id e20so5793459pgg.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 15:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=RaDdDbD/AlLqwQ8GC9YGSUk8vdMIbCD4miwJWHj0fyA=;
 b=VilV7tRsjbXxzE+2DQJkxLpQfDTaI4ict4zc8ONKihS/Py4T5VyxhZmb89uSybO0T3
 jF95mOdEjKMeY9XxkvlGqNw2h+sbiHP23NdSEoq+9jkWBZNOUHiEEVFEHGfZOlsk5aH4
 Do/tKP+Me4pwZUZoiOGkA/Cekh6pcD1yRVFvFF++t81ttxtNTXYRi3hL4/X3J+ts1lUb
 gkEAR8xeJIZ/S5rj0h9RZYha8lYHP19AOowtjgu8u/yv+pFG6P3Ufe2lNWzeIhDW92Wk
 RGnV7UDIStE77dzXlZw41IMP5Z1G1UQplu52KM9oLXl97+rb0jLqPtm5tKgkhTPKRQ0i
 9XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RaDdDbD/AlLqwQ8GC9YGSUk8vdMIbCD4miwJWHj0fyA=;
 b=gpzTUE4QOS/xSBtczDckRQ9BaChFfnGAtIFZa/usgputr8GMLF5/lgNra6HNoIVm0I
 fU4KyIOGUHKTRN0VP81ttmHXYtMoapf8IpfvDHy6vJdP6kWveyDUdria7D+OLgSMoMdt
 GCo9qJ7kLcQcOUGgRnnuScNsoQpkxbd13RB0NYRPM9JBzKxs57AKpgbGF0lPVIx5XV2d
 FSxi/ONHCByauyWNCNz39R9f3Y1xW1AbKMs7LDY8uPodDpmquIDH0J2h/UUs3DDJxnyE
 jc6dvdIPTOBAhiDZbWBXrEd+DKD4AU2U+z9wmlW0ym73BvPwGS26lexxNo/LW9iYAuGD
 zIxg==
X-Gm-Message-State: AOAM533Yk7eEDmdjVODIrQsg5nQ1f5284NwflFpxYG4urDr3iqE1oNxB
 NTmUHr6t/K2IivQshnd3asD2BV052xgQJw==
X-Google-Smtp-Source: ABdhPJxAD817rCjNoP5gqDtUxww8mtecRp9GzBmIH5q0Sj2e+IftHrdtjcXexsLIE2XYUZApBX/xQA==
X-Received: by 2002:a62:1701:0:b029:2e9:a8ed:fcce with SMTP id
 1-20020a6217010000b02902e9a8edfccemr2015610pfx.19.1623191255129; 
 Tue, 08 Jun 2021 15:27:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c20sm3089006pjr.35.2021.06.08.15.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:27:34 -0700 (PDT)
Subject: Re: [PATCH 17/55] target/arm: Implement MVE VMVN (register)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0f5928d-e298-4fb7-139d-ab99c81c2940@linaro.org>
Date: Tue, 8 Jun 2021 15:27:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +DO_1OP(vmvn, 1, uint8_t, H1, DO_NOT)

This is a logical operation; you might as well perform in uint64_t.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B86A6209
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:00:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX80o-0002yj-Hb; Tue, 28 Feb 2023 16:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX80m-0002yU-EN
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:59:52 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX80k-0004pw-OJ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:59:52 -0500
Received: by mail-pl1-x644.google.com with SMTP id p6so11139690plf.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TWgd9eGwLSFNFX3gK9HsvA77OU3BMucFHdJv7s6AD8I=;
 b=vcpDGM1E4lX33ssUIgNb/+0h1Q3m+/mw3JvT+J2lDIz0T07dHtolNiyPYhxZv+DUqo
 NN9H+7MwI/VJHQJpgUXgIokLmTCWDOscte8qa36FbMWfdZalMVyd4kb8WouGtvNYoWyL
 YElo0zH3j1FxrQB+oSI1y4IkIJ+rASG8T6fJkU7tgYYK6l8PmZw3cjMbH6+NonPmsQvU
 pJX+fJKq0wLLK4hchVaf1ckJCWZPqqbsVd6o+CWE1M/VZWKWp9G61+ZxNPAiHXXAEB5P
 QRafcmxAU6jEMJwUbYVTeNRnN2apmqaSSuGB19Zjb0NTSZhuSr5JnlWwbmQ/ZdF/0UvZ
 dC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TWgd9eGwLSFNFX3gK9HsvA77OU3BMucFHdJv7s6AD8I=;
 b=p8NiGultM0RP3Gqk7Y95BCKTj+XV5LYnOVFOAzP2C5hBUUWo8PR2ju1cD+Ixv60vFU
 abwgB7K6ehdlKtLClpFJiV9Px6jSJnTNs/E5ZbBCCvAO4IGy504qbeA1EbgihBLLKFpw
 0BSaZ7aNS4Xbzhrf0hMcBfzFSvMNugDU/n//hqKiBYy7DwuCCc3wBjwdA750nDSz6O+E
 BE6FG9Xkm2/CeVqsId4JN56pcvPZkBev6qdj+7ilddpkAB84VQEEvUFff28ng8VDfd3l
 WEfVD4I0e6KV8NAtB4JefRq37QS9rezjJ9vTalZYsgUt/XfTpsbyulu5L3E3/ltVJisH
 ZCFw==
X-Gm-Message-State: AO0yUKUUmUNd+1XmJPAXdnJ9DOuEoNrPraxF/f8WjrjSpGhbXlury7cp
 dfsQ1AWdWlcpB2FU/RTOLLECxw==
X-Google-Smtp-Source: AK7set8bXBcnhHkqFk4aRN58DtKMagCMT4/QV6M4Xuj21XcQP0PyXXRSkWE7EaV/Y+ffN9RB8dlz9A==
X-Received: by 2002:a17:90b:1c8d:b0:22c:d44:5669 with SMTP id
 oo13-20020a17090b1c8d00b0022c0d445669mr4635276pjb.22.1677621589176; 
 Tue, 28 Feb 2023 13:59:49 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 n1-20020a63b441000000b00502f1256674sm6059366pgu.41.2023.02.28.13.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 13:59:48 -0800 (PST)
Message-ID: <00276686-831f-9d43-ee5d-a2a09e44e800@linaro.org>
Date: Tue, 28 Feb 2023 11:59:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 07/24] tests: don't run benchmarks for the tsan build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230228190653.1602033-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 2/28/23 09:06, Alex Bennée wrote:
> All we are really doing here is checking that TSAN builds compile and are
> therefor a tool available to developers. The benchmarks are not
> representative of QEMU's actual threading behaviour and they burn
> precious CI time. Indeed switching to check-unit reveals many
> unaddressed issues which have been logged at:
> 
>    https://gitlab.com/qemu-project/qemu/-/issues/1496
> 
> So for now disable the make check and make this a build only
> test.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Message-Id:<20230221094558.2864616-9-alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


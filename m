Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A734698A83
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:28:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSTyh-0008SN-FH; Wed, 15 Feb 2023 21:26:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSTyf-0008S2-OV
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:26:29 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSTyb-0003h7-3e
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:26:26 -0500
Received: by mail-pg1-x52e.google.com with SMTP id b22so386197pgw.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JX6EbvplTl14srMglOQ8FqLfaaWr4KdKwMx0Z+bI8+0=;
 b=i4SVU3c6VjfNtijXQARbWEMNSMlqo8Jrskssr+d6/f5YBqFsAXxBTI7b0OXEVodCLs
 M1Pj6A4YoHZAqDalNDoyPTkBwqlExf9p+LqqxwqOYB4nTH4g8JifQrvaq+UMedhfTpkh
 RDrwXqwMUpU9lWSPmF1XhCSJL1FdvC7OLcxGj9a5sYo6iastVqoxRCmvnOn4XpJ2sCX6
 hRAFSQIjWP3ZDTkS9du1uQ5tdwq+zq/MibckR3AR+XqndnFRfXC/ZP+RDc1GlszMMgYu
 /D72t0JrPLqGiTHaeNCMdnG6FxTdeYGM4keO2zf5L14yhAjy9xw/r4Af4aphQf6Fzb25
 Ijzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JX6EbvplTl14srMglOQ8FqLfaaWr4KdKwMx0Z+bI8+0=;
 b=QJCxMaG2npOVkHpp2WWVbiHw1QfTg/iWxh6jh7D6bov8katx++eQPE2VsoQ2+PHbXo
 uhjfFXw/SZn6NBu40PN3RSZ96Itr8M6FtZzJM01UmFIx/N3a14wzzoG13cWPs29AvMQg
 EZPx+cmIVA6sY1xXbxl5owPkFFZpGbgVqYQ66lp/2TxS91wxGTKA4e16Gy97A9zGX6WT
 MGPwnnMuw5Kgd5FamZlFpX3RJwJFvV/VmCLbJSVHym+6at9n8q0uMn4kA+VpRG3R7HmV
 zJp2s4/HjzSIZjqjwPv3+/D0cAAX+bBBjIHoW93ZQHGClgUWWfw0XQlMK8QsEySLtbYs
 sSfA==
X-Gm-Message-State: AO0yUKXy3FPwNla+X22K/A95b5+L37RRoGRMzRjC6//Kkug8/+i4k3Dd
 9tOpCunQ8n0h4oeH9BkUz52wKA==
X-Google-Smtp-Source: AK7set+LSVOljo+GT3fYQLFHfi/F2CCefptnNHeE/jXfRfc1JeDHQefXGRg825cJWfLJog5LXGI6tQ==
X-Received: by 2002:aa7:9f12:0:b0:5a8:31a1:2f05 with SMTP id
 g18-20020aa79f12000000b005a831a12f05mr3041432pfr.5.1676514381956; 
 Wed, 15 Feb 2023 18:26:21 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 g23-20020aa78197000000b0058d54960eccsm34295pfi.151.2023.02.15.18.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 18:26:21 -0800 (PST)
Message-ID: <2c467dfb-a546-1bfc-a2e6-be30d91c73df@linaro.org>
Date: Wed, 15 Feb 2023 16:26:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Does the page boundary check still necessary?
Content-Language: en-US
To: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>
Cc: qemu-devel@nongnu.org
References: <tencent_F8004464D432CD4CABBADFE9E9493EDF9607@qq.com>
 <b2c5dd7c-5c90-9104-5477-b76ed22ea799@linaro.org>
 <tencent_5ED3B1CE709A7A92C2B7264011B9A84C2205@qq.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <tencent_5ED3B1CE709A7A92C2B7264011B9A84C2205@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 15:45, Kenneth Lee wrote:
>>> Now the chained TBs have been link with tb_link_page(), the chain will
>>> be rebuilt if it is invalidate on page. So why is this check still there?
>>
>> Even for a guest which doesn't use paging, and therefore does not need to
>> worry about memory maps changing, we still enable breakpoints and
>> watchpoints on a per-page basis.
>>
> 
> Thank you. So is this the only reason? May I write a fine grained
> checking to remove this limitation?

No.


r~



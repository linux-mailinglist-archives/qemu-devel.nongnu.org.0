Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C032BBBD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:37:53 +0100 (CET)
Received: from localhost ([::1]:42740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZBo-0007Pn-1p
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHZAn-0006xd-EV
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:36:49 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHZAg-0007OO-NG
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:36:49 -0500
Received: by mail-pg1-x529.google.com with SMTP id e6so17351398pgk.5
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 13:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jUZzcY6eBy7Z6eKyJXjT0BT0XCYxsL5AfUdd2WTGiUY=;
 b=gtSxgr1M4aB+JUcuAMrbTF/aXVV5DGcRTBYaSmyo4oewC5KkwBTrPCjoKEOd9Fsv0A
 62gnnzBLXAtXacb4jjabhzhrrenxIKtzl7g5rJHTbDjZdbke93IOpgsnWzDuvyBhVoEV
 jqInTVFJRVqKXHaFbmfBraP7yHlvNdrkbXPgtg0k9dzjxaZdCHZKzE067qyddHAnYrYp
 l57UsnCULXXikpCH2iQZx7b9pV/dbTZWFbUb4C5SyeG4GHHpemttSQCBv8hERGyfpT4p
 O6/CL+qW1nvUvAxGeHC1sKEv9NyjECOaPyAUeELQZE8sT0RlibQEGX4zEMUvTnW2w/2X
 efLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jUZzcY6eBy7Z6eKyJXjT0BT0XCYxsL5AfUdd2WTGiUY=;
 b=Pp93Jg8JhYFzszNEPCcEU1xdFKGkD+Lf+5Jm1OS1CpDpBNA9A6BdOupRs9sORiURQL
 4UYrW90dS6VThdlZNJtvWAN95soA8hRNKcCZPTM3EYHAwUk/buI4fQLsT+478vF2k9HF
 yeN/KfvqoAMlQxypBHnNMbBkVvs8Mjt97fdY7ft78CyGsr5GLP0kGHaxV32XcxaxHGpO
 P12NDOUW/o/upN9h0Sm2A/qfZW5OXNi+QkbCeWs18GU9E965MBFFU++ijPsPUBtwzFuO
 y/ILIRY5qCvrZH0QbZ3pHuB37ny2Fo4nZgL1yyHzFed3Qfw9oQTgjOJ+hEN93IYUHJKN
 +VgQ==
X-Gm-Message-State: AOAM530WwChkv5Resi+YU5PgJ2RvsaJ1XLPyPCmSapyLQIr8OeJwqR1H
 dNXW3hv8HHeckSsTnr8pNk23DQ==
X-Google-Smtp-Source: ABdhPJy+zN20NRQqw16UhkCYIVjq9cTfwry2dwhxnaNcRn0mK/HPrDL8YsRk0Ilm/Uw6pH9YAXih8g==
X-Received: by 2002:a63:4084:: with SMTP id n126mr862043pga.80.1614807401016; 
 Wed, 03 Mar 2021 13:36:41 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id v15sm23882201pgl.44.2021.03.03.13.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 13:36:40 -0800 (PST)
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
To: David Hildenbrand <david@redhat.com>
References: <1e13f11b-4c4f-83c6-5c83-8c8accc4f6cc@linaro.org>
 <42016B7B-A144-4319-9F48-92C029083274@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ac4007e-001b-73b5-8023-fbfc9ef94eed@linaro.org>
Date: Wed, 3 Mar 2021 13:36:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <42016B7B-A144-4319-9F48-92C029083274@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 1:22 PM, David Hildenbrand wrote:
> 
>> Am 03.03.2021 um 22:19 schrieb Richard Henderson <richard.henderson@linaro.org>:
>>
>> ﻿On 3/3/21 1:11 PM, David Hildenbrand wrote:
>>> MMIO on s390x? :)
>>
>> hw/s390x/s390-pci-bus.c, memory_region_init_io*().
>>
> 
> ... part of system address space where a CPU could stumble over it?

Impossible to tell within 3 layers of object wrappers.  :-(
I suppose I have no idea how "pci" was hacked onto s390x.

r~


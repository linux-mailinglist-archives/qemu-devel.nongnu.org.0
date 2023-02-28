Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7936A5020
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 01:26:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWnnI-0002ss-Qk; Mon, 27 Feb 2023 19:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnnG-0002rT-5F
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:24:34 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnnE-0007c1-N9
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:24:33 -0500
Received: by mail-pg1-x531.google.com with SMTP id y19so4678801pgk.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 16:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jXsdxYjAv5fg0ek7fYXs0C+xcux5cNegHNNaXTH94Gs=;
 b=wuSiiJ6peONb7X/NKFgRuMQ8cF9lNPWL+lUPqFUYfH2vyuH6PA2tgmk1oqj5tY7PuH
 FULxGc79+D8qPboXn+jbIAImNqK9nRaaznow3Rdlft5QVU35DptyJqL6+dwQZXMb0zln
 nwNwsbJu3hz4USgrgwGlVhbTndsB8KhDEZYtZC7n03SJMVWxKSbcAVYS7yeUPsFAewKZ
 xjLgOdedjIvJS4+Q4nsHE9s1fQ9fF1D5HJTZxWriBxZbBHlPcNnRziMA2BS3wYg145YP
 2ToMf4jAYn1Ed1r4qcU6nbHxz5zqVy0AQfZ+prH5mMEAVga4hLBwJyeMJBF27ecJZlen
 g8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jXsdxYjAv5fg0ek7fYXs0C+xcux5cNegHNNaXTH94Gs=;
 b=195GWHdNpY30fvCbs+qdtppefD1lypP15nPSy8yvqaC4wc9qbY0v6mjl/vdoq8mtKQ
 obVwXT6BmWLKhOpp+SZ6c4z5TKadN4jOXJfZRNL1s/ct64fL43FiKvxtaoJOhgKdXvvx
 G8QdKcomqy41QjwAfaCg27Wgg7Oa/ldSqZVgsgdAPDhB3p/c7qmwdJAnz5RRHBL8mbPT
 DTRMiu1GcHodTSm+b4nrUCJPZmk/9twmPtIQiBctDhkS/Q1X87nV3cOSCQv97M84xB0A
 KsD8cbgEB5+VMlu9/cp6Pw6S/17d/Z7jKQSDW+544I1h7H1dulbIcn2q9uHOwWRM9Ivl
 YeiA==
X-Gm-Message-State: AO0yUKVYlg9/GMS5wHb6/NmfRtlGG3jdr6V+eFBDpWCg4Dq/nsKfZ8P6
 0eZlfBuTIi3wtmFxV3/Uz1Lnew==
X-Google-Smtp-Source: AK7set/O058riAzl8Sn3h3cgy1Qt8HPTLvdv5jiJcRDMVy3RJYqGUOocvL3Xmlp1vaYY5otmc1dkSg==
X-Received: by 2002:aa7:94bb:0:b0:602:7c0:3afe with SMTP id
 a27-20020aa794bb000000b0060207c03afemr15313pfl.26.1677543870751; 
 Mon, 27 Feb 2023 16:24:30 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x27-20020aa793bb000000b005a8dd86018dsm4762832pff.64.2023.02.27.16.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 16:24:30 -0800 (PST)
Message-ID: <8755d13f-3da6-3e5f-27e9-bb518ff32f1f@linaro.org>
Date: Mon, 27 Feb 2023 14:24:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] docs/system/loongarch: update loongson3.rst and
 rename it to virt.rst
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, armbru@redhat.com,
 thuth@redhat.com, mst@redhat.com, sw@weilnetz.de, clg@kaod.org,
 danielhb413@gmail.com, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230227035905.1290953-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227035905.1290953-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 2/26/23 17:59, Song Gao wrote:
> +Note: build release bios need set --buildtarget=RELEASE,

Note: To build the release version of the bios, set...

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E4731EC99
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:59:51 +0100 (CET)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmec-0005vU-0j
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCmSE-0005yW-12; Thu, 18 Feb 2021 11:47:02 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCmS8-0007lQ-Fo; Thu, 18 Feb 2021 11:46:58 -0500
Received: by mail-wr1-x42e.google.com with SMTP id g6so3681416wrs.11;
 Thu, 18 Feb 2021 08:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xx7+GihJ2B3NPd2W8Vlhz4vTvoanmgVAJhAksHPwXtY=;
 b=nPR5O039QgpgkmMLo1y/Mxc3ZqWputMWDd0dIYEK3HobiMrfajkMcstgwXWpna0BT6
 spIJSsubTqiaTkh1SEdqIk3DChn2MaVcn6VJwtPrembH2RZkgiKV5zPLW+LXmvsfMhZd
 zjrdV93Ci788co1IpaaUUIYNY9PiEotfsK7qcKrxDR4783iOcUoZ5BSF1l4c9ZNuQ+VG
 m1KlkyRGd4FB5VnhvHh3IiSltq5N1Ll8Ttz/kJIYZ90CVUMOjDwupG318srub/6QC8pt
 +NdNbQdx0DXihZ+qJ8sM2nqGMUDQgmZoC02qT7NnmmC+TFlSBEAVH2xMC/L7U9TLSDhL
 n9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xx7+GihJ2B3NPd2W8Vlhz4vTvoanmgVAJhAksHPwXtY=;
 b=bMYRX24hN/99/+oYxFOczIukfoz6+fcP4FxQ349pT7yqBGW1Zh66G9mU/l4M931sJ4
 DjUqmoERyxyqiXUtskLjwEMs0a52nH+FYr3J3f8UEIvvKUjpCX1xHu037gW2ySoo6baN
 OE60Cjtv7hBI75xjKzYvk0uwlKjR0sMzWK8av/Af0NKwfTiWkTeu339GFWRtFjnReKu7
 PrwhLqyKN+wvawA5/RdVr6/E69d6SBXfDqlOZ5rP6QzkZYtad3q9zOyWdgzaYk5gBwmB
 ck4+hzm3tK5AMEVVtPVExNJuaEWTNpM/w5pwrsPVLfZ60cLstAI8899fQTtWMVyEEuE/
 65bA==
X-Gm-Message-State: AOAM532ffJalixDlPlFZgPmvD26gDGuceCAynActKLl4MFuUp1QEct66
 KU5uiQS8+Gx4Q89fdwp2rlU=
X-Google-Smtp-Source: ABdhPJx39LIb0cHyLT1Yow433YLRfdv+LTBobfdeO8Su3sDneIEAYvQARwyJ9vUEVMV49nZo0NNV/g==
X-Received: by 2002:adf:e543:: with SMTP id z3mr5266985wrm.181.1613666814135; 
 Thu, 18 Feb 2021 08:46:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o10sm3551119wrx.5.2021.02.18.08.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 08:46:53 -0800 (PST)
Subject: Re: [PATCH v2 1/6] hw/sd: sdhci: Don't transfer any data when command
 time out
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Bin Meng <bmeng.cn@gmail.com>, Alexander Bulekov <alxndr@bu.edu>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-2-git-send-email-bmeng.cn@gmail.com>
 <4312d31e-d533-74e8-c4d4-107faf785dee@amsat.org>
Message-ID: <651b63e0-0cc3-1c20-3d91-9d6fe7fd3b8c@amsat.org>
Date: Thu, 18 Feb 2021 17:46:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4312d31e-d533-74e8-c4d4-107faf785dee@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, Li Qiang <liq3ea@163.com>, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 5:25 PM, Philippe Mathieu-Daudé wrote:
> On 2/16/21 4:46 AM, Bin Meng wrote:
>> At the end of sdhci_send_command(), it starts a data transfer if the
>> command register indicates data is associated. But the data transfer
>> should only be initiated when the command execution has succeeded.
>>
>> With this fix, the following reproducer:
>>
>> outl 0xcf8 0x80001810
>> outl 0xcfc 0xe1068000
>> outl 0xcf8 0x80001804
>> outw 0xcfc 0x7
>> write 0xe106802c 0x1 0x0f
>> write 0xe1068004 0xc 0x2801d10101fffffbff28a384
>> write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9d8e7f60514233241505f
>> write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80d000254c80d000255a80d000256880d0002576
>> write 0xe1068003 0x1 0xfe
>>
>> cannot be reproduced with the following QEMU command line:
>>
>> $ qemu-system-x86_64 -nographic -M pc-q35-5.0 \
>>       -device sdhci-pci,sd-spec-version=3 \
>>       -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
>>       -device sd-card,drive=mydrive \
>>       -monitor none -serial none -qtest stdio
> 
> Can you directly add the reproducer in tests/qtest/fuzz-sdhci-test.c
> instead, similarly to tests/qtest/fuzz-test.c?

Hold on, Alexander will send a RFC series to have that conversion
done automatically.


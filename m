Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D977731EDFC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:07:33 +0100 (CET)
Received: from localhost ([::1]:39290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCni8-0007Jk-U5
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCneY-0005PK-Dd; Thu, 18 Feb 2021 13:03:50 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCneW-00087D-JZ; Thu, 18 Feb 2021 13:03:50 -0500
Received: by mail-wm1-x329.google.com with SMTP id n10so4770000wmq.0;
 Thu, 18 Feb 2021 10:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q3dfLVepLcRehpYC8Y2i9rr7Mm5ErBNhSo1kufqlJ8s=;
 b=AjckquCac53UusDB+72eskpygWuU7hWMFsdFYz9MZlhhaPMsStWhEYtPPiGnvCC/7U
 jT47NGmBl85pFbkPboMYvTp8+9w3JCEWEhNaEoYeeLTnE+3ghpPEdG4k8kXMcIZoVAHG
 Q47tuLVNEnFUW+ZMb7nNeHjnRiJtmqpd5jXNcdB0a29t20Hlnyw2bMm9MeiqFvQXJ5C6
 1rBHsLWJO+PbVgdhI+/Q9JusWzPQqpQyQMXnBYtnOPTaB8aWmfh971a+9maTFz71c6T4
 CToFTMM9hDFzpTSrSln4s2cJxaSqj7mtosa0WRTznTjxtoNv8PRq/U701FQr3JqwQpR/
 5oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q3dfLVepLcRehpYC8Y2i9rr7Mm5ErBNhSo1kufqlJ8s=;
 b=KbEL1eHFY3wKOT4usGhBNZzB1VZ/HNJ/woE4Fhtx9TOPJMSJShehrou84p6tS71CET
 IL0A54cHVkGlKzz/zRYO1wZQakU3hJtd1Q4tywmLVR31UX03s7+oNM10k4HUCHyJyzCD
 HOSrQfqbobENvNY4Zxio12f6jrZFMESgUl4eki2Lw8VZmDHpm/qp45FMoz11+BiZO66u
 PtKavV5XAgy1aYr/rydU804IrCcqarFWoHCBwdM3g5SI2W5XdyVDYNRs7BQKgf8xZOmj
 OPJxjP5iETCSPn6PML9IDRFofLdf4T936b7mLxwzYbICLzi72rQg563TqLuNHh/mIoMN
 Atsg==
X-Gm-Message-State: AOAM533b49O0de2NkA2NprjBmtjw5kRqWc+kL1biC6eV7jA77yYoJAW9
 N9MdsIGDEVfBj7jrLsJ2tioNasitWuc=
X-Google-Smtp-Source: ABdhPJy+rZRy8ujsaBMBvy//1upr5P4FPNBcSWBkXNmbvC/BxXGbgopahQuBsSAXrMO7xTYVi2CHRA==
X-Received: by 2002:a1c:e245:: with SMTP id z66mr4702318wmg.168.1613671425711; 
 Thu, 18 Feb 2021 10:03:45 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o129sm9283932wme.21.2021.02.18.10.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 10:03:45 -0800 (PST)
Subject: Re: [PATCH v2 5/6] hw/sd: sdhci: Limit block size only when
 SDHC_BLKSIZE register is writable
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Bin Meng <bmeng.cn@gmail.com>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-6-git-send-email-bmeng.cn@gmail.com>
 <9d73ef0b-2d58-6c5b-8a14-590eaddd4a3c@amsat.org>
Message-ID: <53f50f67-90c9-4c6c-c42a-d2eab7bccecb@amsat.org>
Date: Thu, 18 Feb 2021 19:03:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <9d73ef0b-2d58-6c5b-8a14-590eaddd4a3c@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 6:09 PM, Philippe Mathieu-Daudé wrote:
> On 2/16/21 4:46 AM, Bin Meng wrote:
>> The codes to limit the maximum block size is only necessary when
>> SDHC_BLKSIZE register is writable.

Per "SD Command Generation":

  The Host Driver should not read the SDMA System Address, Block Size
  and Block Count registers during a data transaction unless the
  transfer is stopped because the value is changing and not stable.
  To prevent destruction of registers using data transfer when issuing
  command, the 32-bit Block Count, Block Size, 16-bit Block Count and
  Transfer Mode registers shall be write protected by the Host
  Controller while Command Inhibit (DAT) is set to 1 in the Present
  State register.

Shouldn't we check for !(s->prnsts & SDHC_DATA_INHIBIT) instead?

>>
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>
>> ---
>>
>> Changes in v2:
>> - new patch: sdhci: Limit block size only when SDHC_BLKSIZE register is writable
>>
>>  hw/sd/sdhci.c | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 


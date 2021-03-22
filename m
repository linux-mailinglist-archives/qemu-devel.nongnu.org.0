Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E3344877
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:01:51 +0100 (CET)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOM3y-0001hb-Dx
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOLaT-0005I0-48; Mon, 22 Mar 2021 10:31:21 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOLaR-0004rG-GP; Mon, 22 Mar 2021 10:31:20 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v11so17179307wro.7;
 Mon, 22 Mar 2021 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/OaQRvnohnanmTyNOZ6gFn0pd+hZ+6cn3xRtPcJUUM8=;
 b=KB/6PchzRvb4UrmntdFySTtDq9iVs29+02P21j7GRkzRHe+gMveeGulz5++3rVq/0b
 q/d/CVAaUNqIURpgoAZRwcPlqGO14xYhcC0mMoTicc+hD/BvIZnbFBMOpOw2YNpa9JLH
 6AqowG9VOcVf7phdr9lBPFYAf4L35eNA0Es+hPDps4/iokBdPew/q22Fu4ebbYLpAvMg
 RMYBONCT+O2/DJg9xVO9RCm1GLoVBR6E6TqviU4BZxfhAwqHL8gEPSmYw0ecDKJmwPdL
 YF4sVrO1m4nHl7wYNlQfG6GI+pfmtRSi/uWsrgYOJE8foCA471Mr4exMcN4+ENeLlwN4
 /abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/OaQRvnohnanmTyNOZ6gFn0pd+hZ+6cn3xRtPcJUUM8=;
 b=FQOTLDJSdt1T6qcFbsWoCsagyeypzyR1KzE/amoDmGqwngJUz1zPaKhzzsmDcV9zP+
 u8CBupOFGjztGY96BfKY8ZxBjbgNxcKP7tVGqNWfqSnvYxhexeoOTDe8Tti2q3niyVDV
 CX4CZwl6skSlR7ggk3oRtMuGfqNFX3rcNZGvKw4VSH3QoRZKQM96DFmmM7q/Hfnihtog
 v3bKelE/yBpTlUJjxugdmvZwiO3ah0B91FQOr2HWDdOKLIKiuxj7HUnC6bdHh2Ue2sBf
 nanh3nqtvc3hbbRSUk7bX18miWTvRFTKzEESsoqMxKiocA0G0hlUFvzA+eQYFHdUB8Op
 fhZw==
X-Gm-Message-State: AOAM530JRohOj9CLJ1J3M++wjf6GR0kh2ItmI0Shzdz7JtY2vwsDG2oM
 VQfDfrySgnNaKhHVL2PechI=
X-Google-Smtp-Source: ABdhPJykgAy5A5aw3WwgbYK3/JDDUZqYTLXmNc0asfdiCzzy8ploKMnfF4uk1Qmy+MeZZDHr7nAP2w==
X-Received: by 2002:a1c:68c5:: with SMTP id d188mr114321wmc.119.1616423477457; 
 Mon, 22 Mar 2021 07:31:17 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c2sm16744870wmr.22.2021.03.22.07.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:31:16 -0700 (PDT)
Subject: Re: [PATCH v3] hw/sd: sd: Actually perform the erase operation
To: Bin Meng <bmeng.cn@gmail.com>, Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <1613811493-58815-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmW-D9fCnu8jeKb-9VicdG81nCPysyX0M6uPxVTZgbZaqQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a3ddb875-30e0-14e5-492a-1a5cac7f38b1@amsat.org>
Date: Mon, 22 Mar 2021 15:31:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmW-D9fCnu8jeKb-9VicdG81nCPysyX0M6uPxVTZgbZaqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 8:16 AM, Bin Meng wrote:
> Hi Philippe,
> 
> On Sat, Feb 20, 2021 at 4:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> At present the sd_erase() does not erase the requested range of card
>> data to 0xFFs. Let's make the erase operation actually happen.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>
>> ---
>>
>> Changes in v3:
>> - fix the skip erase logic for SDSC cards
>>
> 
> Any comments for v3?

None :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch applied to sdmmc-fixes.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44354224464
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 21:40:53 +0200 (CEST)
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwWDy-00034O-22
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 15:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jwWCt-0002UM-0U; Fri, 17 Jul 2020 15:39:43 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jwWCr-0007ka-Ft; Fri, 17 Jul 2020 15:39:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id s10so12211488wrw.12;
 Fri, 17 Jul 2020 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UzGa+rePLjaoL8vOlbvkRWpkRHHzZ1RhieO4rHtl86Q=;
 b=HHp9+xouP5Vt9J8V/cjKWaV2hcx73y61IKDp4wq49WM5zWIG7+IHgR6GNFr7tjmM8I
 z31QM0iJmtKS7sLa0RYDBJgBklD6hNt+z5oDysDsGHMILn+QONKUK1H92q5uazpBIoH3
 kl2j5f6pbhBI6p3plkIPsp0EmiXjVw9N462AstQg3n2DSDXZs2+rjGo/Oo2f8wU1htZC
 9tU3Og/Q++nNL/EjinZ3WJFs3K13N0MYDquKw/nzGMkvtSp4rggEmQ5Hpb/UxBrVWDqg
 wwJnYAP1PaY24T6vwlKsjbf5vpMhfkZnkkNlaz5Oxik68ckg2F1E+D+tTC0YnIH0TzaU
 KmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UzGa+rePLjaoL8vOlbvkRWpkRHHzZ1RhieO4rHtl86Q=;
 b=rEnf8TT7SEfP+yZwmzVCf61FSoequdoyYxrhaLnORhQVY+KpOVs5AFHHWG3oD8q6SY
 W6zoaZ8shDOQTPvTCmq2lAYptr6CkWPGuhVidvbeaaMNSxRUSsEIuotXLbQMPKc6f21G
 FoiSbLvOEAi5GcTXIWIdfU2MqQig8SN1KC3tTAQR4JGvvD1qPv57J5C1Cz9xW/3bxXd1
 sGbKN626vfyjxiMH7Pk9uJRrr3f0MWfQwhNnPh+4NFeB/LeL1PHImG0BfHI7K5TPgY6G
 QOkvsJi4ooJkTvTQihYlbNoKJ3SvyOy3zehPra7F8l4E39sRDwcyaCo6lX+rCSggJqMs
 Xemg==
X-Gm-Message-State: AOAM532OmZJTLxeygEepBWerrfRBISsujY4nycMmcCiJi5KlqYf5ddBQ
 8/goF/G1fQwsEs7HRQzRrtU=
X-Google-Smtp-Source: ABdhPJyor94LjkWMBa5dQnjBD16UC7Y5UIDPiB0Sdu76QuwfARxVVZZ6neKNynW6wlFwLdXxZfQj/g==
X-Received: by 2002:adf:e7c9:: with SMTP id e9mr3043370wrn.307.1595014779211; 
 Fri, 17 Jul 2020 12:39:39 -0700 (PDT)
Received: from [192.168.1.43] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id 14sm15308674wmk.19.2020.07.17.12.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 12:39:38 -0700 (PDT)
Subject: Re: [RFC PATCH-for-5.1] hw/pci-host/q35: Ignore write of reserved
 PCIEXBAR LENGTH field
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200717181724.27493-1-f4bug@amsat.org>
 <edf80e5a-b698-b9dc-f867-8fa920f41786@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <21f1ae09-0db2-cced-a117-961c4e337afc@amsat.org>
Date: Fri, 17 Jul 2020 21:39:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <edf80e5a-b698-b9dc-f867-8fa920f41786@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/20 8:38 PM, Richard Henderson wrote:
> On 7/17/20 11:17 AM, Philippe Mathieu-Daudé wrote:
>>      case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD:
>> -    default:
>> -        abort();
>> +        qemu_log_mask(LOG_GUEST_ERROR, "Q35: Reserved PCIEXBAR LENGTH\n");
>> +        return;
>>      }
> 
> Did you really want to remove the default case?

The field takes 2 bits, 3 cases are covered...

> I guess the mask means that only *_RVD is left over, but the default sorta
> self-documents that.

OK I don't have problem keeping it - until a compiler start warning
about it "default case already covered" ;)

> 
> Either way,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

> 
> 
> r~
> 


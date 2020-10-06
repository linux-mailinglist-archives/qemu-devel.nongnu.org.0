Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA160284FC2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 18:23:53 +0200 (CEST)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPpkm-0001sC-U2
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 12:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPpdJ-0001Ve-HT
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:16:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPpdH-0005P9-0M
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602000966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CptPc0KrpfKuI1U0y/bT06wia6yhYH/gkbU+ouzs+JE=;
 b=YzX8OvtO20ou/y2zxzJukGekx6YdmnLlWXzKvF7WsDqHkGQqGxlFvUyCf8FKkUkXeSUJIz
 PIGU8nn92Do78qIqtLp79Aty7/jbIusIQVMxAX6frNCx/mEMjhpOfHKUXGjaSYHXlTRfQk
 IJcApK7rCKFsZC1gSTvXc8HPJ8I6SLk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-bHdr8LyNM1yXdkBqGewwUw-1; Tue, 06 Oct 2020 12:16:04 -0400
X-MC-Unique: bHdr8LyNM1yXdkBqGewwUw-1
Received: by mail-wr1-f71.google.com with SMTP id f11so3348275wro.15
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 09:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CptPc0KrpfKuI1U0y/bT06wia6yhYH/gkbU+ouzs+JE=;
 b=SYp8aFVtY3EKUj3QRvF0dKErGK728FxUwQw2ZDFKVfiY3cxX+wwTiChPG4bqUpKorV
 4hc9TazvF91/XVuc42+2lqLymZHC1zqCaKYBGgpvvzXEGr9y2s4KOX1ngWoKnrANeA0Q
 xsa7CSjXdEId44gl3+gXSWG8xaaqVPO7dbZMtg6SF6a13mJEHUCSS+Sp9ceba8P87IvA
 KamcVDv2MLmk0AQKA+b9CIZeKwyFgdDeeHvXOO6nkIa000D3uU2W5YaHXjp7YVORSXLK
 jA4dFc+IVqzCzitEfVa+63rgPOz9gZbbqJEjWIfL3+d6+cVdo5uCR3s85yzYVw8vWcKM
 KUcg==
X-Gm-Message-State: AOAM533yK9GhtQ3aAuJqp2sGDslhciwT9R5ydhmkbJDL1tNAKD3DC/XC
 7/8hv5SWunkpA0b6/ojJ3pmenSsap26ExTvgmujRJMSpmawbe/0bckaFYACqbN0myBZ4gj9XlxJ
 LHnvq7tZrscdR1/o=
X-Received: by 2002:a5d:5751:: with SMTP id q17mr5885171wrw.409.1602000962771; 
 Tue, 06 Oct 2020 09:16:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyUcdHpT73PPWqVJ0zBZu+7SYwuizvoVVD0e9dQ9070s0Nu/hDfLzQxbs6Yd8OWxgph5eXeg==
X-Received: by 2002:a5d:5751:: with SMTP id q17mr5885139wrw.409.1602000962512; 
 Tue, 06 Oct 2020 09:16:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e?
 ([2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e])
 by smtp.gmail.com with ESMTPSA id q18sm4881267wre.78.2020.10.06.09.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 09:16:01 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] hw/nvram: Always register
 FW_CFG_DATA_GENERATOR_INTERFACE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201006153636.2383248-1-philmd@redhat.com>
 <20201006153636.2383248-2-philmd@redhat.com>
 <134bbd15-c53c-7686-a36d-f02a81b56e0d@linaro.org>
 <700d357f-e214-8ba6-910f-78b857757d32@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a73ef334-01c2-21f8-e793-15e822da28a0@redhat.com>
Date: Tue, 6 Oct 2020 18:15:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <700d357f-e214-8ba6-910f-78b857757d32@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/20 18:02, Philippe Mathieu-Daudé wrote:
> On 10/6/20 5:51 PM, Richard Henderson wrote:
>> On 10/6/20 10:36 AM, Philippe Mathieu-Daudé wrote:
>>> +++ b/hw/nvram/fw_cfg-interface.c
>>> @@ -0,0 +1,15 @@
>>> +#include "qemu/osdep.h"
>>> +#include "hw/nvram/fw_cfg.h"
>>
>> License boilerplate missing.
> 
> Grr. Paolo since you queued this, do you mind fixing directly?
> 

Please write it here and I'll paste it in place.

Paolo



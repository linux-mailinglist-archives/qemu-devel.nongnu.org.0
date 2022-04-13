Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D34FFFD5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 22:14:21 +0200 (CEST)
Received: from localhost ([::1]:52014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nejNb-00079k-Tx
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 16:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejME-0006O7-Le
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 16:12:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejMD-0004f0-AY
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 16:12:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso1858452wml.5
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E39DXjBxoARQlqPaHxSKZpRc7/KDFSCeLA+c7Y3DMCc=;
 b=bJlD8AXVPoJ4T1+Q2QiQ3C4Wm8xHIy0z7J4fDUHxKmys2YV2ciCsj6gj6Bg1iaF9Tq
 BdXHf11axxedCIKPotpICPeubvZKT7OyZb6Xzcd+HPsq6s0g3hw/TWg7bhKXzOd7Bbuf
 KyUlJD14DmANMUgCQCgK+Ctqpkz3/ybG/2lLX3dItZwDIciFD0yE79IVEzjXnhx5W2J1
 iw4qvQdd8UpMqbuza02P/K5mc83rHDd//KkThLnrImySVq1oqg81m+X+eVg3V6Pl2PfI
 TZmcBxW5F+Q1Mq98BUCUQTFlrI3AYP2MTqXP1A5fMwPnIYfCIR05YgJIUmkFn+lLyuCj
 UjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E39DXjBxoARQlqPaHxSKZpRc7/KDFSCeLA+c7Y3DMCc=;
 b=dw2tKmkCtKcLrI1+QZlkA7zicZQsp7ovvK7dJmsXIinhazu7ZAPZQ9Fh1vzfkTutPf
 w+ahYJD3eaWXfL0VvehaFi55E+gjjJQhSmm6Exafr2TJblUs44+izEzFi5/ShtQndRNr
 SaOngneGnL3XiF3Kq6ruVDeaCQjTN9PFxaCC+h7Nwm+7Ktxy3woqpdJUHmLw+d2Sku2p
 gdGX4MxIHJJK/qq4PeiHUuQyn0KmDG2lUQXEjOyTn8/C/dnnWokrc7mrIyVKnu13dJsD
 WxpX/500OLaWbhk776HGGJDW617WuuGqFIQUS0B+odHRTJVBWUWpkym3buKCFBXEBkKr
 +rqw==
X-Gm-Message-State: AOAM533+YEGEwEjrl7V0Em2spZPNBgJPrzgRtrPQuWfDqdUXNJizIFOn
 0Co9uv6hF1tVsltgQyeshDM=
X-Google-Smtp-Source: ABdhPJxgRAmFi7meMMpq4Z0kgvm7V3vD6H2RgpIdH77yzbzYJ9UBpigow/kIK1BwXMBJ3LEWyj0yhg==
X-Received: by 2002:a05:600c:4e90:b0:38e:bb1b:d2e2 with SMTP id
 f16-20020a05600c4e9000b0038ebb1bd2e2mr326133wmq.69.1649880771458; 
 Wed, 13 Apr 2022 13:12:51 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 h8-20020a05600c350800b0038cc9096507sm3846715wmq.3.2022.04.13.13.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 13:12:51 -0700 (PDT)
Message-ID: <f955882c-0a56-977b-602f-9d530b3e86e2@redhat.com>
Date: Wed, 13 Apr 2022 22:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 2/8] nbd: mark more coroutine_fns
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-3-pbonzini@redhat.com>
 <20220413122513.kcc65cmllyc7cl3m@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220413122513.kcc65cmllyc7cl3m@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/22 14:25, Eric Blake wrote:
>> -static bool nbd_recv_coroutine_wake_one(NBDClientRequest *req)
>> +static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
> This already has_coroutine_  in the name, would it be better as_co_?
> 
>>   {
>>       if (req->receiving) {
>>           req->receiving = false;
>> @@ -144,7 +144,7 @@ static bool nbd_recv_coroutine_wake_one(NBDClientRequest *req)
>>       return false;
>>   }
>>
>> -static void nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
>> +static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
> This already has_coroutines_  in the name, would it be better as_co_?

These mean "wake a coroutine", not "I'm in a coroutine", so I'd say they 
are fine as is.

Paolo


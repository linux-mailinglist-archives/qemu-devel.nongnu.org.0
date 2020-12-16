Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529282DC29C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:00:33 +0100 (CET)
Received: from localhost ([::1]:57602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYI4-0002Se-Bb
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpYF7-0008Gi-1O
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpYF4-0005nx-S9
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608130646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LIG3jcVIGncP2vUS1bXEhKF2aUhxH4r0dd+E+veD7Hg=;
 b=SAFbfpXJcmOe0cmrs08lPnrG/MQrSOflU1+v+McK/Y/DOuWJK6e7/mKrpAP1vxtEhwIlje
 K6lxaQQpm+k5dV5WwtaqBcHwwFai552Jm5IcUjqYitYLOt3jAxSFztbdMGFww4EZpxMwgt
 ZuCMKTUVtxF8WeeYrJmspIIhsoC3c8Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-hTFUTgQZMYWomuJjWHkTMw-1; Wed, 16 Dec 2020 09:57:24 -0500
X-MC-Unique: hTFUTgQZMYWomuJjWHkTMw-1
Received: by mail-ed1-f72.google.com with SMTP id l33so11875224ede.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 06:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LIG3jcVIGncP2vUS1bXEhKF2aUhxH4r0dd+E+veD7Hg=;
 b=oML/bm3UeuKmrsCLfnQh0YYOA8hlzlcn0MG7hKaT6e/p/xJq6yBx+ObHwSPNzWPFN4
 jY+6JUWrjoGdeZSNsjZfZ0loWnMtadqsGxHlNXt7Qx/8I3Dcsp0Sa9fKDs4j3TnRAVfZ
 vjTg+gyo0bllZkOp9nLRNaXw1MxmdLUVwC3lbHNZOd6x/R6wt0lODaK12sHJZPuY7Gm2
 QFlmnNKCs2KrZ9dJcGhl4soqCCPdPsH1Qkn6eHiunL0PpePBLtEY21LrcOqqfDllK2KV
 d5dWBxSN+xAsYSbZOZo1P1WhgYbb0j4ZIj/FOeFuv9Eu/bV2azvpLtw5dQqhXeihiGhY
 09EQ==
X-Gm-Message-State: AOAM533rW2nHK9y6SZGSWG0rxf4grin7lGu3ttfCj8iwEiLr7e8mDDxU
 RrxlSDxD1OGhA0TV5MgLpKAOg89NPdUsNmzos+bhjcgzGS5F9G+S7PuDifHYoqdqEeutWbX77DQ
 tG/psAESxqcI0ELQ=
X-Received: by 2002:a50:d2d2:: with SMTP id q18mr33876094edg.346.1608130642724; 
 Wed, 16 Dec 2020 06:57:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVRcejMJ9O6tdIrjyW3vQZ8tCABSQF92+NkKB4VxljJ/ToRIEuXy7XUvX34mqZbH+6c8cYRQ==
X-Received: by 2002:a50:d2d2:: with SMTP id q18mr33876087edg.346.1608130642567; 
 Wed, 16 Dec 2020 06:57:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n16sm21621218edq.62.2020.12.16.06.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 06:57:21 -0800 (PST)
Subject: Re: [PATCH 2/3] move icache flush out of tcg.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201216135529.265165-1-pbonzini@redhat.com>
 <20201216135529.265165-3-pbonzini@redhat.com>
 <81af6c34-3ede-0a5e-ae3a-4f9f2cf205a3@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5e1d19b2-1bb1-84ef-079a-ddc4555730e4@redhat.com>
Date: Wed, 16 Dec 2020 15:57:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <81af6c34-3ede-0a5e-ae3a-4f9f2cf205a3@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/20 15:52, Richard Henderson wrote:
> On 12/16/20 7:55 AM, Paolo Bonzini wrote:
>> icache flush is also used by non-TCG accelerators.  Do not require users
>> such as physmem.c to include tcg/tcg.h.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
> 
> See also
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg03623.html
> 
> I moved it to a new file, rather than into cacheinfo.c.

Oh, I missed that.  I'll pick your patch instead of this one.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9F5412F5E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:27:53 +0200 (CEST)
Received: from localhost ([::1]:55018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSaC0-0004ef-Pi
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mSaAK-0002bS-2d
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 03:26:08 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mSaAI-0004Yl-Gs
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 03:26:07 -0400
Received: by mail-ed1-x529.google.com with SMTP id dj4so14979783edb.5
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 00:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xoaxEoG6PwrspGMocHlFHQ31PuFZgKjAtC32n8y+EA4=;
 b=I0TwZbLQT21iGW486pqX8kn4UC56jRrqonEF2bJ77+PrIIMlUD44Apvb9nBB4aSsvo
 QovarHVGSLYK+OlA0k9g7DYiUPznwOSDZRjTVvNUUOThDI9xaJRMT1QxvqDPQr/rcFzQ
 pTfC4OVoncmjcOAPwNUb5v/rB4qOd2ctQzIiSbqIVF8XJxA+ojw1I2F341Jprsmq3gOM
 /s03eFe2qWdOZGianzVjF+DQ3YxaC0bkMahKgAx2zYlLMcf0KF/ZHODmXpiDhCnEqjmF
 ZUaCaO2Z+t+/H/HK5C07TJUMegrHEM/y7Rqlj1UyltwswMhOUIB5Ls8N+ocZrTy3X5JG
 cd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xoaxEoG6PwrspGMocHlFHQ31PuFZgKjAtC32n8y+EA4=;
 b=dAwaiMNg5WcEXv4jqsN+Lc9w+m2DTM2vZm4sK1ehse40RTh/2J9o7/JtZRZAlRnYzH
 8HM+Ervv2GCmFfqqYqNITzL5gcUFQUznzXoBkPaAnXSJoLurjXQrFnPBf1l3xTAFUSFt
 wPiPFaX79spkSpmdMJOaQqJGMxqBlrB9Y9nWBJz5y/sZ0oC6EkpUe0uWOK7244IUmPjO
 u3WNuNmBtz9fElRlwRnIE8/ijoJo3NWcnySHynquVRtcNtQSVtMcykq1t7HmJLk0sBQ0
 uKaOPt2jaourX4fhUqB9Ici0Hc3k0cIuV4qWXhQY2Q7bmtpuWFsvds0v/eNaTzHNXpv5
 cEYQ==
X-Gm-Message-State: AOAM530HkwiWirvHscmIyTq8E1TKrgxi1dkzgABeY4B1lNh2UxFCGIZ/
 UsQInMtv4/OLQP63M2CGLB8uwLVs2PM=
X-Google-Smtp-Source: ABdhPJzGPLdBcog5+5Dnlnxr3YaJ4u/oUgbz7M2AStnk2yExufrjLd6iDpBW9rRe+y5oTNl4sCd9Zw==
X-Received: by 2002:aa7:d582:: with SMTP id r2mr34043256edq.324.1632209164822; 
 Tue, 21 Sep 2021 00:26:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id v13sm7044232ejh.62.2021.09.21.00.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 00:26:04 -0700 (PDT)
Subject: Re: [PATCH 2/3] scsi: make io_timeout configurable
To: Hannes Reinecke <hare@suse.de>
References: <20201116183114.55703-1-hare@suse.de>
 <20201116183114.55703-3-hare@suse.de>
 <CABgObfbUH4Djyicuie0-Bbu1zKrYN3+NDd56c5KA16s+Q+Liww@mail.gmail.com>
 <1f46ca6f-4ea7-247e-b3e9-680e3f60b2b2@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <35e66c97-0124-be61-b79e-84eba6c17fbb@redhat.com>
Date: Tue, 21 Sep 2021 09:25:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1f46ca6f-4ea7-247e-b3e9-680e3f60b2b2@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/09/21 07:39, Hannes Reinecke wrote:
> It would, but then anyone attempting to use tapes via qemu emulation 
> deserves to suffer.
> Tapes are bitchy even when used normally, so attempting to use them 
> under qemu emulation will land you with lots of unhappy experiences, 
> where the timeout is the least of your problems.
> I sincerely doubt anyone will be using tapes here.
> Not in real-world scenarios.

Hmm, I have customers that disagree.  Probably the timeout should be 
kept infinite for tapes.

Paolo


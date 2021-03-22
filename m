Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBF3344852
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:57:43 +0100 (CET)
Received: from localhost ([::1]:42708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLzy-0004UZ-Qj
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lOLFo-0004uI-Ln
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:10:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lOLFl-0000lq-UT
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616422189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6+pRs2xi6aoq2CsnXMuWN3Ce/jzNWvWsbbhqMJ0Alfg=;
 b=gjY6DTVNFesatVhIyEY6K4L41E3dvfIn5jjgUxCr06K/xgdjNxRbQXjxnXUea26DQc+IxM
 CWVpwQUSexQqDu3qQ4dZQSp0O7Vn9YDGbGK8TTaHBY2Zs0Qp7Ou1nZNDeh+SQm6ZgvUf1M
 1JKrNMB/E3Tvw9eXV1+OFn5+V4yR0u0=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-lRdqpdtiP4OvScNX2Rs9pw-1; Mon, 22 Mar 2021 10:09:46 -0400
X-MC-Unique: lRdqpdtiP4OvScNX2Rs9pw-1
Received: by mail-oi1-f199.google.com with SMTP id o125so9908990oif.0
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6+pRs2xi6aoq2CsnXMuWN3Ce/jzNWvWsbbhqMJ0Alfg=;
 b=uKFIEGCtuRYNUnXbTANVaCqew9/Z2Nejo4ju70iXxfoQG/HVuOls1TxcJCgGc1ZOEO
 62sPNBJfvLTA8oiR/wJJENtbHUBmeXLlkLmk4CQoxOQy/JZLeEr3Qud7yri5UveVBdJi
 MdIsyOKnCOlMTGbwiTsi7TyzGbDpdLyniHjjYppNCHCC/cziEwXIh1N3Uh3xTJsOTFe6
 ySjSQI5UW8W+Q8ebQmuqVtnxWkJD6i8wwU2tKMStLEehSabgdRfKMni4CmfQugZvwd6v
 4o2GMYQn1tjaki8IFEZeoo+sLCLesSqOyxL6YDo5Nm1j1I3AKI+Orr1rPL44BJhZSl1v
 W7mA==
X-Gm-Message-State: AOAM530nIZLbt48n6ffdnO6UUVG0fGSoCZHxRRkcRw2CytBEAeh+sAOY
 6OscWsNQPuZQWM7HTekIpl25qgmozupGK3WwS5q4BrccX0WWeN8FKwywqmSodQ81DK4auzXBN1L
 lpmYGU/p/FZLlG1U=
X-Received: by 2002:a9d:22e2:: with SMTP id y89mr124851ota.15.1616422186057;
 Mon, 22 Mar 2021 07:09:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz5gJM2VipoXkx/ZGVo2MJaHYfcL8rdbEjHpg1+DO2xNqGz3jl1BpUASLrt3Wv4U44yBSPmA==
X-Received: by 2002:a9d:22e2:: with SMTP id y89mr124840ota.15.1616422185895;
 Mon, 22 Mar 2021 07:09:45 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 i11sm3351094otp.76.2021.03.22.07.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:09:45 -0700 (PDT)
Subject: Re: [PATCH 0/2] SEV firmware error list touchups
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210218151633.215374-1-ckuehl@redhat.com>
 <cd383ad9-21c6-340d-8821-c151e1b9714e@redhat.com>
 <bde95e1b-86ef-18d4-6864-7bc034d41688@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <3644aa5f-ee80-358c-f563-faa15c2c8a9f@redhat.com>
Date: Mon, 22 Mar 2021 09:09:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <bde95e1b-86ef-18d4-6864-7bc034d41688@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 5:18 AM, Philippe Mathieu-Daudé wrote:
> Hi Connor,
> 
> On 3/15/21 3:08 PM, Connor Kuehl wrote:
>> On 2/18/21 9:16 AM, Connor Kuehl wrote:
>>> Connor Kuehl (2):
>>>     sev: use explicit indices for mapping firmware error codes to strings
>>>     sev: add missing firmware error conditions
>>>
>>>    target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
>>>    1 file changed, 25 insertions(+), 23 deletions(-)
>>>
>>
>> Eduardo, Paolo, Richard: ping
> 
> Looks too late for 6.0 now.
> 
> Can you repost/ping after QEMU 6.0 is release?

Sure.

Connor



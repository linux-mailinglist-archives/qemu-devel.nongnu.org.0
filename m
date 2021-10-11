Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C854B428BC5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 13:07:04 +0200 (CEST)
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZt95-0006B6-LT
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 07:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZt6v-00054N-U7
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZt6r-0004fK-Ku
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633950284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3o+BZFCWxeYT7KIBQLIXKhw1LutUhrLv6etVY6xY1U=;
 b=U1uKOYtmNwFocbXiBkhpY8EQaT9LQRqFwtqPzWrXr5OnxTzBOJre0uZQSlCz3bVfD9o1ZH
 vVoT6sh8SzdStIr4ZaONw9QHuX/ZQtCfMSg4TymWeIzSBQfxEYSGducxBORCFG/nuU7DhY
 ffy4yrGIRPXgDwFAoEw9Wcy+6rsLv0g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-2D3xzmvUMHCQ5mTTCPIyWA-1; Mon, 11 Oct 2021 07:04:41 -0400
X-MC-Unique: 2D3xzmvUMHCQ5mTTCPIyWA-1
Received: by mail-wr1-f70.google.com with SMTP id
 c4-20020a5d6cc4000000b00160edc8bb28so7203931wrc.9
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 04:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X3o+BZFCWxeYT7KIBQLIXKhw1LutUhrLv6etVY6xY1U=;
 b=xbaHd7uiToy/EeKG/QDe61YxKUzhk9UQJyNAOZbidc558GmOPkxWPsncdTJdupkQ7G
 94axeGcboQGp92jXN8dl0HVffidKTlOebzs6E57TBgzgEhiZFzXCv2FiKoOTcnZYeqP7
 +LItlmNv7zIIQFdIc6yaWaMI1RKRM4JTyRoPV+McQq8KYMx4hA+Gza3j0WMhCtCJ5LTf
 E7x5vlQEQFFS0vP3d1WlG04l3C/chim0g37D5bfk7WMjeWTxgFLgRMYqFelyB+wSN0xG
 smiAdC65KNidG92LncRwGO3tSuZb766AD/DBYL2gIJAf2w8FsnRhiGsIBJWNKQFzPKYZ
 7Wgg==
X-Gm-Message-State: AOAM533s2UTCRY0XkNA6P6BKnJ5uujwbdqFT7eZhhHN4SWyNQG5o+PTW
 VnAh20rY4MYVkc1Croxeihc4fPsrK6ZGbpWnaItrlKVeKTjVoCFdeEzBA7imOJOWZ1VEAhQkjUE
 vLsxyJ7c2ig68P7M=
X-Received: by 2002:a1c:a558:: with SMTP id o85mr20684694wme.110.1633950280707; 
 Mon, 11 Oct 2021 04:04:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7dNDgKQYkbCmyFN+Ty3KJzgxM8zv5Vr8I2q97a/LbuXAs7qDJ5oLx7jk7qA4JhNg7XUfeow==
X-Received: by 2002:a1c:a558:: with SMTP id o85mr20684669wme.110.1633950280504; 
 Mon, 11 Oct 2021 04:04:40 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id y4sm2580391wmq.20.2021.10.11.04.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 04:04:40 -0700 (PDT)
Message-ID: <6d4bde7f-8a2e-3f20-eb25-f653161b24cd@redhat.com>
Date: Mon, 11 Oct 2021 13:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/2] pylint: fix new errors and warnings in qemu-iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211008062821.1010967-1-eesposit@redhat.com>
 <ec26842c-27a7-4f3a-3eab-7f2096581101@redhat.com>
 <10dd6939-4199-0974-a4e6-0c9a45a7c721@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <10dd6939-4199-0974-a4e6-0c9a45a7c721@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.10.21 11:58, Emanuele Giuseppe Esposito wrote:
>
>
> On 11/10/2021 11:29, Hanna Reitz wrote:
>> On 08.10.21 08:28, Emanuele Giuseppe Esposito wrote:
>>> There are some warnings and errors that we either miss or
>>> are new in pylint. Anyways, test 297 of qemu-iotests fails
>>> because of that, so we need to fix it.
>>>
>>> All these fixes involve just indentation or additional spaces
>>> added.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>> v2:
>>> * temporarly enable and then disable "bad whitespace" error in 
>>> image-fleecing
>>> * better indentation for a fix in test 129 in patch one
>>
>> So the changes look good to me, but I can’t get my pylint to generate 
>> a bad-whitespace warning no matter how hard I try. (When you asked on 
>> IRC whether others see pylint warnings, I thought you meant the 
>> consider-using-f-string warnings that John disabled in 
>> 3765315d4c84f9c0799744f43a314169baaccc05.)
>>
>> I have pylint 2.11.1, which should be the newest version.  So I tried 
>> to look around what might be the cause and found this: 
>> https://pylint.pycqa.org/en/latest/whatsnew/2.6.html – it seems that 
>> as of pylint 2.6, bad-whitespace warnings are no longer emitted.  If 
>> that’s the reason why I can’t see the warning, then I think we should 
>> take only patch 1 (because it just makes sense), but skip patch 2.
>>
>
> Yes you are right. I had 2.4.4, and now that I upgraded to 2.11.1 I 
> don't see bad-whitespace errors anymore (actually pylint does not seem 
> to complain at all). So I agree we can just take patch 1, as 
> formatting is wrong anyways.

OK, thanks!

I’ve applied patch 1 to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block/

Hanna



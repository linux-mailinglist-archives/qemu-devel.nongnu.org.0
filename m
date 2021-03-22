Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0191E344509
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:11:52 +0100 (CET)
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKLX-0000lf-1f
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOKKY-0008P7-Dv
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:10:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOKKU-0007ZU-7M
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616418644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgRSzlp9o9+YR8oJp7GgP0xsFpiOfQygvu7LSWanYdA=;
 b=IwOEHmaCKrbjCpMvWb0Bb+PrpHb3r/Kczkvl9mkgCVQYDbLC4bRQxXWL+RVHlP6tl4SXdA
 Os/hBlXYAx7ixthGDf6uWk9bxJ4BJ1SVyen0eswppzVrFpXVzMT+40UOUkJfKSSupFw02E
 M14MQ/zaYgwd/2dFsi8GojLmTu/ThZg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-xowy_QTpMPKTl1pn0FeesA-1; Mon, 22 Mar 2021 09:10:42 -0400
X-MC-Unique: xowy_QTpMPKTl1pn0FeesA-1
Received: by mail-wr1-f69.google.com with SMTP id h30so26040712wrh.10
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RgRSzlp9o9+YR8oJp7GgP0xsFpiOfQygvu7LSWanYdA=;
 b=RWY998AqNUngSeUKgY9YGKhNHbFL1Ckze12xtowaQWDQyv19Wk4NiKPZmKa+QM4XnR
 N7X7NZAmNObJHxWef+5U124pMx5WxqtsPnSZSNc+nKvh4Hz0MuYVnZMafsirclTeBFZx
 ZuwKljZTuWqvQt0UWP3OsTYIvJAqtmCib6O0AmANeGGZtIosE4v0xoOTSApdCnXzfA1U
 UGcSIld2thOm9qZza7j2c5iyCVoelFhwn0jkjzsE7poKHP8nFylWyGqyefePTxm/GXtR
 TW5RE38v96TkrHMieFn3wNgBxDe/uxPkbvYXY+XjH0tI5CNyglI1BJDeAO03mxWyom+E
 KVbg==
X-Gm-Message-State: AOAM533BV0ueuvM+L/aGznN6ce+MB7yhMnCIG6MofbeN6GKS1jKXVXPH
 vL7m8JvaEeML59ZnC61lhHsCOooPb9kk0uh/hOACuIL2SfNkTtJQvjAY37HfI7DZn5vnEyR26GM
 xuhbAtGWCPGxIaOQ=
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr15762788wru.259.1616418641111; 
 Mon, 22 Mar 2021 06:10:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFfFpL09eMjfcjI3QPmQrG0f8ATq2zJ2R/7v3heWaWADNK9e/TUBnXM9NEVJW1iKPLiPUgVw==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr15762771wru.259.1616418641002; 
 Mon, 22 Mar 2021 06:10:41 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x11sm18691549wme.9.2021.03.22.06.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:10:40 -0700 (PDT)
Subject: Re: [PATCH] nvme: expose 'bootindex' property
To: Klaus Jensen <its@irrelevant.dk>
References: <20210322082444.12916-1-j@getutm.app>
 <a7030c4b-943d-c88d-655d-dfd6398d68d5@redhat.com>
 <YFiPfnX8is7tCS16@apples.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <79302867-4160-8a39-bc0b-a981e04d8b1d@redhat.com>
Date: Mon, 22 Mar 2021 14:10:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFiPfnX8is7tCS16@apples.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:nvme" <qemu-block@nongnu.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Joelle van Dyne <j@getutm.app>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 1:37 PM, Klaus Jensen wrote:
> On Mar 22 10:58, Philippe Mathieu-Daudé wrote:
>> On 3/22/21 9:24 AM, Joelle van Dyne wrote:
>>> The check for `n->namespace.blkconf.blk` always fails because
>>> this is in the initialization function.
>>
>> This usually mean the code depends to some state only available
>> during the QOM 'realization' step, so this code should be in
>> nvme_realize(). Maybe in this case we don't need it there and
>> can add the property regardless a block drive is provided, I
>> haven't checked.
>>
> 
> If we defer to realization, it won't be available as a parameter on the
> command line, but as far as I can test, adding it unconditionally
> doesn't break anything when there is no drive attached to the controller
> device.

Patch is good then :)



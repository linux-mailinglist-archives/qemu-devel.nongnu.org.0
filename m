Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C4841151B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 14:58:15 +0200 (CEST)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSIsA-0005RA-NE
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 08:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mSIr5-0004lM-Fg
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 08:57:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mSIr1-0007GG-S6
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 08:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632142621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n079083B6k5FNu5HBCdqB/lUt70q20Xo/zWiaBpDkkI=;
 b=PPGHCnu7Rpgza+KfKjyaIO7eSh1xpH6iupaY92BIPoHRfrnTebVyd66g6vuY3/6C4neZHz
 xfhdPJeH38QaS2b76qIAy2Fs/Me2TmjlwKrIhvJkNys+YUYDh+HSKgqgrlRJGyjt1yctJy
 npI1Bh1An7kFzOzxuL8y9wLEgQgT1IQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-RxoLxdKyPDeDpgULdHUUVw-1; Mon, 20 Sep 2021 08:56:58 -0400
X-MC-Unique: RxoLxdKyPDeDpgULdHUUVw-1
Received: by mail-ed1-f70.google.com with SMTP id
 o23-20020a509b17000000b003d739e2931dso13865444edi.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 05:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n079083B6k5FNu5HBCdqB/lUt70q20Xo/zWiaBpDkkI=;
 b=FFNzORge8v+pwP5pMXo3Hhj+5hF+CYtnsvT9tdo/kDA+L59yrVBB45LYzA2FaRlKAw
 QLh4FOYcH2p6Wfw/0yrSeTzTWY+Msh2mCLwyid4khkRIH/2oRtSKFhyTDViayDI3QSbI
 Sui7zj94TzpVIXgIvJh77WaumJSUIFS5pxaR59odwgIaVPJI9X6OjCcpB1qJFOZmhp2p
 S8anhJAueQVXP05LP9ZArtb3iVDM1TdrSAlIu63T5BHp1OxRTL9zWqnigbrjj/ryIoiy
 TS9ieuJ9gCMUsFnBPKIxzhHZyXbrNTsibKMw+ZSgq85grJHVPFOhX4Xwpz/xuTPTiogA
 x6/Q==
X-Gm-Message-State: AOAM530MvM7n6oYEBsblibdU+FfzQa5vAhNYjPT880JmGHib7T3QvQ7/
 DJVkfVqlFGRg7b/wzAHgY3g/dGkLhX+jMm3XEREs9sZQKFq0LKLpK+yq1yQ0W6TpQtMxdmYFcD1
 wTlEYsKqMedmGJIM=
X-Received: by 2002:a17:906:2bc7:: with SMTP id
 n7mr27520372ejg.238.1632142616873; 
 Mon, 20 Sep 2021 05:56:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvn1/7fogKUt30b7w+EvXjgGv95oe1Td7lq83b3v5GuwlARDx2XBqgzE7+5vGN9q6Na69xfQ==
X-Received: by 2002:a17:906:2bc7:: with SMTP id
 n7mr27520356ejg.238.1632142616666; 
 Mon, 20 Sep 2021 05:56:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y4sm6097299ejr.101.2021.09.20.05.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 05:56:55 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Fix memory leak in sev_read_file_base64()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210820165650.2839-1-peter.maydell@linaro.org>
 <a25a7814-af34-eecd-2672-bda706692c31@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a5e4bf09-64f4-5fcd-bf30-d767c293b9eb@redhat.com>
Date: Mon, 20 Sep 2021 14:56:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a25a7814-af34-eecd-2672-bda706692c31@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pan Nengyuan <pannengyuan@huawei.com>, Li Qiang <liq3ea@gmail.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/08/21 19:05, Philippe Mathieu-Daudé wrote:
> On 8/20/21 6:56 PM, Peter Maydell wrote:
>> In sev_read_file_base64() we call g_file_get_contents(), which
>> allocates memory for the file contents.  We then base64-decode the
>> contents (which allocates another buffer for the decoded data), but
>> forgot to free the memory for the original file data.
>>
>> Use g_autofree to ensure that the file data is freed.
>>
>> Fixes: Coverity CID 1459997
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> Tested with 'make/make check' only...
>>
>>   target/i386/sev.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Queued, thanks.

Paolo



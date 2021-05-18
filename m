Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F691387657
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:21:57 +0200 (CEST)
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwrM-0007dh-Ga
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwSS-0005yN-FI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwSO-0000MX-6d
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vqJUf0hWjhoU0N/Mbawa0AyF2gQvow6Uz10vDMn3Oio=;
 b=C+eH5vyH3SjsbivjaZYWFepydwd7xnI/iB7yTTXsXFqsGgy1Alrcgoe9Fx/v6knf/g5H3C
 EKSZy5IeGkZOrFI9o0NXBVRLLgTctavAaDVbDPHk5tUCbHM6QhXLyZPcalbr+THLrt4Vw3
 Y+umRHY+7I45n/hK0ZVXFVe+4PxTZPI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-jLqH5fbtOGWvv6LwgccLWw-1; Tue, 18 May 2021 05:56:03 -0400
X-MC-Unique: jLqH5fbtOGWvv6LwgccLWw-1
Received: by mail-wr1-f72.google.com with SMTP id
 1-20020adf93810000b029010fd5ac4ed7so5337344wrp.15
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vqJUf0hWjhoU0N/Mbawa0AyF2gQvow6Uz10vDMn3Oio=;
 b=YKsYP0uiYCluiaYKGkzLqjPHtSdX7YpLN0+oUGgiESeZpxnO9IawmyxSMN4G/Ik8Se
 kiGtjQjWaiI0dM5tSOXEkmn6YHe4sc8QFq/zN7wscgD4znIbF2mGAQ+gWSkS0m0ttNEW
 tKVuISt2nuQdJTCZnfiEDWR2Ku8TrtOoo9LuJIKfB86gHsvPZYuc9ICzukA9oPLz9v5D
 GfDMj4prIqwYBfD+V+3KtDAdoJDKRnLfOParIJGb+OdoGaf/Z8N+RysfhbTwkd2beSMw
 0GqlaVRonZZ7KskId45eevLvOnEs76mDVTdS/wEBTNHzClW47arQMZq2d/1OFYa9MqL3
 FM9w==
X-Gm-Message-State: AOAM5310o5KVj48PDW6SAmshLAAQZfnqcDc8KH0d13MQQ1Jb/ZXcM+xp
 Em/arO4Ma4n7qEX008m8SVxLvHpKcq+GAvEQR7tUlOBzNeTajXAnaRg4pI1q38eg485ZK5BxIvy
 C6upEr048UsVJWUk=
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr5859952wrq.92.1621331762688;
 Tue, 18 May 2021 02:56:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw20ROgrcbZ5JOZkpOunhGrmY03seR0miE5V/XmeRmvgeS0It8dIAaDMNVcaJfSgu1mVAUfnQ==
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr5859934wrq.92.1621331762542;
 Tue, 18 May 2021 02:56:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g5sm7368008wmi.8.2021.05.18.02.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:56:02 -0700 (PDT)
Subject: Re: [PATCH v2 34/50] target/i386: Mark some helpers as noreturn
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-35-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7680e646-a542-9b80-a1be-befd1d319b4b@redhat.com>
Date: Tue, 18 May 2021 11:56:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-35-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Any helper that always raises an exception or interrupt,
> or simply exits to the main loop, can be so marked.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/helper.h          | 18 +++++++++---------
>   target/i386/tcg/bpt_helper.c  |  2 +-
>   target/i386/tcg/excp_helper.c | 18 ++++++++++--------
>   target/i386/tcg/misc_helper.c | 14 +++++++-------
>   target/i386/tcg/translate.c   |  3 ++-
>   5 files changed, 29 insertions(+), 26 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>



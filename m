Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73CD33DC6C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:19:05 +0100 (CET)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMEHY-0002Fh-MA
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMDea-0004Ci-VY
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMDeX-0006iy-T8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615916325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93VJ0r/V2YCLLJxCoIMxwcfoAaX8hWutqG/0GkrQlHo=;
 b=TCWoltt9hCCMMX2icC11M101th2WpdojflF3kallBpGK9FSGT1PJT5zkEg9apKoXse+KmE
 kKEeh53YmJW5+nkNU5D/TwMjV/U/n2rOQo5mCf4WQtYJkPY0Lc7PWZqWcRkFmlKhrpIaYF
 hdzVpOb2rRFiEr4YSm0hvUK0JAVWTAM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-gUC24_IoOd6enf9zpOa-bA-1; Tue, 16 Mar 2021 13:38:43 -0400
X-MC-Unique: gUC24_IoOd6enf9zpOa-bA-1
Received: by mail-wr1-f69.google.com with SMTP id p12so14443581wrn.18
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=93VJ0r/V2YCLLJxCoIMxwcfoAaX8hWutqG/0GkrQlHo=;
 b=NVPTGc7h5AS85rbjyx2bCoabufBOrxZ030GgvVQeELeA0oIz12OB3AOQkdEmXhdzJT
 bRQ2eqk+aJQ4vMNgXdydbA2gthzloItHvLhtZd2Ac9RODPWyrD7nqAqxY7D5aEITNJ93
 AY1HTTTii/MFlWS8xXWmWtMvbKCGRbaEjzBS2UxDEStmtY0YOUBgJw1yITft70njkqyH
 p4F30VqnEr2K0HXc2zLUgh8Dljv5iNX/V0JtXvB11wfrGevaGB0sGhJIQyflzDXVXojy
 4x4E2qJZk4khfB9JYCsiXVyH6wPajgIaeDR3UyMKKAxNZ8yt69iM6d/SdFXRsgh8t7DT
 SnXw==
X-Gm-Message-State: AOAM533217K0Uep+buKbOlRGKlqgRCF2Q5xrTTXSB+aXsprGlkmEx5PH
 0654671PhWGkHsG8Be3BDnFCHB6kuv42bxYKRrlXqUWTjJilEHxm+vjGy09KFqSq3mEYwPWIQBy
 3SKr779QK6X9NFiqSG6LkeqPW8br57azKhLAX6cdt1vZHfJvBUCpqCRGdUSRSLH0i5yc=
X-Received: by 2002:a5d:6304:: with SMTP id i4mr130090wru.155.1615916322100;
 Tue, 16 Mar 2021 10:38:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjbAnWeAq0NlQy2+boMBiiuLy0L3c6czRUEfzUD2psF6S+C7GTWOJBx4nRAQX1PS8B00gNmw==
X-Received: by 2002:a5d:6304:: with SMTP id i4mr130066wru.155.1615916321875;
 Tue, 16 Mar 2021 10:38:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a12sm21888333wrx.5.2021.03.16.10.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 10:38:41 -0700 (PDT)
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
To: Reinoud Zandijk <reinoud@NetBSD.org>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com> <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316015503.GA1008366@private.email.ne.jp>
 <20210316131304.220a53b9@redhat.com>
 <9e2e1d83-29c1-053a-fd43-187f6f824b39@redhat.com>
 <YFDcWFNyq7dH3ZAS@diablo.13thmonkey.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7be4087b-fb7c-2206-d408-af3b7141e6a7@redhat.com>
Date: Tue, 16 Mar 2021 18:38:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFDcWFNyq7dH3ZAS@diablo.13thmonkey.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Isaku Yamahata <isaku.yamahata@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/21 17:27, Reinoud Zandijk wrote:
> On Tue, Mar 16, 2021 at 01:49:57PM +0100, Paolo Bonzini wrote:
>> On 16/03/21 13:13, Igor Mammedov wrote:
>>>> Although I don't know about nvmm case, this function also needs to be updated
>>>> if smi isn't supported.
>>> can you submit a patch for this please?
> 
>> nvmm is not part of upstream yet, so I guess it's up to Reinoud to fix it.
>> Still, reproducing his testing conditions with KVM and -M smm=off is
>> probably interesting because it also affects HAX, HVF and WHPX which are
>> supported upstream.
> 
> As stated in my other mail, I think NVMM supports the SMI.

I doubt, even KVM only supports it as a kind of "fringe" feature for 
secure boot.  But anyway, feel free to post the patches now and we'll 
have time to do more passes if needed, during the freeze.

Paolo

> We would have liked
> to add NVMM in the comming 6.0 release but I see we missed the timeframe as
> the soft feature freeze date is today.
> 
> It was posted here some months before but somehow it got stalled and when the
> main NVMM developer left the project to persuit other things it kind of
> stalled. I've now forward ported NVMM support to todays Qemu sources.
> 
> With regards,
> Reinoud
> 



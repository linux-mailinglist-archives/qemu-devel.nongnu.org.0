Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028153251AA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:44:07 +0100 (CET)
Received: from localhost ([::1]:36578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHs6-0007gw-0n
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFHqp-0006k8-PI
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:42:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFHqn-0000zI-Da
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614264164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGp06j97mQi5tJsSeo2IGWj2d6MxxjQzXOLpodBMb1w=;
 b=bUdGbFXT8Bd3XDDL4hYQh5TLb5thLr0cKEu8BkJKoRk/kDCXaoQAnbS8rYA8VIJ2b/MYPg
 97oXcoa7QsuUCbt2OSSeb4MWjjBvUE8dXu/Z/b4Lc58E+1/FN9/lU5q2xMMdYbhgfp8cwo
 W2b/9eHo78Z2mywWetFBWJ4Ro9IRfsw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-qpHocgAOMpuDE9uRunJWgw-1; Thu, 25 Feb 2021 09:42:43 -0500
X-MC-Unique: qpHocgAOMpuDE9uRunJWgw-1
Received: by mail-wm1-f71.google.com with SMTP id h16so1990981wmq.8
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 06:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TGp06j97mQi5tJsSeo2IGWj2d6MxxjQzXOLpodBMb1w=;
 b=As6AAJnzxzfCFccBagQb842KJH31X3WD9Dt7MtyfSuBNesMTX7DH0x6D1keUsDcT2u
 RLnfFKy0nuizmlVNkdVkeEHv6YUDYjOXN59jCmhMIsReHVtrdthXQSgf0gWEJfDRHp2F
 yVzhu4NJIkPQU9uhibsRkUFwL2lTVIhCLMGzybrDRHtjU2ZWNAlVauu3rTsjB/TrN++h
 wYl9hQ7WJryX+R/lixGWP7PFouDx1uEvw5f0NOxHp+cFZaOPmKffsH0ndcbVZfxaamtt
 E6YK8qIzGhlquie2ntSWHSz7CluXeL6iRWQuJCMijwU9RKC1r6nfOs98aoNXG722QrmJ
 12jQ==
X-Gm-Message-State: AOAM531vMj8Tv44MZsh8jUlQUj2zFsNKZtS4TcoBXt8LSXjRbrwGl1NY
 TLuW5QPeS0nX7ilCtLE5R3yheFDw7enuemqixWkyuDalgztt8zOh0w8w/idqqs/QbweInS8H+DU
 o/xTYXYeQv8toE3rjDl5SH332P9WlqPdZG/uHI03h1blQezPaMximtPQhVrXgjkWbkyQ=
X-Received: by 2002:adf:fc46:: with SMTP id e6mr3912885wrs.389.1614264161730; 
 Thu, 25 Feb 2021 06:42:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZwJj74T2QOjs+RiZwvTiWTP9XQMpTWrTlViIbrKErzhqLlW7DHCuFdQu6lJHqNv0y9QyTgQ==
X-Received: by 2002:adf:fc46:: with SMTP id e6mr3912852wrs.389.1614264161414; 
 Thu, 25 Feb 2021 06:42:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p16sm7810148wmj.8.2021.02.25.06.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 06:42:40 -0800 (PST)
Subject: Re: [PATCH v2] vl: deprecate -writeconfig
To: Markus Armbruster <armbru@redhat.com>
References: <20210225131316.631940-1-pbonzini@redhat.com>
 <YDeuOYpYZX+49AAd@redhat.com>
 <7593fccc-fb5b-4e1c-a35f-e9e4ff940a9a@redhat.com>
 <87lfbc9q74.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a09be207-575b-8d69-8d65-42610923f62d@redhat.com>
Date: Thu, 25 Feb 2021 15:42:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87lfbc9q74.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/21 15:28, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 25/02/21 15:03, Daniel P. Berrangé wrote:
>>> FWIW, we've rarely kept exactly to our 2 cycle plan. In practice it has
>>> become more of a minimum bar, rather than an exact deadline.  If you want
>>> to promise death in 6.2 though I'll defer to your judgement :=)
>>> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
>>
>> Well, I have patches waiting for the removal and sitting over them for
>> a year is already enough. :)
> 
> I don't see a need to bake the end of the grace period into the
> deprecation message.  We don't do that elsewhere, either.

Ok, I'll change it to just "-writeconfig is deprecated and will go away 
without a replacement".

Paolo



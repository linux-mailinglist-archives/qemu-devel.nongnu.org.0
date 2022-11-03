Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17830618607
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:18:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdpx-0007nF-9h; Thu, 03 Nov 2022 13:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdps-0007mL-QS
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:17:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdpg-0001Lq-JJ
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667495807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xn/zV/1aq9MhX7PhWTYe4I0LHq8bpkljniNKNkFlny4=;
 b=aT4EK05ZBXERwJS+cJVcn5rh4jOy8+HGz/HZh31yn1rpyJA74T+ohuhJWokMPIfLxCOWuG
 23tDY2VFZRh7TVUbpslD6IXHpzj930gHrd+bHBGfPk3lHe6OJpMXwHJUUQfjKP9d2GXkHg
 Mx9Uf9/sNjjX1yq/ZXxsRDxlo22nv24=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-ame7ipywO22xOYjOCUVnSg-1; Thu, 03 Nov 2022 13:16:46 -0400
X-MC-Unique: ame7ipywO22xOYjOCUVnSg-1
Received: by mail-ed1-f71.google.com with SMTP id
 y20-20020a056402271400b004630f3a32c3so1829439edd.15
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 10:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xn/zV/1aq9MhX7PhWTYe4I0LHq8bpkljniNKNkFlny4=;
 b=fU+5du/pqJZpTutq/l6tueSuYIMAtxVymq6ZG3+527YZxItpFY73a+SxAQO79pQ1BV
 /gd/Z5XNtqlSFp2OKKcNa6FwSZgab77US05I1j//Y/FhB8e85WZeh21T2Yo98IN8fsmX
 LjzpLkLJU2vzgcEprW2OAZhcp/jmeyfruK5C79ZD1ErUp8alM8mPa2v5rJ4ZqzMtl5xm
 XtZDxR7gvBxc/9nQVsfT6VI7j5oETz03j5lnKOAc+HkrBaZBRWGTnTdJ83m6vzt7/icW
 Kl08PIyjzFTsJNPouG7aSWowcQocTeYynczg9yJQZXfukjaKsJ9gBkrVtj+0i4HUCcbW
 yaZQ==
X-Gm-Message-State: ACrzQf1T1CXOYG+TLAk8sNg0c783r6uGbKBkN6GgfQSso3l9C2ArLJFN
 PcKjKUiZkIV18mQo4QJjzoYFAKw/MXoAH7JAX9xyeBDeLMoWeP7Pv6Ao3Woed5d8CXFvCFQaOji
 pCJL8snmTxZkuNiM=
X-Received: by 2002:a05:6402:2706:b0:461:b93c:cbd8 with SMTP id
 y6-20020a056402270600b00461b93ccbd8mr31293225edd.254.1667495803906; 
 Thu, 03 Nov 2022 10:16:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4QjnBHGfFoAfgEM2ztdg7SS78UGof8XXaYIWFdMVFWucs2caMxZuS+Vpg/qPah3jPSkgTpYQ==
X-Received: by 2002:a05:6402:2706:b0:461:b93c:cbd8 with SMTP id
 y6-20020a056402270600b00461b93ccbd8mr31293093edd.254.1667495802183; 
 Thu, 03 Nov 2022 10:16:42 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 q3-20020a170906a08300b0078d9c2c8250sm728017ejy.84.2022.11.03.10.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 10:16:41 -0700 (PDT)
Message-ID: <e9bc7a8c-2d7f-99b9-b9b6-6318a3a56372@redhat.com>
Date: Thu, 3 Nov 2022 18:16:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for 7.2] Fix broken configure with -Wunused-parameter
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20221102202258.456359-1-sw@weilnetz.de>
 <Y2OCyLSw2hurfemT@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y2OCyLSw2hurfemT@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 09:58, Daniel P. Berrangé wrote:
> On Wed, Nov 02, 2022 at 09:22:58PM +0100, Stefan Weil via wrote:
>> The configure script fails because it tries to compile small C programs
>> with a main function which is declared with arguments argc and argv
>> although those arguments are unused.
>>
>> Running `configure -extra-cflags=-Wunused-parameter` triggers the problem.
>> configure for a native build does abort but shows the error in config.log.
>> A cross build configure for Windows with Debian stable aborts with an
>> error.
>>
>> Avoiding unused arguments fixes this.
> I'm not convinced that we should allow -extra-cflags to influence
> the configure compile checks at all, as there are likely more cases
> where arbitrary -W$warn flag will impact the checks, potentially
> causing configure to silently take the wrong action.

Meson cc.compiles/cc.links tests never use -Werror to avoid this (which 
has a different set of issues, but if you want you can add the argument 
manually and 0.64 will also add a "werror: true|false" argument).  Since 
the last configure tests will go away in 8.0, I'm fine with just 
applying this patch in the meanwhile.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F12425071
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 11:51:58 +0200 (CEST)
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQ4D-0005TM-Ll
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 05:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYPvM-0007mI-DD
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYPvK-0000gE-Rb
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633599766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GBhJwkIwiBT2/Ui8//Rb3PIMyglL90cAxVd3ak4/zLQ=;
 b=HF5qPTqK5TLCucAR7Lt4iA9o1bXnqUGTj6KjhaZ9hofNPJCzq8Vx9Ow97WRLnasQCSASXD
 tWY0PwTMWSLoQI0NQfDH+4BD8hPqbsjGisJdKWEW6QPKgC02LXPLIinlUArdmVJHKHYqJg
 NnctcuPLuSpaouoZT6/6ucnmP4Iq7T0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-0PmRc4ixMeOiZcsV28NFpg-1; Thu, 07 Oct 2021 05:42:31 -0400
X-MC-Unique: 0PmRc4ixMeOiZcsV28NFpg-1
Received: by mail-wr1-f70.google.com with SMTP id
 k16-20020a5d6290000000b00160753b430fso4238215wru.11
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 02:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GBhJwkIwiBT2/Ui8//Rb3PIMyglL90cAxVd3ak4/zLQ=;
 b=v2Lqui1agPLg2OCL8ebGQ154I5I5triGYd3ErdowWceglKPaDOe3h0vx/lFqwYfTZY
 jcaW/1a4x2RlhedNZxnCfMcIts/45qmpqjPfOS4VNzghMGsdiGU5mIcPcRu75069iLwG
 cnxiHnLt3IERcFukU6Qu6ek/lWqjzoqY31l+/wN8x/SO+zHhkNnpgbMsq+pSUhBiirdT
 1tFdLMno/8SufHabpy8DM0DnOiVmVCdFNP7CM0AgmMc30tZzPfbfqCQ9hWSCAJRhtrgn
 ypkkaSs8aCsFNXiiZJlZpw7v6bZBZx9uLXy208lgIJkxKk1gOeUDNAjFSmB6rYCNj7AN
 CKUg==
X-Gm-Message-State: AOAM532ElhQ9VWOAjeCvyDiG2dGD0BZ6u16jBPs9T4N7wOlOKDWE+NuP
 6DT/KdVr8+1GPsDTt/VzFQGYGE5nxrrsCLheKcqSKS+H+mqSkIlmB9WKucX00xPLrSnkUq6RvOk
 Mk5qSl//Pyt0IEYg=
X-Received: by 2002:a1c:1b90:: with SMTP id b138mr3524950wmb.160.1633599749984; 
 Thu, 07 Oct 2021 02:42:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXpFrflJFtKsI0TFP+uwAMQW212+stpcyPue4ddbboFlzqqPz15V1PbWQctYB9oBUUf1QiCQ==
X-Received: by 2002:a1c:1b90:: with SMTP id b138mr3524927wmb.160.1633599749739; 
 Thu, 07 Oct 2021 02:42:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g70sm4197416wme.29.2021.10.07.02.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 02:42:29 -0700 (PDT)
Message-ID: <c8f74ca4-f8b8-0fdd-5172-925b43f8e42c@redhat.com>
Date: Thu, 7 Oct 2021 11:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 12/12] meson: show library versions in the summary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211005164408.288128-1-pbonzini@redhat.com>
 <20211005164408.288128-13-pbonzini@redhat.com>
 <2fe71843-bcbe-cbc7-dfed-d9beb60e9f2b@redhat.com>
 <658443a3-35ea-67ad-64f5-eb25059a454b@linaro.org>
 <8a067352-a8d5-6afb-6584-79604a0377a5@redhat.com>
 <face0d36-da9d-1ad1-4045-7de3e341f7d0@redhat.com>
 <f5a98954-4a10-ced5-c9bd-d71b6bb7006e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <f5a98954-4a10-ced5-c9bd-d71b6bb7006e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/21 19:56, Philippe Mathieu-Daudé wrote:
>> How do you run "./configure"?  If you passed explicitly
>> "--meson=/usr/bin/meson" or something like that, then you're asking for
>> the broken version (which works fine except for the summary).
> Yes you are right, this build dir had --meson=. Sorry for the noise.
> 

Np, you demonstrated that it's better to put it in the release notes.

Paolo



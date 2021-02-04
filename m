Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B3430FBCE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:47:02 +0100 (CET)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jef-0003S9-0P
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7iqe-0004TA-7q
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7iqb-0004NB-1U
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612461315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbZhwk8arZ3id85PAVCut0GHdvLUy82BHiibvcrjP6s=;
 b=TsZITEMpyIB5kknYz/U9zop2K2CdNMlKTIIm0E9sNKwWS5PJAEUO0NfuM5KpWqJ+GWG1wH
 l529nKZFhpct/9+VYEo9tX7IcIxOSYVEUeYvVwfOPQwTa1HZO9dcmuAfOQ7TQlE3HNEd4e
 ljSVQ0XCgQ/w+n6hZw5245Zrx9wB+AQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-3DlSq4HmOr2lXbYJGLk2TQ-1; Thu, 04 Feb 2021 12:55:12 -0500
X-MC-Unique: 3DlSq4HmOr2lXbYJGLk2TQ-1
Received: by mail-wr1-f70.google.com with SMTP id l10so3245585wry.16
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:55:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FbZhwk8arZ3id85PAVCut0GHdvLUy82BHiibvcrjP6s=;
 b=KkvNbTJOjWStv4ElrHa69X9zMNagWBLYd8w+Sq+VZDNaVVlsZjGUwiaEAvoIzEAvz+
 V9x7Q1X4bYc7I13xjPT9zzd1ZM9x3lG0qce7WcsiDP441ENLaxu+DaX92IJZixEC2Ek5
 M/8J3JAFUqvMwZz4yp+sVjUPiz7jUymUC73z0YJ4w4jFOaKLSUfmJWDvBPfK9WV6cT8f
 vj4nC3bqnasdUQUYumd/ulMM4ccLEBH6Kly8a2ek0rLbJE4x4vIGdVVQ0xEJiFQ2zCXl
 mqBHQezqneOLEC964TFZz6sXs76e3KNIrdNK4Ihyf6q3ocLAUSV5Af9atk+z6YXOGmDi
 m7yg==
X-Gm-Message-State: AOAM531tv92XNAccjZaXZGHjJ+bWvbmOsLAB13JN+73p/8WlSPMMQ0bS
 IGlmJ5U+hJ3e+IngBCpFPWJRR5myp3qKS6mgilB2GDm5mBJIfLJpxEKFcmQeUNeC55J2DMyD36+
 TxDlf86AMThsBzRY=
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr532941wrg.171.1612461311812; 
 Thu, 04 Feb 2021 09:55:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyprdrNcJGtB8AnLh9wuUUzFS9B28xPxIvARkmUIZt6E5Dc9+VPE4w0YIYEcN8KEKtOlD7BXg==
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr532930wrg.171.1612461311643; 
 Thu, 04 Feb 2021 09:55:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p9sm9297428wrj.11.2021.02.04.09.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:55:10 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
 <affe4e6c-8f3e-1ec2-5a6f-6da31a2ced98@redhat.com>
 <573fa4c4-6092-09ac-be49-0cc18af72a1a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
Message-ID: <aadb42d5-ea06-609a-159f-ba66378d3134@redhat.com>
Date: Thu, 4 Feb 2021 18:55:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <573fa4c4-6092-09ac-be49-0cc18af72a1a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/21 18:42, Philippe Mathieu-Daudé wrote:
> On 2/4/21 3:40 PM, Paolo Bonzini wrote:
>> On 04/02/21 15:22, Wainer dos Santos Moschetta wrote:
>>>>> -F: docs/interop/virtfs-proxy-helper.rst
>>>>> +F: docs/tools/virtfs-proxy-helper.rst
>>>>
>>>> Unrelated, but Paolo once said helpers are not tools.
>>
>> I think helpers is not a good word.  However, if an executable:
>>
>> - can be started directly by QEMU, or is not useful without an emulator
>>
>> - is usually too complex for a user to run manually
>>
>> then it should be documented in docs/interop (not docs/tools).  Their
>> sources however can be in tools/, that's not a problem at all.
> 
> I understand tools can be built/used standalone (no dependence),
> while helpers are companion of another binary, thus dependent on it:
> 
> - we can build tools without emulator
> - it is probably pointless to build an helper without its helpee
> - some binaries can't be use without helpers
> 
> Maybe "companion" is a better candidate to describe?

I don't think we use the word helper anymore in the build system, so 
really the only thing left is whether the documentation goes in tools/ 
or interop/.

The sources can be in tools/ unconditionally if people decide that's 
desirable, either with or without subdirectories.  I didn't propose that 
because the Meson change was big enough and it can be the decision of 
individual maintainers.

Moving the individual tools is easy enough, since most of them are just 
one source file, however moving the executables would require changes in 
the tests and son on.

Paolo



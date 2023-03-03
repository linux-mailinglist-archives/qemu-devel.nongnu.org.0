Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370606A9653
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:32:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3dm-0000CD-SE; Fri, 03 Mar 2023 06:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY3dk-0000Bs-Og
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:31:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY3dj-0007k3-4z
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677843114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2X96UUD+92YZeXNe71Re1yjjJOYn1e6yabwc3I03zXw=;
 b=Wx3gD9RXkAYlD0LDQ0YYvIrE0rXBkDDXCjmu8gVAy6BRG/MPfHN8etvujKV0pnos3O7/tG
 Bk7rnVgf9jwKoHp9atP3M6R6/qOL9WTczDqy1e/EvBjZ6Q+SI0gQJs1fUPJ3HtCis59a/z
 2S4Gv4Xvds0sf722KqVOkkXqx0O2pyU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-OKwxajBRM2enbmS_fNBkdg-1; Fri, 03 Mar 2023 06:31:45 -0500
X-MC-Unique: OKwxajBRM2enbmS_fNBkdg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so2706741wml.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2X96UUD+92YZeXNe71Re1yjjJOYn1e6yabwc3I03zXw=;
 b=WKhp21wvspsdfFL+3OkAgOtJnYa301mDrI3i9pwKk8PVVODTjYLcEWAP/fQTZYgmEQ
 DArjmPRrJG6xoDTf+E/erjXdU/IYY+rtQm4Uvsiqp8u7vIKonwg6TeYN4LeP/z0a8W+O
 O90drvu87hd4LzOkpRwRSsUnB0W1Nq6pcYxiMWxyWRFxe7v9jYUlxozaSt8Dkc0Rnebt
 6vCk8SXvDjBY09o5WZ9eB/OARFojKAJGHmKOjORth23H7j8TJjEhRJRGM3grpZYmq9fM
 zwFIs8TxCLUG5QRR80W2Fin1Hcjapk6PT1qJbKnTy+di2kZPJ90ANQDKhXihMhXZRk9B
 /0ow==
X-Gm-Message-State: AO0yUKWjiUEClzIxwgfGgRCn436BVx8jCd7q9PJxkrktysUi0lQzxJCG
 wBeQs6yjwW65a7NvWWomxU95QBcY8G6s6B2m5WCWUTfyiGdm2A0lnOLrK5ZNklWxCljWoQj0Rlk
 Q6k0txvXyc2cjb48=
X-Received: by 2002:a05:600c:5251:b0:3da:2ba4:b97 with SMTP id
 fc17-20020a05600c525100b003da2ba40b97mr964769wmb.19.1677843104687; 
 Fri, 03 Mar 2023 03:31:44 -0800 (PST)
X-Google-Smtp-Source: AK7set89jwYKfXX+tidUwcn0W5eTNsi8WSvEa9NJwfkaA5xQlI7lx04yyCW7l1zd4f/2YxKQHT2bhQ==
X-Received: by 2002:a05:600c:5251:b0:3da:2ba4:b97 with SMTP id
 fc17-20020a05600c525100b003da2ba40b97mr964749wmb.19.1677843104376; 
 Fri, 03 Mar 2023 03:31:44 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6452000000b002c71dd1109fsm1926497wrw.47.2023.03.03.03.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 03:31:43 -0800 (PST)
Message-ID: <4e6512e4-b159-cbe2-5f74-89fab25208e6@redhat.com>
Date: Fri, 3 Mar 2023 12:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Berrange <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
 <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/03/2023 12.16, Peter Maydell wrote:
> On Thu, 2 Mar 2023 at 16:31, Thomas Huth <thuth@redhat.com> wrote:
>>
>> qemu-system-aarch64 is a proper superset of qemu-system-arm,
>> and the latter was mainly still required for 32-bit KVM support.
>> But this 32-bit KVM arm support has been dropped in the Linux
>> kernel a couple of years ago already, so we don't really need
>> qemu-system-arm anymore, thus deprecated it now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index a30aa8dfdf..21ce70b5c9 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
>>   on x86_64 hosts. Thus users are recommended to reconfigure their systems
>>   to use the ``qemu-system-x86_64`` binary instead.
>>
>> +``qemu-system-arm`` binary (since 8.0)
>> +''''''''''''''''''''''''''''''''''''''
>> +
>> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``.
> 
> I think this is not quite true -- at the moment if you want
> "every feature we implement, 32-bit" the only way to get
> that is 'qemu-system-arm -cpu max'. The '-cpu max' on
> qemu-system-aarch64 is 64-bit, and we don't implement for TCG
> the "-cpu max,aarch64=off" syntax that we do for KVM that would
> let the user say "no 64-bit support".

Ok ... so what does that mean now? ... can we continue with this patch, e.g. 
after rephrasing the text a little bit, or do we need to implement "-cpu 
max,aarch64=off" for TCG first?

  Thomas



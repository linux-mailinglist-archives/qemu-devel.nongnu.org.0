Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7901523132
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 13:12:40 +0200 (CEST)
Received: from localhost ([::1]:35084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nokGl-0006BI-Ge
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 07:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nok8b-0003LV-Kn
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:04:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nok8W-0008KN-Jw
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652267026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztkaqyDRG5x2FreP+gsY/pttIlTUSPbxnJMhCRLTw0U=;
 b=aRm6L7EqaE/XT3MWo3r9dzyQTqp5sgYL85fLN5yM2aKvsZWOOCO7EwevjyCE3Db+rH17hq
 H31BaB5V6DGeKmBygk5c0bMQgfsxsZttCybpyhJuivm4k0tRjE9nsvUMQIiLv9mIsVQs6l
 8Hd5P/hn6fnRIb1BeE4LI69AiLFKlI0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-KAP0GmyCOyy-rKHkqHx2Yw-1; Wed, 11 May 2022 07:03:45 -0400
X-MC-Unique: KAP0GmyCOyy-rKHkqHx2Yw-1
Received: by mail-wm1-f69.google.com with SMTP id
 u3-20020a05600c210300b0039430c7665eso602625wml.2
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 04:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=ztkaqyDRG5x2FreP+gsY/pttIlTUSPbxnJMhCRLTw0U=;
 b=rMD8Esph4ky2Tlr7ObrKh4MN8JByukviOmpfhLGnHuQcSbBE8NsxG9lCOL+AV2+PV9
 423MF6JuKyOK8YK4GCML6G7Rl1kMhnZ2vJND0TFGCRhgNwb+WYHvL0KLTvzhgDh53QmT
 6CbrIIST1u6bmKHgXzBttKsHdoZRCM3mdOU4/PIbm1nXoaVnvU/14Kx98yPyxeL0fSyy
 /Y0kZV83TzfvRAOzHUR08rAfAdMXnGjldEYATydQBATMvF/CGJiUzjUNMSSv202u5eKb
 AofG4kYLr1g14c1+onOLpcWP7AXUF8PE7czC4OmIh+Kzhb4P4NVzYdLkF/VCgSMp1W6M
 E9ew==
X-Gm-Message-State: AOAM533FR99kkrzcHTwLBVZ7bM/quBx3AY7zpM31A/F8nBlBO+QePCfW
 /7oo7VsjO2o5Wz4xKtmyRQ8MNHzCLxL9G71NxOjlRUU+tgEacSqc/HP4ITKtJbaiP5viogOARd2
 6PGJYkWF8KK2BwFc=
X-Received: by 2002:a5d:4407:0:b0:20c:55c4:540e with SMTP id
 z7-20020a5d4407000000b0020c55c4540emr22440956wrq.92.1652267024581; 
 Wed, 11 May 2022 04:03:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqHxtpA8+hiGTfZCbUHJkGDifqdiXbxB8Xabrtl179vOlex5c2i+ge+UgjXgog1sLH2IigXw==
X-Received: by 2002:a5d:4407:0:b0:20c:55c4:540e with SMTP id
 z7-20020a5d4407000000b0020c55c4540emr22440937wrq.92.1652267024349; 
 Wed, 11 May 2022 04:03:44 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b003942a244f31sm5856832wmq.10.2022.05.11.04.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 04:03:43 -0700 (PDT)
Message-ID: <f40ceb7b-8412-8da2-7c16-2590debecaed@redhat.com>
Date: Wed, 11 May 2022 13:03:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Robert Foley <robert.foley@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220510195612.677494-1-thuth@redhat.com>
 <YnuCEPOj70J+1NXx@redhat.com>
 <CAAdtpL45Bn0wrDX6nQzkzQW=eqxrja4zOFcfG_gTz84LExSpoA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] Remove Ubuntu 18.04 support from the repository
In-Reply-To: <CAAdtpL45Bn0wrDX6nQzkzQW=eqxrja4zOFcfG_gTz84LExSpoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2022 12.46, Philippe Mathieu-Daudé wrote:
> +Robert
> 
>   On Wed, May 11, 2022 at 11:30 AM Daniel P. Berrangé
> <berrange@redhat.com> wrote:
>>
>> On Tue, May 10, 2022 at 09:56:12PM +0200, Thomas Huth wrote:
>>> According to our "Supported build platforms" policy, we now do not support
>>> Ubuntu 18.04 anymore. Remove the related files and entries from our CI.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   Seems like nobody touched the 18.04-based tests/vm/ubuntu* files in a
>>>   very long time, so I assume these are not used anymore and can completely
>>>   be removed now.
>>
>> Or it could mean that they are working fine and so haven't needed
>> changes...
> 
> Yes :)

At least for me "make vm-build-ubuntu.aarch64" is only failing with ssh 
timeouts (on my x86 laptop) ... is this really supposed to work with TCG, or 
is this KVM (on arm hosts) only?

  Thomas



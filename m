Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3E737179E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:12:06 +0200 (CEST)
Received: from localhost ([::1]:58530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldaEv-0006kw-86
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldaDq-0005Yj-66
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:10:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldaDo-0005Rc-Gs
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620054655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3j7UFY0YNG2FM6OXw1BaZUKD5kIZ9Ctbnv1rQqs6AcI=;
 b=hJuwXBHhqmyLrv+UEy2d+u6gTZgaAffjdOTAOgWu+yK/5nxcUZv9v1z5C7uI0i05G1eH2p
 zz3RltBg9vQC/1vSnL+UzD45hergPDLNZ8hQ9Kv3fPP7Ut4I0BYPD4vZylwsSBvLuvV4f3
 98FGNFl5UNCF5nfjCCHlHUrTbdpI49Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-4tB0tHWEN4qZVAfRZcwNHw-1; Mon, 03 May 2021 11:10:54 -0400
X-MC-Unique: 4tB0tHWEN4qZVAfRZcwNHw-1
Received: by mail-ej1-f72.google.com with SMTP id
 z15-20020a170906074fb029038ca4d43d48so2181418ejb.17
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 08:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3j7UFY0YNG2FM6OXw1BaZUKD5kIZ9Ctbnv1rQqs6AcI=;
 b=ZTs2yw+hJ3tgH67q1JNBVBFQ2xQsTaRPnMccbxxM13IChYndt+61VDBeirHVeYkpze
 r+pI5yxRo4ZZAntYKe9y7pRmGNhmqOwyM7neoaVqe6AS4yKFhc0TVH9EkfEzRocSQzvK
 BttwhPATJF/EuwupNEZXMldfQgERhhNHqu4T+GFCq8I6eMDpzBz+i4LShYEKllp6ze3S
 hZUQbGhZcQ+OYzUTmisyCaymDA1N9Lz1y+Fs9ZJU+Y02BNQ8VDVUGShBXfBsYxEF0hsh
 o4sM3OKos1VERcuOxWgQdlYMFU2V4JqwFhVErdhY6KYfLa0GAmrqc/+nZ+BaH/R8zXuu
 puHw==
X-Gm-Message-State: AOAM53332eu3f8bE1aOW4uavJwiBxHngaBSoQt4TkRPNZ28RcBsJnnjR
 Jw53q9paZ9hfRQH73cygG1ln+qj3QgQ5cdqADav1DKKsNFdZqegy45S0itUTc8tn8hbrPBK3ZUn
 8B3mp5p3Oz+7wvcU=
X-Received: by 2002:a17:906:d978:: with SMTP id
 rp24mr17280586ejb.333.1620054653044; 
 Mon, 03 May 2021 08:10:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb7ISTBiWl86N0HCmHy74Rvas5uMl/nr2k0RIQdE6hZmU+TUinALY66nST7TvjIvXDktTj8A==
X-Received: by 2002:a17:906:d978:: with SMTP id
 rp24mr17280558ejb.333.1620054652875; 
 Mon, 03 May 2021 08:10:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v23sm13017138eda.8.2021.05.03.08.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 08:10:52 -0700 (PDT)
Subject: Re: Let's remove some deprecated stuff
To: Gerd Hoffmann <kraxel@redhat.com>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <bd90409c-14d0-2732-0056-9fec8383479a@redhat.com>
 <20210429124049.z7qtkufk2wgvvd5i@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ac964003-8358-dfc6-dc6e-edb830541e0f@redhat.com>
Date: Mon, 3 May 2021 17:10:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429124049.z7qtkufk2wgvvd5i@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Robert Hoo <robert.hu@linux.intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/04/21 14:40, Gerd Hoffmann wrote:
>> In other words you would do something like -audiohw
>> <audiodev-args>,model=xxx and it gets desugared automatically to either
>>
>>     -audiodev <audiodev-args>,id=foo -device devname,audiodev=xxx
>>
>> or
>>
>>     -audiodev <audiodev-args>,id=foo -M propname=foo
> Suggestions how to do that in a clean way?
> Given that -audiodev is qapi-based I tried it this way:

Since this is sugar, I think it's okay to make it desugar into QAPI, 
instead of being QAPI all the way down:

- use qobject_input_visitor_new_str in softmmu/vl.c

- visit the "model" key

- look up the "model", fail if it doesn't match a known model

- pass the rest into a variant of audio_parse_option that takes a 
Visitor and returns and Audiodev*

- pass the id into a constructor function keyed by the model

Paolo



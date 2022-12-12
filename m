Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B42E64A53E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:50:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4lz9-0001iR-4P; Mon, 12 Dec 2022 11:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4lz2-0001hy-Hi
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:48:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4lz0-0001hk-Ud
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670863729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+yK7F0omTnM6FNu70B6R0PoNRirz7c4yNUbRlJUvMg=;
 b=fS7298/AfONZXcXxQZNxOPHRsXEZ0xQdK9hzl6eniEqvjUGwa9tqXzwWpy8+nZ+TbXEi1P
 hWbNXWRN0AytVp0ZyKgzx8i8Vr/VcUGCLOcujylNE1CMytEvrToC+tSNAZyofJhtGuCjYu
 V11JiL8BqV9a6BtMdbOsQOj1Gdnwl4k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-vFRfOSg7PhW_HspC10jcAA-1; Mon, 12 Dec 2022 11:48:47 -0500
X-MC-Unique: vFRfOSg7PhW_HspC10jcAA-1
Received: by mail-wr1-f72.google.com with SMTP id
 x1-20020adfbb41000000b002426b33b618so2376665wrg.7
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E+yK7F0omTnM6FNu70B6R0PoNRirz7c4yNUbRlJUvMg=;
 b=cIS7b0NlceotTKQ9fOoGNfLfVDb7LkMJS+vFQVVKKCdEWVYj9+kqnyjUTeKel5wg8g
 QrijPUYU9kLqG89q5AQLJTiOuqTLEHVHgrAWbvhRKrnP9xlebbFgYh2OY4gnMDmZUwKl
 l8IHQie1AEDuv6bnq+T+MKcfJjyYtVh9cvjH5yb05J/b7LybSUkRMaU0EhKD1C2VhVkk
 NfGTJizjAp3SmW4oQeCmSGOEz8ErbCJjy8HBaKLN7dhkZsgZTEO7UXsFK2vP+ChiJVJS
 Ed3ctjxIciIv7ZUp/zLMLTOX+1KhdaXdgroNAnmg/2WvO/MznRJ5KVw8yQo06fZnxUkI
 Na+w==
X-Gm-Message-State: ANoB5pkA+PvGu/i2ufYWCsGk1D6jeyBX82wTbCIHumCMehKO80EFlBua
 I6RRqFkz8BPnyOYhW8wwRYPoQx/tFpMNS3CyItewfdGf5oqwabqqJVmUCkcEzQ61QocxHyNFL+p
 nJr1Yaatp6uE5q/k=
X-Received: by 2002:adf:fec2:0:b0:242:8664:e71e with SMTP id
 q2-20020adffec2000000b002428664e71emr10435590wrs.36.1670863726789; 
 Mon, 12 Dec 2022 08:48:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ql/0D3NxoJOxW8NZs/gcRS1/1l/nFAT0YUqPp9RzAKUkYjgHWrN2cAsHul+YI2gcuBNkMoQ==
X-Received: by 2002:adf:fec2:0:b0:242:8664:e71e with SMTP id
 q2-20020adffec2000000b002428664e71emr10435572wrs.36.1670863726527; 
 Mon, 12 Dec 2022 08:48:46 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 e4-20020a5d5004000000b0022e57e66824sm10798218wrt.99.2022.12.12.08.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 08:48:45 -0800 (PST)
Message-ID: <b7ce9b86-811d-b7e5-8dad-82e7b825ae0b@redhat.com>
Date: Mon, 12 Dec 2022 17:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 30/30] meson: always log qemu-iotests verbosely
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-31-pbonzini@redhat.com>
 <CAJ+F1CJcVTX5DO4Jrs9P7MLL9qQr-Jy3N5LSpPWKWFzyLCgUEg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJ+F1CJcVTX5DO4Jrs9P7MLL9qQr-Jy3N5LSpPWKWFzyLCgUEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/12/22 15:02, Marc-André Lureau wrote:
> Sounds fine, but I like silence too. Could you give a bit of motivation details?
> thanks!

One qemu-iotests TAP testcase is comparable to a test() invocation 
elsewhere (in terms of both runtime and kind of test).  This makes it 
useful to see the last logged test.

Paolo



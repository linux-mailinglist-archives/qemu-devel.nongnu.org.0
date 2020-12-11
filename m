Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843392D74DD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 12:46:44 +0100 (CET)
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kngsk-0000Lv-Vk
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 06:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kngre-0008ID-Co
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:45:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kngra-0002kh-Cs
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607687127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZ8LQlF1TgAAts50HSe0nuGMsad+vhVtkH3XH2HyUcE=;
 b=LEM0NjbU/t91mUun80/TRKZLtLMtJBAVidzbpmazyOyyK6CoIgBNmfnVIRoHwHxnyju9Xs
 He6BAOH57fNh5RE69swU86IsyFiRugpnx5oyPyhxHc+1UVR/7yjiH+poj+eP4QlChF7jzg
 xB0kOyJ1sqfby/d30x4kjGcXRuzsRr4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-WqtPEAQHPCCqxSZw8p3b8A-1; Fri, 11 Dec 2020 06:45:26 -0500
X-MC-Unique: WqtPEAQHPCCqxSZw8p3b8A-1
Received: by mail-ed1-f72.google.com with SMTP id r16so3807351eds.13
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 03:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XZ8LQlF1TgAAts50HSe0nuGMsad+vhVtkH3XH2HyUcE=;
 b=S26FU6Am3W99tK8+4UArEQcpia6QuhGsqipNVBu+c2C7BQ7rX+rjV17ngtUpg/Zfwv
 9Doalpcxp3g37H0yGuMiJAWyxWcmMPCylhWThFc4ZrvhXKM2y8tRY5XJ57uwhiUmd29I
 8rK7spMbxENom8eykJEp04sT3U+pDj5TnDeLDoOKCd/jlYlVH0Of6xDuwfy2g0EUPzRs
 fl1gZaH/HiP6a/PpcitYRWB0s34nnj0c+wJeUMBI9/byEXG2u9JmjUobW4PitWEIoYGe
 5MtDIoHzc7Ouy5T5WneOfMjOjB4svmJp0MXJQuyND5h0rKgAnerTNhUWjgf0lKgRW8YY
 4zMQ==
X-Gm-Message-State: AOAM531Yrz7mQze4KzZtLY9/coRpGuCacqVVS16WY+3ebniyD1L/g0Ax
 vPUJW8sA0YXohYXocg+WIzH278jhbg6d1abOPxypjKcvZdPpa3vXqF/hSvjA1wR6+UvnqAha8XC
 n4b8yI1BtxTEM2SMqYbm20E/RzTAHnYQgA+esXWTfwr/9KIAscXezWpx6iGDiSiryGyk=
X-Received: by 2002:a17:906:34ca:: with SMTP id
 h10mr10763772ejb.417.1607687124337; 
 Fri, 11 Dec 2020 03:45:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxw4zkXEmkqcL54xDsQtv0p92mQlu3b1ZAsYqIm2MRZRPMLFVKWMaZlGWM0TlqlxcvtneCa0w==
X-Received: by 2002:a17:906:34ca:: with SMTP id
 h10mr10763747ejb.417.1607687124088; 
 Fri, 11 Dec 2020 03:45:24 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id u23sm6670441ejy.87.2020.12.11.03.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 03:45:23 -0800 (PST)
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
To: Wenxiang Qian <leonwxqian@gmail.com>, P J P <ppandit@redhat.com>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
 <a964ffea-ece6-3f33-3dd1-ee9c2b729b75@redhat.com>
 <87sg8o65ys.fsf@dusky.pond.sub.org>
 <212n55r-9n3q-8r4r-85p7-14n495r53s6n@erqung.pbz>
 <CAKZf9JDg=5y=2v=O6ZQjcLCYXXEn2szM_c3rrQgtTHvLsSicww@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2c1b5a52-cce0-560e-269b-9d61348cfa92@redhat.com>
Date: Fri, 11 Dec 2020 12:45:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAKZf9JDg=5y=2v=O6ZQjcLCYXXEn2szM_c3rrQgtTHvLsSicww@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 09:23, Wenxiang Qian wrote:
> Hello,
> 
> I may not have made the detail clear in my previous email. The details 
> of the AHCI device, after running the reproducer I attached in my report 
> are as follows. If there is any information I can provide, please let me 
> know. Thank you.
> 
> ###root cause###
> (1) The s->packet_transfer_size is bigger than the actual data.
> (2) packet_transfer_size is passed into  ide_atapi_cmd_reply_end, as the 
> total number of iterations. Each iterate round, s->io_buffer_index is 
> increased by 2048, but without boundary check.
> (3) The call to ide_transfer_start_norecurse use s->io_buffer + 
> s->io_buffer_index - size as the index, cause an OOB access.

This is not the root cause.  These are the last steps before bad things 
happen; the root cause is what _led_ to those last steps.  In this case, 
the root cause is that a read request with s->lba == -1 is mistaken for 
a non-read.  Read requests are able to reset s->io_buffer_index and 
start with the index pointing just after the end of the sector buffer; 
non-read requests instead visit the buffer just once and start with 
s->io_buffer_index == 0.

In turn, the fix is to validate:

1) that s->lba is in range when issuing a read request

2) that the size of the device is sane (e.g. the number of blocks is a 
positive 32-bit integer).

Paolo



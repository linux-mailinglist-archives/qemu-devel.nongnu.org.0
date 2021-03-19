Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF47341B30
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:11:02 +0100 (CET)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lND1x-0002FV-KG
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNCzk-0000YA-SY
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNCzj-0007pR-4Y
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616152122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPXjJYmiFJIwMTCbQJGlvL3wM/IknWzxETBIcfvbHSs=;
 b=C8Eh/5Mcnb+A1Nplg8XvgZbTGZy5IkAkolLcYkakKiJjDUtdlwv1hKwqY4/tIWVojzS5yv
 xdnVays1hzezQDFOWb9dDJ30g5divk6qYnDsAzevfO31FoLAUz0YC1YjwW22H8AnqsiFAT
 LPusS2/3wQjyIn939TTBUo3v+02WPhI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-WvaGBTGGMXmzlsu8B1HLKw-1; Fri, 19 Mar 2021 07:08:40 -0400
X-MC-Unique: WvaGBTGGMXmzlsu8B1HLKw-1
Received: by mail-wr1-f70.google.com with SMTP id r12so21692748wro.15
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 04:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZPXjJYmiFJIwMTCbQJGlvL3wM/IknWzxETBIcfvbHSs=;
 b=XrlQ0H4l6Be9BTaZQzSiiH6t7YcnNnrq+SdRxl2561aKHn4ewabHXtHY7YTw0qMzcm
 GwShHn3ZAaNLd4JRSxIkb+TT4xOgiXQ54XeAn7wk9/JP2oREsUcdfkZ6c4na2NESZoN3
 SR29jab3SDqb05FKPWZjsXfuviHoi6Z087cbS6wvTjPHY1df83Z8PjbRl1Mm3tt2AmE/
 9FBBCOKecz9R3JE0v5h81r36lVeF2n+XjRyonBs4gEDZ/5dxTkibtzlWt4hWxk6sJNrE
 gR4Y2+h/3Bo1RZHBFi12DRRPLjXQKuojtUkjh2J/ifmF3/3Dns8JNvqVEUCvYdYIYNK0
 XtKw==
X-Gm-Message-State: AOAM532rJIW9RuE/WkWbfj6Gfcyb8K4kiLVpLgItbl/goMBphJ5FuzdZ
 tEy5IzqN7sYYLasX5HlHRsRGBhd61XCVbnykyYVZUhnHxZkLIXoUxtUZ8+KZvlHmB4O6VEzTgWu
 wr8cA5R+Ki2/6MI0=
X-Received: by 2002:a5d:4587:: with SMTP id p7mr3942818wrq.205.1616152119675; 
 Fri, 19 Mar 2021 04:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz89dMQJjr1DIHI7BBumwdNiPKieFmFD2uF8Wk9adBzkjH5ryfwChnWWiWvxBYRtputSK9S5A==
X-Received: by 2002:a5d:4587:: with SMTP id p7mr3942801wrq.205.1616152119536; 
 Fri, 19 Mar 2021 04:08:39 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q4sm5977480wma.20.2021.03.19.04.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 04:08:38 -0700 (PDT)
To: Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
 <b06c176d-c4ab-6c27-c96f-0bf27f7fd036@redhat.com>
 <27c791b2-dcc0-6c98-d765-ac1b60b7af3d@vivier.eu>
 <0d55cabf-0fa0-f9fd-6436-de2e03422329@vivier.eu>
 <0b3cedb8-f40a-18fd-5030-a596afb9298d@redhat.com>
 <82f6dc3e-18bf-f90a-7e43-5568b319767c@redhat.com>
 <3bcc22b2-eb25-b0a0-f47b-72c747ca6f0a@redhat.com>
 <1a2a91a4-0425-0da9-482b-f46a6e17b6b0@redhat.com>
 <f69095dc-7021-4f3a-ef59-debcf3df2784@redhat.com>
 <42717291-e5ac-091b-1272-c997536728aa@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
Message-ID: <49100ad9-f3ef-0948-d558-8076782af4d6@redhat.com>
Date: Fri, 19 Mar 2021 12:08:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <42717291-e5ac-091b-1272-c997536728aa@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/21 11:51, Laurent Vivier wrote:
>> It would also make the patches that Laurent sent this morning unnecessary, and avoid the use of
>> aliases in the tests (so that it's clear what is tested).
>
> We don't test the virtio frontend, but the blockdev backend, so we don't care what we use here.

Sort of, see for example the iothreads which, with your patch, would not 
be covered anymore on s390.

> Aliases simplify the code...

Aliases are not deprecated but... let's say despised, because of the 
special casing they add.  But yes, the code simplification from your 
patch is hard to brush away.

So I agree, since you have already mostly written the patches let's just 
complete them.

Paolo



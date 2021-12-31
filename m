Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57084820EF
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 01:03:05 +0100 (CET)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n35Nw-00055V-W4
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 19:03:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n35MO-00039Q-5R
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n35ML-0000Hz-Oo
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640908885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xn81vPQ6hVXFBfUjuwswozTKQ3KmTFaoD2JXb8F7aQ=;
 b=XpCZTmtBq7Q/qPbnpaEc4+HJHl+kNlJcgxnor4F71glpQIFiuMQWvKzfoMHs4HDIT7O5ar
 DZjjALNaCsLs65F5++rCPodmPClMfWxQCTP8CYLQ7ncyhbgyweETxZa9qe9iEhRD6MFssP
 8f4/Z3BPLjpNAuzqOOVVpnm0uxLgU0I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-WIm5ttXoPDaqoxvZLe1ePw-1; Thu, 30 Dec 2021 19:01:23 -0500
X-MC-Unique: WIm5ttXoPDaqoxvZLe1ePw-1
Received: by mail-ed1-f71.google.com with SMTP id
 g11-20020a056402090b00b003f8fd1ac475so10167597edz.1
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=/xn81vPQ6hVXFBfUjuwswozTKQ3KmTFaoD2JXb8F7aQ=;
 b=6u+SOt9ryxC3DuanITs/SnRYU2It7IxbxLmmwx4FUgamP+b/8OvC+Mep7opCm+gfuP
 TOx6vYCKSUmzVDs8BOuH2nKb/o4qpRFQOBl69VWGlAsMyUSMzE5WsoLYwkRqQqmeZ/i+
 WhSab2Kym+1/w+4aOjaJY5STEcuUrUTWPJPkUlqLEcFrS6x6JIDcugL0BbEko4VHU9vk
 uwzuj51fYZisiX0iiQzHwBdv/+XoVFl6xqna5pe/snNygVQvPLTVJuXQ00DF/41AaSNv
 J3bG2Hy3FDE8lg08dUxAI0G67NJj6GaVw/uQM3bAydfzdUj0qJo9j69Zp4GjKyv09KIy
 dh1Q==
X-Gm-Message-State: AOAM531HzW/v3aMEN6CozHMPBc3pT/GNLF5vwSvd9gE/afPMvOkcYGU9
 DVSZ59zs9CgLo5/mFrnKGWZIKwLEzf8rJsyw6c3GXXTcZUq8Mswa8BMyZtub/pqpFf93byA4e0o
 9KvrNHg0/WLXcaUX4HXPArP/dOLR840EOrmk/d4P+alwjuB/taQM0xR1YtdCDkHMF
X-Received: by 2002:a17:906:c144:: with SMTP id
 dp4mr26709435ejc.88.1640908882405; 
 Thu, 30 Dec 2021 16:01:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycrbJubLBzNrMCkj0Tb3thGu2HrOEhstxUBFaqtEuLG8maSvH4BAswpbz2RzOY9SEk+YMEbg==
X-Received: by 2002:a17:906:c144:: with SMTP id
 dp4mr26709385ejc.88.1640908882147; 
 Thu, 30 Dec 2021 16:01:22 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id ne39sm8114365ejc.142.2021.12.30.16.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 16:01:21 -0800 (PST)
Message-ID: <7b0147aa-1d45-1496-d8c4-d00eac68ce2e@redhat.com>
Date: Fri, 31 Dec 2021 01:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 00/23] hw: Have DMA APIs take MemTxAttrs arg &
 propagate MemTxResult (full)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
References: <20211223115554.3155328-1-philmd@redhat.com>
 <60d8426a-b2fe-08e7-5ab6-ee73dcd114cc@redhat.com>
In-Reply-To: <60d8426a-b2fe-08e7-5ab6-ee73dcd114cc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/21 17:07, Philippe Mathieu-Daudé wrote:
> On 12/23/21 12:55, Philippe Mathieu-Daudé wrote:
>> Hi Peter and Paolo.
>>
>> This series contains all the uncontroversary patches from
>> the "improve DMA situations, avoid re-entrancy issues"
>> earlier series. The rest will be discussed on top.
>>
>> The only operations added are:
>> - take MemTxAttrs argument
>> - propagate MemTxResult
> 
> Series queued.

Patch 14 "dma: Let dma_buf_read/dma_buf_write propagate MemTxResult"
fails on 32-bit host (when passing &size_t). Dropped it from the queue.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C209372DE2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:18:23 +0200 (CEST)
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxkc-0007tO-6x
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldxfz-0004aR-M8
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldxft-0005EM-HX
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620144807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDjH8HUsPkhGMMcrdHjqQzQOQEJ2YcdFedYMSf93gzs=;
 b=iyBFTTAXWFXVrvIYGw95/WVLKDa4Bhlkg+IzZNuEuffVpILg0FLT3RKNkaZwSSTogSlExI
 OfHQvfU1/QeuJSnfPqbGBj5szwmV6JwyAYyl27NkwtpvyHAhd4pnzmhPclXtQgycZJvlv5
 S0AXonFggEilFnTxnAgcVq7IleG4UYI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542--X7hADwTPoGVRVMrwBpVKQ-1; Tue, 04 May 2021 12:13:25 -0400
X-MC-Unique: -X7hADwTPoGVRVMrwBpVKQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso5952510wre.8
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 09:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WDjH8HUsPkhGMMcrdHjqQzQOQEJ2YcdFedYMSf93gzs=;
 b=FfKP36neo6yHZ5WRuDJwx8QsVAnAN1BBVLtwYON7Tb+RTQpG61NwSy5OfBh7ssh7Wy
 U7frXwfUz2VeFR0jr2ifgKqRQ18miZhSpWBN7oHjeQeIAABQdC/uftVyQy/nTFWgxg+u
 HxJxBFCyuOzjKwObSvyooZej/x6m/22xU+L6qGBOj9YzZHkeHJal4EE1yW8OANB06i33
 jWPhxpga8tU7m/XAtDisqf4ahumDJMXGSg3PrZ9kraJXA697okfV0gkxKo9JzwBH7ORi
 21blKmACz/RlGb+PFzxByqqtVvLv9cMT/D4mCAb0aBA6FxLmTtfl5IMTGhUA4v2REift
 7iMw==
X-Gm-Message-State: AOAM531jLO9OPE16twWRLEwjeY7g2J5PkJSCRwcSKxRwT3i3Kam9edx4
 vWKJ1Ggm/VSzDg0Q3lKyJD8gDdLzHFUhlbAmgo5RHgjVQRIOaKJ3UhPi8Neo6fPUWdAht7DiIJb
 3Fz7DGjJYYFdnWXw=
X-Received: by 2002:a1c:6646:: with SMTP id a67mr4837503wmc.11.1620144804415; 
 Tue, 04 May 2021 09:13:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf5u8/7hb0tx50JECxyRwkz/p47GlzYsM74hvf5qBFysNjp1Q93reUZvSc16yiMCouZb39UQ==
X-Received: by 2002:a1c:6646:: with SMTP id a67mr4837479wmc.11.1620144804127; 
 Tue, 04 May 2021 09:13:24 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id s1sm3081836wmj.8.2021.05.04.09.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 09:13:23 -0700 (PDT)
Subject: Re: [PATCH v6 11/12] qtest/bios-tables-test: Make test
 build-independent from accelerator
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210503211020.894589-1-philmd@redhat.com>
 <20210503211020.894589-12-philmd@redhat.com>
 <8e675e24-fedc-c4df-22d6-b385142e0e4b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <759a1dfd-371a-7e08-e0cc-15114d5b2b3a@redhat.com>
Date: Tue, 4 May 2021 18:13:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8e675e24-fedc-c4df-22d6-b385142e0e4b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 11:19 PM, Eric Blake wrote:
> On 5/3/21 4:10 PM, Philippe Mathieu-Daudé wrote:
>> Now than we can probe if the TCG accelerator is available
> 
> that

Oops. I'll wait for Igor review before respinning.

> 
>> at runtime with a QMP command, do it once at the beginning
>> and only register the tests we can run.
>> We can then replace the #ifdef'ry by an assertion.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v5 had:
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> v6 is simplified and keeps the same logic, however since
>> it is different, I'm not keeping the R-b tags.
>> ---
>>  tests/qtest/bios-tables-test.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!

Phil.



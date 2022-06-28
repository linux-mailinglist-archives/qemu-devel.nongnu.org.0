Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3018B55C041
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:37:05 +0200 (CEST)
Received: from localhost ([::1]:57924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68ae-00072v-7s
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o68UA-0006Zp-5V
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o68U5-0001z5-Hz
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656412212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEtYhFiAvAAxLs717RRdAJ/5mXcgOIpOR8grCiqn97s=;
 b=V2IG5HiOhaIJehEK3SMUqY9eaX/VkqCj4EMRaJq2Yd2m7aTxogWwWzmIH8VqOD1nkcoBTc
 +Be6V6nVn0f/p0GOGBpSqaWuPBlbYsS8VwXwN0/PsWbZzQ1FsPoRzMpWbAjVfcyTOCNr4k
 MWLTnlapydlwSParpAG1eeg90xGsKSE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-cfmQjR5aNnyzNGz7jrXqJg-1; Tue, 28 Jun 2022 06:30:10 -0400
X-MC-Unique: cfmQjR5aNnyzNGz7jrXqJg-1
Received: by mail-wm1-f69.google.com with SMTP id
 6-20020a1c0206000000b003a02cd754d1so4899951wmc.9
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=NEtYhFiAvAAxLs717RRdAJ/5mXcgOIpOR8grCiqn97s=;
 b=bnIN6ARqdU5KXj+HCLhgR5qAhmf2LUdlNbn3E8JMaG63iZrAo8+1jgHOoIxBuE6CC0
 MudhrieOIO2Nx1KvvBRohQMVy5l8JKgV3S2xhFoUWjIXdDK+2ZwayFw2cZLB8mIWfGya
 iM8rUd/naEcSSQPxsZVa4TWb6Xz/lXvU5jc6/Nl9ws534gk1tiw4gYOqC3ICpftWkQ9Z
 Ad7k5mug6FausB6gxY61xtfeZki+j02N55yiz3SHyhzVgn7eZnoTVr42hcR0rVj/Nmnb
 CUNHEFoHiSx1m4xZ6oPj97szhCXYQsOcnBGoCIEKbC36Vw9ql3VgUHWHwgVOb2R/4633
 nvQA==
X-Gm-Message-State: AJIora+EhvN1lULUlfrUB7otnzgBzAe0dnb5JdImhkhajL1uEC3G4WXj
 lUoJfV6iDfOe815wXR11+CH4+wwc5O7k2NYKmkK0Vv/6XJ5f6CXahZpF+7SW02UXSvzypXOlfvj
 OK8zlkZKesgInQXI=
X-Received: by 2002:a05:6000:1888:b0:21d:151c:92a0 with SMTP id
 a8-20020a056000188800b0021d151c92a0mr6584927wri.609.1656412209600; 
 Tue, 28 Jun 2022 03:30:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vyk1e5IFrGrpUzHBAXWhka6qQPHGU9srAQFXejZkJJxu0c5C92afbfG21Ve4fnQ1R7ES2pCg==
X-Received: by 2002:a05:6000:1888:b0:21d:151c:92a0 with SMTP id
 a8-20020a056000188800b0021d151c92a0mr6584913wri.609.1656412209400; 
 Tue, 28 Jun 2022 03:30:09 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 t10-20020adfe10a000000b00210320d9fbfsm15798228wrz.18.2022.06.28.03.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 03:30:09 -0700 (PDT)
Message-ID: <11d1ef8e-d3c0-5a08-7c44-a4936c6c07fa@redhat.com>
Date: Tue, 28 Jun 2022 12:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
References: <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <YrrUnfHwmu50JrJD@redhat.com> <20220628061749-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
In-Reply-To: <20220628061749-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 28/06/2022 12.21, Michael S. Tsirkin wrote:
> On Tue, Jun 28, 2022 at 11:14:53AM +0100, Daniel P. Berrangé wrote:
>> Now that you mention it, avocado does feel like a more appropriate fit.
>> IIUC the biosbits project appears to be effectively providing a custom
>> guest OS ISO image. IOW this testing is quite biased towards being
>> integration testing which is the target of avocado, while qtest is much
>> more to the unit testing end of the spectrum. This would avoid all the
>> discussion and patches around introducing python to qtest
>>
>> With regards,
>> Daniel
> 
> Yes it's an ISO image but not a full OS.

The avocado framework is not meant for full OS testing only. We have a 
couple of tests there that just run a small firmware image. For example:

- tests/avocado/machine_m68k_nextcube.py : Just runs the original firmware 
of the NexT Cube machine

- tests/avocado/ppc_405.py : Just runs an U-Boot firmware image

Some of the tests even do not download anything at all and just run a QEMU 
instance via python, e.g.:

- tests/avocado/virtio_check_params.py

- tests/avocado/x86_cpu_model_versions.py

So I fail to see why biosbits should be so much different here.

Of course we could argue whether the avocado framework is really such a 
great fit for the QEMU test suite (as I said in another mail, it rather 
feels like an oddball nowadays), but that's a different argument.

  Thomas



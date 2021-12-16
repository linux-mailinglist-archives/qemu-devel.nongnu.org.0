Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67149476E65
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:57:39 +0100 (CET)
Received: from localhost ([::1]:56120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnW6-0005iY-Bd
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:57:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxnTC-00046H-7b
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:54:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxnT0-0003Eu-N4
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639648460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xs5OY7Sv6bIvDjHloU4Ht/3jxhseiWqoJRVcBCuWBaA=;
 b=D76EF0rBYNp8YS7EnDe3k15PLPebFlkxFNqxlAhee/Ttzd+D5WZZrf2W8Hq5Qwq3z4hAwp
 4uY9uXpHTL9emNxFGldEisXxf8M0yChudkP6PlJ9F13tG/aLVAHb9OY0xAWSfOMCiTZBTy
 1TuB3eJ/OPr7zXuK6lBj/6lKVMjnjyQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-QGGSWhPvMM6VclH8hUOlBg-1; Thu, 16 Dec 2021 04:54:19 -0500
X-MC-Unique: QGGSWhPvMM6VclH8hUOlBg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso10080169wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 01:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xs5OY7Sv6bIvDjHloU4Ht/3jxhseiWqoJRVcBCuWBaA=;
 b=otdeBQV0XhAtciORZES/XjmIGUG5U2ubEQEHu8SAkxGQfAOG6DwWHDBsJ57NDZzoE+
 g+wAcs+WXYcxz6yPI9zpc7j9VHTmhgNaSVmSOWaLT2W4xIWJYCD86I6Xns3EGqrRYU9W
 1FeKHlRPwSlM7vilCL1wg1D2iJuMtzm8ooDK9Y2jnSfwcqzN+R8BZWAYOeL3+HasApSo
 IVknDiqrxISWYlo7hcHvmvK8lfAe6N5jH+wqY+0c6GRmtDamqYs1r74EzoB1G0y2FyBa
 MPA/gbdHH3ukR+ot/O2h3cF16e0eZPOS35uluedr7KHTq/dNPNxfofml3WgbjtO5XrRa
 UEgg==
X-Gm-Message-State: AOAM533Wi8cJjp/6C78tIBmdbo/dhPIoDxDeQvseIv4hr9k9PMerjgK7
 8gJnOfXoHeZ3595Awb17Ut9idKELbB33KyQpuhMt6jTdrpAhUczVZnvoYZpKqgyqrlBe8xo67sg
 xhdSb5WNEj4eKhtc=
X-Received: by 2002:a1c:a783:: with SMTP id q125mr4147090wme.132.1639648458533; 
 Thu, 16 Dec 2021 01:54:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8lQTfXNJEdGdU1K0uAy1KyJRmhdN2ApllMsPDjYZv7vt+MM+8ny5aoG+pbQxM3Xp2+9BArg==
X-Received: by 2002:a1c:a783:: with SMTP id q125mr4147067wme.132.1639648458279; 
 Thu, 16 Dec 2021 01:54:18 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id u10sm5850533wrs.99.2021.12.16.01.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:54:17 -0800 (PST)
Message-ID: <8a41180b-b627-bc04-6144-62ee19b799ea@redhat.com>
Date: Thu, 16 Dec 2021 10:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 0/3] hw/block/fdc: Fix CVE-2021-20196
To: Kevin Wolf <kwolf@redhat.com>, QEMU Security <qemu-security@nongnu.org>
References: <20211124161536.631563-1-philmd@redhat.com>
 <YbNZXXoqhB1nqEYE@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YbNZXXoqhB1nqEYE@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 14:42, Kevin Wolf wrote:
> Am 24.11.2021 um 17:15 hat Philippe Mathieu-Daudé geschrieben:
>> Since v3:
>> - Preliminary extract blk_create_empty_drive()
>> - qtest checks qtest_check_clang_sanitizer() enabled
>> - qtest uses null-co:// driver instead of file
>>
>> Philippe Mathieu-Daudé (3):
>>   hw/block/fdc: Extract blk_create_empty_drive()
>>   hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
>>   tests/qtest/fdc-test: Add a regression test for CVE-2021-20196
> 
> If I may ask a meta question: No doubt that this is a bug and it's good
> that we fixed it, but why was it assigned a CVE?

No clue, I suppose this is audited and handled by qemu-security@ team
members. Cc'ing them.

> Any guest can legitimately shut down and we don't consider that a denial
> of service. This bug was essentially just another undocumented way for
> the guest kernel to shut down, as unprivileged users in the guest can't
> normally access the I/O ports of the floppy controller. I don't think we
> generally consider guests killing themselves a security problem as long
> as it requires kernel or root privileges in the guest.

Agreed.



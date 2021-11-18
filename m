Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D782B455D11
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:56:03 +0100 (CET)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnhtT-0006Lj-09
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:56:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnhOf-0000d6-QL
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:24:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnhOb-0000XS-Hp
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637241848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44ixxT7YTwYREEBaRKQNN00bWOqG9UcraitkvHR7Adw=;
 b=Z8gsjp04SgT7u86Vcq2/dyzxcRcpMGa5X7qge11TSuik5KQ7UJqPx+Q7QEDwxWu6gvUU0h
 667nXImNx4OMhSSq/XYORyvxDBHrx5uyzszS9UYgy52CfR1iZdcBycHjwrPRvTQ6MQxiIb
 fb6HyJCbtvFsX7+9WDksPWvLfYR2SXU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-W85FVkYLO8iOpxdTvj8Cew-1; Thu, 18 Nov 2021 08:24:05 -0500
X-MC-Unique: W85FVkYLO8iOpxdTvj8Cew-1
Received: by mail-wm1-f69.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so4323285wma.3
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 05:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=44ixxT7YTwYREEBaRKQNN00bWOqG9UcraitkvHR7Adw=;
 b=g3b+J6e5m5LDX5O81ksMqzApr29Z0DKnRmXYAtYh1xkHj9BZL1RbiOf5IUQwuxH0A3
 ztLCoWEKA2XXCar/gflp+DFUl08GsWxxxEVkm7zguPZt8CMgf0vsH3B6xHGRbBOH83Nt
 UskETaolN1wAso3Y/e/7h5ffFg12WwIuVq4OkL6YXybjYZPo4fJbI3VfA6DnHwt/f1Hr
 RmOamyd0mtg8pkmB9AP5DHovEHveiejzpmRIYMosYNJgOma8STB32vJfEsAGMZSYaP9g
 MC8JQCWkwvr/fkV8A0nVrcbuLkWe88T4otNzHhTpP5XI8iWMtBOMMVv/EuVPtbOyRAOx
 ldXg==
X-Gm-Message-State: AOAM531TC12Va1eBhm/kqiwoz/8wBdiazx6YgAeLQRutLtJCzRUlM/5Y
 QBamqekUlZpqK3lxnWlczXJxAe6y3aDh8PSYQ5F0Ge3PxOkD9fftDMPgfKJrdQBZ6QTcnIlgwnV
 YUr1Y8dlv6BtMEqQ=
X-Received: by 2002:a05:600c:1e26:: with SMTP id
 ay38mr10123182wmb.14.1637241844112; 
 Thu, 18 Nov 2021 05:24:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3Fkb7t+6+tCDqbO401reGIPijlqMsjlXK0hkTO2Koof4CRo8YGzxg/or73s4dAvHwgULtyg==
X-Received: by 2002:a05:600c:1e26:: with SMTP id
 ay38mr10123153wmb.14.1637241843921; 
 Thu, 18 Nov 2021 05:24:03 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a10sm8991081wmq.27.2021.11.18.05.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 05:24:03 -0800 (PST)
Message-ID: <171fc584-6968-039f-cf39-857e5725d6a0@redhat.com>
Date: Thu, 18 Nov 2021 14:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [qemu-web PATCH v2] Add Sponsors page
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211118122912.4051779-1-philmd@redhat.com>
 <641401f8-378f-213d-1be8-5c704780ea40@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <641401f8-378f-213d-1be8-5c704780ea40@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Markey <admin@fosshost.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+project maintainers

On 11/18/21 13:54, Thomas Huth wrote:
> On 18/11/2021 13.29, Philippe Mathieu-Daudé wrote:
>> Add a page listing QEMU sponsors.
>>
>> For now, only mention Fosshost which requested to be listed:
>> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
> ...
>> +QEMU has sponsors!
>> +
>> +For continuous integration and testing, hardware is provided by:
>> +- [Fosshost](https://fosshost.org/)
> 
> Are we finally using the server now? ... the last time I asked, it was
> just idle and we talked about returning it?

I frankly have no idea whether we are using it and who has access
to it.

Thomas, who is your contact with the QEMU community?

Anyhow whether the community is using this resource or wasting it
is orthogonal to this patch purpose, which is to address Fosshost
request to be listed, and we can not deny we had access to their
resources for months.

Thanks,

Phil.



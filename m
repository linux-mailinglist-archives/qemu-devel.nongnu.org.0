Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731848555C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:05:00 +0100 (CET)
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57qV-0003ov-5Q
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:04:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1n57mg-0000vV-LR
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:01:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1n57me-0007RD-16
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:01:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641394858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GpFUOgWjUY7YUMHsbIIUzxq/Zhl7Q/5UAfQ+kGbqbQg=;
 b=Ihu6YhVzZU7RRGgvlnw8CqOewWMCQ2bA46VbQYEw4hU6yi3yOhxeDGz7s854b+qXudIDlV
 j46GJzDnPjWt4/B3VLUi6ODKJf/+/kSnosD8kNo5JFp1EzB/tVYgT8Km4cpPyDfKElgMeE
 Tf0ATBBQM1txfcnqwx4YhJOMaq5Y1HA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-FsiZAfNrOjKGS2-cTQDEzA-1; Wed, 05 Jan 2022 10:00:57 -0500
X-MC-Unique: FsiZAfNrOjKGS2-cTQDEzA-1
Received: by mail-wm1-f72.google.com with SMTP id
 83-20020a1c0256000000b00346a78f8fd7so1141521wmc.8
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 07:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GpFUOgWjUY7YUMHsbIIUzxq/Zhl7Q/5UAfQ+kGbqbQg=;
 b=dSJeu+kh2R71kis2mJ2fp+ImiP4/ZG2/tkQXSyGMENlS2pOW9xVUYIX2ZWUuFh53Rx
 3FJdTSkW1fB5txygXSaumTtAqn0gq9Oha/o22NriGuuqmIEm8yjp7vzSrflw9YUkDXJM
 qbNefy8ul82feE9DG141a5i1i1c7Kg3AYYqWQffTcLVIioC6olby7zOvVZJxGRSesdYw
 KhQlnDZoDcBLb6RO8adGBM2FFfCjAR6FGPNxgu47Xu97Nn+Kq3O0fegfWZxajEJ1lo7J
 pwoYXnKMHVrsG/shN9liUbG2rgDqO+QpgTTX1oCdrtWfVqTHmrkTLnubasXejHhrB8PU
 KAeQ==
X-Gm-Message-State: AOAM531EVF529/7VXrWHLcXHZ0Pnwd0CdvArThyNCKoy5YJdEqNQH8Wr
 E8gy130zg6diKxzDE6oyC01xZyd6HCq5yuVmhtD4N/JG6/kCLSAd58r6nrpbsT1/3ZQSaYVBhZb
 zCz45kwHjf/JtcXk=
X-Received: by 2002:a05:600c:34c8:: with SMTP id
 d8mr3338692wmq.94.1641394856193; 
 Wed, 05 Jan 2022 07:00:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx+/1AndV+cc3oktkZuThVRA2tn+v54VEnPCptGPxZcs8Zwj+zKTf3dAs9nPoyrkcn/qLM+A==
X-Received: by 2002:a05:600c:34c8:: with SMTP id
 d8mr3338676wmq.94.1641394855966; 
 Wed, 05 Jan 2022 07:00:55 -0800 (PST)
Received: from [192.168.100.42] ([82.142.12.178])
 by smtp.gmail.com with ESMTPSA id i8sm2985929wmq.4.2022.01.05.07.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 07:00:55 -0800 (PST)
Message-ID: <ef04e0ee-4349-a9cb-a3e7-2abfcc7aaedc@redhat.com>
Date: Wed, 5 Jan 2022 16:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/1] softmmu: fix device deletion events with -device JSON
 syntax
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220105123847.4047954-1-berrange@redhat.com>
 <20220105123847.4047954-2-berrange@redhat.com>
 <a2a94c4c-190f-9be6-eadf-bd1404a2e272@redhat.com>
 <YdWxZ0DYZT0zDuWP@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <YdWxZ0DYZT0zDuWP@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2022 15:55, Daniel P. Berrangé wrote:
> On Wed, Jan 05, 2022 at 03:49:12PM +0100, Laurent Vivier wrote:
>> On 05/01/2022 13:38, Daniel P. Berrangé wrote:
>>> The -device JSON syntax impl leaks a reference on the created
>>> DeviceState instance. As a result when you hot-unplug the
>>> device, the device_finalize method won't be called and thus
>>> it will fail to emit the required DEVICE_DELETED event.
>>>
>>> A 'json-cli' feature was previously added against the
>>> 'device_add' QMP command QAPI schema to indicated to mgmt
>>> apps that -device supported JSON syntax. Given the hotplug
>>> bug that feature flag is no unusable for its purpose, so
>>
>> Not sure to understand: do you mean "now unusable"?
> 
> An application wants to known whether QEMU can support JSON
> syntax with -device. If they look for the 'json-cli' feature
> as a witness, they'll end up using JSON with QEMU 6.2 which
> is giving them broken hotplug. This is unusable for any
> non-trivial use cases. So we need a new witness to indicate
> whether JSON is viable with -device, that only the newly
> fixed QEMU will report.

I understand that, my problem was with your sentence:

"Given the hotplug bug that feature flag is no unusable for its purpose"

Thanks,
Laurent



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4768D941
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 14:26:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPNyT-0003gm-VQ; Tue, 07 Feb 2023 08:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPNyR-0003gZ-Fh
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:25:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPNyM-0003V8-AO
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675776321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gU4G7hbZLfkE4QZ43auvhBkm0ohWUYQBW4QUhb0s3w0=;
 b=PnK8SlzbPD6/yYTp/U2JU/jghQFhhs+5CWKlt8fQkxbsySyJTeCCqOr13w9k8qlvkSaBnB
 xNSZWmnY5/wqMxWPnCGdVSZVSwsh3/0vKpRPTA3Yvy3CT+i8oax8NFfAqIaBQPQH4ogHg5
 S85LrBEPNt3Z37m9N1EUDb77d1U+zLg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-493-0oZ9F1BnOaqRksi7hyMs2g-1; Tue, 07 Feb 2023 08:25:20 -0500
X-MC-Unique: 0oZ9F1BnOaqRksi7hyMs2g-1
Received: by mail-qk1-f197.google.com with SMTP id
 ay10-20020a05620a178a00b0072db6346c39so8477122qkb.16
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 05:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gU4G7hbZLfkE4QZ43auvhBkm0ohWUYQBW4QUhb0s3w0=;
 b=DvqhOq+gRd48CrN+ZxhXJXsYE3DYdj4uh9OVFd1tMzr/IrgF4UXLlyJizG0j2u6xow
 DxOOAJH2S4I0UbqJPzbEHJY4Ni4fBEY2toM69aszitEaGzrf610PB9nSgAc4vAm5Ksq8
 x2mjkMUYZvIraTSQwlRVf5c/Vr5dnwk5nyt0thHMj8YC90qG4prR4TWTs0BGDJqJP5Gt
 5l7y+Xlu0gFydUSdgHeIxDn+n9SVJYZWLMsc/lhnsbVxhLOf84QGuLQoE3GgtuWn8fnl
 RaIPjjJGZaEUx2/62cWqgt5Itj6TSOLDzDPnL4rxn6mQ5dV+GWh7oo399EP/T+IRZwWo
 y9aQ==
X-Gm-Message-State: AO0yUKXlvNpnjZPXgKA+pJC1vbqmMIIcZgMzIVmMgZgo/2U6gmYBoRrB
 JG9feLAmSw2lYKSagfE9Ikla9FDb6KBuFMjacWJ7O6iplykDFXIkSHAATpAlmMeSjQesX4iJtHp
 WAuz8Ckes7gMztjs=
X-Received: by 2002:a05:622a:1a8d:b0:39c:da21:6bb3 with SMTP id
 s13-20020a05622a1a8d00b0039cda216bb3mr5110322qtc.56.1675776319544; 
 Tue, 07 Feb 2023 05:25:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+62idPNrkvtYFE8i6GJ+aherYp9oRk7U+HT6vTU3MMD+fXBTjFV/ParJmeNMLbhY968uICgg==
X-Received: by 2002:a05:622a:1a8d:b0:39c:da21:6bb3 with SMTP id
 s13-20020a05622a1a8d00b0039cda216bb3mr5110299qtc.56.1675776319286; 
 Tue, 07 Feb 2023 05:25:19 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 d23-20020ac800d7000000b003b8238114d9sm9337939qtg.12.2023.02.07.05.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:25:15 -0800 (PST)
Message-ID: <3b2e6eb7-2f0a-7663-b454-bce49d92f36f@redhat.com>
Date: Tue, 7 Feb 2023 14:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 04/12] tests/qtest: Skip virtio-serial-console tests if
 device not present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-5-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206150416.4604-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/02/2023 16.04, Fabiano Rosas wrote:
> The virtconsole device might not be present in the QEMU build that is
> being tested. Skip the test if that's the case.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/virtio-serial-test.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/virtio-serial-test.c b/tests/qtest/virtio-serial-test.c
> index 2541034822..f4e05e8fdd 100644
> --- a/tests/qtest/virtio-serial-test.c
> +++ b/tests/qtest/virtio-serial-test.c
> @@ -28,6 +28,10 @@ static void register_virtio_serial_test(void)
>   {
>       QOSGraphTestOptions opts = { };
>   
> +    if (!qtest_has_device("virtconsole")) {
> +        return;
> +    }
> +
>       opts.edge.before_cmd_line = "-device virtconsole,bus=vser0.0";
>       qos_add_test("console-nop", "virtio-serial", virtio_serial_nop, &opts);
>   

virtio-serial-test.c is a qos test - and this should detect automatically 
already whether a device is available and pluggable or not, I think.

There must be something else wrong here ... Laurent, Paolo, any ideas?

  Thomas



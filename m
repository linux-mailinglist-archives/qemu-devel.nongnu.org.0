Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BD5216A92
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 12:40:40 +0200 (CEST)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsl1j-0005AC-Of
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 06:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsl0m-0004TN-Jd
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 06:39:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27642
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsl0k-0006HC-84
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 06:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594118377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MH6CEv5Co6KUoalB5KCDZj5wIhxAEhaURzlq5QSOI88=;
 b=OuD3DDIJ9QR654l+qz1F6pqLyoBuSiSRIAacws/bzze55/p0on5DrJreRsGugwIzukDus9
 v9afC8t230EnScbOvozMwjP1f49r+J779uzBj2g/TmVrFDRB481qFQgYDD+vtz3qn0Kk+u
 JDJ1k8H3H0+u/ZZB960haaTv12Y6kNQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-0TQgWdgwOpudJ4YqSEwJ9g-1; Tue, 07 Jul 2020 06:39:35 -0400
X-MC-Unique: 0TQgWdgwOpudJ4YqSEwJ9g-1
Received: by mail-wm1-f69.google.com with SMTP id 65so32314964wmd.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 03:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MH6CEv5Co6KUoalB5KCDZj5wIhxAEhaURzlq5QSOI88=;
 b=pB6fCYnHGgx46ioxruowTM5ojIg+AuZyccHYGNMZat+Tw2GbwJrv4hRAuyCIbQbguF
 0WHPo7I2dh3+XOzaiFVC6Z23gBfyyWgn1Kuh4eDe40G8jszDB0c/5YjZnaEyAP0BF3hG
 xfjt2T/GDxM8PE406TFhHoi3OPD8+Oge9cfpTb1LVUmb23NYPbsnCjz7pRUH4aOaQgI7
 xrlnhdR7kWtS1+fJs1HaTbmV6u6RvbN7Rtl3yUdIcqYXOvYEtI+w7sDnHCWb6jDGQW/M
 bxcOBRUe2kPhYR9LYtY5oVqEXzntJA/N0x9RJRIBy1GVJYLARLpz1uuBkFUByxDCBNpZ
 dOag==
X-Gm-Message-State: AOAM533ZiJdKF5yw9tk3+CBARoC8xSsfhMnZkVVlxHJxXuwkGT3i3+EA
 AIvZCWo0N5/0Oj0AvySWo5oZoaz4WUFgdYbzUd0cKe9PiQiWkIec+y0dGfANlAWk9od1IS7I+r3
 ZJ8zeTFymVlPDLPw=
X-Received: by 2002:a5d:6781:: with SMTP id v1mr51035175wru.383.1594118374707; 
 Tue, 07 Jul 2020 03:39:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsZ7XYGB7+f1GqCBOkzcZp2yOiqus6cFX7UqmyDB7g6lD8Dmoc3foiqYM1tG3JrwJm0kPRlg==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr51035157wru.383.1594118374459; 
 Tue, 07 Jul 2020 03:39:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e95f:9718:ec18:4c46?
 ([2001:b07:6468:f312:e95f:9718:ec18:4c46])
 by smtp.gmail.com with ESMTPSA id n16sm520132wmc.40.2020.07.07.03.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 03:39:33 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/char/serial: Allow migration of the I/O serial
 device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200703185809.5896-1-f4bug@amsat.org>
 <20200703185809.5896-3-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ef63ebb4-5f60-e4a7-3027-065b8d1d1f61@redhat.com>
Date: Tue, 7 Jul 2020 12:39:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703185809.5896-3-f4bug@amsat.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 06:04:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/07/20 20:58, Philippe Mathieu-Daudé wrote:
> The serial device mapped on the I/O bus hold a migratable
> SerialState. Keep the same version range from SerialState:
> 
>  837 const VMStateDescription vmstate_serial = {
>  838     .name = "serial",
>  839     .version_id = 3,
>  840     .minimum_version_id = 2,
> 
> Fixes: 10315a7089 ("serial: make SerialIO a sysbus device")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/char/serial.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 9eebcb27e7..c167b584fb 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -1002,12 +1002,22 @@ static void serial_io_realize(DeviceState *dev, Error **errp)
>      sysbus_init_irq(SYS_BUS_DEVICE(sio), &s->irq);
>  }
>  
> +static const VMStateDescription vmstate_serial_io = {
> +    .name = "serial",
> +    .version_id = 3,
> +    .minimum_version_id = 2,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_STRUCT(serial, SerialIO, 0, vmstate_serial, SerialState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static void serial_io_class_init(ObjectClass *klass, void* data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->realize = serial_io_realize;
> -    /* No dc->vmsd: class has no migratable state */
> +    dc->vmsd = &vmstate_serial_io;
>  }
>  
>  static void serial_io_instance_init(Object *o)
> 

Is there any difference between SerialMM and SerialIO at this point?

Paolo



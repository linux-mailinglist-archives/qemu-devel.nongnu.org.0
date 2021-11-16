Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A67452C92
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 09:21:37 +0100 (CET)
Received: from localhost ([::1]:52024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmtii-0008Mt-8s
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 03:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmthD-0007L8-2W
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:20:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmth5-0004ne-Im
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637050794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZ17tPgUA0rI1IsUr/LN+mZnrJBJxQairCLmmrizhHM=;
 b=NZFrNe1SGqpPyZWfgWshy/2k2k4t1YFhQEJ2azOhx9CUk+iBuD6LiHU8EWqptVNtWgKbTz
 xZM/l89h/5X7QNVSH3KI9rrDbgzlJfupeU14ptqukqA7rjQxAdmaTJcWGNVUSwrbsgBy7g
 yhZ+dkzbcq+8M7hmYFKmXMrKPjrfo0c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-J1WCwInFP26o1683xk-NMQ-1; Tue, 16 Nov 2021 03:19:51 -0500
X-MC-Unique: J1WCwInFP26o1683xk-NMQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r129-20020a1c4487000000b00333629ed22dso858387wma.6
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 00:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UZ17tPgUA0rI1IsUr/LN+mZnrJBJxQairCLmmrizhHM=;
 b=Jzo7+nJ6BXNSx4fZC0DfTK0xrpjD5Y5oHoLKqUuVAAclZlmLSJBJDOjfHL28+PiOMv
 4PVeCKGvLMH7naOmjyC+6QmkBzycMmKhNaXfkTBcvMEN1Ax+zo7+O7Jb0MBdEx5PzZav
 bJqdDfPn5sKRZ8cvIkI7tOUbDjBjUUW/LIkvR81GW0sLuNLjmN1HCQQNDV6d2LuDR1g9
 m+HRxPz/JJhMqYKKCKlN8WAdO9RwVkAK5ggYWOGQc9MzYJYdoEtLzgS0kyG7eyRYdirz
 uWYTN9FYjsd4l8P28gQna+deOGLdIvDUk9IldvbsUAR83JKZJrf9h6VeKfYowCV1ikRF
 3Omg==
X-Gm-Message-State: AOAM532bJW9lfrSZZd22NUO5Lk8uFhCtxhZRPgB09p5UWugzTNTk6Vzz
 pbFIcGyEtYhomTX7Z33d00xPP6BZXHoNKiyid1e2Nk+XI9nkToRpE49cUVuifpGEktS2UpbTyqa
 D6EIdeB70EjplG+s=
X-Received: by 2002:a05:600c:500b:: with SMTP id
 n11mr52460509wmr.38.1637050790267; 
 Tue, 16 Nov 2021 00:19:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypzfHvcaCyu0cu2obFptIYZ0KRg2drBj5jmwSOpmSRi+J93AzGuBNo+EB+9RlA40uTWP9K1Q==
X-Received: by 2002:a05:600c:500b:: with SMTP id
 n11mr52460482wmr.38.1637050790024; 
 Tue, 16 Nov 2021 00:19:50 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l4sm16281025wrv.94.2021.11.16.00.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 00:19:49 -0800 (PST)
Message-ID: <08ee9ba8-0561-05df-29f7-5d92c7941a88@redhat.com>
Date: Tue, 16 Nov 2021 09:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2] migration: fix dump-vmstate with modules
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211116072840.132731-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211116072840.132731-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 08:28, Laurent Vivier wrote:
> To work correctly -dump-vmstate and vmstate-static-checker.py need to
> dump all the supported vmstates.
> 
> But as some devices can be modules, they are not loaded at startup and not
> dumped. Fix that by loading all available modules before dumping the
> machine vmstate.
> 
> Fixes: 7ab6e7fcce97 ("qdev: device module support")
> Cc: kraxel@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  softmmu/vl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 1159a64bce4e..620a1f1367e2 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3766,6 +3766,7 @@ void qemu_init(int argc, char **argv, char **envp)
>  
>      if (vmstate_dump_file) {
>          /* dump and exit */
> +        module_load_qom_all();
>          dump_vmstate_json_to_file(vmstate_dump_file);
>          exit(0);
>      }
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



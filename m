Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8555151F44E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 08:12:37 +0200 (CEST)
Received: from localhost ([::1]:45464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnwdI-0003pP-2h
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 02:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nnwaP-000326-HF
 for qemu-devel@nongnu.org; Mon, 09 May 2022 02:09:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nnwaM-0005Uc-T5
 for qemu-devel@nongnu.org; Mon, 09 May 2022 02:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652076572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMzG6pDSFa1vmp6V+FYGzLwaA/t16pgEE1LfbIGi0/s=;
 b=TM0wM2R7hUlB+l9wtOUkPfcegaQOIwtudt23k2sd7q9x5JlqpURMP/frVSvleiU7ZXQo7y
 yJ3dpkkmArmzN5vbAloaTW2UWjaw7+qUeqlYKCvJER7jh2CJpOPTRcp2vneLTOCnetIK3p
 BM8gVwkn8H8uHMdnCk2aEVy6aaoDiJg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-aIXV6Bu4PI68AkZ_GGjvyw-1; Mon, 09 May 2022 02:09:30 -0400
X-MC-Unique: aIXV6Bu4PI68AkZ_GGjvyw-1
Received: by mail-wr1-f70.google.com with SMTP id
 v29-20020adfa1dd000000b0020ad932b7c0so5343801wrv.0
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 23:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=cMzG6pDSFa1vmp6V+FYGzLwaA/t16pgEE1LfbIGi0/s=;
 b=ZFM/sBFeB67rGa1sCrTcuiUur0FxarvFu8QXrGzrQW8esmO0z8DlXKutO2tdVLsWpP
 No8c4zN+c8YuJ2qWzXR0iatJgJeQ9dlb3oTmFnhSniqWVF9vN6n7Dl+TDAMJbtaZJKe8
 r2G4xUsZSVQoqXm3rpZah6MQPeBja0aXaSBN2Ua7kgserSa5rJjvI8dG3Jk7JS7GLbzS
 nWczc9ZTs6AYIgspG4bbetPtU0421zJxEr7WP84p3v9JxAjh8KXg/bl1sI55dHahYq9/
 QGBiulx0ly4WHBBoxdcYbYYTAPG4yKP7qt0T40z5W0HZPhKbdGgfnH9Srz3vn8DcLTVT
 1pwQ==
X-Gm-Message-State: AOAM533YeLMQS08Iuf+u15ZEIJFtJI+BsuHQlC1rcjEadPILH7AefnvJ
 2/ely+5vyZuPPWM+Whty4sozcwG3sT+xhrh26Ji3K97Qah36T5e6C6LZLkmwe9UoqefrIVK1gEQ
 5Q2SvbQkNhfC4gnk=
X-Received: by 2002:a05:600c:25d2:b0:394:2db5:bc32 with SMTP id
 18-20020a05600c25d200b003942db5bc32mr14231911wml.39.1652076569405; 
 Sun, 08 May 2022 23:09:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1clp+GXHN5KkMkZ5XHBei2+n8paImEYJCDhTGOt0Zxr+N2JDEZ2VjmrRmTQdNItl++/fl/g==
X-Received: by 2002:a05:600c:25d2:b0:394:2db5:bc32 with SMTP id
 18-20020a05600c25d200b003942db5bc32mr14231887wml.39.1652076569182; 
 Sun, 08 May 2022 23:09:29 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 o8-20020adfa108000000b0020c5253d8e5sm10312132wro.49.2022.05.08.23.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 23:09:28 -0700 (PDT)
Message-ID: <ead755ef-a693-787c-378f-3a4c20285890@redhat.com>
Date: Mon, 9 May 2022 08:09:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, kraxel@redhat.com,
 qemu-devel@nongnu.org, Gautam Agrawal <gutamnagrawal@gmail.com>
References: <20220501122505.29202-1-gautamnagrawal@gmail.com>
 <YnUvpsaM0hwUSZvM@stefanha-x1.localdomain>
 <b16d2b2d-f086-636b-4da5-79d3134a4482@redhat.com>
 <CAFEAcA9rK6T03mkUrojf+Wz=UCiakibXtj56W0F=uuEjeqoZig@mail.gmail.com>
 <7551dedd-7417-6292-907b-28ff8304cd83@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3] Warn user if the vga flag is passed but no vga device
 is created
In-Reply-To: <7551dedd-7417-6292-907b-28ff8304cd83@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 06/05/2022 17.43, Paolo Bonzini wrote:
> On 5/6/22 16:48, Peter Maydell wrote:
>>> I'm just in progress of preparing a pull request with misc patches, I can
>>> also throw it in there if nobody minds.
>> Paolo mentioned on IRC yesterday that there was some detail he thought
>> it wasn't handling right with VGA_DEVICE, but I didn't really understand
>> the details. Paolo ?
> 
> Yeah, I was wondering if this would warn for "-device VGA".

Yes, it's possible to trigger the warning like this:

$ ./qemu-system-ppc -M ppce500 -device VGA
qemu-system-ppc: warning: A -vga option was passed but this machine type 
does not use that option; No VGA device has been created

> But if so it should be enough to do this to fix it:
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index eef1558281..7ff76b795a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1352,6 +1352,7 @@ static void qemu_disable_default_devices(void)
> 
>       if (!vga_model && !default_vga) {
>           vga_interface_type = VGA_DEVICE;
> +        vga_interface_created = true;
>       }
>       if (!has_defaults || machine_class->no_serial) {
>           default_serial = 0;

That fixes the warning, indeed. Thanks, I'll fix up the patch with this hunk 
and respin my pull request.

  Thomas



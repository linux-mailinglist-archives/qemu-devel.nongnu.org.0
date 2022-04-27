Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8F5118BA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 16:23:56 +0200 (CEST)
Received: from localhost ([::1]:37386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njiaB-00046L-MU
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 10:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njiYM-0002TW-5z
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:22:02 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njiYK-0006wO-Lh
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:22:01 -0400
Received: by mail-ej1-x634.google.com with SMTP id y3so3691896ejo.12
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KmIqq8mNUxjxixuenwToXtzEkEqyO5IVxc/4VU2X+T8=;
 b=SfQcn78uggH6qDZSvrRDmNTv+d+b4TEagHfXnqzBtpLzhMDUt4i+b1JMm8Kkm5x7eE
 uxcxvqcf/cupYqoHlcKIZjayF4/MhUzAyBc5QAJcY7YNIvaTS6Ss9yJb7I1dZZLU6h3U
 j97BugoBMr6PNTSme/A3WOmjsU9BpukiVHCiY3/ZQMnishg0ezKmq3E/g5wPWuaelydo
 1RKHbxl8gOcCYapcGFa+UYUGyeJgUOP70FbFEne8lxueAwCDFWuytxPl7IDfVuKfk8ca
 h42JzPl0aaMOCURk+G6T4H2EEdEFyEjaw+Mj1ROH7BtfsKfCsOOk/PtvUJHPiaw27206
 4L8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KmIqq8mNUxjxixuenwToXtzEkEqyO5IVxc/4VU2X+T8=;
 b=UYNaO98xTlj0Yzj+pl6wpczF0AfRETLBSn05gIo9nTNZ+pvZGlT9QFAMBx0x7aePna
 bpUnjsWPzo3oc8NsNHJ0s+tXetw1U/lIAKMYQF9ZcC+dC+F0H6TaGCOmldz6CkZDztq6
 rd8a2C/wWt9ZEYNsKfiSGDUZlQfmIko7KIRUiB2PLQgrItVDsHsAiIALOv9Fbgh3+Gbr
 dzqJdTz4DWlrG3SQUyCd8yoCAHQB1tA+zb/1k7o+iSCktra03nirdwA/vQ4uSh8ili9Z
 YmmeGunqVaOhEXXXf8c5tY6cL+bAssPizYdkfbniZQYPropG7ti41P3pkHzpWUWem/CJ
 75ig==
X-Gm-Message-State: AOAM533GHnxQbHdQJxFeIvRgKB9O9oyFsTGfjaQ0Ecf7j2P2GoeCaRO/
 PkXwrCxtmPalUZhZvARLXOzrrW3uz3fcrQ==
X-Google-Smtp-Source: ABdhPJztp/Un6o1fWYyCBJwiSwOiAPt5NFjZpo4a4j8nxC/ID4ZRvsws1zwlLRPfF90aYV58qBcLhw==
X-Received: by 2002:a17:907:6d07:b0:6f3:d077:813a with SMTP id
 sa7-20020a1709076d0700b006f3d077813amr1869032ejc.138.1651069319130; 
 Wed, 27 Apr 2022 07:21:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 g6-20020a056402090600b0041d8c2f9e61sm8541658edz.31.2022.04.27.07.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 07:21:58 -0700 (PDT)
Message-ID: <62ca19cb-6d61-bf24-f500-f72b9a4da3b6@redhat.com>
Date: Wed, 27 Apr 2022 16:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 6/6] vl: introduce -audio as a replacement for -soundhw
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220427113225.112521-1-pbonzini@redhat.com>
 <20220427113225.112521-7-pbonzini@redhat.com>
 <c338fd73-e2d8-791b-d23f-1cfcc8010d5b@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c338fd73-e2d8-791b-d23f-1cfcc8010d5b@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mkletzan@redhat.com, berrange@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 15:41, Mark Cave-Ayland wrote:
>> +                select_soundhw(model, dev->id);
>> +                g_free(model);
>>                   break;
>> +            }
>>               case QEMU_OPTION_h:
>>                   help(0);
>>                   break;
> 
> Is it possible to change select_soundhw() to take an AudioDev pointer 
> rather than a string, and then add a new qdev_prop_set_audiodev() 
> function similar to qdev_prop_set_chr() and qdev_prop_set_netdev()?
> 
> In reality the underlying QOM property is still a string, but I think 
> having the stronger typing for AudioDev properties is useful and 
> potentially allows for the various *dev backend properties to become QOM 
> links in future.

I didn't consider that because there are just two uses and I don't 
expect them to grow much, but yes it's possible.

Paolo


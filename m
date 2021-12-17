Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FA1478BB7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 13:49:14 +0100 (CET)
Received: from localhost ([::1]:41714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myCfg-0007yu-R2
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 07:49:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myCX3-0005qM-K2
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 07:40:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myCX0-0001a8-GX
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 07:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639744812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mlP1fI++Q+S1rmIf4mMU5lijueGrnJ4SRNrIySBoyc=;
 b=a4jFlqVVSnufiUY5IJjFDCa0M7yf/j/PuaxRlTUD8nQ6XKW6PukmwU0mWEUJPi2E1Tg+3x
 2LPm22Kn7GT+JrUzLdALQtRGpK7LNifFdyTWFZS0SEnMGsP3Rw4CboAnWXrhZJtjEtmZRv
 Ny066sSIYoTEhblRuWDUL/XGE7tkTAE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-gTaxHTLnN2Cm7uSPnIL54Q-1; Fri, 17 Dec 2021 07:40:11 -0500
X-MC-Unique: gTaxHTLnN2Cm7uSPnIL54Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 j71-20020a1c234a000000b00342f418ae7cso2904702wmj.1
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 04:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5mlP1fI++Q+S1rmIf4mMU5lijueGrnJ4SRNrIySBoyc=;
 b=DeGUjbFr8pGYeFF8C+SPZWNqzIcPW3DoccCjKKNJ+d7rVCjPuuU1uCHjwz02kjy9AT
 MlBELPviNQkqZrBwyGf8XgKjHKU3jA6Gxlvs8L/WN6JMrkhuZj9nM4SmyP+TEBVOSeJc
 nNdKEAOkByA5+J7+m9v4gb+EHPsTHEu3xdhiQKT/XG7XBTCj92lGUj9FdbTcxD6tpT76
 ypjDThuZWTBEHBee3Ar4Mcf0l6DISLizwp6hHaN+4QeWFnsf7QJIlTR+wwgE1Adu+jUu
 3oPmFHOwizL/46XOOjCGsuOAtoceI1Ge50T9hYv1aKcphDqfAHuoRzYsPN8UlJxXH/ST
 1jZg==
X-Gm-Message-State: AOAM532X/uxWZjnh4vrKjJpsHL9xzATM8U7dbVb7FWePZ+NpFGCe5yuW
 L67eGj2UbXkTqTfllbFJEK20JH3+8Wv6YHnbqHwn9GuMwMcqjyQTkK9ip7fZ9qoe+jnzMF9Guif
 IGPH1flIs5BgaG5Q=
X-Received: by 2002:a5d:6c6c:: with SMTP id r12mr2419568wrz.532.1639744809144; 
 Fri, 17 Dec 2021 04:40:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8lff+gOZlv5i5XIT0lPfh/TCi6dDJdhhpcvHhCUH91q5u6XjYuMsUEsC5+QhKKJfAQHWmFA==
X-Received: by 2002:a5d:6c6c:: with SMTP id r12mr2419559wrz.532.1639744808942; 
 Fri, 17 Dec 2021 04:40:08 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o25sm7221019wms.17.2021.12.17.04.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 04:40:08 -0800 (PST)
Message-ID: <bc28e35c-1eb0-1fb7-1f45-d53be7a1c082@redhat.com>
Date: Fri, 17 Dec 2021 13:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 08/37] hw/display: report an error if virgl
 initialization failed
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-9-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211009210838.2219430-9-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/21 23:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Currently, virgl initialization error is silent. Make it verbose instead.
> 
> (this is likely going to bug later on, as the device isn't fully
> initialized)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/display/virtio-gpu-virgl.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



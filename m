Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3135E7DEB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 17:07:14 +0200 (CEST)
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obkGm-00028T-Is
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 11:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1obk8N-0003Ig-Ha
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:58:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1obk8K-0000lW-1w
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663945106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hiCbuBsIMBFlgz7KVtIQd9s0odDCbTcYY7QnDQt4HYU=;
 b=QBwmlok5Xa2ll7W0aMCmuuSzqE308rWWaiBLSLR78uWb071GMzVHBpVB832mtVfE47sNl+
 XaDCMyhXSyQVLkKP/E9pExTS4bx0KNNNLlrogtx0VBdIKjsF35Rb26IDdVsqRiSoD6uHnH
 szxpQ/mntPH3tUPt9Pcn5kTdDPJJ+vs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-39-otfJuB81NhaCzqDJuIYPYg-1; Fri, 23 Sep 2022 10:58:25 -0400
X-MC-Unique: otfJuB81NhaCzqDJuIYPYg-1
Received: by mail-wm1-f71.google.com with SMTP id
 b5-20020a05600c4e0500b003b499f99aceso2854511wmq.1
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 07:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=hiCbuBsIMBFlgz7KVtIQd9s0odDCbTcYY7QnDQt4HYU=;
 b=qP6k/3EvEDnvf86nObhfIM2YxzqASyt7IXyG/Axw9wMQDVKHaNAgtgy5Gjj9VBHYYB
 u1xsM/BXw4iy6f87KGqEEEdCp63XDhXSfHBxap81P77ebIyxMU1q1Ck+nqAoz2msTyw/
 JnE8Bwu1SzSd7yUNOrjl20hn/f0z4C0qHFu7KGYF31z985mhoj3gz+gwR/CuxSlZ2xZK
 7IIcjzQyQVMdr5ftc/utMvrvPE0tJw/2inzFvQYb3Dt8OxWSQfSEwdhnhdvmLam+ZjQj
 q+L6PuWLKzy+pXHb10ZYRChqqB+CmI9v6F9zUAWRxMZZpvHsCwTF8/UtrVdcdxtBP1x0
 tUMA==
X-Gm-Message-State: ACrzQf0Qhqv+P1zNCiSm2fh3LtRT1sYZhlXolhURxKAqX0AYPtfRlqjY
 p/Q1wIkpTQAUtBWkH1BOMWwDyXg5nG0Y4BXSeZXTRM9ZwUgbOUQ54jo376Fhwl7uU7WNu+4qYFq
 LsqM0C2l9BSbXFvY=
X-Received: by 2002:adf:d84f:0:b0:226:d37a:b2c4 with SMTP id
 k15-20020adfd84f000000b00226d37ab2c4mr5658122wrl.42.1663945103847; 
 Fri, 23 Sep 2022 07:58:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM68KwO+72FuLyF1PGsNLbRNS7kO6TZ1H9ikGFz5ivAR4tyNNrCJdmRIDesuN4DhJe1syrUbjw==
X-Received: by 2002:adf:d84f:0:b0:226:d37a:b2c4 with SMTP id
 k15-20020adfd84f000000b00226d37ab2c4mr5658102wrl.42.1663945103620; 
 Fri, 23 Sep 2022 07:58:23 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c434100b003b3401f1e24sm2543098wme.28.2022.09.23.07.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 07:58:23 -0700 (PDT)
Message-ID: <4326b13b-807b-a5c3-cd27-6913ba89bdd1@redhat.com>
Date: Fri, 23 Sep 2022 16:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8 06/14] net: stream: Don't ignore EINVAL on netdev
 socket connection
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-7-lvivier@redhat.com> <YyFhADVRPSB4ZT4p@yekko>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <YyFhADVRPSB4ZT4p@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/22 07:05, David Gibson wrote:
> On Tue, Sep 13, 2022 at 08:39:52AM +0200, Laurent Vivier wrote:
>> From: Stefano Brivio <sbrivio@redhat.com>
>>
>> Other errors are treated as failure by net_stream_client_init(),
>> but if connect() returns EINVAL, we'll fail silently. Remove the
>> related exception.
> 
> Is this also a bug in net_socket_connect_init()?  Is there an
> equivalent bug in dgram.c?

Yes, the bug has been found by Stefano in socket.c, I'm adding his patch to the series.
There is no equivalent bug in dgram.c

Thanks,
Laurent



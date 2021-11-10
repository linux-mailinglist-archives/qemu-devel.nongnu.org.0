Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B4E44CB80
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 22:58:00 +0100 (CET)
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkvbT-0002TE-Cj
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 16:57:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkva6-0001RR-Cl
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 16:56:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkva3-0007i1-72
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 16:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636581389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dur4v0qgDy7pYtypuCk//uYsMsG2e204/RCR//3mbfY=;
 b=jThUQ/8FWXY5G1STL4pM5aFKr1QVRIX4tdVCLDPEhEpFKpVXwlPliipmEyxccsVtsdO/2L
 QgPj4TC3ImTIYGIi2M1n+TloqLV2XpQ6e0dDzpDqLaaicp+1L4K2kAddpMLjwm7Pk4gOC+
 aQNsCtIPvB1AnOhhADRFjmJ0yB+RMh0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-i0cAvCaPNvCz1zQna6oblQ-1; Wed, 10 Nov 2021 16:56:28 -0500
X-MC-Unique: i0cAvCaPNvCz1zQna6oblQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso1792665wms.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 13:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dur4v0qgDy7pYtypuCk//uYsMsG2e204/RCR//3mbfY=;
 b=a+IBRHmjQuDlAOLMt6Dj/dLsUGOrGWZgoX19CZ8fmqIW24z9DfuuIYY7+bmRoVoKeW
 BK8iXBakniOlZMQtndNO4E/+mrCVKKLB8XjjYvTON9wvjHGD/wibguFMiqpvpEh6/2GZ
 bM8246mC0XQRaSw+eBRwPdyM+0D92rRkHA2e32cOEH6qMb7Cv/Bn3x4sacR726PvFwGw
 0xeJLe7oVRIkEOVGBgx32wZQvu+2wZSgUjhj01d/X2mWExWMzRi0E2eDFGle6/hZO191
 8wCQwP1u0ce8rp5bKBz70C3eoiikGGmQXy3rX6YZkqH0JAvoMezEPX4wYtUM//pSwc5u
 remA==
X-Gm-Message-State: AOAM531IebsY0ArzfKQConYRxtoYkZIp72gVofWZqBLetUfHfcjvqSkW
 lyP++2dcKPCB5+60cNif358TbSKP/RLZ22Vc/kkjJ+WIIH1Vxu5L/GuM3LRp6LzS64j/pNg3ai4
 FlWnBm+0h9+X05i8=
X-Received: by 2002:a1c:1fd6:: with SMTP id f205mr20161398wmf.98.1636581387412; 
 Wed, 10 Nov 2021 13:56:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQYR0ZaJ89jK0B6+9ebA5AEix1V8A1Hz8p+yjxteQ/7tZvSeu08aDLPC4K7lbmqzZc5fOMYQ==
X-Received: by 2002:a1c:1fd6:: with SMTP id f205mr20161374wmf.98.1636581387215; 
 Wed, 10 Nov 2021 13:56:27 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id f3sm6734838wmb.12.2021.11.10.13.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 13:56:26 -0800 (PST)
Message-ID: <c4ac9bcc-90ae-302f-d5d4-b95f1419a7a0@redhat.com>
Date: Wed, 10 Nov 2021 22:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] qmp: Stabilize preconfig
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
 <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
 <YYAATW1JQmzpDPhu@redhat.com> <87zgqlzmxi.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87zgqlzmxi.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On 11/3/21 09:02, Markus Armbruster wrote:
>> I wonder whether we really have to step through three states
>> 
>>           x-exit-preconfig  cont
>>      preconfig ---> pre run ---> run
>> 
>> and not two
>> 
>>              cont
>>      pre run ---> run

Devices would be hotplugged between x-exit-preconfig and cont, and part 
of the machine until x-exit-preconfig; so there is a need for something 
like x-exit-preconfig.

In my prototype of a QMP-only binary, the idea would be that there 
wouldn't be a single x-exit-preconfig command, but "cont", 
"migrate-incoming", "finish-machine-init" (the stable replacement for 
x-exit-preconfig) and "loadvm" would all complete the configuration of 
the machine.  "finish-machine-init" would do nothing else, the others 
would continue with whatever they were supposed to do.

>> Which of the queries you need work only between x-exit-preconfig and -S?
> 
> Well before x-exit-preconfig, QMP only permits a very small number
> of commands - QEMU has loosened that up a bit, but I don't think anyone
> has checked whether there's enough to cover libvirt's current usage yet.

Indeed I looked at the commands that operate on the backends, but not 
that much at query commands.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E94AD9C0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:28:40 +0100 (CET)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQXv-00088c-Dp
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:28:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHOtC-0002Gr-Mq
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:42:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHOtB-0002h1-0l
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644320548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kx6dbc/YLbq7KaDiyaNYtylCA13uw3HiWaRh5bxNexg=;
 b=C1wSVpfVTeW23LZYv7ZIqfj60040RMQ8vE2WBlZ5pc3aO/kDYvtm1sUEejq+kRI+puqZLV
 22csCHKUcUFDgBLIovTrr0qwlnApvUm7NueJ48psmim4pZflgbQcbFkj4lJ0RYw9LsXViE
 RSllV8rT3//M95ZsBEXuhobmMI9ofbA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-A6T5lwlVPaqV9_R_n5bhgw-1; Tue, 08 Feb 2022 06:42:27 -0500
X-MC-Unique: A6T5lwlVPaqV9_R_n5bhgw-1
Received: by mail-qv1-f70.google.com with SMTP id
 m20-20020a05621402b400b0042bffb6a731so3094370qvv.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Kx6dbc/YLbq7KaDiyaNYtylCA13uw3HiWaRh5bxNexg=;
 b=EhhmYgPI02yxybitOWRK4PFc2EdelIFdmGJWOYlME0JEACgSKNbfEZ55jGi203kSfD
 CYsN9KcTTPUlOPPkllLOAOS/0bIaSpWge32Vitj/DxHk4+NaI2RULROzSzWxBhFkrff0
 bi+ORqBBrVnCWQACgzs25yNnkGkwv+NOER3C3vzSCkKEVmlflWBrfcK/TvgkojFKEeHV
 GQxl0oGY/ZKrVeubBwvrgyOq8bHEGh9U6vIAC34nTBH7Do4e377Ko07W61HctRf+QhqN
 Mou1/cWXNfJd7yvVBwMFAAb6Rf7Dfoxm1TnDYoBf+SgxOwmIA383xXSbmJoJAGbt1g0H
 68tQ==
X-Gm-Message-State: AOAM533x06827w7tB+pcm6A1GcBNR13ZSJ/MSNpp5MnDDFnb6gc5Vs5k
 nk2um94+HslYBo6SCvcRFh0nsj9ipxfscwSf72Oqy7e1Ws+TQ3+9dkxT7IVR31bQBiKQ9fWZRvw
 mrYAXL7mUDvqLA9c=
X-Received: by 2002:ac8:7f06:: with SMTP id f6mr2562461qtk.153.1644320547023; 
 Tue, 08 Feb 2022 03:42:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwm/WFraiWR6Sh+bVOdH67lFHzEEwGHUgi1rrPfD5mMHHFN0/xsg2PjUQ2g4lp1Ca8YgicMaw==
X-Received: by 2002:ac8:7f06:: with SMTP id f6mr2562436qtk.153.1644320546803; 
 Tue, 08 Feb 2022 03:42:26 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id 5sm7358764qtp.81.2022.02.08.03.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 03:42:26 -0800 (PST)
Message-ID: <1f3d2562-c355-4295-77b5-088d2ed49023@redhat.com>
Date: Tue, 8 Feb 2022 12:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 00/33] block layer: split block APIs in global state
 and I/O
To: Kevin Wolf <kwolf@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <YgFlQrmGXcOO9P/4@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YgFlQrmGXcOO9P/4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/02/2022 19:30, Kevin Wolf wrote:
> Am 21.01.2022 um 18:05 hat Emanuele Giuseppe Esposito geschrieben:
>> Each function in the GS API will have an assertion, checking
>> that it is always running under BQL.
>> I/O functions are instead thread safe (or so should be), meaning
>> that they *can* run under BQL, but also in an iothread in another
>> AioContext. Therefore they do not provide any assertion, and
>> need to be audited manually to verify the correctness.
> 
> I wonder if we could actually do something to catch at least some kinds
> of bugs. The first conclusion from thinking about it is that we probably
> shouldn't open-code assert(qemu_in_main_thread()) everywhere, but have a
> macro or inline function for each category to be called in each function.
> 
> So an IO_CODE() macro could increase a counter in the coroutine object
> (that is decreased again at the end of the function with g_auto), and
> then GLOBAL_STATE_CODE() could not only assert that we're holding the
> BQL, but also that the counter is still 0, i.e. it is not (indirectly)
> called by an I/O function.
> 
> We may want to enable this only in debug builds, but maybe still worth a
> thought anyway?

I don't understand what is the point of the counter, do you want to use
it as a boolean flag? Would a single counter work in a multi-threaded
context? Shouldn't we have it per-thread? And why you increase it only
in coroutines?

Emanuele



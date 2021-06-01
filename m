Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53B397151
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 12:21:22 +0200 (CEST)
Received: from localhost ([::1]:50950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo1WT-0000i9-2W
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 06:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo1VJ-00081r-UK
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo1VE-0000Jn-Fh
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622542802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWS6eSk9WxOHAhANGQqddgHu9MhI3Sgw5OcDiE3W9Ig=;
 b=Tfvp53/VG2fLGVB1T6uro+xrMQBabFnWJnNXtTcXXhNpYmsherWpSh3GHoSKjxmKklQQqj
 CX8M/YyHBSAf77H1SHMfXmkXrOhceBFsjO+KXI7WRzI9BmqiQchwaHfDGcHbrRTM1bQa2G
 GSGmEDjUDEPHVYF9sYjIvSqYIrVrCw8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-ZMIHYC6aNgu6JkrGHihiQw-1; Tue, 01 Jun 2021 06:20:01 -0400
X-MC-Unique: ZMIHYC6aNgu6JkrGHihiQw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i3-20020aa7dd030000b029038ce772ffe4so7600906edv.12
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 03:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yWS6eSk9WxOHAhANGQqddgHu9MhI3Sgw5OcDiE3W9Ig=;
 b=km1HVdZZMBw35dGVTzvueTkkwEH8LVOX/g1MkVzCXb6anWBAblHmJ1lUlwYI4/986i
 piZ/772D7CC3uQ4vr/Jm/SU3fG93YE/zgDAX0CPslvkCscJgvpMslX8K4571LNBG5wFB
 eTc1un83eNEq2G4DIYTLUmqUyDHrYxBKNlboIGBIwTw/hQV741/ucZvaYSFIkJk9WJbE
 A/1hrOWbpQmo5mnrB8mHYNk/hSnzXvQfniZcYDkK6ACb11Wu8BztLNUa9W2T80uzWv2P
 /J8vZypczNM8XM/IpaS23EOh3MX8I58bko4M5/Rqmla7pF+BGWj2VDYPS4JJWbXuA0Jp
 Qugw==
X-Gm-Message-State: AOAM532QAkQ741I2VgBAGXToMZfO2E0OAYV3MSowgFx9vqT3jgmelanA
 CjiPHwlciCFRoQTUncd2hopA4e29mzD0EHIJ5gBY0RemvON++0c8639cQl+s27vtH7Y2O3cFosj
 p420wpsD0JjeJyzY=
X-Received: by 2002:a17:906:6d95:: with SMTP id
 h21mr28194652ejt.260.1622542800184; 
 Tue, 01 Jun 2021 03:20:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymECXY9iy8jeNrRd+IpX/SqqL2iw8Y4Ki/ahzMmerB6um6LvJLmPQKBZAwLs/Fj2miM4ZR3Q==
X-Received: by 2002:a17:906:6d95:: with SMTP id
 h21mr28194632ejt.260.1622542800000; 
 Tue, 01 Jun 2021 03:20:00 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 n11sm7177092ejg.43.2021.06.01.03.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 03:19:59 -0700 (PDT)
Subject: Re: [PATCH v2 24/33] python/qemu/machine: QEMUMachine: improve qmp()
 method
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-25-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <cb758e11-0050-3712-5e73-86bd78daa86e@redhat.com>
Date: Tue, 1 Jun 2021 12:19:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-25-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> We often call qmp() with unpacking dict, like qmp('foo', **{...}).
> mypy don't really like it, it things that passed unpacked dict is a

s/things/thinks/

> positional argument and complains that it type should be bool (because
> second argument of qmp() is conv_keys: bool).

I guess it would have been nice to see some examples of this that can 
now be written in a cleaner way, but well.

> Allow possing dict directly, simplifying interface, and giving a way to

s/possing/passing/

> satisfy mypy.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   python/qemu/machine.py | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>



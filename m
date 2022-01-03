Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B07482FC9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 11:11:08 +0100 (CET)
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4KJ1-0000XE-3M
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 05:11:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4KHC-0007fp-6b
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 05:09:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4KHA-0005kv-8U
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 05:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641204551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEz58uy+bNrS3WTqaycTJm7D8MHJM/MBUCck2a9e+Vs=;
 b=NAEgQu3AQi9WwsM9AI5jig63NmeQubRUhCFhXZ9sz/wmhdJ0ruWaZyh8YlOEm3gviIQvUf
 BqP+N4oUbO6FenufU7o/gMXPOrFa+uo/hd5XB950TefmsViWTsfrkySPM5CJWk0P/pOngk
 fxdHSrfI+P7BYzZLbSoYfBCYW0LCrZY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-nnCpob4iN4eKY5Hx5YcnpQ-1; Mon, 03 Jan 2022 05:09:10 -0500
X-MC-Unique: nnCpob4iN4eKY5Hx5YcnpQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so8805199wrh.23
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 02:09:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=gEz58uy+bNrS3WTqaycTJm7D8MHJM/MBUCck2a9e+Vs=;
 b=S8t8PliYTYDP3mrnYK6Ft+3mBGhjUmR1rGxvL2e3PdPxEXt8krAn5Ui3LfwaAi7iIf
 MPJOot3TEHqhVxE4twxdtprKIuo1MGqGZr3774S0Gb+Lb37vCSymDdAfssmyr3DprswJ
 8IJlo0eNSiti95BOTrXI4uw81BGZ2pMGSCW16hzN9Si3l/b44L+6B0ILvaUjEmcavoTP
 QNxc5jaSsZeSlDQxlmPZtrxizAjI/dQuhjtL7ll0NB5cz+cjFxi8yh5Ar6qWuZllQzjI
 DgMLWboPKUNKKfNwLv/ii3Q1+w9uQNtw2J9ZiXy5zHwM4sa/509XM1s5AP/010KWxgiQ
 L+nw==
X-Gm-Message-State: AOAM533Y4FiYbrkDq/ZCzMmJzA5/xwrtDszvFIibcdJUyrjM9+03N/Pu
 h70eePOAHw0H2MxOtEy+IH9b+o5EKyZW/ijg29qyWR2sUl+B0OsL47mCCkPUN1HxUX/xsKSRtpn
 S4gw6Wlns/k8kiD8=
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr38022192wmi.125.1641204549040; 
 Mon, 03 Jan 2022 02:09:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOsM2LFQBAgos8ALNZ0LJyqgbCgA3P79Ny7mClowew+WZz4cKVNdUGxy62iD1vxNvSjZJPnQ==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr38022178wmi.125.1641204548841; 
 Mon, 03 Jan 2022 02:09:08 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id f10sm13717776wmq.16.2022.01.03.02.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 02:09:08 -0800 (PST)
Message-ID: <214c77f0-eb08-3375-6ab7-c09651b53a9c@redhat.com>
Date: Mon, 3 Jan 2022 11:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Igor Mammedov <imammedo@redhat.com>
References: <20211222153923.1000420-1-thuth@redhat.com>
 <20211227110120.5d61f6ee@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest/test-x86-cpuid-compat: Check for machines
 before using them
In-Reply-To: <20211227110120.5d61f6ee@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/12/2021 11.01, Igor Mammedov wrote:
> On Wed, 22 Dec 2021 16:39:23 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> The user might have disabled the pc-i440fx machine type (or it's older
>> versions, like done in downstream RHEL) in the QEMU binary, so let's
>> better check whether the machine types are available before using them.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Looks good to me, so
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> 
> the only concern is that when deprecated machine is removed,
> this code will happily hide test block which should be removed.

Yes, but ideally, the person who removes depreacted machines should "grep" 
throught the sources for the machines that should be removed anyway 
(otherwise you might miss the spots where they are mentioned in comments 
anyway, like in hw/i386/acpi-build.c for example).

By the way, currently there are no x86 machines marked as deprecated ... 
should we maybe mark the pc-i440fx-1.x machines as deprecated now, since 
they are very old already?

  Thomas



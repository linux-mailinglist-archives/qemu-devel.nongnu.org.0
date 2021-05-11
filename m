Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B621037A2C2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:59:40 +0200 (CEST)
Received: from localhost ([::1]:58936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOEt-0008At-FQ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNqt-0000qy-F4
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:34:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNqp-0004LT-Jm
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620722085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtl0WP6ze59bBic0SmLC98x635Y4j/A3sQWxGw2lzHM=;
 b=KfhbAISn5zS8JLTEoJdh/h88ljXIJ3HP9uc9AfbJRYSSWIrJBlUUbu2Gnsoqq8HC21TxQG
 5b7YAgy9Rajf238k9tYh3EpvS3xK68HiABXFa6gh2X+nxCbj+JD6OjFa1fDWKWVpVtwZXS
 0mbrzS+8kXThNXkmRNJWZMgLCXA6BOU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-IqOSRnhOPjKmZlWfRC2auA-1; Tue, 11 May 2021 04:34:44 -0400
X-MC-Unique: IqOSRnhOPjKmZlWfRC2auA-1
Received: by mail-ed1-f70.google.com with SMTP id
 i17-20020a50fc110000b0290387c230e257so10534236edr.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dtl0WP6ze59bBic0SmLC98x635Y4j/A3sQWxGw2lzHM=;
 b=KgY7IRaGsVzQK+Ia/GrVbXBRqiaZ7EScydXiINtdPlyzvUDJi6FL832yXN8PcjJYxC
 QGvMRT2bl4UVj2Ug1c5l38lpzV5xQWmYSbxR4EPOOPBPpoHXOTqy2qi7MI012+nwb18R
 VaPjIQvdGcVs1AveG9N2xHLDCvrlJIIr1JQaTiDyItTHifVVjOP9+8blpXxpE0y9Fvsy
 wG+9vsCE1ySLcKy0wDACFh6k2f7Vsp7HbBXcLksxAK0GmgYfwCpfM3feF6TjLu8YflIB
 eA1eW6HyzK+DdFBxZhtyQFaEQQ20mq39ET5M+QqwKIMNhjI9j0bUGbgssMDQqzsSTWXo
 Ehxw==
X-Gm-Message-State: AOAM532Ff84qQGP2ZXn3J0IGnbGeBukG48zXePwBa9q5A1ltiU1hv91B
 WYobTWzyPyCOZTaTq1q5/pCZUeJQGqTqh6+DyzAQ04Drraweys2KDRj/kxMl9ekP1YZIyLF3gUO
 nc/fiEBOg7S813OBbZX7ik98akf+hD0tTsmetqf07K5CC+lv6i3XsvqjQJvN9/BbuceE=
X-Received: by 2002:a50:bec1:: with SMTP id e1mr34702346edk.116.1620722083336; 
 Tue, 11 May 2021 01:34:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydkiEe9S5kCz3MHMU6v5fXMWwgCtkOvmQj3KS3zyBvo2dTHYV5MCLQU0Xmc19XMkdSIAa04Q==
X-Received: by 2002:a50:bec1:: with SMTP id e1mr34702320edk.116.1620722083109; 
 Tue, 11 May 2021 01:34:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o20sm7654889eds.20.2021.05.11.01.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 01:34:42 -0700 (PDT)
Subject: Re: [PATCH 5/6] co-shared-resource: protect with a mutex
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-6-eesposit@redhat.com>
 <57fd4d5f-4645-905f-998c-a120c042fdc7@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2cedc820-d14c-b7e6-5024-10357e0e1b36@redhat.com>
Date: Tue, 11 May 2021 10:34:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <57fd4d5f-4645-905f-998c-a120c042fdc7@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/05/21 13:40, Vladimir Sementsov-Ogievskiy wrote:
> 
>> co-shared-resource is currently not thread-safe, as also reported
>> in co-shared-resource.h. Add a QemuMutex because co_try_get_from_shres
>> can also be invoked from non-coroutine context.
> 
> But it doesn't. It's called only from co_get_from_shres(). So, better 
> make it a static function first.

It's a sensible interface though.  It lets you sleep or retry in your 
own way if you cannot get the resources, so (apart from the 
unlocked/locked confusion in the names) I like keeping it in the public API.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484EF3972CF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:49:54 +0200 (CEST)
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2u9-0004l5-2U
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2qw-0002bE-Cn
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:46:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2qu-0004Q1-MG
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:46:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622547992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRngOqoKzv4Us2rMgvv3HdzoPmBGZSSoRrEIblETIfY=;
 b=gktAzQhbAFb9oLy5bY8L3Xbf/+F2CVQdQ/NeuGIGcuWU/hUYCwnSPBTVNWITPdtqWDDw+n
 FI5jPwwH74El5TPoMkTsokrqpavKcwPMKVg4/EjMBP/YCQfXQWzLHpsQPTfQhyDXoM5GQ4
 OFfU3frnNBGeqn1MeNmoJ6zkHIM928U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-pYertjiOPKujQcj5rjQopg-1; Tue, 01 Jun 2021 07:46:28 -0400
X-MC-Unique: pYertjiOPKujQcj5rjQopg-1
Received: by mail-ed1-f70.google.com with SMTP id
 c21-20020a0564021015b029038c3f08ce5aso7710468edu.18
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 04:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qRngOqoKzv4Us2rMgvv3HdzoPmBGZSSoRrEIblETIfY=;
 b=GngBDmkRMgctsMdxwkl3BvKK/Yxh9gDS/eZzYx27kzyaGGbcYoCe2MirZhF5G+5ID4
 q9sayHnU5BxcUiUiUX2npqnjcowFh15P5Uk015rNjBUBdOdjGiFE7FDYtUwoWE0UEzRV
 6o2Mmi6CxrDCLh2wOjy1p+ibhVdJF+t7CN6heJiiV9hfeOCT0kX5OswUaq1ipDNpSetU
 kXM4+noHz/vGfz1tyuIv83IVg2FNvHtbFTGQK+KUkfcMdxWUF7g0F+R1gCkOwJFlB8/v
 NchvUR/zjOCpNUrZqwLQ5B8nAB4Vf22twVMufNcsEo0+btsWtAjjOe9tTLhlc7MUkA6x
 BhNg==
X-Gm-Message-State: AOAM531vEIwwOqBuMtQycSOw8XzzHA61X8Wymh10f7W76LzjUPX5YmYV
 o+SPdiFcikHcluvSh1QFADTiuNI7tczs/bQ5Pkn3F3oSZIyEwCY1UUuXyivmFEmY4Vioqt2c4xB
 07x0GPw6VIzxjgB8=
X-Received: by 2002:a17:907:7ba8:: with SMTP id
 ne40mr7678933ejc.209.1622547987636; 
 Tue, 01 Jun 2021 04:46:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiA/P2WCxX4yUgnnUnrO+rqlLrN8gRU5qN8cOkTa99HUUDuWj2kKns7p5uQXlqpIOJLML80w==
X-Received: by 2002:a17:907:7ba8:: with SMTP id
 ne40mr7678907ejc.209.1622547987435; 
 Tue, 01 Jun 2021 04:46:27 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 ox6sm6465306ejb.120.2021.06.01.04.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 04:46:26 -0700 (PDT)
Subject: Re: [PATCH v2 31/33] iotests/image-fleecing: rename tgt_node
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-32-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d9df2b71-4a64-1b72-7b9a-767b820b75a4@redhat.com>
Date: Tue, 1 Jun 2021 13:46:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-32-vsementsov@virtuozzo.com>
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
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 20.05.21 16:22, Vladimir Sementsov-Ogievskiy wrote:
> Actually target of backup(sync=None) is not a final backup target:
> image fleecing is intended to be used with external tool, which will
> copy data from fleecing node to some real backup target.
>
> Also, we are going to add a test case for "push backup with fleecing",
> where instead of exporting fleecing node by NBD, we'll start a backup
> job from fleecing node to real backup target.
>
> To avoid confusion, let's rename temporary fleecing node now.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/tests/image-fleecing | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>



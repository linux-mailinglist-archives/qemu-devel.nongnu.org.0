Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D17B6ADCAE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:59:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZV26-0005zj-O4; Tue, 07 Mar 2023 05:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZV24-0005zQ-Pa
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:59:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZV22-0000mJ-TH
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678186737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oi/nV329Q76lyVx2Ua11zLodr2sIsITQxJqEN8yUpk8=;
 b=LrXJFKsa4TIGyYlXtC6WaibzVfPOMNUoFq2b+aZUFBd+h0ShAgHqixSVFJYag/Yp3ITo+z
 HhnQMNRnqDKKmWvAikNiqjm1mjCUl59zuoA09FqCRtGUpiASfVVBTAQT2i39cLQk+Bt9JY
 OzOS8iMermLQBeDUvp/tVgehSDfnkJM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-s4ttbm2vNJ-FKaNdWoBErA-1; Tue, 07 Mar 2023 05:58:56 -0500
X-MC-Unique: s4ttbm2vNJ-FKaNdWoBErA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z14-20020a05640235ce00b004e07ddbc2f8so9676992edc.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678186735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oi/nV329Q76lyVx2Ua11zLodr2sIsITQxJqEN8yUpk8=;
 b=GBHPpFGn0Aa9IzCjg38kK6Lcu3SlbHlZU6Egh1TagkfgwMZibEy31j3bj9udF/X9V6
 PrBXnYTfMJNZHPwjEBK+L2oLWsnCJM1qrcgnOmJmvjkgiWKABoq4K2udhJLhXCcp2S9V
 i3orE9N14Uy4rA8eJdszGqSqGEyDQJaGDUOZBUmQ1Po+fqSD0p/6seGu0a2ocQUPlP6M
 qpgv6bliFhd4iqMrs8gjYkLVbB7e09ZyzEAC+f9vpRzJjj4entGJeM7cA0N43OHtZSGU
 efgi2dFl4Q2QhZPr8WyobwKQ3uYwLI3qqLaMfbsy7tHrLLoNdDymSDvVNabL0rMgzKpZ
 +R+A==
X-Gm-Message-State: AO0yUKV+mVNBg/v8qMgIuWD2lAVVrSJrZNqUvys38kpJxgeQEyB3OtLF
 Z0kyOZAy/O68uMhs8W/NYZhhhltjTMtMpE+l6XS/nFc/q1qXhcrGYRo2LoYs5PhDnfV4DsHnUbF
 TYIGNUXBRCUdgJ5E=
X-Received: by 2002:aa7:d84f:0:b0:4ae:eb0f:4273 with SMTP id
 f15-20020aa7d84f000000b004aeeb0f4273mr13797710eds.15.1678186735359; 
 Tue, 07 Mar 2023 02:58:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/bGvoc7yLcEWSj5ibGmUB2xaOtZouZWtExoID2iv2uwUS+T5xWtyPjTAV9vGu8p7psRF1cGA==
X-Received: by 2002:aa7:d84f:0:b0:4ae:eb0f:4273 with SMTP id
 f15-20020aa7d84f000000b004aeeb0f4273mr13797689eds.15.1678186735113; 
 Tue, 07 Mar 2023 02:58:55 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 m25-20020a509319000000b004be11e97ca2sm6444134eda.90.2023.03.07.02.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:58:54 -0800 (PST)
Message-ID: <115b4902-b930-5f33-4a3c-5b767f94c2d5@redhat.com>
Date: Tue, 7 Mar 2023 11:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 1/4] linux-aio: use LinuxAioState from the running
 thread
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20230203131731.851116-1-eesposit@redhat.com>
 <20230203131731.851116-2-eesposit@redhat.com> <Y/96WsnkiZEb0+kf@fedora>
 <ZAb6c+Nz7jVvNylN@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ZAb6c+Nz7jVvNylN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/7/23 09:48, Kevin Wolf wrote:
> You mean we have a device that has a separate iothread, but a request is
> submitted from the main thread? This isn't even allowed today; if a node
> is in an iothread, all I/O must be submitted from that iothread. Do you
> know any code that does submit I/O from the main thread instead?

I think it is allowed, you just have to take the AioContext lock around 
the bdrv_*?  For example it could happen when you do block device migration.

Paolo



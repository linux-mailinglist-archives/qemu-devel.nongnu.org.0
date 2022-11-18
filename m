Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D3662F8B4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 16:03:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow2s6-00053z-2F; Fri, 18 Nov 2022 10:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ow2s3-00053f-6i
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:01:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ow2s1-0007sQ-Cd
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668783692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aaGCylxYiAFp8AKnIeCn/2YoHShOXyiorZSerwvfcc=;
 b=OxOW7x7RMxZOUcYujrSYqptAuPeu2EYlXQBc4LEVf47C45YtlaAhPlposTq/j2IPsNNjqu
 pYf7i602lIcp03fCRUPopELcbLkV4T1ihn7vQpn1HrvVNuTp1mL6kejz+6ntjlvBRb+TKM
 6cworPSIcp8FM3m876IQghlw+3GOWig=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-201-JEVAbxOONhytdl8k1piIVQ-1; Fri, 18 Nov 2022 10:01:31 -0500
X-MC-Unique: JEVAbxOONhytdl8k1piIVQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso1683775wrc.10
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9aaGCylxYiAFp8AKnIeCn/2YoHShOXyiorZSerwvfcc=;
 b=js2BbxdyzJEUA+oGoOT5rxJ+/ZoaDMX3Q04EcKBiOZqcHP/opQ2eWjVm0cahNjpm5g
 Lk6lU/Vybeby2PwCPttGQxVPvgQVGuPkj5awdadGCC+mnwiqbeUNJv9CJI84aIUThl+g
 LRt3Zbg+3GpuxBq5TzkSk48VkuwaK6YZjgD/6eWsc0PAx2KfzNI/c/8Uck1YwHbCgUOu
 vAWC0WC3DHFCzETiht0P7MEfDevSrekbu7PfSpuia6J8lh9woi6lIrDf3uyTPikqwFxL
 wXFlij1rrJ9k77lf+nbsx1qd164sj7W6qmzuhoF/xde+UAsbmwvWxyWfufNY+tBGQ1Kh
 QfVA==
X-Gm-Message-State: ANoB5plBHquIu7utkRNiYuWCITJNge2pIrs1Sv1stBC9SdSrL4NHtI+J
 yUWr0usaUvLYMIOPXT0uHEHBasP/nwlpqybhL8p1C489CihpHGIhUboPvqXsDCUgZkhJZ1jntX8
 /fFpNoc6yHS9CAHQ=
X-Received: by 2002:a05:600c:4f90:b0:3c1:aeb9:29b6 with SMTP id
 n16-20020a05600c4f9000b003c1aeb929b6mr8700118wmq.97.1668783689861; 
 Fri, 18 Nov 2022 07:01:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6c9x9x495kLKi3qP4jNntoHquJh7KT2jcLIPz7Sf6ZSP7zjZR5oIwzz4NGGM8ZaRKLAYjrjw==
X-Received: by 2002:a05:600c:4f90:b0:3c1:aeb9:29b6 with SMTP id
 n16-20020a05600c4f9000b003c1aeb929b6mr8700066wmq.97.1668783689518; 
 Fri, 18 Nov 2022 07:01:29 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a5d5952000000b00236883f2f5csm3725467wri.94.2022.11.18.07.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 07:01:28 -0800 (PST)
Message-ID: <a26e707d-0929-7a6b-6860-72edd32a54d9@redhat.com>
Date: Fri, 18 Nov 2022 16:01:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 00/15] Protect the block layer with a rwlock: part 3
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Alberto Garcia <berto@igalia.com>,
 Ilya Dryomov <idryomov@gmail.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 integration@gluster.org
References: <20221116140730.3056048-1-eesposit@redhat.com>
 <e218aa44-6c49-d53f-d377-58a90a84db46@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <e218aa44-6c49-d53f-d377-58a90a84db46@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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



Am 18/11/2022 um 11:57 schrieb Paolo Bonzini:
> On 11/16/22 15:07, Emanuele Giuseppe Esposito wrote:
>> Here we introduce generated_co_wrapper_simple, a simplification of
>> g_c_w that
>> only considers the case where the caller is not in a coroutine.
>> This simplifies and clarifies a lot when the caller is a coroutine or
>> not, and
>> in the future will hopefully replace g_c_w.
> 
> This is a good idea!
> 
> Just one thing, though it belongs more in the two series which
> introduced generated_co_wrapper_simple and generated_co_wrapper_blk - I
> would make this the "official" wrapper.  So perhaps:
> 
> - generated_co_wrapper_simple -> coroutine_wrapper
> - generated_co_wrapper_blk -> coroutine_wrapper_mixed
> - generated_co_wrapper -> coroutine_wrapper_mixed_bdrv
> 
> ?  It is not clear to me yet if you will have bdrv_* functions that take
> the rdlock as well - in which case however coroutine_wrapper_bdrv would
> not be hard to add.

Why _mixed? I thought _blk was a nice name to identify only the blk_*
API that have this slightly different behavior (ie do not take the
rwlock anywhere).

No, I don't think there will be bdrv_* functions that will behave as
blk_*, if that's what you mean.

Regarding the bdrv_* functions in general, there are a couple of
additional places (which should be all in the main loop) where we need
to use assert_bdrv_grapg_readable. In those places we theoretically need
nothing, but if we use the automatic TSA locking checker that is being
tested by kevin, we need some sort of "placeholder" so that cc/gcc (I
don't remember anymore which) won't throw false positives.

> 
> Even without looking at the lock, the three series are going in the
> right direction of ultimately having more "simple" coroutine wrappers at
> the blk_* level and more coroutine functions (ultimately less wrappers,
> too) at the bdrv_* level.
> 
> Paolo
> 



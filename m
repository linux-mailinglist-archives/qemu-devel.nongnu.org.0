Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C9D397238
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:19:50 +0200 (CEST)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2R3-0003UG-VY
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2Ow-0000lC-Oh
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:17:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2Ou-0003eq-0e
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622546255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXLsxPlFb1/hgvW41egJQjDrDmadFN3cY2lmm+DpXZM=;
 b=WGhPreXRzpBc85OAwJS9XY9ufGTnMEuRmDKGZMCX/tbxwKONYDatAYg8bBtMxYZnLkfDKF
 /mMv+WQ1BjgJuZrcxNq7iQoOmAMDO0gIwtZGCf3lFDlfleJTj1abccILIb9XZwQKDeMpir
 jwdFfI69ZVxKvvZWNnvv+Yab+AUtO2E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-4THUPOLHNA6ULgpQx5QHww-1; Tue, 01 Jun 2021 07:17:33 -0400
X-MC-Unique: 4THUPOLHNA6ULgpQx5QHww-1
Received: by mail-ed1-f70.google.com with SMTP id
 x8-20020aa7d3880000b029038fe468f5f4so2682629edq.10
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 04:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oXLsxPlFb1/hgvW41egJQjDrDmadFN3cY2lmm+DpXZM=;
 b=rr2M+ahpKUEg0bSNtYosMK1BDDDwbuB/Z5UU2MwhhkXyl8YaqaQQ0CvVvm2BbdroIg
 ogE6UChxFKJA3X7kjz/1j/q5f96aYqxEKSA/VJQ093hLKgJU24KfpfVK+LIIW1u+adrt
 MKVkNBz7M9fxCvG+eQNthcytdC71NNu47udPBJm6+j5Zlb0KV0JrVJ0u0aU3qcZzgmg9
 orNMRSfMXgTiOEC8peLaUbbVC1dmumKoJLwhK0ugZgIZoRfmlYGKUUdwX3/B3BZrI7AS
 NNzRoNTW1AvcUWaTmxROhGfLqUmPmREY9QF5L6NyR7BAjHwwnpRjOROJ2/yWwMUFJkJw
 iwMQ==
X-Gm-Message-State: AOAM532J8+eMvcEU8QURBG8bSyC4olAmvWTtax81letpPYOZGlXAINae
 UjbJ19rpImLZzoffPqH0UTHIEtIIm/fkYyBG0H9eqB3QBmNipDCkoTAT/gKPV/x6WvPK31QW21D
 lA/yA5NqyT5jjTEM=
X-Received: by 2002:a17:906:a12:: with SMTP id
 w18mr22017513ejf.92.1622546252845; 
 Tue, 01 Jun 2021 04:17:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv+5d2TZ1CWQPHAhZEjorrwb1zTrWPQam0MGo7ZhkwW7VFPlKx6VXGJPILobBRFYS+AQZPzg==
X-Received: by 2002:a17:906:a12:: with SMTP id
 w18mr22017494ejf.92.1622546252685; 
 Tue, 01 Jun 2021 04:17:32 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 ay24sm2765918edb.2.2021.06.01.04.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 04:17:32 -0700 (PDT)
Subject: Re: [PATCH v2 28/33] iotests: move 222 to tests/image-fleecing
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-29-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <9298d037-e4a3-8415-46fe-11cdd02c0f84@redhat.com>
Date: Tue, 1 Jun 2021 13:17:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-29-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:22, Vladimir Sementsov-Ogievskiy wrote:
> Give a good name to test file.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/{222 => tests/image-fleecing}         | 0
>   tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
>   2 files changed, 0 insertions(+), 0 deletions(-)
>   rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
>   rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} (100%)

Reviewed-by: Max Reitz <mreitz@redhat.com>



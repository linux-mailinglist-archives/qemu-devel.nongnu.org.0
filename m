Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02353E48F7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 17:36:37 +0200 (CEST)
Received: from localhost ([::1]:55462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD7KO-0008Ew-HI
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 11:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD7J4-0006xh-Bn
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 11:35:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD7J2-0003ui-2t
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 11:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628523311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqFB6jvAYBpE9bCRagnduV87X+net+TMxwu+1bcT4wA=;
 b=U3bHEFapQKnzsntRw0e+I8RUFAyHfRKXlsht/2tnd/DfmJo8vZwCrRZmD5g7tfSYSHLMUT
 3sGrXrflI/JtRf3bP0Qo4uWz4ycsewVBOzYaXtsonu0JE+TNxsnijr7JLVEwErZCzNz5f2
 PZsRpDs+qQj79I8tAs+Jz2fwKjEgBMw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-FMI80D-lNYmASRpix4Tm1A-1; Mon, 09 Aug 2021 11:35:10 -0400
X-MC-Unique: FMI80D-lNYmASRpix4Tm1A-1
Received: by mail-wr1-f71.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so5476757wrl.0
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 08:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zqFB6jvAYBpE9bCRagnduV87X+net+TMxwu+1bcT4wA=;
 b=oYoDBDNV9akqjgsplM+pzGhq4Sk1Ca6pDqksjinBq/1ZmgKRNeFsUwnyKdvYJf29iy
 m8lyyUvwIr/VUVcJDssHGbO1+kmTmHz9zzVOq+hqGs0LExsGG8mVjWhGhgPfvjw/9vzR
 2Kib2CCHCiPpuOvLDveO3e30sOOspOgf8SpXoinw3c3y0Gr5ACBuNgZU519KvFujwX/D
 J+fwFnIVBRk0jrQx3kXt3UQ8N5aXDq4lz1Gxo7wHH0PY7+tfBj60MDZLbCzrcEnXk44q
 l/cI1qPRnnU9R0tKCf5BhspmhKsdOYQ/+oxEyN+bW0uhUJNNknTXJ+cNyGE0EApDOBLY
 9n5w==
X-Gm-Message-State: AOAM5320SVhe5WIgiSHmXrywPSS1mLR76P4+FL+cl6C6SazQImAS91m+
 ymbdIqqijMrWNxv4g2Lga/rpA6kceH/iF80DyynVIafMz9urFohTb+tSE3+C/RlHUjrVYlPP8um
 N20IUKkVG2CGHgEs=
X-Received: by 2002:adf:f80f:: with SMTP id s15mr25694477wrp.330.1628523308975; 
 Mon, 09 Aug 2021 08:35:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysabtI4bUtgJ4bVKKSIu1+uLW7pSLnmD++aJyscE9gQUlm1qg98cEj92l3lUl6mqvKyHq/ag==
X-Received: by 2002:adf:f80f:: with SMTP id s15mr25694444wrp.330.1628523308672; 
 Mon, 09 Aug 2021 08:35:08 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 g6sm8270193wmq.42.2021.08.09.08.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 08:35:08 -0700 (PDT)
Subject: Re: [PATCH for 6.1] tests: filter out TLS distinguished name in
 certificate checks
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210804180330.3469683-1-berrange@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <af8f6dea-def2-c3fe-e2f3-68e5fb27fa89@redhat.com>
Date: Mon, 9 Aug 2021 17:35:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804180330.3469683-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.08.21 20:03, Daniel P. Berrangé wrote:
> The version of GNUTLS in Fedora 34 has changed the order in which encodes
> fields when generating new TLS certificates. This in turn changes the
> order seen when querying the distinguished name. This ultimately breaks
> the expected output in the NBD TLS iotests. We don't need to be
> comparing the exact distinguished name text for the purpose of the test
> though, so it is fine to filter it out.
>
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/233           | 2 +-
>   tests/qemu-iotests/233.out       | 4 ++--
>   tests/qemu-iotests/common.filter | 5 +++++
>   3 files changed, 8 insertions(+), 3 deletions(-)

Thanks, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

(Given my email address change today, I don’t know yet how well the pull 
request will go.  Perhaps I’ll have to ask Kevin or Eric to step in on 
this one.)

Hanna



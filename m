Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE29E40F481
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 11:06:15 +0200 (CEST)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9p0-0005Oc-Ms
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 05:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mR9id-0002td-QO
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mR9iZ-0003SW-6i
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631869174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lfWLsDMcDJCBpi517s5xKISqgPEbDTZzpQo54ivTci0=;
 b=R12HON8PWS4LpUHMWb2cnJo4OJYd8j7zUdWru3M2Y4BICrdeSqjFCCoOVV6K5Xcw6ovvdl
 zZyl9S3jBGT1KStsMgQ7yWDof1iSGAto3+K64QZ2rmzbPku2VoYQ1kJZXDIRKEEfJ1qIF6
 jSuKGDZCUA0E0qCj/Nh9UxyrwNboRSQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-rpwDTjGHMcGb38U-j6ET9g-1; Fri, 17 Sep 2021 04:59:31 -0400
X-MC-Unique: rpwDTjGHMcGb38U-j6ET9g-1
Received: by mail-wr1-f72.google.com with SMTP id
 z2-20020a5d4c82000000b0015b140e0562so3476931wrs.7
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 01:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lfWLsDMcDJCBpi517s5xKISqgPEbDTZzpQo54ivTci0=;
 b=QzJST3vAOdJ3ggA9/5NYCADNh9JTDkrmjju2FWrs3wjoIh/diD81pW6O6PynhiLFTx
 LNxkYmzAnGEoW4dMpbu65Vw00l/Sc28WMXnEi0ebmvpe4KmDLqm2OKTod17eKYgFw4gL
 uDMAdXlUFGh1j2aC2EyDnnzF758xdYHLkI2D65wsxk2wg3OVz3UdNmKfN60N9/zLRLuy
 cEP1qEydOJPv1MCSi5sTScNAvK17V+UfEebmhg0CVTb6yxsD+vzlkI2/KwOPGOoKq7sS
 10v9TrIS3GMqXLxvQGnpIs7+zzk0ySQsruNPscRKGq/iY+ATNVGqtUPIcr7NR2hXIA5f
 5fuA==
X-Gm-Message-State: AOAM531meO3uYmANoKGb//3hXynE0Z9J6il+mLhsFsZ06jnkF1YCvPFm
 BHRoVUHG3UM/eLn3s3d2m4APIdELR5p1Hfz8IeY252PTjnU3t+1zokjtSTmdSHLekht8wjka9Gc
 9hGwvp3qvjr7e1Cs=
X-Received: by 2002:a5d:4d4f:: with SMTP id a15mr10883102wru.210.1631869170107; 
 Fri, 17 Sep 2021 01:59:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBoKPy3iBaYZ/w3mmEaBd+FzXZaApU+LOWk5UlLhohjIp7GB2YAvRg7pphTkr38NHiQNnAxQ==
X-Received: by 2002:a5d:4d4f:: with SMTP id a15mr10883086wru.210.1631869169915; 
 Fri, 17 Sep 2021 01:59:29 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id s15sm6142161wrb.22.2021.09.17.01.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 01:59:29 -0700 (PDT)
Subject: Re: [PATCH v3 04/16] iotests/migrate-bitmaps-test: delint
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-5-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <76e4af2b-f3f1-3642-9b2c-98b39a465601@redhat.com>
Date: Fri, 17 Sep 2021 10:59:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-5-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> Mostly uninteresting stuff. Move the test injections under a function
> named main() so that the variables used during that process aren't in
> the global scope.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/tests/migrate-bitmaps-test | 50 +++++++++++--------
>   1 file changed, 28 insertions(+), 22 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



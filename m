Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309D740C7B6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:49:50 +0200 (CEST)
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQWEP-00021U-8x
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQWAZ-0006Uc-7X
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQWAR-000520-Ay
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631717141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPyw41+g5/VyyqmZfiUe7wukOTaZFvaPaQO2wULQvyU=;
 b=efNWON4LuMWHLKF5BkLmVUdjZ2MeYh1oPshjvQiK5viTYkm3OwxYdBx7lwrITMIGAFFsKu
 0JV57j/cWFqQpEfliURsXSLUfGCMR/6OSyrn531W9bvMvCBrDSJdt/bmtz8Dod6JqMQ75l
 jvjT/RC13hcJBf14K0PkIqXGb9xcaCg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-DmrB-LxnNdeuaiQVKn-fvw-1; Wed, 15 Sep 2021 10:45:39 -0400
X-MC-Unique: DmrB-LxnNdeuaiQVKn-fvw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s13-20020adf978d000000b0015e4260febdso597760wrb.20
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 07:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=EPyw41+g5/VyyqmZfiUe7wukOTaZFvaPaQO2wULQvyU=;
 b=NnyJbTtimmDb3pGPlXQqviwW9NxV4yAIi+MrXL9vY5pV4DUkaRq3oilQEF31S3+yWM
 Mlv4fMIogWUlvEm3oJfeNFy3iPIquy6WJvhI+y0+HcbWABYX23JM2WMhIdne9MBzwV6p
 nu0RYda0UaGbgUdwFycfouOZgIlXch3ob9vqK18hPuBb7S6thfInkBq1LDLCoSgC50ql
 R/YH7roi2uXkd0J3qUi2A+qiyrFfy5XAfqCybgX76YhujSJQfqNZMsJISG46i5pC+nQC
 jGb+hGMp34SNP+w36+4rkfr6NwqGFDi5NyAahpqUMwN9PcCSdfuq7bYtJlZobgDHYsxP
 l9sA==
X-Gm-Message-State: AOAM5310iUeydSJ3s57WxdEbix9LzNsA16oAbllJCoKgEK0g6s685KtM
 gK95uemmzVlB9QZmC4kwPT7skvZA3vsaurUw0F0YA3G1oddvTnnw4fcpgkGHDZAZ8lsbFq7M4bQ
 WZoBIlOViv69Un/E=
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr316020wrp.95.1631717137984;
 Wed, 15 Sep 2021 07:45:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7zXUeDcF/vFLxeo+zIJT4EgWxpwjXSKrM5ulm9HdT9/ga8/lnJD/2588pzA9/MZzkbQHw9A==
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr315988wrp.95.1631717137683;
 Wed, 15 Sep 2021 07:45:37 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id k17sm206866wrq.7.2021.09.15.07.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 07:45:37 -0700 (PDT)
Subject: Re: [PATCH v3 00/17] iotests: support zstd
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <2e923c5b-0bfa-6870-be68-cd1ccb7b125d@redhat.com>
Date: Wed, 15 Sep 2021 16:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.09.21 12:25, Vladimir Sementsov-Ogievskiy wrote:
> These series makes tests pass with
>
>     IMGOPTS='compression_type=zstd'
>
> Also, python iotests start to support IMGOPTS (they didn't before).

Unfortunately, the problem I have now is that it makes the tests fail 
with other IMGOPTS.

My regular test set includes 'refcount_bits=1', 'compat=0.10', and 
'data_file=$TEST_IMG.ext_data_file'.  These fail now, because the Python 
tests don’t have a way to specify which test options they don’t support 
(like _unsupported_imgopts).  Handling data_file of course is extra 
tricky because now every disk image consists of two files, and the 
qemu-img create invocation needs to expand '$TEST_IMG', like 
_make_test_img does (in the line where imgopts_expanded is set).

I think we need an unsupported_imgopts parameter for Python tests, and 
it needs to be filled (perhaps 
https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg00082.html 
can serve as a starting point).  And for the time being, I think Python 
tests should be skipped altogether when IMGOPTS contains data_file.

Hanna



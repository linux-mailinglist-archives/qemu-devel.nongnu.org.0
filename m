Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC23243B102
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 13:18:51 +0200 (CEST)
Received: from localhost ([::1]:33296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfKTj-0004tN-2c
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 07:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfK3I-0001fo-Ti
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfK3G-0001VV-Pg
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635245488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCBMDPSlaEVbZBy/2fTD7xUi7hMBZYxdiwdxP6OrnIA=;
 b=LYC8m/yuTENr4Un3T0A8YJY1+mdhyxQ8LLx3EXII2vXOy1pyXKNrb2eSRK5oazUbnN/ok2
 4APvWilJvnDoNlcK3t9IdZUJDm7///lw0hF5G5Z86Y3JNW6sl9X1pF3MqzXoC4670U/MsR
 Y2ZN4yN1j7Tt2xop4P7jA9sI5J8FMyU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-CbTImtgPOBm_Y8tf_VQ5tw-1; Tue, 26 Oct 2021 06:51:25 -0400
X-MC-Unique: CbTImtgPOBm_Y8tf_VQ5tw-1
Received: by mail-wm1-f70.google.com with SMTP id
 a18-20020a1cf012000000b0032ca3eb2ac3so782219wmb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OCBMDPSlaEVbZBy/2fTD7xUi7hMBZYxdiwdxP6OrnIA=;
 b=nI73oVsm8jrOx50p00sNWxr3jAZ31fUyDwOQ8ebOU/qEc0U876KFXfMHEjtBD54QiB
 scYt1XBtpDgmcl+kDQqP/hoqV17C7UL+diCrrUPWTIXbosq2X6vuvaQoIf1Y9eg2LZXy
 9RJNvPY8eH06YWmdzkZkVdwy49zc0Ye1SQucAj80pQ3j/5S44WX9mP7wgli7KcZMtSxy
 QFWX0jPUzmk588SxvFGELRpKDveiAEfgUitKojZWU4CB4oPadQv67j6NrY8mPgfLC7Ww
 MDrALO4Xsd7yt83dtV2VnXKARuucy6PPCjhhg7Xhp99inKqd1m/SS3uqOYyxR2YRyF3J
 cKBw==
X-Gm-Message-State: AOAM530v8ilIs0qxguZH2eBkZbX/L7a6LycuOcTljPNai9Lw6Ci1PbYd
 mimG55uNZhoHegKf+WAVlJh6AipsrYLTeaW0XGi+2LwJxXU5qSh0OBulEbbmqU1DfGYbCbrBu37
 h+LD0we7brHv7O5k=
X-Received: by 2002:a1c:f712:: with SMTP id v18mr27728087wmh.104.1635245484547; 
 Tue, 26 Oct 2021 03:51:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRsqGt+FQAzfQJ38RiZrPKzUUDf8Xx+R5M5Dbm7tGBHFQEUDNFjXtZP4lMy2NoHPQ1tVX0Gg==
X-Received: by 2002:a1c:f712:: with SMTP id v18mr27728062wmh.104.1635245484290; 
 Tue, 26 Oct 2021 03:51:24 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id j9sm451469wrt.96.2021.10.26.03.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:51:23 -0700 (PDT)
Message-ID: <ebded478-63ee-a2d2-7b90-d6d6926d9291@redhat.com>
Date: Tue, 26 Oct 2021 12:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 11/15] iotests: split linters.py out from 297
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-12-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211019144918.3159078-12-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.10.21 16:49, John Snow wrote:
> Now, 297 is just the iotests-specific incantations and linters.py is as
> minimal as I can think to make it. The only remaining element in here
> that ought to be configuration and not code is the list of skip files,
> but they're still numerous enough that repeating them for mypy and
> pylint configurations both would be ... a hassle.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297        | 72 +++++----------------------------
>   tests/qemu-iotests/linters.py | 76 +++++++++++++++++++++++++++++++++++
>   2 files changed, 87 insertions(+), 61 deletions(-)
>   create mode 100644 tests/qemu-iotests/linters.py

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

I wonder about `check_linter()`, though.  By not moving it to 
linters.py, we can’t use it in its entry point, and so the Python test 
infrastructure will have a strong dependency on these linters. Though 
then again, it probably already does, and I suppose that’s one of the 
points hindering us from running this from make check?

Hanna



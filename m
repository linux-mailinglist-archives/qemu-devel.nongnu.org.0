Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9FE40FACA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:52:23 +0200 (CEST)
Received: from localhost ([::1]:50564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFDy-0007S2-UX
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRF18-0002CJ-2U
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:39:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRF15-0005jU-8H
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRG7m8QmpVl+mJP073cyMld+3DLBc9o97brYMUqHQzU=;
 b=a1WuV1oAbX3IKsN5j4rImJweZME7Ple7hONoCPJrKasZGjabHjNkFSzJ/TYmJ6FrzZwtnk
 xE9tbEDTqTQML+fwwl+AFD1ch9oYSEw64/cqqd2dCoqYqVIT6XWppZaaiyaZGtYePN8XY3
 hwP/6H8KPTCHThLHZCzQm5yUiVnRS08=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-lxlCmuB-M6mq-rE1kAuiJA-1; Fri, 17 Sep 2021 10:38:59 -0400
X-MC-Unique: lxlCmuB-M6mq-rE1kAuiJA-1
Received: by mail-wm1-f70.google.com with SMTP id
 g74-20020a1c204d000000b0030a1652fea8so270458wmg.3
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 07:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nRG7m8QmpVl+mJP073cyMld+3DLBc9o97brYMUqHQzU=;
 b=wWZkKXRMUqYYEqKQVy8bH/6qsP2NC/zcgEVUZZg673uwmcIqLdSqBOSyPREAHGKv3d
 rSUmGclnlhWAFMx7ooK+BXg+SQc5tlcx+6AP4zUo5XzAEJhOgTtt3AVC0aVDFi2ENtRC
 9G7kYbGGLsxWNxjJHYjkkY8btslMMHiaOihU1ABjEPAUMiA1DkqQr3YX2jKO2/T5rXNe
 iMcp6iKccX1sHZQcipwUGxdm4DIynTwzoU2gtGI98kldmFW9/8sRmOzhM3XOUWTv6hK7
 WIX+yjuvd3YiuXoli41JuyQLe7dssB0NhDZFxc6p9c3Pi3IYQIAZfdVU8YhQe+BkQS2B
 jVHw==
X-Gm-Message-State: AOAM533kpfT+LgIipAJx0pHV/YW9ZF3EkA61hTXjcqDGU7kAOW4B5A7C
 AFeIFRJdKKblkn1aLY5a6Mnj1qq4JqKzFERefiEe7E7w4i2LXHkeuo/KFoBSCxT2kFS45DNWhyO
 4+wbXASCSxjSPuMk=
X-Received: by 2002:adf:ed92:: with SMTP id c18mr12354011wro.86.1631889538258; 
 Fri, 17 Sep 2021 07:38:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3UnMOSUUduBaOcLW34qolenhKM0lG5Ys6v7+z5p+7pL6dS4Jf6rJGRQMCM7S6+7njDl4hGw==
X-Received: by 2002:adf:ed92:: with SMTP id c18mr12354004wro.86.1631889538154; 
 Fri, 17 Sep 2021 07:38:58 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id y8sm6797486wrh.44.2021.09.17.07.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:38:57 -0700 (PDT)
Subject: Re: [PATCH 14/15] python/aqmp: Remove scary message
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-15-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <7e77d482-3ba1-06b4-6c6d-0bafb9ff7e2f@redhat.com>
Date: Fri, 17 Sep 2021 16:38:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-15-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 07:40, John Snow wrote:
> The scary message interferes with the iotests output. Coincidentally, if
> iotests works by removing this, then it's good evidence that we don't
> really need to scare people away from using it.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/__init__.py | 14 --------------
>   1 file changed, 14 deletions(-)

I definitely won’t give an R-b for this one, because that would require 
me reviewing the AQMP series, and, well, you know.

Also, if I were to review the AQMP series and could actually give R-bs 
in good faith, why would I accept adding this message?  I mean, if I’d 
reviewed it, I’d’ve had to trust it.

So, öhm, I’m fine with dropping this message because evidently I’d’ve 
never agreed to adding it in the first place (had I reviewed the AQMP 
series).

Hanna



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C3742BDD4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:51:15 +0200 (CEST)
Received: from localhost ([::1]:50382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabqs-0004ms-Qq
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mabox-0003xU-OO
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mabow-0004Of-BV
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634122152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjBgOHcKB8Qf2daSpWk/nqiEFlWoxzqcztV1F21iMAE=;
 b=fR15Zz/xiIUoEvFYTgaWk7LTnXqvNbORnkzCI5icGtkGU2uk+uRdlXrOCznfjrkmwS2Ur4
 Iq+ri0KkKymHyUGdh1WA94E2vcs/nFVR0cf6WQ32Mui09dqUh9Dkjw8a7F9jugAJ6LgkyK
 a6pONVzN1ILa1y7TCpcxhAcl6+1QMfE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-aVVjETr1PbG5goWQ4Wi96Q-1; Wed, 13 Oct 2021 06:49:11 -0400
X-MC-Unique: aVVjETr1PbG5goWQ4Wi96Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso1630369wri.17
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 03:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BjBgOHcKB8Qf2daSpWk/nqiEFlWoxzqcztV1F21iMAE=;
 b=0MpSh/e5iIvulAZ7K6rLjNdqSlGdFPMzOpMlvp/YUdX18WUYX7bN47zxjSIxfUe4W/
 DeJdJlowXIXWYNG/OafWqm2tLnEGAn6qFpwn+liHo4saJ8ptXPe6HnYu2TRPtR/GB2ml
 x/mv+QXeS+D2pICJF4Bj+8vM2aQlzWgEDWt/M086VzF6tsoxTIoi9MAMId6Hh5yV2DFi
 OpfzhFsAlEUy6TPS3ChNONkdegJsSWdsbBFWV2v9v/3+htvHapxYuFGllD0yYTUdRlBA
 Ll3b7tW0zhv8aNl/GyhVDdyyVPmSan9PraLDOqQ6YcFi2/jf0lZz/WRbDF21XYYz9q59
 y75w==
X-Gm-Message-State: AOAM533pxX0cyKqA9KO3qOGi8izTjJ0arZygV5PXstsdEo43bonHMmiW
 P5DqQFUKmUjxYWGsP+gE7dFlR0xQ+bvVLp6QhH8HVhMeX4U/GXbX+pK2qCVO7Ev9XQ7VRBvGKJ1
 VjUXu0jx2HFmIDRo=
X-Received: by 2002:a5d:5889:: with SMTP id n9mr40114110wrf.248.1634122150222; 
 Wed, 13 Oct 2021 03:49:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOsmYU5NpFRYorIknTmhXe7GOlh8HKxoJ/pluYjVJvl0sx0fiRTsRnyL4GizkQWF+YfcoJNg==
X-Received: by 2002:a5d:5889:: with SMTP id n9mr40114074wrf.248.1634122149971; 
 Wed, 13 Oct 2021 03:49:09 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id n66sm5125458wmn.2.2021.10.13.03.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 03:49:09 -0700 (PDT)
Message-ID: <29138de7-4bf2-ddbb-4abd-3530d2f04c4e@redhat.com>
Date: Wed, 13 Oct 2021 12:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 01/13] iotests/297: Move pylint config into pylintrc
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-2-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 04.10.21 23:04, John Snow wrote:
> Move --score=n and --notes=XXX,FIXME into pylintrc. This pulls
> configuration out of code, which I think is probably a good thing in
> general.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297      |  4 +---
>   tests/qemu-iotests/pylintrc | 16 ++++++++++++++++
>   2 files changed, 17 insertions(+), 3 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



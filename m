Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9644E7431
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 14:28:04 +0100 (CET)
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXjz0-00080j-Qa
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 09:28:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXjwi-0005yu-Ed
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXjwa-0004BU-U8
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648214730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMlLto1o94vT3p8b/mteuRJaQfKtLPpa++nNIFDbj58=;
 b=OR5G9uG573N5JZPFu+9Aa106hds6hyMwTz0efg7BTpUU4MW5VFbT7E6E7bgT1JMoTrWA8Z
 yFNn3GRmDq3MtMxz2yeULVZ0acUtyIDZEFbh6ASzfb+SkuuVMrKh/7u5wCBSJR2MXDedKQ
 QeXfHLi4fh6VtY/naTuQGc+gh5G1BsU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-yeouxURRMKGVx9e4k_Kwxw-1; Fri, 25 Mar 2022 09:25:29 -0400
X-MC-Unique: yeouxURRMKGVx9e4k_Kwxw-1
Received: by mail-ej1-f69.google.com with SMTP id
 ml20-20020a170906cc1400b006df8c9357efso4100242ejb.21
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 06:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yMlLto1o94vT3p8b/mteuRJaQfKtLPpa++nNIFDbj58=;
 b=j+nI3u+E3iDnibPMkriObCh4nBf1Gb95Yv0hLoQsl1Ca5Zb/2AelnpXhPmuVrABfNM
 qn8y6LCgik6lBfHwj5YN0eUnX43qNJY64YuBQ0k0NZOCLBbzLaJkJqPUK0SmmHFMwajV
 gjRB15k+yacNsNWssaF7ET8Jx5wrSzaGQRvO7jN9ZMCRjDAzypawbGHU4MU5YvR6sa6w
 J9UH/5GiOSonNeW3uhIzFWqkctY/b11T8urHlulz+Yulr7mtz1gderpglzNY9K2mP/KO
 npB8AqQsDGizEGmCkFiRt2vCekqyXbkV3DnE4TtxHS9D4XXHjJCTF2PTLFIVzhMD6eBy
 DVjQ==
X-Gm-Message-State: AOAM530TCSNWrawi4RrOKG+nrjl9NqQgrJVe0ue/cfI2cO/0u+FrP25C
 MaaFLyPZAiwQT4A2LB2ATTJJA14JZGzTS7HyC/sdWld+nv33uDJOHfw+TuKV3OU8njRMndM2L4x
 +TTEn9+kYOmiBdKU=
X-Received: by 2002:a17:906:6a19:b0:6e0:aa9a:dbc8 with SMTP id
 qw25-20020a1709066a1900b006e0aa9adbc8mr2561208ejc.15.1648214728278; 
 Fri, 25 Mar 2022 06:25:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMeQFLO+N8ro1sNtJlEj5vQ8dVI4hw0NQ9wdcbidQjFRolsadx9kODDvf3306KlZtvYQ8AJA==
X-Received: by 2002:a17:906:6a19:b0:6e0:aa9a:dbc8 with SMTP id
 qw25-20020a1709066a1900b006e0aa9adbc8mr2561188ejc.15.1648214728059; 
 Fri, 25 Mar 2022 06:25:28 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a17090673c200b006db8ec59b30sm2271215ejl.136.2022.03.25.06.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 06:25:27 -0700 (PDT)
Message-ID: <74c1af31-78de-87a1-cad1-54e1622b9632@redhat.com>
Date: Fri, 25 Mar 2022 14:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/17] iotests: replace calls to log(qemu_io(...)) with
 qemu_io_log()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220324183018.2476551-1-jsnow@redhat.com>
 <20220324183018.2476551-2-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220324183018.2476551-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.03.22 19:30, John Snow wrote:
> This makes these callsites a little simpler, but the real motivation is
> a forthcoming commit will change the return type of qemu_io(), so removing
> users of the return value now is helpful.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/qemu-iotests/242 | 6 +++---
>   tests/qemu-iotests/255 | 4 +---
>   tests/qemu-iotests/303 | 4 ++--
>   3 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



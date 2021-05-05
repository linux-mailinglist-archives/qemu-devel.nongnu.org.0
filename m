Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848CE37386B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:14:03 +0200 (CEST)
Received: from localhost ([::1]:53048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEXa-0002WA-KN
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leEUb-0008Fy-M7
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leEUZ-0000Eq-PE
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620209455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pkb0yePtoLNoTcFK0O2FmTjEwQ00ayOQd84L1E6FB1Y=;
 b=H7I2M1DFkwwWvmfw2d7BlGQZsUJqj+qVQ/3AyF8Vd0RX6+4U+JuU3z3+c+/SqcMcTDadg7
 b4yXvVCQ1AKo5VWeh9E/D/KORhu05efdRolk53xu+Oe+F0NqAL0QB4n5lz8nuLTM1R2/FB
 3dvM2YQEgPNlTFLbvzVAtcWw7lw6YEY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-NoskljvaOIaGOwmDUXNHYw-1; Wed, 05 May 2021 06:10:53 -0400
X-MC-Unique: NoskljvaOIaGOwmDUXNHYw-1
Received: by mail-ej1-f70.google.com with SMTP id
 x21-20020a1709064bd5b029037c44cb861cso270494ejv.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 03:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pkb0yePtoLNoTcFK0O2FmTjEwQ00ayOQd84L1E6FB1Y=;
 b=QZDW7eD/nOE78AsmMlFmX/KMVhGKU+94tyqLE24mFh+dX3qSBkj4Q/7xD9ZE0XioDk
 Z5U3XbGb06fRdmRG8k7+MUvutG0+hq6V8A7u4Gk+pieMJsWOEWCc8rJRP9ZOEbLfS2Xd
 C+EvD2OfJUBM/S3jtAhGwvuwsbkbtZ49yNm36YphtSEdDZbYYm4N8GOAnFuIBHmCz39p
 5aMgektv0Fm7SDMaPMjjaIdeHymOhDShzic/G8QSdUeyNHAqWYTlgnUvNFWDv+lyp7QD
 /Pc5tQwFO8pvY8cgDuVpjA7dQ4oZ1nNE4VEOkHeJ84s5Btk5mmfFn84r6228Vb6g0F8h
 m0nQ==
X-Gm-Message-State: AOAM533TWh/UWw/8o2r/MMVPqF98Cm3i6un21UZP/8MoVWXOL6guOlxa
 sWXL8AM+or/yt6uNMxMDpUNEftpNjqDs6GViEeVMzQQsFQfjogV+2Z1M/PQ5Xm0m7DuvtCcQGCd
 hNabh2mHkhlNXB3A=
X-Received: by 2002:a05:6402:b55:: with SMTP id
 bx21mr31790309edb.281.1620209452541; 
 Wed, 05 May 2021 03:10:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0KFA2xio642Nxkqow4F7LGmKnt2eBHrzOYM4rPsxVv/EN5k63i8EjsZmGypvnj6c7/cco/w==
X-Received: by 2002:a05:6402:b55:: with SMTP id
 bx21mr31790268edb.281.1620209452213; 
 Wed, 05 May 2021 03:10:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s4sm2664821edq.96.2021.05.05.03.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 03:10:51 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] block: do not acquire AioContext in
 check_to_replace_node
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-7-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7841470b-abb7-d361-32d0-cdea6276e9b3@redhat.com>
Date: Wed, 5 May 2021 12:10:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419085541.22310-7-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/21 10:55, Emanuele Giuseppe Esposito wrote:
> + *
> + * Called with AioContext lock held.


... for @to_replace_bs.

>           aio_context_acquire(replace_aio_context);
> +        if (!check_to_replace_node(bs, to_replace_bs, replaces, errp)) {

A release is missing here.

Paolo

> +            return;
> +        }
>           replace_size = bdrv_getlength(to_replace_bs);



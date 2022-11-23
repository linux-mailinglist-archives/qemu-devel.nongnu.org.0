Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F6E63668E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 18:07:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxtAo-0001Da-QX; Wed, 23 Nov 2022 12:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oxtAR-00016u-8o
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:04:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oxtAP-000219-Jp
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669223047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sSJWa40nXYrVeHMJHVf2rfadgZ9X+O0pjVAkjiqc+cQ=;
 b=jPr6alPEyJ9pdPJ/NJACuqLFdyonGOt8YcjAoVUjvWmreCIUloY0CuRIjZBp06pZSARjKL
 u3LKlnOtlL2yIQF81X9sApNy2jKUaWrfR1zluS9usT3bFwJrEf3AZlKq/1lV0xjXIhlxaO
 eS2pigNvzyfhV2m5zWPxsJ5ZFSuU/hI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-558-ewAQvrsHMC6RsXr3y9sYig-1; Wed, 23 Nov 2022 12:04:06 -0500
X-MC-Unique: ewAQvrsHMC6RsXr3y9sYig-1
Received: by mail-ed1-f72.google.com with SMTP id
 v18-20020a056402349200b004622e273bbbso10726842edc.14
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 09:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sSJWa40nXYrVeHMJHVf2rfadgZ9X+O0pjVAkjiqc+cQ=;
 b=QnTqOUvYQ8rA32Tfw5Fa7IhrBsmi+inT7Iq1M1k/sOEmQknZ7ja8rQAtsyeSZaR3vc
 Gi9OYZWjbBMEDuyLzJwfLULKMnLO2tRKUbdYum87KJ8ow+j3e6SbgkpMWFSiYXb6atOy
 tHrNJRZYr5oYUnP3DRN31VX6nNfEaVm3wgO+lgQ+p5CZuJ5jX/UTGbp2ixt5wVFARYz/
 EYbw5EHSi2nJKxrbaNx/f1i9QlGNc2uvWBK9WIQPQGz2tnck4wgULuWci7vlG3UkIDRo
 +Y1a7rMh260Wgw7VgzuH24gUtat5eLE4PuFXWmlG+xwL0iTKnY5lcb6XSCSwLQiz+WqI
 5jAA==
X-Gm-Message-State: ANoB5pnrW7TgpUk6eQ+aXJvult7jB+woQBKS4X32NiilWhUeeODrzpe4
 pEUu4Y5M6gVMon7krhrr7oCY8WmVuabz5PYOdYd1w41RSvFcylZubPybb4f00CN8zRXhWd5jO18
 Q9+P/tXSIeqtHpaE=
X-Received: by 2002:a50:fd0d:0:b0:469:c73c:e29a with SMTP id
 i13-20020a50fd0d000000b00469c73ce29amr11558362eds.423.1669223044934; 
 Wed, 23 Nov 2022 09:04:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5otGHLhakERJihhVkJ5iOWnEaqZFQPYYTkH66X4N+Uot+pHQmd8cqKEYD7+yXVMg00wGc0Yg==
X-Received: by 2002:a50:fd0d:0:b0:469:c73c:e29a with SMTP id
 i13-20020a50fd0d000000b00469c73ce29amr11558317eds.423.1669223044595; 
 Wed, 23 Nov 2022 09:04:04 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 ss5-20020a170907038500b007ad86f86b4fsm7398835ejb.69.2022.11.23.09.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 09:04:03 -0800 (PST)
Message-ID: <e6b0dc87-8ff8-6388-748d-5eee25d374f2@redhat.com>
Date: Wed, 23 Nov 2022 18:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 00/15] Protect the block layer with a rwlock: part 3
To: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
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
 <4a16c6dd-7806-429a-f62d-afd13bebc52c@redhat.com>
 <Y34kBsj1NEV+kmJQ@redhat.com>
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y34kBsj1NEV+kmJQ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 11/23/22 14:45, Kevin Wolf wrote:
> I think this means that if we clean up everything, in the end we'll have
> coroutine_wrapper and coroutine_wrapper_bdrv (the fourth version not in
> the above list, but that Paolo mentioned we may want to have).

Yes, I agree.

> The only thing I'm unsure about is whether coroutine_wrapper_bdrv is
> descriptive enough as a name or whether it should be something more
> explicit like coroutine_wrapper_bdrv_graph_locked.

That's already long and becomes longer if you add "mixed", but perhaps 
co_wrapper_{mixed_,}{bdrv_graph_rdlock,} would be okay?

In other words:

generated_co_wrapper_simple -> co_wrapper
generated_co_wrapper        -> co_wrapper_mixed
generated_co_wrapper_bdrv   -> co_wrapper_mixed_bdrv_graph_rdlock

?

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3B4C2E10
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:17:54 +0100 (CET)
Received: from localhost ([::1]:52874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEwL-00062V-0R
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:17:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNErp-0001p0-Lr
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:13:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNErn-0008US-FN
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645711990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDph96NGkcKcK95Vzi25n3Smi97waIy8gCtSblNjA2g=;
 b=WN6vKsUgfNff7qxNZvDhzHCYH3+xvA6kwmjSSSEOJLbPsMJ+yTqmKgJBudRN1if6Z+4CJ5
 COrda/sAwkAeGx7EdXYEolq/FcUPTlwIAer4oWXq8f1W5Xa2RB9v91Evd8539jtpDp8Nzh
 5hukiZKf0QwpGPk8Jj+MUiIgxwjpWog=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-hL2suF0gMbyrrY8tzjwcoA-1; Thu, 24 Feb 2022 09:13:09 -0500
X-MC-Unique: hL2suF0gMbyrrY8tzjwcoA-1
Received: by mail-ed1-f70.google.com with SMTP id
 h17-20020a05640250d100b004133863d836so813156edb.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 06:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bDph96NGkcKcK95Vzi25n3Smi97waIy8gCtSblNjA2g=;
 b=DcEA0Fr35qc/FsGgchTOOUax28WkNTUxz0y2zHUm7/UQwGH06mXAFwKXFqmXgySbzX
 E43vxKEOw6X3sdslspS3QvGdyRNV1qhiqbNWVJvutBx+awxS7YZQ2wm8Qod2SSIiVhHn
 xVyc3QyJASs5ce8TAasvghzNKD8CwpITryvf/BWMyWUHdpA4fqx8yEzgv6wnRPARZgPU
 chLrIRWrXIjGhlIWg7gxXmYUTSjvdjkJ8J+tdQ+svB7sdRaZCQ7nhGvigceTZ/WrUzg3
 elLbcqrAq9lZn2xQsnfUwbn3bGiaHIlieu9G3vMMtYLFXIZ0tg8GQbVrWyr9hrlDyHhY
 3DFw==
X-Gm-Message-State: AOAM532IFfwCHpqP/fAYpH6EcwY1GyBAwEc/ShLEBTAMBJoDKDJHwtaN
 i7LD5XcILzdUM2mut65ZMxDJ6Mp72/POhdMOls00nbaEVBYZug5z6vRFtw0cPY9MQ/WY2uw9NSR
 1UWRld47t+tYaLzI=
X-Received: by 2002:aa7:d8cb:0:b0:406:3135:51c7 with SMTP id
 k11-20020aa7d8cb000000b00406313551c7mr2425894eds.233.1645711988056; 
 Thu, 24 Feb 2022 06:13:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytibFEWcRvFny1vxdRS5GKKq/XOnPiKqYXGzrn9tnLgUTsaIrk9S3pohDbA8JoOFmbIKOQ2w==
X-Received: by 2002:aa7:d8cb:0:b0:406:3135:51c7 with SMTP id
 k11-20020aa7d8cb000000b00406313551c7mr2425877eds.233.1645711987842; 
 Thu, 24 Feb 2022 06:13:07 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id m7sm1422839ejq.10.2022.02.24.06.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 06:13:07 -0800 (PST)
Message-ID: <3f45bd0b-2c31-92ba-c840-014b833fb495@redhat.com>
Date: Thu, 24 Feb 2022 15:13:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/2] block/curl: check error return from
 curl_easy_setopt()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220222152341.850419-1-peter.maydell@linaro.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220222152341.850419-1-peter.maydell@linaro.org>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.22 16:23, Peter Maydell wrote:
> Coverity points out that we aren't checking the return value
> from curl_easy_setopt() for any of the calls to it we make
> in block/curl.c.
>
> Tested with 'make check' and with some basic smoke test command lines
> suggested by Dan:
>
>   qemu-img info https://cloud.debian.org/images/cloud/buster/daily/latest/debian-10-nocloud-amd64-daily.qcow2
>   qemu-img info --image-opts driver=qcow2,file.driver=https,file.url=https://cloud.debian.org/images/cloud/buster/daily/latest/debian-10-nocloud-amd64-daily.qcow2
>
> Changes v1->v2:
>   * new patch 1 which fixes a missing "set the error string" for
>     when curl_init_state() returns failure, since we're about to
>     add more cases when that function can fail
>   * set the error string in the failure path for the direct setopt
>     calls in curl_open()
>   * fix the failure path in curl_setup_preadv() by putting
>     the curl_easy_setopt() call in the same if() condition
>     as the existing curl_multi_add_handle()

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna



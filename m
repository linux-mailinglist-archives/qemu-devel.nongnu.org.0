Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C2C4DC504
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 12:47:37 +0100 (CET)
Received: from localhost ([::1]:39872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUobQ-0006Tk-70
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 07:47:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUoT8-0003qc-Pk
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:39:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUoT5-0002Ks-Hf
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647517138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4To3dIQD74NY/0YQwlRNgzr87S5+jctL+/La1HuB4A=;
 b=fU77N0X2eoMWn35tMQ1pdBb8zx8eBvQpr3QqrQOWLGWS8MJdY/bH3bNCKkKQ0du+dVt/H+
 6IY1YT0oVtj5rfGZfGPw2khrPhLdAtn+y3bLC2HQexBiWfq5P9OcfMFYbdoBLiEk3AKSXn
 u68H8qeBd7BbVOlsAr5/ZhaPjEYDiUs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-7tPk-yucO--yFKKULmA1Bg-1; Thu, 17 Mar 2022 07:38:57 -0400
X-MC-Unique: 7tPk-yucO--yFKKULmA1Bg-1
Received: by mail-ed1-f72.google.com with SMTP id
 x1-20020a50f181000000b00418f6d4bccbso1239090edl.12
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W4To3dIQD74NY/0YQwlRNgzr87S5+jctL+/La1HuB4A=;
 b=ryk3fSYLMMBMGWlEDHTGqlLITOifbIGchl8eS+7XGrRXWb0bCudOB2E36rXU1hzCV3
 3oZvXAkToLKkQ0lHhjzN2jl9i3XoE4uxtplCfnL8Ev9AOuLiWdza68JkNi96YLuDvY0P
 +s6OIXGE/olvCSbPTHvGRaE43VubIba4gnXDkvGbGrxKiLEYAPAdEINLiYwKP3h8/k1I
 Fw3BRtPQFEd6CmF5ovZU9NjYe27cxNzb29H8hEeM8CLZ/ikk7ecNvkyLOJ5VplkvY24c
 MVKKjdmhuCaijw+xpn+R3DvCa/W3QRsXEQr2LFrFgzied+Vi43Pvm1+iKdwAcpJCjduY
 00eA==
X-Gm-Message-State: AOAM533+5+SF7/ZZl7lNuWQj0VVAmv4V0iv5rGr9H2n1kHewKu2qH9L8
 qX+4H/yaAovx4X5divfy87Bt66hcMcERC4/c11JBhJ256OVHbE7qvFT/DdRqpOlsyaxi5zD6Ih6
 LeUQsHDE0SPhiu90=
X-Received: by 2002:a50:da8b:0:b0:415:a122:d7ad with SMTP id
 q11-20020a50da8b000000b00415a122d7admr3932412edj.123.1647517136262; 
 Thu, 17 Mar 2022 04:38:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOIZwX2mI83vXEoxofMfeyExa3DEG+npzNVyq/sTN75kVs+TRLaBrf+m90DMObGvMnE0WJag==
X-Received: by 2002:a50:da8b:0:b0:415:a122:d7ad with SMTP id
 q11-20020a50da8b000000b00415a122d7admr3932400edj.123.1647517136088; 
 Thu, 17 Mar 2022 04:38:56 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a1709062a0700b006bc28a6b8f1sm2238767eje.222.2022.03.17.04.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:38:55 -0700 (PDT)
Message-ID: <b22155ed-167f-9788-7adb-4de25061ce2d@redhat.com>
Date: Thu, 17 Mar 2022 12:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/14] iotests: replace unchecked calls to qemu_img_pipe()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-8-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-8-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 09.03.22 04:54, John Snow wrote:
> qemu_img_pipe() discards the return code from qemu-img in favor of
> returning just its output. Some tests using this function don't save,
> log, or check the output either, though, which is unsafe.
>
> Replace all of these calls with a checked version.
>
> Tests affected are 194, 202, 203, 234, 262, and 303.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/194 | 4 ++--
>   tests/qemu-iotests/202 | 4 ++--
>   tests/qemu-iotests/203 | 4 ++--
>   tests/qemu-iotests/234 | 4 ++--
>   tests/qemu-iotests/262 | 2 +-
>   tests/qemu-iotests/303 | 2 +-
>   6 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



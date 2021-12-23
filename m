Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1347E567
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 16:22:40 +0100 (CET)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0PvT-0005t4-5O
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 10:22:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0PtQ-00049A-C6
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 10:20:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0PtJ-0005ZJ-Ia
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 10:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640272813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oePvyCjfiPluXvKJHkFTBpQziB6Ur/we0SCYw3saUlU=;
 b=NO6M9Fdt4IEdukKD9iGzs3JdwtZqzpMjc8tMbpt2/Qn0oY1y2QeAwfQVKc7svt70DI6LvX
 ihvr1X9x+va/v5olwQwR28xLyA8liQdrFXaLMeojsxPPyJ2Biy/23MNjLPkFEq1dfnj+hy
 quWslIDAba7JcezIPT8mjHMkeCoeORY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-jwvcrBUyMOCPyo6DoKASEA-1; Thu, 23 Dec 2021 10:20:12 -0500
X-MC-Unique: jwvcrBUyMOCPyo6DoKASEA-1
Received: by mail-wm1-f71.google.com with SMTP id
 b75-20020a1c804e000000b0034569bde713so4803976wmd.9
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 07:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oePvyCjfiPluXvKJHkFTBpQziB6Ur/we0SCYw3saUlU=;
 b=iUBTZtd6BkSjPXdSSCmAXvIRmlzFy4EeA6mALx0vmJIddRpuKano8oRr2YiaN1Ie9Z
 dHO0h+yty/41osWoJWK2oi1jhYCaCxvj7iu9Nxw1oAx9dQbTNt1ub02bKWd8L8ZgTHJ+
 wc48ycUJgsx36A28oYd4KaUEacph6cA37lJHmIbLxJ6d41/GOBdPk0wlfMFnH6ax/ai4
 B927iKpOFSiUn1PYi2G1vfAWg980XnigG8Bs3htsENrPANUbwJ1DfMM1ulWfcLHl2hho
 OQ1Rno4FyXBfj1XCnDTnsB1ClGzBYkzqIRkhvof0/WkwCwDs9RH5NlIJMHr9p2Q7PUYv
 Gu8g==
X-Gm-Message-State: AOAM530V1XheYfHOpCP/tzX60k1+2zCnYAFaarbfL0ggKzWIBC/Dmua+
 +k5f5DjzssJpK5+VMEOloqQ/v2jrL1kNTukxQQhUol2Nwz6JAKhzgw3omb4CxzifssYoRljFKOS
 VqBgnK6l4t8QvBH8=
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr2131226wrz.545.1640272811146; 
 Thu, 23 Dec 2021 07:20:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJym41C4kcr94pNjSEaCo/9kxaYh424V57Q2UzTCc7eVQkZZLNyn9uggYrjsXoEr5P0tg333HA==
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr2131219wrz.545.1640272810929; 
 Thu, 23 Dec 2021 07:20:10 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id t12sm5772768wrs.72.2021.12.23.07.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 07:20:10 -0800 (PST)
Message-ID: <3fc5f1c1-74d1-4e2a-5552-4296304bf5f3@redhat.com>
Date: Thu, 23 Dec 2021 16:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0] tests/qemu-iotests: Fix 051 for binaries without
 'lsi53c895a'
To: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org
References: <20211206143404.247032-1-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211206143404.247032-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.12.21 15:34, Thomas Huth wrote:
> The lsi53c895a SCSI adaptor might not be enabled in each and every
> x86 QEMU binary, e.g. it's disabled in the RHEL/CentOS build.
> Thus let's add a check to the 051 test so that it does not fail if
> this device is not available.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/051 | 4 ++++
>   1 file changed, 4 insertions(+)

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna



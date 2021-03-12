Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59A23387D4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:46:11 +0100 (CET)
Received: from localhost ([::1]:42490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdQw-0007hg-Rz
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:46:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdPA-0007BW-0i
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:44:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdP3-0006k8-9d
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:44:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615538651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Na8IP0xLw6pWXL+TFzZBdPNmLAkSHfRY/Tlzxm8NY1w=;
 b=P0NydS92Yp7YvwOdJh1ryViMb+0eTg7Q4PZYG4Gh1pvIxtRTkyMisQ+jtJDRt8kqwO5Ge/
 pwTsvA//dif4NuwjX7nDETq3/WuC2bzTWQ7oH4WPxZejkAAG1H3jvRRCPWCtcfJc3Az5No
 ORIU8C9g9ZoT/ExjVsnDQ8FLzo6XU48=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-Daa8apiqNICPyGfFzL_xyg-1; Fri, 12 Mar 2021 03:44:09 -0500
X-MC-Unique: Daa8apiqNICPyGfFzL_xyg-1
Received: by mail-wm1-f71.google.com with SMTP id j8so1836425wmq.6
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 00:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Na8IP0xLw6pWXL+TFzZBdPNmLAkSHfRY/Tlzxm8NY1w=;
 b=O/2XEBNrdaQAT83bJFcgTD8okQwGM+tSMVrevf40rMjvCIoaWjYQHv5+MPUflRbpZJ
 q4Y4hAv5MxFLGggxoMtVbvc6KMCwN4YNoB25sTGKFRcmNE1KWvMeFidffT2JGg2SsvmI
 /75xhQ5PYg8vUV20bSLHJB7RtiVmeSvm2KMk2gwWzvk+qjlBf/j8CCMZX2cvq8Xa7G7e
 tTbtfvz576X2MxjqUVl018xiiQLXhiD2EZ3ghtXTHUvhDyICXemTu8lisYJIAsM2VzW4
 H9lzTCY6j5XMdqAseAoFIi0I3OYZ6yi0lmd1Rvacb4l6CQQ4PRK029yvRNrJi1dJWWeu
 ng9Q==
X-Gm-Message-State: AOAM530UER6gUwS11Ex+8iAk0cUEmE9tjuaYyBoofPH0JKy0unFRbTnk
 TU50GAyH5BuIYV0EcH/zDAO1sFbI7ABQFZ7ffavnWjL+U6PfhKBtOCjvIoUG6c23s8cqwaVmHrz
 i+mWy2Gy9ebuhIrGjJT2obpCokh7+s8pzo8XA9dHZQ9OKfMHmruTvh2p5v708of4qhV4=
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr12764675wrq.54.1615538648317; 
 Fri, 12 Mar 2021 00:44:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz20zWktxB5SL2rNMZhkAiAtkZdJBYPlCOSipOi2ppatMAg3GqzyRI8EMUnbGAtU9FVROJQSA==
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr12764643wrq.54.1615538647993; 
 Fri, 12 Mar 2021 00:44:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id s16sm6985139wru.91.2021.03.12.00.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 00:44:07 -0800 (PST)
Subject: Re: [PULL 03/16] net: validate that ids are well formed
To: Jason Wang <jasowang@redhat.com>, peter.maydell@linaro.org
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
 <1615529786-30763-4-git-send-email-jasowang@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2e3d2321-be67-ab5d-9511-64de1fcbd196@redhat.com>
Date: Fri, 12 Mar 2021 09:44:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1615529786-30763-4-git-send-email-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 07:16, Jason Wang wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> When a network or network device is created from the command line or HMP,
> QemuOpts ensures that the id passes the id_wellformed check.  However,
> QMP skips this:
> 
>     $ qemu-system-x86_64 -qmp stdio -S -nic user,id=123/456
>     qemu-system-x86_64: -nic user,id=123/456: Parameter id expects an identifier
>     Identifiers consist of letters, digits, -, ., _, starting with a letter.
> 
>     $ qemu-system-x86_64 -qmp stdio -S
>     {"execute":"qmp_capabilities"}
>     {"return": {}}
>     {"execute":"netdev_add", "arguments": {"type": "user", "id": "123/456"}}
>     {"return": {}}
> 
> After:
> 
>     $ qemu-system-x86_64 -qmp stdio -S
>     {"execute":"qmp_capabilities"}
>     {"return": {}}
>     {"execute":"netdev_add", "arguments": {"type": "user", "id": "123/456"}}
>     {"error": {"class": "GenericError", "desc": "Parameter "id" expects an identifier"}}
> 
> Validity checks should be performed always at the bottom of the call chain,
> because QMP skips all the steps above.  Do this for the network subsystem.
> 
> Cc: Jason Wang <jasowang@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   net/net.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/net/net.c b/net/net.c
> index 9c784da..d36729f 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -44,6 +44,7 @@
>   #include "qemu/cutils.h"
>   #include "qemu/config-file.h"
>   #include "qemu/ctype.h"
> +#include "qemu/id.h"
>   #include "qemu/iov.h"
>   #include "qemu/qemu-print.h"
>   #include "qemu/main-loop.h"
> @@ -1011,6 +1012,17 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
>           }
>       }
>   
> +    /*
> +     * The id for -net has already been checked by QemuOpts and
> +     * could be automatically generated, in which case it is not
> +     * well-formed by design.  HMP and QMP only call us with
> +     * is_netdev == true.
> +     */
> +    if (is_netdev && !id_wellformed(netdev->id)) {
> +        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id", "an identifier");
> +        return -1;
> +    }
> +
>       nc = qemu_find_netdev(netdev->id);
>       if (nc) {
>           error_setg(errp, "Duplicate ID '%s'", netdev->id);
> 

Sorry, I sent v2 yesterday.  This patch passed the tests at the time it 
was submitted, but now fails (because it does not work with -nic).

Paolo



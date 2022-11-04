Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D797619F51
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:55:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0tz-000429-Jy; Fri, 04 Nov 2022 13:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1or0ty-00041m-LN
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:54:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1or0tx-0006DI-4M
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667584484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kndU397AV1YGcxJnliqmtu3OdBbkYSDS/N8amfYed4U=;
 b=T3JEyrflQNCseXlVZQpQvnmCd4x9WG3Jdr4OXtJEi01KDsCkSD8VbGWYjje26zpSNJk6Le
 qsYgTaaZ4f7QPwXMcG+40JYwFIJmIDiUe4qJilIXtFHqiflvhskaWHYWMDZgmOqoXyCWaL
 GRR2hwpgYGPUMWTYyTbJ8lmUUOhIvVI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-CMyg3Wi5MlGidEoOGLS66w-1; Fri, 04 Nov 2022 13:54:43 -0400
X-MC-Unique: CMyg3Wi5MlGidEoOGLS66w-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso2638740wmb.4
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kndU397AV1YGcxJnliqmtu3OdBbkYSDS/N8amfYed4U=;
 b=qAK8V1alvFlT9LNeBr3YdXoLuQlL734bh2OgUOi7b7sa1a8gK2YevXyb/E6hWXYtwX
 IJmsd3Wf7ClPOV2mVvS6R4WrN9XUVTVLMf4hKgcTpyz+QrqDHnqaWe9OHBQibndD0znP
 kgIilCnVZPRe+o7dg4Ai5LcyasIX7sxQ6TMxWCxjWv8wFcRxp4SZUqz21xhh0yyUol6I
 SMonUr+JoRozAjCNXcORKqbDFv4KimR7v+n6F03RA5PBRnfP/W4O5sNWEaO4Dsik/RS8
 v/XskogUeU3LRXqrbvpxQ3YyuLK7zIciKXtzGRe4K7cfKTpSWK2TwfaJ8RL0oum2E3Z7
 RQEA==
X-Gm-Message-State: ACrzQf388WbMxqXulh8ha3yQ0iXVc0qjR0EfdWfprLVBZVilpxrwvg9k
 9t21C+LTpIy0+zIvpBQLsvZe4yadfZdR4OVRVahvtE3lsknIxr23fBX+O/tc10PN5d7PKu5aoL0
 xCqYc/pHeb4I8LdQ=
X-Received: by 2002:a05:600c:4e8c:b0:3c6:ea09:9cf0 with SMTP id
 f12-20020a05600c4e8c00b003c6ea099cf0mr24573444wmq.43.1667584482392; 
 Fri, 04 Nov 2022 10:54:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4P4gFGy62g7y2MC/Yt6kEojubzkPCS79r+Lm+n4k4iYD+yREvZtzrcjRMDpq6kT5FQ7Rhvmw==
X-Received: by 2002:a05:600c:4e8c:b0:3c6:ea09:9cf0 with SMTP id
 f12-20020a05600c4e8c00b003c6ea099cf0mr24573426wmq.43.1667584482172; 
 Fri, 04 Nov 2022 10:54:42 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-201.web.vodafone.de.
 [109.43.177.201]) by smtp.gmail.com with ESMTPSA id
 k39-20020a05600c1ca700b003b47b913901sm2017923wms.1.2022.11.04.10.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 10:54:41 -0700 (PDT)
Message-ID: <70570de9-3aa3-f036-d11e-42750269a1cf@redhat.com>
Date: Fri, 4 Nov 2022 18:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/e1000e-test: Use e1000_regs.h
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221103095416.110162-1-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221103095416.110162-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/11/2022 10.54, Akihiko Odaki wrote:
> The register definitions in tests/qtest/e1000e-test.c had names
> different from hw/net/e1000_regs.h, which made it hard to understand
> what test codes corresponds to the implementation. Use
> hw/net/e1000_regs.h from tests/qtest/libqos/e1000e.c to remove
> these duplications.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/e1000e-test.c | 66 ++++++---------------------------------
>   1 file changed, 10 insertions(+), 56 deletions(-)
> 
> diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
> index c98779c7c0..9e7cb1eb2d 100644
> --- a/tests/qtest/e1000e-test.c
> +++ b/tests/qtest/e1000e-test.c
> @@ -33,34 +33,11 @@
>   #include "qemu/bitops.h"
>   #include "libqos/malloc.h"

  Hi!

Thank you for your patches! Just a very small nit: That "libqos/malloc.h" 
was still old context, the file is called "libqos/libqos-malloc.h" now - 
please make sure to send patches based on the latest git master branch. 
Anyway, it was trivial to fix up, so I've queued your patch now (together 
with your three other patches) to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas



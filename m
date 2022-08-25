Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CCC5A0FB7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 13:58:46 +0200 (CEST)
Received: from localhost ([::1]:33114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBVV-0002fh-Hj
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 07:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBSb-0007gP-KI
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBSY-0000aT-HH
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661428540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omOMVJ5WkQk8+7DVgUFMHePd8n5nj+c9dElyI/AN3ho=;
 b=GCLHvQO7UjXpgWNl2rTT4dzEqiT07PCDIS65xa6h1P4nr5nVdrCk7LZquYQeeUpduxTgai
 ffHshkJ5v5Hg0lfvbkQmM4pZEHNHMLRE9ZfEoLVmtzJys0uMRuMhj0d3F2hyfda+pZYywT
 l3BgsM83b+0YEsIBHwxQAVAU0H1FZzY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-GMiiQ96BOiqq5Qykd_ovkA-1; Thu, 25 Aug 2022 07:55:39 -0400
X-MC-Unique: GMiiQ96BOiqq5Qykd_ovkA-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay27-20020a05600c1e1b00b003a5bff0df8dso2692644wmb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 04:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=omOMVJ5WkQk8+7DVgUFMHePd8n5nj+c9dElyI/AN3ho=;
 b=Rt3FJAA+i2se51wrJ7eP4TMZgNOX+3PZdXg8IHlij0KS+hhk1qIm3Km2ClsvCBs5Y5
 nDXsvdFqRF4AuxFrnzQ3WjwJPx6IqVu3gYwOOT72FjkqSWM9zh4T3ln5fIpF2r+cOgOJ
 NSlmyj6M5vjWmGWHjq26kXdQF5X7QFqYU5nh7fnpMpcu4h8Tji8EqveNxLmeiP3lCvem
 EJY9shkB63GD6lJxIqhf008CYcXnUwTLvwcN6UC+yqjFmMhs9sRe74B5+FMDnmixiLeo
 IcIrE/lnXENY/lpJhgvVZCT6BMyfr0UMTc7ZbkHXmlsvh0MLZmZAJiuNQr0OvsdYOgC7
 QDdA==
X-Gm-Message-State: ACgBeo0Ml0vmePzRdL6C3dnf493fMiiYhEOoJK2z1B+tWHmL9uCbPW5m
 i2jwZLnmJlFfQ8e5VNwkj68gnZmjhykbO3Rk5ftKmth4Ex9Jfh29k/wQLMPTvmedU6mkWOL/LoO
 vj5V6XSqaPvGvjsk=
X-Received: by 2002:a05:6000:1043:b0:225:504a:1eb4 with SMTP id
 c3-20020a056000104300b00225504a1eb4mr2010326wrx.68.1661428538462; 
 Thu, 25 Aug 2022 04:55:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4n3iJ/HjVSejevBLroaLTa1b16k1FWwU476JpQzg8iKG6Y4b0i52m25wfEanQ9ctqiHWPg9Q==
X-Received: by 2002:a05:6000:1043:b0:225:504a:1eb4 with SMTP id
 c3-20020a056000104300b00225504a1eb4mr2010316wrx.68.1661428538256; 
 Thu, 25 Aug 2022 04:55:38 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c4f4d00b003a3561d4f3fsm5411391wmq.43.2022.08.25.04.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 04:55:37 -0700 (PDT)
Message-ID: <37de62bd-9a22-01d8-3757-1493dfe0458f@redhat.com>
Date: Thu, 25 Aug 2022 13:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 24/51] tests/qtest: libqos: Drop inclusion of <sys/wait.h>
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-25-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-25-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2022 11.40, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> There is no <sys/wait.h> in the Windows build environment. Actually
> this is not needed in the non-win32 builds too. Drop it.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/libqos/libqos.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/tests/qtest/libqos/libqos.c b/tests/qtest/libqos/libqos.c
> index 85c7641add..5ffda080ec 100644
> --- a/tests/qtest/libqos/libqos.c
> +++ b/tests/qtest/libqos/libqos.c
> @@ -1,6 +1,4 @@
>   #include "qemu/osdep.h"
> -#include <sys/wait.h>

Works for me:

Tested-by: Thomas Huth <thuth@redhat.com>



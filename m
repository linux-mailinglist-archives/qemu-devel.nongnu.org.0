Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7084E3AE7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:43:45 +0100 (CET)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWa7E-0003RW-F8
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:43:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWa2d-0005sG-Da
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWa2a-0004Su-IV
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647938335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCEwsAYZda/6MLb1WPrRLP/ITE2RIrn0ttfNNOshVNU=;
 b=dYqE0k/MB+jtboPpuUOUjLfgaQIoB8h2SrhwR8TWkV4idPetpXGngChjfHoHzX+NE2mgO9
 6qa2InWxD6GbY0bfr+0kFZxiN8Ne1QJVsq6Ygu4hVEAmOpK6y15opSA0w4N4qMMRauxBzY
 be1oMcYZ26a/V/6p2/ShPIqauYSeFuU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-TiTwX0b4MyO84dCfEEJo5A-1; Tue, 22 Mar 2022 04:38:54 -0400
X-MC-Unique: TiTwX0b4MyO84dCfEEJo5A-1
Received: by mail-wm1-f69.google.com with SMTP id
 9-20020a05600c240900b0038c99b98f6fso545386wmp.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 01:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kCEwsAYZda/6MLb1WPrRLP/ITE2RIrn0ttfNNOshVNU=;
 b=KDQ/Xr5fNg2Z1YafkPY/TagHXflgyzx/dTMdUgojd7TvalO74ZWWH9+fPSFCcacLtv
 tIKjmvzhbZ7RzkHhUF84nzvtCEAD7Kz5HlnXSm8lsZoq7or90YeuTuoNc+VaeDvSOaV5
 t9jVEG6fSoLixQgzLJBq6YUNmztTOzMG7mct4duGsHEMLThv1qhp0hSXBM7LvoytPE3b
 bvfB5KHR3vUzZcEbG60n0z9spgoNpLRCbQJbYiPAJkZPdZrv+NUQJNzVe04yBF6azrsu
 QotmnrSF2lCz1wBY61NM89yBLOQH2a3SqRFmf3DOarMZxxjByYYrMWZLS93U869Oq50J
 IHDg==
X-Gm-Message-State: AOAM532W0JlYaNBRk3fgABDSUZx/uq6ZOseifWGIGShWINBkqS6IIPhm
 5JhIJiYIPd5tW/Q0FyqPMwisfHAxuQQB5rba+240AfNZFktwdpiYft+CoMe5aAkx+nTEcYQWAJZ
 lBkFYTFbAzrHZVGM=
X-Received: by 2002:a05:600c:4f89:b0:38c:bd13:e03f with SMTP id
 n9-20020a05600c4f8900b0038cbd13e03fmr546380wmq.117.1647938333303; 
 Tue, 22 Mar 2022 01:38:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzvGfyLh7uSblgb1iZGkKeF941IALzKmz+nQUllNqtIeM//WsFVJ5oaybNiWXFQqdt+DRA9g==
X-Received: by 2002:a05:600c:4f89:b0:38c:bd13:e03f with SMTP id
 n9-20020a05600c4f8900b0038cbd13e03fmr546359wmq.117.1647938333039; 
 Tue, 22 Mar 2022 01:38:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:de00:549e:e4e4:98df:ff72?
 (p200300cbc708de00549ee4e498dfff72.dip0.t-ipconnect.de.
 [2003:cb:c708:de00:549e:e4e4:98df:ff72])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm1443631wmb.48.2022.03.22.01.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:38:52 -0700 (PDT)
Message-ID: <b07ed7dc-a3bd-f7f8-58d1-3ccee87cac83@redhat.com>
Date: Tue, 22 Mar 2022 09:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 09/11] target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu
 CPU model
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-10-dmiller423@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220322000441.26495-10-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.22 01:04, David Miller wrote:
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/gen-features.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 22846121c4..499a3b10a8 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -740,7 +740,9 @@ static uint16_t qemu_V6_2[] = {
>  
>  static uint16_t qemu_LATEST[] = {
>      S390_FEAT_MISC_INSTRUCTION_EXT3,
> +    S390_FEAT_VECTOR_ENH2,
>  };
> +
>  /* add all new definitions before this point */
>  static uint16_t qemu_MAX[] = {
>      /* generates a dependency warning, leave it out for now */

As discussed, this will need adjustment once we can merge this for 7.2,
after 7.1 was released.

You could base your patches on the new 7.1 compat machines:

https://lkml.kernel.org/r/20220316145521.1224083-1-cohuck@redhat.com

-- 
Thanks,

David / dhildenb



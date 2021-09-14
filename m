Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5440B674
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 20:01:32 +0200 (CEST)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQCkM-000526-5Q
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 14:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQCif-0004F9-O9
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:59:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQCic-0004GI-5N
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631642380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/6evVj9kpNilv4Tp2CR/lMFXbkz3kRCEJi8xYL71qw=;
 b=N2yQRO1we6VEXu9CjlAsnut2xLtpf0Q5H1RT0yfZ9f6H9Uz38gd+YiIMKQ9MNUByfBTW6q
 XFTJDvivTTNF1sg22J4nLNn0ukkQiLygdaREDbowQUSRxpF/64QBH/oPtHsabYgVDjvVgJ
 mYxhrbsWPX4ByDobX4Kq52XpBoHK2ZE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-NwdxsQ7YMnKWa0Z8zO7QGg-1; Tue, 14 Sep 2021 13:59:39 -0400
X-MC-Unique: NwdxsQ7YMnKWa0Z8zO7QGg-1
Received: by mail-wr1-f72.google.com with SMTP id
 h5-20020a5d6885000000b0015e21e37523so825982wru.10
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=O/6evVj9kpNilv4Tp2CR/lMFXbkz3kRCEJi8xYL71qw=;
 b=gQrPd9lUHNvFNqQA6JYoNrTLyteU+/VLV3ue5X2CIgJ8SOJ2a7uWlvYVYHt/Wxll1c
 IyxuCcwqE9AxOmCtuX+N1BxBHW3FGMHuy6jgl97ICewkzQq2Dn1iivhCrE6HLcsjM0ow
 aaiEZA+sZ+KoRj9vQkg7EBh1glz4ozsK6WVgWyBZNjCg/0matKPPqFXtLJEzivZuINsW
 1JpOChTkUINfX3IXaqlLtBqxCn4WEXPczRZL0eEh7zbinXaGwoayjsXQQiNOLtlz8KWX
 z65b2aAVNDmI+CgDW6KmbuGDau6DI57IFKUUii+oDbrDJSGjMkx4CvdULcKQldGO4LNj
 Mp1g==
X-Gm-Message-State: AOAM531FpuLfVMkhcD8Qt+piuAiibIlHlTTpvogvyb2txGAHD50N+YJr
 nUi0HB8BTHh4nEnYapZeVJEzy6l062A4Fh4OGawbUYhRHP0YaZILuWs1D6S8vw9ytdmlVUgBiow
 5L6sFf9y37eI3R00fRJA/9IAEOF6OWvwK9LUL3CBk3Xi/Cz76dAx+0tRbwUd2vXc=
X-Received: by 2002:adf:fe82:: with SMTP id l2mr498141wrr.268.1631642378278;
 Tue, 14 Sep 2021 10:59:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVs1KcS8ZwYp01fPiYWUhOj+nspp2vi3EQuueTqBvUDmQ7APjDhyQbcx1O2k8Y+PVHINm50Q==
X-Received: by 2002:adf:fe82:: with SMTP id l2mr498128wrr.268.1631642378050;
 Tue, 14 Sep 2021 10:59:38 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6041.dip0.t-ipconnect.de. [91.12.96.65])
 by smtp.gmail.com with ESMTPSA id
 o7sm1629963wmq.36.2021.09.14.10.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:59:37 -0700 (PDT)
Subject: Re: [PATCH v4 08/16] tcg/s390x: Implement minimal vector operations
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-9-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <96259732-658d-9cf6-bfb6-db13ed931233@redhat.com>
Date: Tue, 14 Sep 2021 19:59:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626050307.2408505-9-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.06.21 07:02, Richard Henderson wrote:
> Implementing add, sub, and, or, xor as the minimal set.
> This allows us to actually enable vectors in query_s390_facilities.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 154 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 150 insertions(+), 4 deletions(-)


[...]

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb



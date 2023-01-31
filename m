Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C9A682560
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 08:08:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMkjG-0007yV-0L; Tue, 31 Jan 2023 02:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMkjD-0007yK-Cp
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 02:06:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMkjB-00013t-Ll
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 02:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675148807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DDJJH29VY10aJLcI22VIq4XEL2dcUmbTBpU/JYi2co=;
 b=LVHj5y2bbYZ7r+DoLDu9JACq1v3QR79mp6ytY7WkGdiiQaLUm6943x0rSJjrYFp8rBMXDb
 xRdXBW8Zb9WmPFIYIgjO2epvnsLAOPY4klqMkH5pWBdkhbe3sf3hIJtJcsZaUXSW+07Quw
 fKr033/nGDyfebyV6JEtMyMY1GySxeI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-zsfMPgdINteU7H7jrLm3kg-1; Tue, 31 Jan 2023 02:06:45 -0500
X-MC-Unique: zsfMPgdINteU7H7jrLm3kg-1
Received: by mail-qv1-f70.google.com with SMTP id
 i17-20020a0cfcd1000000b005377f5ce3baso7655210qvq.10
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 23:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0DDJJH29VY10aJLcI22VIq4XEL2dcUmbTBpU/JYi2co=;
 b=6uP0T121aIYeJxw9yPeWfwe+G9wus+PsmQpD8iW7FPcu5mZBkxlXnKmyX6L5HGY6xw
 o+e2UU3SEl1phS8rtDsl6a1L12iLb8S7zW8/JwgZI1eXVq9+2HuN2nWB2shbniW98ero
 mo8GbVe920UD9R91MQd8Vzwk5LFPrjp8gJRdaAX4jOZGqbZra77Yk3H15Hisioi0u4g0
 VeJ+B/qqaba64ePcJl46zqhjYbs1yhmur4xhF2c6Edk/ostzs5rNYJqO0pkjowNWTDNB
 vuyc7HZ7x2OqU8jAIAxQXpMPuGexQWabaN2+6omQSwUlTCnlEthDcv9XepWPvzW2PFWw
 VBiQ==
X-Gm-Message-State: AO0yUKVEbpgU/evsJS+y46owo9hexmZxILuUZ/3+thw/MbIcjlS9ZnyS
 PEzbv2TNKYjlP2bnP//HZZgqOm2zBOkkrZAFqy0FQskOyanWkQs+vxvK0XKzN3qz5S0EKEb+5Va
 N8JUMGYmFTepo5ho=
X-Received: by 2002:a05:622a:1b9f:b0:3b7:fb43:e745 with SMTP id
 bp31-20020a05622a1b9f00b003b7fb43e745mr40246458qtb.39.1675148804893; 
 Mon, 30 Jan 2023 23:06:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8gHDVnpWDVBPSiy382B8hoyliu48A8QqKBdBVXi6l5YL/MXX7KzZBvD2uvrr3WUCf3fsrcVw==
X-Received: by 2002:a05:622a:1b9f:b0:3b7:fb43:e745 with SMTP id
 bp31-20020a05622a1b9f00b003b7fb43e745mr40246444qtb.39.1675148804669; 
 Mon, 30 Jan 2023 23:06:44 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 eb10-20020a05620a480a00b007112aa42c4fsm9295024qkb.135.2023.01.30.23.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 23:06:43 -0800 (PST)
Message-ID: <ee777547-b38c-38b3-6dec-491fef7904bf@redhat.com>
Date: Tue, 31 Jan 2023 08:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] meson: Add missing libdw knobs
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20230130225204.1763364-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230130225204.1763364-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 30/01/2023 23.52, Ilya Leoshkevich wrote:
> Add the missing meson infrastructure bits for the new libdw
> dependency. Model them after the existing capstone knobs.
> 
> Fixes: 7c10cb38ccb8 ("accel/tcg: Add debuginfo support")
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   meson.build                   | 11 +++++++----
>   meson_options.txt             |  2 ++
>   scripts/meson-buildoptions.sh |  3 +++
>   3 files changed, 12 insertions(+), 4 deletions(-)

Thanks!

Reviewed-by: Thomas Huth <thuth@redhat.com>



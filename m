Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690963C5E16
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:14:01 +0200 (CEST)
Received: from localhost ([::1]:53446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wh6-00020g-EC
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2wgE-0001LB-Nc
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:13:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2wgD-0004Ge-BY
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626099184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RUpbVkNkG5zH1yA/6MPDzcZG32IR7ySuaPO9qO6vwo=;
 b=VoScic5PhR+L12wd/FMj0XR0hPFH6/WX/qrXa4uQyuMi8f3lJIMgS6HVE3ux9dwB3e6BAh
 tI6zYhxgNg1nJITuOBK35KNSL2P6CUrIYGxtRTfcPgOP/TTPLlBquw/v9jSQ3bh3cLkeFC
 o0zXdE119oYDVSKduIM85qkC2MO+Zoc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-DoO-6SqzMMOsl1LwJZEE9w-1; Mon, 12 Jul 2021 10:13:03 -0400
X-MC-Unique: DoO-6SqzMMOsl1LwJZEE9w-1
Received: by mail-wm1-f70.google.com with SMTP id
 n17-20020a05600c4f91b0290209ebf81aabso59097wmq.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6RUpbVkNkG5zH1yA/6MPDzcZG32IR7ySuaPO9qO6vwo=;
 b=HB5kGhdjXMkna23NXpwzbJfxi//A++RVmt92doXhk2JVi8c2+Csij5obmnsus7KAhH
 Io4g7/27cwPlpj61GCUW0qN5Ey3PlPu+nje9zxNaKY3rRgUkwruN6FSnAdKKh5EIVwbB
 3qqjlL2Wo5kurDIsUP+USxELMTc41SnZ6QJk1jiTZtzWSAGW5BwLKDSXlnyYVHLvAPHC
 MmDB0rCc6TfsdQRgiWAmKAwbUtNVxwykvBkQ8boLzbm22T3HlD/C6b7XrutXf7QsiDzt
 SZWm0mRUOjquscaME84dNR1Fm/jGqbyAHb12NF0uyryP93ByjhTGfvNmxTxxkfcWSKET
 PHWA==
X-Gm-Message-State: AOAM53169n6XYVIhahytj1Lyr7I1aOE7sAOph+eddwHqlqaWj9rfnapp
 /WwaXZb9ESopeV7DJCe1PstbDRm0QcB5UX+fSZVAKtExWjGcAYZw0oytI0i32tSoWwSXx8NFBtr
 iVeG7r3lq19hG8rc=
X-Received: by 2002:adf:eccf:: with SMTP id s15mr57672202wro.176.1626099182109; 
 Mon, 12 Jul 2021 07:13:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbIFqH4suuiAOlMjQliUxKiXe63EmDMpXjYzeCAGZ3OaErVqisvZGNcdNLL24cF7Y3bJjWEA==
X-Received: by 2002:adf:eccf:: with SMTP id s15mr57672173wro.176.1626099181917; 
 Mon, 12 Jul 2021 07:13:01 -0700 (PDT)
Received: from [192.168.1.27] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id f26sm6613455wmc.29.2021.07.12.07.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 07:13:01 -0700 (PDT)
Subject: Re: [PATCH] io_uring: move LuringState typedef to block/aio.h
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210712131030.465621-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6c9b947d-06a6-9074-fdfa-ff7fc568bf8b@redhat.com>
Date: Mon, 12 Jul 2021 16:13:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712131030.465621-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: alex.bennee@linaro.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/21 3:10 PM, Paolo Bonzini wrote:
> The LuringState typedef is defined twice, in include/block/raw-aio.h and
> block/io_uring.c.  Move it in include/block/aio.h, which is included
> everywhere the typedef is needed, since include/block/aio.h already has
> to define the forward reference to the struct.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/io_uring.c        | 4 ++--
>  include/block/aio.h     | 8 ++++----
>  include/block/raw-aio.h | 1 -
>  3 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



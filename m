Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB0D45B5C6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:45:45 +0100 (CET)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmyO-0007iI-6P
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:45:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpmrA-0006MU-Dz
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpmr8-0000Vk-Df
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637739493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QnVhXUPjA+bkB7M3BZvc8hAI7CJgQ3Y+s7ikfvEylPI=;
 b=hRNRDPuxRcgSGw5kGRQ4CdxHP2OMqUxcJE0qlGUu56IbgZtwnhSQBJTNPYBqoP1ha8tE6D
 KAC4ZiTu0CjaMFqImRIy2Gbjwse7EgD7c1/ftMk7zhZBB7ldiV66tH7c3dD5sWA3v/7SV6
 WMQp9gpzTU3pKWMqV7WYCdJEIDwTNj0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-Q9eClW1uN6i2THKXxn38OA-1; Wed, 24 Nov 2021 02:38:12 -0500
X-MC-Unique: Q9eClW1uN6i2THKXxn38OA-1
Received: by mail-wr1-f72.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso230426wrq.16
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QnVhXUPjA+bkB7M3BZvc8hAI7CJgQ3Y+s7ikfvEylPI=;
 b=v6hKONd2mfE2WF73s2VBbXCy3m1lHAgs/hiD8iIlgXsVBfvOarV8Ugu2YXqBKELkvV
 9Oiba/DrZv160/ALi2JrFLKWxpTiSiSRjO5hB/hUPTXbyutWOyXeBPqg8iCadVM7LT9g
 rtw88Y4l6TIIGbu7ohl7yiXwlav4AAdhzjcav8V5PUiqC5Ao3XcfSUJyrVjnsh3g456/
 R7aA0dHrhX/hBuZBQKrJ13U72ZUJGS8CzuQiYp4BaCXzU+qOeX4BRx9RBGR4eI/LvE7i
 lrba2UW7HoWh0PuXxmC4+QN0O4s4JJvi1RtK17Xe5J3jXMgVnycwFCLuPsRD1GTvyFp1
 pItw==
X-Gm-Message-State: AOAM530n7UoG6sTLHkqFK1m/gdVeJqJ4ZQnKeDZrP/hp3+RkL9QU4bcg
 0jKfkMkFKhBHeeOFacP+8GcoGSjAozdENEDCnP6XJztWki16nXC2+11AHEIqpSLXRY1In1AL9SJ
 kl24TgVlYx4I5l20=
X-Received: by 2002:a5d:6dc1:: with SMTP id d1mr15873241wrz.282.1637739491041; 
 Tue, 23 Nov 2021 23:38:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUN5a71HNGsKj5rJIHiySJiZXuaC28NTsH/HMPr+yXNaRAjOPUNJ2G5ODTzlUg/WdK349oQw==
X-Received: by 2002:a5d:6dc1:: with SMTP id d1mr15873212wrz.282.1637739490886; 
 Tue, 23 Nov 2021 23:38:10 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g124sm3561363wme.28.2021.11.23.23.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 23:38:10 -0800 (PST)
Message-ID: <fe462ea9-03ec-37e1-1eba-7d6d2f736deb@redhat.com>
Date: Wed, 24 Nov 2021 08:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/4] include/sysemu/blockdev.h: move drive_add and inline
 drive_def
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124063640.3118897-1-eesposit@redhat.com>
 <20211124063640.3118897-4-eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124063640.3118897-4-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 07:36, Emanuele Giuseppe Esposito wrote:
> drive_add is only used in softmmu/vl.c, so it can be a static
> function there, and drive_def is only a particular use case of
> qemu_opts_parse_noisily, so it can be inlined.
> 
> Also remove drive_mark_claimed_by_board, as it is only defined
> but not implemented (nor used) anywhere.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/sysemu/blockdev.h      |  6 ++----
>  block/monitor/block-hmp-cmds.c |  2 +-
>  blockdev.c                     | 27 +--------------------------
>  softmmu/vl.c                   | 25 ++++++++++++++++++++++++-
>  4 files changed, 28 insertions(+), 32 deletions(-)
> 
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 32c2d6023c..aacc587a33 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -27,6 +27,8 @@ typedef enum {
>      IF_COUNT
>  } BlockInterfaceType;
>  
> +extern const char *const block_if_name[];

Maybe a cleaner alternative is to ignore the previous patch,
and add a new public method:

  const char *block_if_name(BlockInterfaceType iface);



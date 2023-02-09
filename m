Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBCF6901F0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:13:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ23C-0006Ww-Ni; Thu, 09 Feb 2023 03:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ230-0006WX-TU
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:12:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ22y-00012Z-Ia
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675930367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZoLZh85LDab/g3w9pXZyJbqb0/3ObSpi6NHd3KhbbA=;
 b=E9Pb7ea0KVo9drhFsBMvUgLToyVgd/Nrd7eWi4Ej/qOC52c/xlAm9pB0Eckg1xRsTom/Op
 +k7yyYG1DwN+ZhWAlpE2jJ71/2WgWxLJqMZq04e8mhtiyw5OAM1u03jcEtkAO7OVuxlgCM
 iDEpK5a6Y1ZBjp7ZdUZ4CkUKKrLAF48=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-TaoHWqL9OK2aT--b2DAUjQ-1; Thu, 09 Feb 2023 03:12:46 -0500
X-MC-Unique: TaoHWqL9OK2aT--b2DAUjQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 a6-20020a05620a102600b00729952b4c73so783420qkk.6
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZoLZh85LDab/g3w9pXZyJbqb0/3ObSpi6NHd3KhbbA=;
 b=JGNyGxf4EDsjiCSu2J5dytFUC4Q7mrGPa1Lw9RcrwOo/fLmhLpA8GQortEbDnKTAPu
 nPO/tbfutKJcCQFiIT9Lo1OsP0/rD0GmeDY5UdGh8FvtYo6LzuLgaC8/ZUDDdE2vfd/3
 ggwWqZQZQ1aYD+K4speV6lIeMicKk8a5HnwIhQkU9BUJdqNzyCnUmTXKQ6ssZggLCHGr
 CVeax7AEzOo7nRsQT2U94qyV4K4TCoThG8YklXtE5IuHcMDPcor89hjCVL3v7+K/IAcu
 n6K+1ctQAmxl3xaLAmkttY9mIxPeQReOphcoTh/h3Mcf7N82wlI/8C66I5FzDYk/YpCZ
 W5bQ==
X-Gm-Message-State: AO0yUKVpbThP518e2bZM6rry/agY+fVL4AE8sKcp3CB2N8Slf27i8vtk
 CSUOZayUqzJOzqGKFFFO35R+iuo4F/nsJ5qQcVW1n2vkAuO5NfwukHwwxzzD15xU2rmOvwcL6IY
 bQnGxKKJqO+usjLM=
X-Received: by 2002:a05:622a:1826:b0:3b6:2b38:e075 with SMTP id
 t38-20020a05622a182600b003b62b38e075mr16788915qtc.9.1675930365747; 
 Thu, 09 Feb 2023 00:12:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+nSLCTLYj6MzDlPoPo9H/Alrv49ClT8fG1C23UZcPCf1JXflWm35j9GrgmCziZIar0rBcP7Q==
X-Received: by 2002:a05:622a:1826:b0:3b6:2b38:e075 with SMTP id
 t38-20020a05622a182600b003b62b38e075mr16788897qtc.9.1675930365543; 
 Thu, 09 Feb 2023 00:12:45 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-209.web.vodafone.de.
 [109.43.176.209]) by smtp.gmail.com with ESMTPSA id
 j13-20020ac8404d000000b003b6953fbb8fsm848804qtl.32.2023.02.09.00.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 00:12:45 -0800 (PST)
Message-ID: <8cd8fcfc-180e-7bb6-4c35-3bd9370bc1c9@redhat.com>
Date: Thu, 9 Feb 2023 09:12:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 08/12] tests/qtest: drive_del-test: Skip tests that
 require missing devices
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230208194700.11035-1-farosas@suse.de>
 <20230208194700.11035-9-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230208194700.11035-9-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08/02/2023 20.46, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/drive_del-test.c | 65 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
> 
> diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
> index 9a750395a9..8a6f3ac963 100644
> --- a/tests/qtest/drive_del-test.c
> +++ b/tests/qtest/drive_del-test.c
> @@ -16,6 +16,8 @@
>   #include "qapi/qmp/qdict.h"
>   #include "qapi/qmp/qlist.h"

Reviewed-by: Thomas Huth <thuth@redhat.com>



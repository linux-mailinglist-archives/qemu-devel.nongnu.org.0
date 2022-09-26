Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C884F5EA661
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:43:07 +0200 (CEST)
Received: from localhost ([::1]:55808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnRy-0004qq-Km
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocn84-0003cp-Uy
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:22:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocn83-0001oa-CB
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664194950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5TkmCeT63K365L8D+LWfrxM8X3N4jRSTFiaCtgj7nUU=;
 b=DK9ILwvrCbnbJfsu+xH35DCvhSz46LzSpvyPABwVx5bRtMzJL9XgTYQHrnJwxHxv9Zo2fS
 IDZQBFMAw9oIXHLMwFFf0Po9R4DtSvGtHn0ZbxIh3gqGCfWZBAfePs4afx4jdCiOXxIfNG
 Hchi1sRgFlWsPHqoY09xjdy+ziCYKGs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-135-CNdk6OO7PQyJHYiDgBOLmA-1; Mon, 26 Sep 2022 08:22:29 -0400
X-MC-Unique: CNdk6OO7PQyJHYiDgBOLmA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5-20020a05600c028500b003b4d2247d3eso6176865wmk.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 05:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5TkmCeT63K365L8D+LWfrxM8X3N4jRSTFiaCtgj7nUU=;
 b=3xzrBI2oOeAV36u8g967hQUxcRfrT3bCtjhZu27R6nssorMneVjqnUuu+7kLh+DmRb
 e9wVkOrvuGRGPTeVLpVzoZxcJDgeGXL2tGGuK1yHDo7M3zTkNC3cpW5QPLkNNFxRblF3
 N7hP0QVc0DkeH+rRFVnkJX4QBSfgbLUfHRyDUnK6xbDIGgfGWyjDoPBylkchtSxAOo5T
 D0GcOFpYPafm92SnE7lyj7JEbjbyrwnImoNR8c8s40JgWVjruW8utCC4NBNTeiZVOZki
 zo9NsJHhag9GuXYlkKbwseHgITkR6uYB0iGZankIEm1kZIZPABHt9Bmj69JL/DEfOXpz
 qTug==
X-Gm-Message-State: ACrzQf3VdS6AoFgwWb3gbCffYcq6FZiUge+PFAJ1leBwFwKkUnkrxIga
 o+SAiWJ2MA+IMW4QBUKmrq7orkcEFN+sXpWH/a1cV067TZJjaSqqcfUmRssr90HveaToiM8CXkR
 Q9PZnaYgIjHxiZZM=
X-Received: by 2002:a05:600c:474c:b0:3b4:cbca:5677 with SMTP id
 w12-20020a05600c474c00b003b4cbca5677mr14477179wmo.76.1664194948302; 
 Mon, 26 Sep 2022 05:22:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7bjJZQlh2sW5zthWER2YvvXnQaOiZn1Gyt86XUarDeRXuCELQFhx9IAw6FOIhcj3KbxLwDxw==
X-Received: by 2002:a05:600c:474c:b0:3b4:cbca:5677 with SMTP id
 w12-20020a05600c474c00b003b4cbca5677mr14477169wmo.76.1664194948074; 
 Mon, 26 Sep 2022 05:22:28 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-251.web.vodafone.de.
 [109.43.177.251]) by smtp.gmail.com with ESMTPSA id
 v3-20020adfebc3000000b0022adf321d22sm14103353wrn.92.2022.09.26.05.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 05:22:27 -0700 (PDT)
Message-ID: <0ab15e90-b5f1-75f1-4f64-bf3610efad20@redhat.com>
Date: Mon, 26 Sep 2022 14:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 07/54] tests/qtest: boot-serial-test: Avoid using
 hardcoded /tmp
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-8-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220925113032.1949844-8-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 25/09/2022 13.29, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> 
>   tests/qtest/boot-serial-test.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640E3F4700
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:57:47 +0200 (CEST)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5m1-0004Up-66
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI5k6-0002Oy-0d
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:55:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI5k4-0004Pf-0U
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629708939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/GMc84aOqPbbDMNvQc1vtfopaudvCC23qxrwOU+Gic=;
 b=fCboBfJ8jL44gcU1iuoFWXEuIrc1+ZdPf6DCXhyoZtH5FbsFGrWCXByxatn6LjIXTejJkw
 7KO+5DCBj1Wca8sk+D4+dRV+i8fWhPTavZo468XdlT47whVSJoHqZYK87udV5gyMcvAJvr
 oPexQPCqu4Z5v4hj0+w03geqHLVG1vc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-ErH1bMyUOA6W5SbLl2MTFQ-1; Mon, 23 Aug 2021 04:55:37 -0400
X-MC-Unique: ErH1bMyUOA6W5SbLl2MTFQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so2755037wma.4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 01:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/GMc84aOqPbbDMNvQc1vtfopaudvCC23qxrwOU+Gic=;
 b=CJVpLGGdzze5Ac0S1+3ZUo36jpU6fUHNLH7GYkDBGBxbjBKxh70QJL6yagsfa8LoBB
 pDBlC1Nfdd7SErGGSC3Mog/klJJ28k+/IL/h0SYbvI/7NVxSKPIqUrudCJZwUDQ73evC
 dzdQ9sN3Tw8Z3AyINBzpRgKo0lmqdnpiISfDx9XR+X0PcSuVa3BwNOzQ4352fMKCFCO6
 SzrDiIZUoa2PzJWthbXfet7aZPQmkWq0Y/j/0XT54Kq39ndwd7q8NCt0VgaTYbBXqYvb
 lw91SoFWB74OozcHMvYoLX2iJbI+vc2yi7mJtQ25y8rIDky2JVs8x4H2Uo8zwv/pJKnc
 EaRw==
X-Gm-Message-State: AOAM531BHgMlBXY6S7K2iG906a4k6Y3uY9+W1ID+827AhsqF4aTBcvW1
 jUGUOr2mVB/VijlLv5crxwbNyYC7MkZ3n40xmYrMINRQaVFPNwPanSPkI0oWNZ//l7M4ghbnwfQ
 D7cJhYFsVmNnoE7s=
X-Received: by 2002:a1c:1904:: with SMTP id 4mr15019309wmz.93.1629708936306;
 Mon, 23 Aug 2021 01:55:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCVu8F3F23Kmhr5d88zD3VR0nvh9yX7EF+lc4WoRcbR2EFrXVTPy8RtvJdDQhPFQcXyd/yIQ==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr15019300wmz.93.1629708936194;
 Mon, 23 Aug 2021 01:55:36 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f17sm12355528wmq.17.2021.08.23.01.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 01:55:35 -0700 (PDT)
Subject: Re: [PATCH v2] memory: Have 'info mtree' remove duplicated Address
 Space information
To: qemu-devel@nongnu.org
References: <20210823085320.597078-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ccdefa93-76d2-c328-da3c-97599189aab7@redhat.com>
Date: Mon, 23 Aug 2021 10:55:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823085320.597078-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 10:53 AM, Philippe Mathieu-Daudé wrote:
> Per Peter Maydell [*]:
> 
>   'info mtree' monitor command was designed on the assumption that
>   there's really only one or two interesting address spaces, and
>   with more recent developments that's just not the case any more.
> 
> Similarly about how the FlatView are sorted using a GHashTable,
> sort the AddressSpace objects to remove the duplications (AS
> using the same root MemoryRegion).
> 
> This drastically reduce 'info mtree' on some boards.

> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: List AS similarly to 'info mtree -f' (peterx)
> ---
>  softmmu/memory.c | 65 +++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 61 insertions(+), 4 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4df..ebc58964415 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -3246,11 +3246,56 @@ static gboolean mtree_info_flatview_free(gpointer key, gpointer value,
>      return true;
>  }
>  
> +struct AddressSpaceInfo {
> +    MemoryRegionListHead *ml_head;
> +    int counter;

v3 coming...

> +    bool owner;
> +    bool disabled;
> +};



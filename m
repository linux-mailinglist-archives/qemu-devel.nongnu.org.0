Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481F14AB4A8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 07:24:06 +0100 (CET)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGxRV-0006Hp-3s
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 01:24:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nGxJB-0003Rl-GR
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 01:15:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nGxJ9-0005iB-70
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 01:15:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644214526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpBJWEBhrqJqmflkzWB7UBEcBT9o0cKXqssS4QdlYTQ=;
 b=TcSfmf6gMkC6HAL6NfQS71oAiejUI1rC/kFMN8+jTCfGAELFPHbwfpMyvhHjvGwH4kAWFS
 6wmrTSkcL6J0UocxxA3RChkOeoAD6WXx77FSs0nJ/7UBhB+AT57gOTtUHr10mj2O/F5KOx
 i18UStDkf9k0oo9CSxpSgBtnXAZFCm8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-FUahAJIzOF6r_pxNH90gnQ-1; Mon, 07 Feb 2022 01:15:24 -0500
X-MC-Unique: FUahAJIzOF6r_pxNH90gnQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so1403695wrg.19
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 22:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EpBJWEBhrqJqmflkzWB7UBEcBT9o0cKXqssS4QdlYTQ=;
 b=7qiNxH6ByOFQLHTXxxzAvKLFPF/zpDg5XrbKcvzKzZFo0BWK6JDhU/3jUYcksmuNQh
 zCwIbWbE09hPb2eCqAVHaQPMS/fbT2rsRT3UtwmOo/zxFe6pkXKb6y2skwD1PMoOnX9u
 7gVgA7k9y/AvbNTLhKRa8GyuRlQeYqMQSDLyL02s/yFX4U5OyqKWaIJARUeH/2qZ9tlm
 o9JidWnZNuB/tbHd52SR+SejnNAUcpWGu93Cs801NrOCU4ywyvDElfS+dwd/MhW7tARA
 6BQxQJOCffJsWICoqwS+xDTSSMA/6eUQusmc/fVKiiKFmV3vjDWOJyuooDhZxU+CUnQ5
 uyUA==
X-Gm-Message-State: AOAM530jwRELaYvnpxw6Ss/GwxOTWlnf1Cp6aEPxDfN4l3lkIMG8m27i
 fhWJtuupwkngXoC/Y6GygRWx9BhiXP6Q3KQ4uhnSS63DUrROZDuW8rh0Lu1ARpQh846Tt5xJkTj
 VjzlJw29XIifvjl8=
X-Received: by 2002:adf:e344:: with SMTP id n4mr8636128wrj.630.1644214523286; 
 Sun, 06 Feb 2022 22:15:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypO5KaWr3tgQimdV3GkUE5FHGyecQssZjejT7fwk1CFQa8fqXzn5UqNUJnmcLzL6uGMxcyeQ==
X-Received: by 2002:adf:e344:: with SMTP id n4mr8636120wrj.630.1644214523138; 
 Sun, 06 Feb 2022 22:15:23 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id n15sm8401037wmr.26.2022.02.06.22.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 22:15:22 -0800 (PST)
Message-ID: <e785d119-cbc5-4db9-0b0d-efc610de5aa1@redhat.com>
Date: Mon, 7 Feb 2022 07:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 11/11] 9p: darwin: Adjust assumption on virtio-9p-test
To: Will Cohen <wwcohen@gmail.com>, qemu-devel@nongnu.org
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-12-wwcohen@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220206200719.74464-12-wwcohen@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/02/2022 21.07, Will Cohen wrote:
> The previous test depended on the assumption that P9_DOTL_AT_REMOVEDIR
> and AT_REMOVEDIR have the same value.
> 
> While this is true on Linux, it is not true everywhere, and leads to an
> incorrect test failure on unlink_at, noticed when adding 9p to darwin:
> 
> Received response 7 (RLERROR) instead of 77 (RUNLINKAT)
> Rlerror has errno 22 (Invalid argument)
> **
> 
> ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion
> failed (hdr.id == id): (7 == 77) Bail out!
> 
> ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion
> failed (hdr.id == id): (7 == 77)
> 
> Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
> [Will Cohen: - Add explanation of patch and description
>                 of pre-patch test failure]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>   tests/qtest/virtio-9p-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 41fed41de1..6bcf89f0f8 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -1270,7 +1270,7 @@ static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
>       /* ... and is actually a directory */
>       g_assert((st.st_mode & S_IFMT) == S_IFDIR);
>   
> -    do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
> +    do_unlinkat(v9p, "/", "02", P9_DOTL_AT_REMOVEDIR);
>       /* directory should be gone now */
>       g_assert(stat(new_dir, &st) != 0);
>   

Acked-by: Thomas Huth <thuth@redhat.com>



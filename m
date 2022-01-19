Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA66493961
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:18:03 +0100 (CET)
Received: from localhost ([::1]:58824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8yY-0007dN-Iy
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8s1-0003LS-S8; Wed, 19 Jan 2022 06:11:17 -0500
Received: from [2a00:1450:4864:20::32c] (port=52047
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8rz-00070l-O4; Wed, 19 Jan 2022 06:11:17 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c2so4707180wml.1;
 Wed, 19 Jan 2022 03:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N3WfaMCFxj9ol7tjll01fO4Fadmj6itLO5fcKmxuXBU=;
 b=SMYoftKk+sDhRqRumO5crubnqJbQn0lLRgQ3Rk2L96L/ORUUdn0I726NzayJDCgf6A
 Ix+rVF5vOz8WrogUdHMWz/C3dl350RHTPE+U9n+gKMTNueGeWVmBiKxbtEKuHfLjBu7n
 UKx7RQ2zCdCxUHKqqCbFcO770DWSWysrz6N6n5x0nlxzRQVllf715qLY31vE2XOK0NI/
 UE7DQqXfHUwE4SZidCx8YzgkKAFmn+8Uw3KWgB8n1c50zf4dFc+keDcHeFgZUBsOd5Iz
 Fvq5SNZy1m3myciRsuWTJWFlZqwJIHTk23oOqu22TK3Q9JubnMX/UzI4681AHFzQRaBI
 xPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N3WfaMCFxj9ol7tjll01fO4Fadmj6itLO5fcKmxuXBU=;
 b=ABP5Yw3BdEyp2kUyydHBQYYE38p7IUR4mSWZgi7LtJPRivnTRCi5y3W3yLXVYD0GF8
 qmRtYesP/6l8PS/8p61txis1t3cEjy87IkNdIOtCRnAeOxgepnrwZts4sqzcmwiqZYYM
 WcWFvF6W7W9WPoXUldop75p3k6T5oOlibdQ3I8HmnE7t3GpBbAkwoC/5YGFWaospRrId
 nKvgrCDEouTtQ6EvjPu7jJMrKcjCunYs6k9VjFKe1hCcg1Sdwxk678ihb5RMUVxVjB9v
 BbVp6W5G6rGNGBIDclxF2x/qR7eGHx7XpjHrsVfGCuMXIpBHnG3Vy+oD+xQfPHsxnMdP
 cT5Q==
X-Gm-Message-State: AOAM530wHaJpjnfeGBxPzG11nPTCVch2ubZLl8SCKlmSpkQqFhSidV7i
 KrH0VmqfLMvTYo5dUoJFofM=
X-Google-Smtp-Source: ABdhPJwIy6ZZ7OqoxA2d18Nv+s4L9XAF3cYbdzN+DriMtzPyCmWXrQGSI1OUIfM7v3/CoXvZBca6Kg==
X-Received: by 2002:a5d:564b:: with SMTP id j11mr7572998wrw.527.1642590673875; 
 Wed, 19 Jan 2022 03:11:13 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id p2sm16212975wrs.36.2022.01.19.03.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 03:11:13 -0800 (PST)
Message-ID: <b09405a0-6968-1fb3-60ce-8d91e64c3673@redhat.com>
Date: Wed, 19 Jan 2022 12:11:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] ide: Explicitly poll for BHs on cancel
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220105111337.10366-1-hreitz@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105111337.10366-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 12:13, Hanna Reitz wrote:
> -        assert(s->bus->dma->aiocb == NULL);
> +
> +        /*
> +         * Wait for potentially still-scheduled BHs, like ide_trim_bh_cb()
> +         * (blk_drain() will only poll if there are in-flight requests on the
> +         * BlockBackend, which there may not necessarily be, e.g. when the
> +         * guest has issued a zero-length TRIM request)
> +         */
> +        while (s->bus->dma->aiocb) {
> +            bool progress = aio_poll(qemu_get_aio_context(), true);
> +            assert(progress);
> +        }


I think the right way to do this is to do  blk_inc_in_flight before 
scheduling the bottom half and blk_dec_in_flight in the BH callback. 
See virtio_blk_dma_restart_cb for an example.

Paolo


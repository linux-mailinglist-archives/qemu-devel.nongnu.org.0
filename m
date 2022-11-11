Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E60B625925
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:15:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otS00-0006C9-VD; Fri, 11 Nov 2022 06:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otRzw-00068M-RL
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:15:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otRzv-0000HR-CS
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668165298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSBoDpJVyH+Az/gSAP+QR+4J6C3gxQI3qn9c0/tl0T0=;
 b=ZSCMpFPFCyrzSPr463raNmHO6SsG3R7qUWvQXP+eY8qujUCEKmy1qfFBMW8kXXfPfOmKto
 lMIcZkz5Zf8+EP0PnMMozEniSj/oJsHHwfb69DIsNYLFUdfTeC4etssu5X3ViV8gj0bSjH
 t44rt/LVqfApAgMNjVspPtMxI8Dxqic=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-ZzbLligzPzKJ-l4kCqpB-w-1; Fri, 11 Nov 2022 06:14:56 -0500
X-MC-Unique: ZzbLligzPzKJ-l4kCqpB-w-1
Received: by mail-qv1-f72.google.com with SMTP id
 nh17-20020a056214391100b004bb6c16bd4dso3470943qvb.17
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vSBoDpJVyH+Az/gSAP+QR+4J6C3gxQI3qn9c0/tl0T0=;
 b=RAX/9Roy0h7sC7ih3XWOISqhSow2PZ606ohkb15gYSflJO5jRIwmBlMK9hYIJskI7Y
 DXKxZgzLMyIuEJLouWCzij0YwguqUJtRWqBXRVuXuDl7O8e4WLmBFwJWjnpMuQe9NWSu
 g5ha6g/YokAQhVCNdykgctMPuT3eBSsB0LjdllrBtfxzLIUkI2XjrhEc60eni5tby8xI
 A3xVytzVS781afm858x6PsEQTyJgcOGPPRxkCaYwvjrvEBr3PAjhUClF2m26Mwrxq35V
 2WMkjJLSyl/dwlEWN+sRKebg/uvG1ZP/fAdwrfEJH46SsenqHIVJcpPsitx+ZqYYAno0
 gKZA==
X-Gm-Message-State: ANoB5pkIFnrDtb3B6Zk1QI69gfaSHPmWq4eisxgUlSK8K0SqF2hUGegX
 kXj9p2CwhtwEd8uKh/B+lQMZmDsGcG6Fu9/HL4qlvGz5KC0d3r/Lc39muGHOKPge2aGU6iMm3dO
 VNQVSM5sSfnAxokM=
X-Received: by 2002:a05:6214:370b:b0:4bb:ae72:da99 with SMTP id
 np11-20020a056214370b00b004bbae72da99mr1410586qvb.29.1668165296241; 
 Fri, 11 Nov 2022 03:14:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4+aCjPHdUnKm1szYHGJrh7kRqsWbpgE3Y4MOsaIufrlANM9s35Sh3OfAXwPvw/UNJyY4o0bg==
X-Received: by 2002:a05:6214:370b:b0:4bb:ae72:da99 with SMTP id
 np11-20020a056214370b00b004bbae72da99mr1410577qvb.29.1668165296064; 
 Fri, 11 Nov 2022 03:14:56 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 b3-20020ac85403000000b00342f8d4d0basm1095732qtq.43.2022.11.11.03.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:14:55 -0800 (PST)
Message-ID: <84200da4-e02c-0cf4-7fa2-662d98c9142f@redhat.com>
Date: Fri, 11 Nov 2022 12:14:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 03/13] block: Revert .bdrv_drained_begin/end to
 non-coroutine_fn
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: stefanha@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-4-kwolf@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108123738.530873-4-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 08/11/2022 um 13:37 schrieb Kevin Wolf:
> Polling during bdrv_drained_end() can be problematic (and in the future,
> we may get cases for bdrv_drained_begin() where polling is forbidden,
> and we don't care about already in-flight requests, but just want to
> prevent new requests from arriving).
>
> The .bdrv_drained_begin/end callbacks running in a coroutine is the only
> reason why we have to do this polling, so make them non-coroutine
> callbacks again. None of the callers actually yield any more.
>
> This means that bdrv_drained_end() effectively doesn't poll any more,
> even if AIO_WAIT_WHILE() loops are still there (their condition is false
> from the beginning). This is generally not a problem, but in
> test-bdrv-drain, some additional explicit aio_poll() calls need to be
> added because the test case wants to verify the final state after BHs
> have executed.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049A5A35B5
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 09:53:56 +0200 (CEST)
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRqdf-0005sH-HK
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 03:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRqbG-0004K3-EL
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 03:51:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRqbE-0004j5-4o
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 03:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661586683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shCnlfDVKS2iv5YzOeWcQlKPaego+2C6WJNW8k/uino=;
 b=LbODAdg50norptOb+W+S803mlvWMeZ+GSd6cIrsIf5fW4uR6784SztvBxBJ/kYK6jue3EV
 YXpHR326oV+MRZbLGeDd7F8qks4k0d3Cz+a3tUcbRDaisjNQLsN9K/fOp7QOXVV9n5rewD
 bTBrZJTeY3vnQxPedFUs0Vq0B68BJxc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-192lPtcpPEiWMHOe3bojyA-1; Sat, 27 Aug 2022 03:51:21 -0400
X-MC-Unique: 192lPtcpPEiWMHOe3bojyA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i132-20020a1c3b8a000000b003a537064611so1936006wma.4
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 00:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=shCnlfDVKS2iv5YzOeWcQlKPaego+2C6WJNW8k/uino=;
 b=KCH+sIX8UAUKaDmZTHXkjZRbafh1FlbHqsYEv2R1gbuEtboqI+eXwM0UtBPUdjQWtq
 EnFpUelhPbrXUbTiif//MCWrfRpUPo0VyJmI7avOC9x+zh4SIHviXxJMFQLGwsy/ccb4
 lcE9lW+c4mWOeVjZ8qhiecAmm2p2+0Uzu69IDro6WOcJRR2bqX8fWbtI32Oa7xNB1CfX
 5X7143TGGk5YPfQgqcRjp+57Jw59T+Qhd1Ed/P5Ym0Snojqm//u0CM5AqBuDUtn/Nzss
 ScWbtNiiJuTWPxGbBbrGc8q0k4hMXKsDscx0oTGwFWMXQELPLUA/ct2gk2omSV7yPSXV
 jA+w==
X-Gm-Message-State: ACgBeo1byu7mLh7scSfD8FxjFP2yde4TIii28nNWe1UAB7fkbeAhxUUL
 Ln1hLcTl1C4SgbpZm2h3Ky72ypTxBZaw5zrxeNNWvD3urGHGifQ5IyG11kiLtFOSF7MjSFnKqoI
 gQhGkT6Nwjc7IWfs=
X-Received: by 2002:adf:d1e8:0:b0:223:bca:8019 with SMTP id
 g8-20020adfd1e8000000b002230bca8019mr1568042wrd.562.1661586680670; 
 Sat, 27 Aug 2022 00:51:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6LOkzM8eJYQ7Q7aeKMKf7PfgGEWBSrD3RA765bAPZLwJs9cU/djq6EHPMbgS9XIOi98Z4qyQ==
X-Received: by 2002:adf:d1e8:0:b0:223:bca:8019 with SMTP id
 g8-20020adfd1e8000000b002230bca8019mr1568017wrd.562.1661586680478; 
 Sat, 27 Aug 2022 00:51:20 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 r28-20020adfa15c000000b0021db7b0162esm1625806wrr.105.2022.08.27.00.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 00:51:19 -0700 (PDT)
Message-ID: <e7d8120b-7d58-780a-5dd0-622f82433830@redhat.com>
Date: Sat, 27 Aug 2022 09:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 14/20] disas/nanomips: Remove function overloading
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-15-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220815072629.12865-15-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/08/2022 09.26, Milica Lazarevic wrote:
> Renamed the following functions by adding a suffix:
> - copy to copy_ui and copy_i
> - IMMEDIATE to IMMEDIATE_UI and IMMEDIATE_I
> Calls to copy and IMMEDIATE functions are replaced based on the type of
> arguments.
> 
> Disassemble function that calls the other variant of it is deleted.
> Where it is called, now we're directly calling the other implementation.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 3103 ++++++++++++++++++++++----------------------
>   1 file changed, 1550 insertions(+), 1553 deletions(-)

I did not check each and every line, but generally this seems sane to me:

Acked-by: Thomas Huth <thuth@redhat.com>




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0272D50FB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 03:45:01 +0100 (CET)
Received: from localhost ([::1]:48670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knBwx-0004ZY-Hq
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 21:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knBvR-00049n-JA
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 21:43:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knBvP-0005pm-Hv
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 21:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607568203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DqYjJGXa6pZMmGvbOvVZ64LDQFExsY50KFeBmsbs4pY=;
 b=clRQmi2wldo+JxN1m/LJFFkB2OLDFVZ2Ig2b/1uZ7iX7Ovp1KoaLtvY340xyT46an6PBhC
 +1KrSxx98HX6DEMvz0mr+ha/zSxk92IRxTVzNTun9PouTgStlwMkBLS1z2V6TR9Fa1RLqu
 clfBEH9JeDIUY/gqvwXfj7uUSGSPzEk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-cEny-lPuPkC5Bm0Fp4Ru6A-1; Wed, 09 Dec 2020 21:43:21 -0500
X-MC-Unique: cEny-lPuPkC5Bm0Fp4Ru6A-1
Received: by mail-ed1-f71.google.com with SMTP id bf13so1766986edb.10
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 18:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DqYjJGXa6pZMmGvbOvVZ64LDQFExsY50KFeBmsbs4pY=;
 b=NysVuRRetxIZpZ2yKK56yjanCYvWdIUx7vkfUCVepRjTN+Q0YK44pNCQjwOkCZIdgT
 yuS8aT5RQT+mzefJgX9023AjpY7csxVeGdTdlYPY9YURA9T9y9JQSt9L4yzYjRN7lFHg
 cETmwMhnYYnDLEpwBI40ekkFWHjgHexpEoFPYMx6kG0xEjoJ8whlHGFxbeHSCrBXKF1S
 qKLHxgQCfW+M9QzEKoV5+Ibq6DGHrjBIwUwLAc0L9BGyTHwH7Cm8Ni2dSNIsC0l3ZGJ/
 +EO3eOyBZgimb8VXXMSZ9l/TM23UNJGzROGrcNZnNCG8KkOkN9Qr4FVMfN1ivs01K5bm
 iCng==
X-Gm-Message-State: AOAM530XGWh7qse9EGPmMg1T000ELTlYsAtw5dM6MWxG32qb4Dkj9QF5
 yU46ldfgX6euJ+ADrBn+moiASzjuODBITTGz8PV8aaVoU+3Z9jKYTqLuG//C5TbecEMBhogodlT
 AsZbpROWHcdZctwM=
X-Received: by 2002:a17:906:85cd:: with SMTP id
 i13mr4562927ejy.553.1607568200435; 
 Wed, 09 Dec 2020 18:43:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNLrWFcj/AVdiatmiLjsDeb3T3NoT7WWYiuvB/eh6EbcUXDsAyElN+jLI5xXdCQZHFaZfKgA==
X-Received: by 2002:a17:906:85cd:: with SMTP id
 i13mr4562919ejy.553.1607568200259; 
 Wed, 09 Dec 2020 18:43:20 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id s12sm3544116edu.28.2020.12.09.18.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 18:43:19 -0800 (PST)
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, qemu-devel@nongnu.org
References: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
 <1607536336-24701-3-git-send-email-alejandro.j.jimenez@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/4] vl: Add option to avoid stopping VM upon guest
 panic
Message-ID: <2441c06b-82b0-5b27-39fb-ee4889346049@redhat.com>
Date: Thu, 10 Dec 2020 03:43:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607536336-24701-3-git-send-email-alejandro.j.jimenez@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: david.edmondson@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/12/20 18:52, Alejandro Jimenez wrote:
> -    vm_stop(RUN_STATE_GUEST_PANICKED);
> +
> +    if (pause_on_panic) {
> +        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
> +                                        !!info, info);
> +        vm_stop(RUN_STATE_GUEST_PANICKED);
> +    } else {
> +        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_RUN,
> +                                        !!info, info);
> +    }
> +
>       if (!no_shutdown) {
>           qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
>                                          !!info, info);

The "if" below suggests making -action panic's argument a tri-state 
(none/pause/poweroff; default is poweroff and -no-shutdown becomes 
equivalent to -action shutdown=pause,panic=pause).

In principle debug and reset could be supported as well, so maybe add a 
TODO comment.

Paolo



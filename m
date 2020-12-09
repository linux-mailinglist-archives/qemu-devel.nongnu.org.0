Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6CD2D4D17
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 22:46:25 +0100 (CET)
Received: from localhost ([::1]:59920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn7I0-0008Lc-W3
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 16:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kn7F5-00079J-Er
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 16:43:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kn7F2-0003ig-Bm
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 16:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607550198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxFN5MReXt4zrehni8NNxupVJtGcRmkyxk2yG7PNb5U=;
 b=CuksGIYu4fshLQ0HPNmB/3Wl2DCsGa0h8EMqKRJyITeJtRvkvfnhJQPPp0U8JVc2h8Lc5i
 kRTF7czsb9IPJlPeO3E10N3h/bMWYsDZ0pTThv5z55yPimTOZuliC5QyO/gJW4aGMQFQPl
 AqmxWYznoK/7FawmcwmhWdxlbhpIjGA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-pXZ3ElTWMbCeolp943TyNg-1; Wed, 09 Dec 2020 16:43:17 -0500
X-MC-Unique: pXZ3ElTWMbCeolp943TyNg-1
Received: by mail-ej1-f72.google.com with SMTP id g18so969691eje.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 13:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wxFN5MReXt4zrehni8NNxupVJtGcRmkyxk2yG7PNb5U=;
 b=Bz34PS2rRXdMW3KXHXnZpIc6xcEPMZFOyEP4cD0O9HtiTGY6/pmdnrFO/b3Cls1u/c
 2JlhYRh5/Hi4bx7446j3df0FPZ1wsNseEHOWkCLpkpgvBIkeHbY1G2Ka/8yaIybb5LvR
 e0tIZy5p5MXSvkMmUzQDg/auF3xZL9yPtoxPb9JKlst0Zv4UoANHxNw9s/0J9/JuwWnU
 GeWeGdNGhy/N7uURLBL0VUqxHYJmvd5B9yNVfnvpYEn7X0/16q8G8nTKHjS5svbbYEDL
 jV8HxKDOoBzOa5TR5Q0ZLiQw1mtPG1mImDMEGBWz+aXzEfNAKkaCqBGiIm3xNjcuUYIr
 XqmA==
X-Gm-Message-State: AOAM532F2qw5y9qgWY3izi+aFZBXkNRYBGy2Pv3249aPkvqG5ANMa6qj
 C2PFjn2WV1E06OT3szI1v611orRYTJ3WqHdshorZv7SBteiskgI9s0Lke4S0Lui/OjSuFRdYhi9
 gglm42wQubDL/EKs=
X-Received: by 2002:a17:906:68d1:: with SMTP id
 y17mr3794320ejr.447.1607550195607; 
 Wed, 09 Dec 2020 13:43:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlaQBwG7X89pqXmSIa2OtvAq1+NBdMAl3fzP+aXXw8huOJfE0mmxDlPuSamZDV0CALYhdYQQ==
X-Received: by 2002:a17:906:68d1:: with SMTP id
 y17mr3794310ejr.447.1607550195371; 
 Wed, 09 Dec 2020 13:43:15 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id m13sm3068973edi.87.2020.12.09.13.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 13:43:14 -0800 (PST)
Subject: Re: [PATCH v2 3/4] qmp: Allow setting -action parameters on the fly
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, qemu-devel@nongnu.org
References: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
 <1607536336-24701-4-git-send-email-alejandro.j.jimenez@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <99a5b268-f37f-b7a3-c976-3342e1145157@redhat.com>
Date: Wed, 9 Dec 2020 22:43:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607536336-24701-4-git-send-email-alejandro.j.jimenez@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
> +# Set the action that will be taken by the emulator in response to a guest
> +# event.
> +#
> +# @pair: a @RunStateAction type that describes an event|action pair.
> +#
> +# Returns: Nothing on success.
> +#
> +# Since: 6.0
> +#
> +# Example:
> +#
> +# -> { "execute": "set-action",
> +#         "arguments": { "pair": {
> +#             "event": "shutdown",
> +#             "action": "pause" } } }
> +# <- { "return": {} }
> +##
> +{ 'command': 'set-action', 'data' : {'pair': 'RunStateAction'} }
> +
> +##
>   # @GUEST_PANICKED:
>   #
>   # Emitted when guest OS panic is detected
> diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
> index a644d80..7877e7e 100644
> --- a/softmmu/runstate-action.c
> +++ b/softmmu/runstate-action.c
> @@ -80,6 +80,35 @@ static void panic_set_action(PanicAction action, Error **errp)
>   }
>   
>   /*
> + * Receives a RunStateAction type which represents an event|action pair
> + * and sets the internal state as requested.
> + */
> +void qmp_set_action(RunStateAction *pair, Error **errp)
> +{
> +    switch (pair->event) {
> +    case RUN_STATE_EVENT_TYPE_REBOOT:
> +        reboot_set_action(pair->u.reboot.action, NULL);
> +        break;
> +    case RUN_STATE_EVENT_TYPE_SHUTDOWN:
> +        shutdown_set_action(pair->u.shutdown.action, NULL);
> +        break;
> +    case RUN_STATE_EVENT_TYPE_PANIC:
> +        panic_set_action(pair->u.panic.action, NULL);
> +        break;
> +    case RUN_STATE_EVENT_TYPE_WATCHDOG:
> +        qmp_watchdog_set_action(pair->u.watchdog.action, NULL);
> +        break;
> +    default:
> +        /*
> +         * The fields in the RunStateAction argument are validated
> +         * by the QMP marshalling code before this function is called.
> +         * This case is unreachable unless new variants are added.
> +         */
> +        g_assert_not_reached();
> +    }
> +}
> +

Any reason not to have the multiple optional arguments as discussed in 
v1 (no reply usually means you agree)?  The implementation would be 
nice, like

     if (actions->has_reboot) {
         reboot_set_action(actions->reboot);
     }
     etc.

?

Note that, in patches 1-2, you don't need to add an Error** argument to 
functions that cannot fail.

Thanks,

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA96F174B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:11:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psMwZ-00060I-8m; Fri, 28 Apr 2023 08:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMwK-0005zt-9R
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:11:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMwF-0003be-As
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682683856;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pucO7epSP7Q4ekItW88JrQNZgS7/+SLrdKMFrKO3e50=;
 b=hehe0/pQAismR0+jrysdAC6Rvr4tFvFtTFPL0TNBcQ2+rUknZLWafmUxQ/GfxqxT63PSOk
 PtX3cZjP8Cpdnuyyyi+C261teRXjgI+fl+0FgQh+tc1qFHmDm8SdECKDBlOjIkQiHzL5ot
 vJCjPjCCsyoSnu0C9h2CVrdV4TrKuO8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-UsY58S-PMemWjWwsHFWksQ-1; Fri, 28 Apr 2023 08:10:52 -0400
X-MC-Unique: UsY58S-PMemWjWwsHFWksQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f19517536eso32827515e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 05:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682683850; x=1685275850;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pucO7epSP7Q4ekItW88JrQNZgS7/+SLrdKMFrKO3e50=;
 b=ioAwsYP6ZhfJBTahwF1Ccz1vRmFi08usgNn4hftLxrvgfXxNUpBcuJpwWjh28IK8vd
 isKVwyF7KwLSgkrHV/xpvabaV+29mEBzSgc/UacEX+cfFiZEl7gRJkppuO/fAdAGGNWZ
 1dpU4KnKzZ6fBk4MSOPxu77PHbVN1BKTIu119olyEuwUbXJHF304cCsufH3G/CawuWHn
 Q97Fi9f8uJTzdlNGu+HN05UkXvQI61NCMiHpPmAlQ19p2ITZB3c2R+bFwPxsrYsV8CZ2
 Bi2qrrMKbQo4Fi9Z0K0IG6113kRbJ+X3ciEvYMZTRfLfJi/0FukFdzvw1C6tMNTOFR8Q
 dZdA==
X-Gm-Message-State: AC+VfDzOiYiHGyER1fY481zP1RvAfIwjPl9UwuI+6SMSBqrtZjlMYOKZ
 Ytf+ziRywq3yx06UpgTQCouWi9Q/f/8+UjxJgeq+6EOwhdP75skcHk04Rr1aXC84Q59wWsvKZP8
 5voyXMT7dTjn/tJA=
X-Received: by 2002:a05:600c:24cd:b0:3f1:92e8:a6fe with SMTP id
 13-20020a05600c24cd00b003f192e8a6femr3933633wmu.31.1682683850586; 
 Fri, 28 Apr 2023 05:10:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7PwWPxoWSvBTR2NBjP750O2ouwxsOekKuWWg7o/IcJ6NKUPUbA+8uPocz4ZEplIKQDy6GqAg==
X-Received: by 2002:a05:600c:24cd:b0:3f1:92e8:a6fe with SMTP id
 13-20020a05600c24cd00b003f192e8a6femr3933611wmu.31.1682683850347; 
 Fri, 28 Apr 2023 05:10:50 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c365500b003f182a10106sm24298056wmq.8.2023.04.28.05.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 05:10:49 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 06/13] ram.c: Call update_compress_thread_counts from
 compress_send_queued_data
In-Reply-To: <d32e80847f7e809c0a905149e3a2745384fde98d.1681983401.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Thu, 20 Apr 2023 11:48:10 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <d32e80847f7e809c0a905149e3a2745384fde98d.1681983401.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 14:10:48 +0200
Message-ID: <87jzxwb41j.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lukas Straub <lukasstraub2@web.de> wrote:
> This makes the core compress code more independend from ram.c.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I haven't looked all the series yet

> @@ -1575,15 +1577,8 @@ static void flush_compressed_data(RAMState *rs)
>          qemu_mutex_lock(&comp_param[idx].mutex);
>          if (!comp_param[idx].quit) {
>              CompressParam *param = &comp_param[idx];
> -            len = send_queued_data(param);
> +            send_queued_data(param);

but it appears that send_queued_data don't need to return anything now.



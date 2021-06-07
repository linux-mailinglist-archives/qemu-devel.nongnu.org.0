Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7839D8CF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 11:31:59 +0200 (CEST)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqBby-0000sn-2e
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 05:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqBa9-00080k-Mm
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 05:30:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqBa7-0003dL-A7
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 05:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623058201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qhipt81FtNyyQCPk5RwxunI4IZboMI/pxbp4lI1nqm8=;
 b=DLzCHCIyZCq3ifIq0XccipPv6/9X2eLtj5lKb73X8auiC6GoANziJIHxcXTgX8V1ar+JTB
 PjdT1VaYtrpUTRPXtFrjyA3GYd+aZ1dhZ8NY7BTHuHYYpSiOQAdrPORAnUvz7CGdAEL3aw
 +BFimcQ63rl8G2orHZ4gxcfGQnATNbw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-BNGeY9xGPnyrQTCBw_kA5w-1; Mon, 07 Jun 2021 05:30:00 -0400
X-MC-Unique: BNGeY9xGPnyrQTCBw_kA5w-1
Received: by mail-wr1-f71.google.com with SMTP id
 d5-20020a0560001865b0290119bba6e1c7so3622224wri.20
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 02:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qhipt81FtNyyQCPk5RwxunI4IZboMI/pxbp4lI1nqm8=;
 b=YmdosXftQBbNfd7GZoVh6tege8AF2/4TJ4MiQEnZ/33AtXMqfoLSZGs9ooTzUrIsZ7
 jG3ReyZFGWTTYvT6uVpwKetaYVqL4Ww36xbbsDbt0xcD0rQ30eCHGIhWOhGspk/TECQ6
 PJRA0AFrAOmMBq39yUyEx7YkQpDUN8Tjjp9VVT2X9qRhkQjnnOd965AO6HBBOqpnS2m9
 y3++0EVk0LG1RNZrDLwOw7LK/GbQHDVom/GCnLD4xr4B100De8shcStGG77fGdBODky7
 Lc6tLmUVVzPnsSV98doLcOFVPlz9PIGOpYaaThuGUwhFp4eVl46gLYj6E24FiT1A5FWl
 ElMw==
X-Gm-Message-State: AOAM533EqGQJEu8SVw2ISCMauNUDDaHs6XqgRLU+Vgoj5zGCMpRhTaEw
 zU/xTDyLxymTG4rUWHv1ir95wllMk7sEM7NR2ykc4/lb9hJE1hh6WYwqbzq2k6k2BN9nYhxUTKt
 cAYo5P5DfAXBlWLw6ruDByLjlZDaEpIJiSr77NxYLZHvMUGnjVstuQfIUEedjjzV42vw=
X-Received: by 2002:adf:fac6:: with SMTP id a6mr16646981wrs.251.1623058199019; 
 Mon, 07 Jun 2021 02:29:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ8SNX8dYem6JYfXlU+eKy+cWA88mHeVQxhpSNTIqzEHDzojvUaOrjCOM/uMoRrAr5DpSxdA==
X-Received: by 2002:adf:fac6:: with SMTP id a6mr16646961wrs.251.1623058198784; 
 Mon, 07 Jun 2021 02:29:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id q5sm15547498wrm.15.2021.06.07.02.29.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 02:29:58 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] blkdebug: protect rules and suspended_reqs with a
 lock
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210604100741.18966-1-eesposit@redhat.com>
 <20210604100741.18966-7-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <88a81cbc-fbe7-08b6-f6f0-5a050dfc89f2@redhat.com>
Date: Mon, 7 Jun 2021 11:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604100741.18966-7-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/21 12:07, Emanuele Giuseppe Esposito wrote:
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        new_state = s->state;
> +        QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
> +            process_rule(bs, rule, actions_count, &new_state);
> +        }
> +        s->state = new_state;
>       }
>   
>       while (actions_count[ACTION_SUSPEND] > 0) {
>           qemu_coroutine_yield();
>           actions_count[ACTION_SUSPEND]--;
>       }
> -
> -    s->state = new_state;

This changes the semantics by moving the state change *before* the yield 
instead of after:

- before the series, the new state was assigned after all yields (and 
could be overwritten by other coroutines during the yield).  Until patch 
4, the situation is more or less the same even though the ordering 
changed in the processing of actions (suspend actions are processed last).

- with patch 5 new_state became a local variable, so it couldn't be 
overwritten by the yields

- now it is a local variable and is assigned before the yields.  The 
yields can write s->state just like before.

So it's a bit messy.  Moving s->state = new_state before the yields 
makes sense, but I'd do that in patch 5 to avoid the temporary change in 
semantics.

Paolo



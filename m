Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BFB2FD040
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 13:39:51 +0100 (CET)
Received: from localhost ([::1]:39664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Cm6-0006Ml-Hl
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 07:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Ck0-0005wC-PH
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:37:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Cjy-0003PW-2c
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611146255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2JWxDsOc8rPD0AlxKRsi8aN+qBVrhRDzFUyO/6snqU=;
 b=YZTMHJxM00uDf+dWkn0RItDT5U3y7pt3NoBQNKwl5F0hdOUXJCuJeUua188TMpubrjiRx3
 /T3YgXxaE5Io4kKnlQCEnlLoNZJZzjrEKpcM1m6sLpCYqh8+YBgDHQ1vuFKTeLEuZcQiY1
 LkceYwxzfdY9Hrjsfga+Go0oYgDKbQo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-S8BFp4LcPoi-VY3ijGlXTA-1; Wed, 20 Jan 2021 07:37:33 -0500
X-MC-Unique: S8BFp4LcPoi-VY3ijGlXTA-1
Received: by mail-ed1-f72.google.com with SMTP id dg17so10769297edb.11
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 04:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N2JWxDsOc8rPD0AlxKRsi8aN+qBVrhRDzFUyO/6snqU=;
 b=sfi8Z8Nc9WY6DRNxzWK7UWcMhXhOmpH4lVNGciTY6DJxzzYXkuwBiEjYC6EsKYBN9x
 RgkXd9vhg7hY0HLCS4FUehVgiKq6WQzBJRwg0WMGhiTAgS5bqhj970KBCl18xCzj/9X4
 chToApOhjUc4m7cWWCoiPODmYNFw9/28/vXGEbzdvWx3pWwkmgq3/iWpVcHm9x4k6lT1
 Sqtw01wUfj/36TlEjRGQLbakX6fmKK6eggKXVxHPIofbDayXPtjl7JpBuDLjPoPpzyAn
 w5ARNPIEZbI6mZSJF+CI+aZx3EFJZRzGKcTcdZEgnmKW5Sfkx7ro6bXmHEdsqBL6K/YI
 hP4g==
X-Gm-Message-State: AOAM533nS1txQ26tzn8Z9RptkitlbuUgD4P7yNAVuzYwEi8S8qMGDWqC
 iCKDxUd3YZNP1dcV9fhtqgzGvQAb3gD54jy1Yk8Yp7ufrIBCClZBQBvDYKXge5Ou514iXC0Y6D4
 4p5258InPWdbGeisb91faC21JsJjf2485CnShaBuMHnt6p8y5piGSbMMv7btu/67H2qY=
X-Received: by 2002:a17:906:99c5:: with SMTP id
 s5mr6061726ejn.236.1611146252237; 
 Wed, 20 Jan 2021 04:37:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiVVq/0c4SzjId2kDbQnEt7Bp1wB4DJ1Lj6K/uJC552J7kyy52sYOUsU4ArvR7yDoGVSDYqQ==
X-Received: by 2002:a17:906:99c5:: with SMTP id
 s5mr6061707ejn.236.1611146252005; 
 Wed, 20 Jan 2021 04:37:32 -0800 (PST)
Received: from [192.168.1.124] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id g2sm834274ejk.108.2021.01.20.04.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 04:37:31 -0800 (PST)
Subject: Re: [PATCH 01/25] qemu-option: clean up id vs. list->merge_lists
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-2-pbonzini@redhat.com>
 <87y2gpxc2q.fsf@dusky.pond.sub.org>
 <0802f4d3-f9b1-540f-b83a-977c01ce8f62@redhat.com>
 <87eeigqbkk.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <890ad395-ba63-b5d4-c404-a3a7430bb894@redhat.com>
Date: Wed, 20 Jan 2021 13:37:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87eeigqbkk.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/21 09:03, Markus Armbruster wrote:
> The detour should be avoided, because QemuOpts should be avoided.  Using
> the appropriate visitor, we get:
> 
>          char *optarg
>               |
>               |  v = qobject_input_visitor_new_str(string, NULL, errp)
>               |  visit_type_q_obj_set_action_arg(v, NULL, &arg, errp);
>               v
>    q_obj_set_action_arg arg
> 
> except visit_type_q_obj_set_action_arg() doesn't exist, because the QAPI
> type is anonymous.  So give it a name:
> 
>      { 'struct: 'Action',
>        'data': { '*reboot': 'RebootAction',
>                  '*shutdown': 'ShutdownAction',
>                  '*panic': 'PanicAction',
>                  '*watchdog': 'WatchdogAction' } }
> 
>      { 'command': 'set-action',
>        'data': 'Action',
>        'allow-preconfig': true }
> 
>          char *optarg
>               |
>               |  v = qobject_input_visitor_new_str(string, NULL, errp)
>               |  visit_type_Action(v, NULL, &arg, errp);
>               v
>           Action act
> 
> To avoid having to pass the members of Action to qmp_set_action(), throw
> in 'boxed': true, so you can simply call qmp_set_action(&act, errp).

Ok, so the idea of a 1:1 CLI<->QMP mapping is good, the implementation 
is bad.  The reason it was done with QemuOpts was mostly to have 
"-action help" for free.  Something to remember when working on 
autogenerated boilerplate.

Paolo



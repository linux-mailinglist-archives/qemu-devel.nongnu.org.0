Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A42441CC2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 15:39:11 +0100 (CET)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhYSs-0008Tk-E8
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 10:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mhYRr-0007lp-VV
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mhYRo-0001PL-Un
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635777481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQnicrQ5bFOXGQoxQ6aRz2rQLPQLpiDbIGNC4fxE/ic=;
 b=cp1qylBIg/0yGrhPe/fz0AkDIZnLxzF+OkQcLpcm7d6qZ3pcZcrHhBiC9bqxfyeD+D7vGx
 MMORf86xs4ZeqvYk/sL5tIhiGlVZB8amZI7xYX7kKrgzQW+xOUt1eeYe8aPDBuM30cMVrR
 vpglQmwkWQxoX7KXlZcP515jXZqavtU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-sgkx28m4M_qUbDGngV2m0Q-1; Mon, 01 Nov 2021 10:38:00 -0400
X-MC-Unique: sgkx28m4M_qUbDGngV2m0Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 o22-20020a056402439600b003dd4f228451so15721449edc.16
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 07:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JQnicrQ5bFOXGQoxQ6aRz2rQLPQLpiDbIGNC4fxE/ic=;
 b=7x3S55iNQ7hV35yo0yLCbLVQ41FLGuVXBWhAE7pR4BVmPhZkwBdU5Xdgm/upbBPF3w
 kObvt37vcvdJSK2gbnk1oCiUZIdfwHRHnq9JJyxGwHtRbJGUkPfY5oObpkS1BqLYdhvf
 P5kRegw6QEyhYfTmaIYaNQxDrFpaiy39VCMDX/uSb57eJ4rKeCsnPBZc1ek20RQbOFti
 VYHk1qAdW1yYqX2k9WdnOYiEkmBIfN/ib4a10NK+77xuw8qzYKdrDKfOqHZ0hf9/xejg
 f0fiNqxq+DcM51/k5s9618TDuI+4vIeLOQe/davymZkJTpaauW7RRD/TpiLEa1kskhLn
 3z1g==
X-Gm-Message-State: AOAM530olbvkEPr+JPiKxUZ2pJ3Shh+Rns3SlXUOBxEneJK1OPrbd/g9
 UJXGdYqscQXhAWXMYPeaFIG+6jpjQXpCyXLYnlDJGqoOqBUtb+R4Ai05QjJLpZGuQonoQrRCHxw
 KjriwlehvZQMO+6JJmh3VjT9D12BlbSb6aB8xaSKk8vAsXTj/QPzIpahtE5T65tWUGHw=
X-Received: by 2002:a50:e183:: with SMTP id k3mr42148463edl.22.1635777479249; 
 Mon, 01 Nov 2021 07:37:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdzDE06AIcGGd6DpdJBJdh7gYBSYyzQ0kUOhOg3IpTtoSKICI3VREU4kjlBfK0q1QMLsf4OQ==
X-Received: by 2002:a50:e183:: with SMTP id k3mr42148430edl.22.1635777478979; 
 Mon, 01 Nov 2021 07:37:58 -0700 (PDT)
Received: from [10.43.2.27] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id m15sm9878982edd.5.2021.11.01.07.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 07:37:58 -0700 (PDT)
Subject: Re: [PATCH] qmp: Stabilize preconfig
To: Markus Armbruster <armbru@redhat.com>
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Message-ID: <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
Date: Mon, 1 Nov 2021 15:37:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87bl3dfg9v.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 2:19 PM, Markus Armbruster wrote:
> Michal Privoznik <mprivozn@redhat.com> writes:
> 
>> The -preconfig option and exit-preconfig command are around for
>> quite some time now. However, they are still marked as unstable.
>> This is suboptimal because it may block some upper layer in
>> consuming it. In this specific case - Libvirt avoids using
>> experimental features.
>>
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> 
> If I remember correctly, the motivation for -preconfig was NUMA
> configuration via QMP.  More uses may have appeared since.
> 
> Back then, I questioned the need for yet another option and yet another
> state: why not -S?
> 
> The answer boiled down to
> 
> 0. Yes, having just one would be a simpler and cleaner interface, but
> 
> 1. the godawful mess QEMU startup has become makes -S unsuitable for
>    some things we want to do, so we need -preconfig,
> 
> 2. which is in turn unsuitable for other things we want to do, so we
>    still need -S".
> 
> 3. Cleaning up the mess to the point where "simpler and cleaner" becomes
>    viable again is not in the cards right now.

I see a difference between the two. -preconfig starts QEMU in such a way
that its configuration can still be changed (in my particular use case
vCPUs can be assigned to NUMA nodes), while -S does not allow that. If
we had one state for both, then some commands must be forbidden from
executing as soon as 'cont' is issued. Moreover, those commands would
need to do much more than they are doing now (e.g. regenerate ACPI table
after each run). Subsequently, validating configuration would need to be
postponed until the first 'cont' because with just one state QEMU can't
know when the last config command was issued.

Having said all of that, I'm not sure if -preconfig is the way to go or
we want to go the other way. I don't have a strong opinion.

Michal



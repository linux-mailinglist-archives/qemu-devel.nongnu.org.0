Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA96944C1B1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:56:47 +0100 (CET)
Received: from localhost ([::1]:39888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkn9j-0002li-4D
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:56:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mkn83-0000FN-Qy
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:55:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mkn82-0004Yv-5j
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:55:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636548901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQkjO4BySU3cS7aiJMdCZ3OXdC34FX2tzmZztXT9HjM=;
 b=LMIgqpMhBVdvlX03qVMBmioiM/BLluTdLtvJLQGDL+1FgLMuoFUoJlyAiZk1cAW+pvGPe2
 BNPP+fnb5fgmref3rxrP9QgZ8eN6TT2bei7dmPL+X5/GZah2mRQJgwh+eoKQVhFHUHFW3z
 ghmFc00jPEbbmHYmWkja24Vh2qVmiD0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-WtW4dSgPNXipgheeDQLZLw-1; Wed, 10 Nov 2021 07:54:59 -0500
X-MC-Unique: WtW4dSgPNXipgheeDQLZLw-1
Received: by mail-ed1-f71.google.com with SMTP id
 m8-20020a056402510800b003e29de5badbso2210391edd.18
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 04:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YQkjO4BySU3cS7aiJMdCZ3OXdC34FX2tzmZztXT9HjM=;
 b=ANen5ncLCgGtPL+XDunui6Ilch6M4D5wNJo7yaXZJz8nZTWiI03JI6ITGRJtFlqWka
 LYhVzOjKEYWjzGkrpXYa9jXSfc/dXHt2erY61dYvRLbxlxNqEe8Po8tLw97ZqIDxj+pj
 IbQTPg1caxTjHQem2swwwTHuw80nZoC58RHbcybkukmw6q78RW+4caGIRbeMnqekxNrX
 XIkRUMALHfM2TcLpT52yTA5ALH2zA9D6mv0gupqmwGERb+0EI+duptxL8Hov1N78LSBy
 4E+HpK+dbOsF2AQicIY/5A1G5/wlrLqad8D9Mtb1KtsiMeNsnvFBuFcAoYcuwpuh2Uak
 R5mg==
X-Gm-Message-State: AOAM532a20/NgIwnS93Vak0mjBuJqsEqM7FF7UBd+w99bJLeQxO07ly0
 KLPp5ohw1sC9MGonxHBpWSxa8SiFtvR0pU9dNLi8fv5St6OEj8+8T8ZIgLFIXkTSuhCVcamcxRr
 mF5EplxQGbvsXg9w=
X-Received: by 2002:a05:6402:11cb:: with SMTP id
 j11mr20912490edw.134.1636548898713; 
 Wed, 10 Nov 2021 04:54:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxew+PGAASRehExt9OZFC/OxU+iCaY96BOfUtXboqox76atW++NHEU8WGoGfkNOae6pQF1NKg==
X-Received: by 2002:a05:6402:11cb:: with SMTP id
 j11mr20912461edw.134.1636548898512; 
 Wed, 10 Nov 2021 04:54:58 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id di4sm11345507ejc.11.2021.11.10.04.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 04:54:58 -0800 (PST)
Subject: Re: [PATCH] qmp: Stabilize preconfig
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
 <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
 <YYAATW1JQmzpDPhu@redhat.com> <87zgqlzmxi.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Message-ID: <40bc6df2-496f-b303-2c10-f28ab4f9608c@redhat.com>
Date: Wed, 10 Nov 2021 13:54:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87zgqlzmxi.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 9:02 AM, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Mon, Nov 01, 2021 at 03:37:58PM +0100, Michal Prívozník wrote:
>>> On 10/25/21 2:19 PM, Markus Armbruster wrote:
>>>> Michal Privoznik <mprivozn@redhat.com> writes:
>>>>
>>>>> The -preconfig option and exit-preconfig command are around for
>>>>> quite some time now. However, they are still marked as unstable.
>>>>> This is suboptimal because it may block some upper layer in
>>>>> consuming it. In this specific case - Libvirt avoids using
>>>>> experimental features.
>>>>>
>>>>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>>>>
>>>> If I remember correctly, the motivation for -preconfig was NUMA
>>>> configuration via QMP.  More uses may have appeared since.
>>>>
>>>> Back then, I questioned the need for yet another option and yet another
>>>> state: why not -S?
>>>>
>>>> The answer boiled down to
>>>>
>>>> 0. Yes, having just one would be a simpler and cleaner interface, but
>>>>
>>>> 1. the godawful mess QEMU startup has become makes -S unsuitable for
>>>>    some things we want to do, so we need -preconfig,
>>>>
>>>> 2. which is in turn unsuitable for other things we want to do, so we
>>>>    still need -S".
>>>>
>>>> 3. Cleaning up the mess to the point where "simpler and cleaner" becomes
>>>>    viable again is not in the cards right now.
>>>
>>> I see a difference between the two. -preconfig starts QEMU in such a way
>>> that its configuration can still be changed (in my particular use case
>>> vCPUs can be assigned to NUMA nodes), while -S does not allow that. If
>>> we had one state for both, then some commands must be forbidden from
>>> executing as soon as 'cont' is issued. Moreover, those commands would
>>> need to do much more than they are doing now (e.g. regenerate ACPI table
>>> after each run). Subsequently, validating configuration would need to be
>>> postponed until the first 'cont' because with just one state QEMU can't
>>> know when the last config command was issued.
> 
> Doesn't all this apply to x-exit-preconfig already?
> 
> * Some commands are only allowed before x-exit-preconfig,
>   e.g. set-numa-node.
> 
> * The complete (pre-)configuration is only available at
>   x-exit-preconfig.  In particular, ACPI tables can be fixed only then.

So why was preconfig introduced in the first place? I mean, from
libvirt's POV it doesn't really matter whether it needs to use both
-preconfig and -S or just -S (or some new -option). But ideally, we
would start QEMU with nothing but monitor config and then pass whole
configuration via the monitor. I thought it would be simpler for QEMU if
it had three states.

Michal



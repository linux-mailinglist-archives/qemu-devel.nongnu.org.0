Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA0628F54
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:33:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouioW-0000T6-Ur; Mon, 14 Nov 2022 18:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifZ-0003YX-Bv
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouYIW-0007Ec-UT
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 07:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668427844;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eRlGQ3FI024ld5OeYFJByRMe7ZbfFnJfS8DDsY678U=;
 b=QQ1EqB7nsgPifBf2VkQCLA6GmuIJzgEzPLXb35PLtc+3VHntRVJlePkezBtbdmmQ2aKEO2
 SDYNEtUfJ+aTBny/EFFY6ZQmTtA9D7KtuuJmXtVUFf1BSCV0BBYeUMppOaz3fr3VyAg1/j
 jIrI/kKbQbnVGWCSuMEUkMf8ZKGmiXg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-UXj9UaAJO8CP5C36lt97rw-1; Mon, 14 Nov 2022 07:10:41 -0500
X-MC-Unique: UXj9UaAJO8CP5C36lt97rw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r22-20020adfa156000000b0023660e969ddso1922480wrr.19
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 04:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8eRlGQ3FI024ld5OeYFJByRMe7ZbfFnJfS8DDsY678U=;
 b=XGXY6LWzQ3gF0PTusPJiZ8cmTOSGQ+QDpZIergu0foz6WZYRrtxN/RgSC7XBFYeHGa
 GY1eDvNZk+fForlpVq68Br9QsIxcN4zzY1uboCXXkKp5ioP3DTC/hT8BVgOX8kH60J1J
 +3Ya6i3e3uKOkmcrgZpIkvd3afDctNQQMJ+9JMomUtrcMyee/122lzwlQX6S36Euweyy
 Q4Ne2pYMpP9Hvu8k0C1W0DryuCmKUhi18jGmLp8XibHsltLkWEFert/3jaCPzJr1mBZk
 kRPbKYOnRewRSipJG/hrWawPrOHIxp8LsscpsQWXkiiJP6MDluJe+ahDhoM3GPgnM/Rk
 q+2g==
X-Gm-Message-State: ANoB5plqkcUBUwS2e6IZ7jwk8jojnN82nc319lvP+DCeFnRAowTyeASR
 J/Gfo/uN7hU+RMPiqpPSJ8FLJeF34BjPDZxNfuBlGFV8s0bMHoPKV4CrplHrQh5xGJ5j+iipH9l
 9TSkn/h+FhCa7nMo=
X-Received: by 2002:a5d:6204:0:b0:236:61bb:c79d with SMTP id
 y4-20020a5d6204000000b0023661bbc79dmr7089228wru.632.1668427839867; 
 Mon, 14 Nov 2022 04:10:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5xyORcJfnG2xakyZw4KW3GCqatLIg0I8E5MuwAz6cniAHLmUQ6SNaxMVnMb4e8FIZhysFgeQ==
X-Received: by 2002:a5d:6204:0:b0:236:61bb:c79d with SMTP id
 y4-20020a5d6204000000b0023661bbc79dmr7089218wru.632.1668427839698; 
 Mon, 14 Nov 2022 04:10:39 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 e8-20020adffc48000000b00236863c02f5sm9230290wrs.96.2022.11.14.04.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 04:10:39 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: chuang xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>,  Peter Xu <peterx@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Yanan
 Wang <wangyanan55@huawei.com>,  Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v7 10/12] multifd: Support for zero pages transmission
In-Reply-To: <87fbac44-3862-85b6-8070-fc0c5845df61@bytedance.com> (chuang xu's
 message of "Tue, 25 Oct 2022 17:10:46 +0800")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-11-quintela@redhat.com>
 <87fbac44-3862-85b6-8070-fc0c5845df61@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 13:10:37 +0100
Message-ID: <87cz9p68jm.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

chuang xu <xuchuangxclwt@bytedance.com> wrote:
> On 2022/8/2 =E4=B8=8B=E5=8D=882:39, Juan Quintela wrote:
>> This patch adds counters and similar.  Logic will be added on the
>> following patch.
>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>

>>           sync_needed =3D p->flags & MULTIFD_FLAG_SYNC;
>>           /* recv methods don't know how to handle the SYNC flag */
>>           p->flags &=3D ~MULTIFD_FLAG_SYNC;
>>           p->num_packets++;
>>           p->total_normal_pages +=3D p->normal_num;
>> +        p->total_normal_pages +=3D p->zero_num;
>
> Hi, Juan:
>
> If I understand correctly, it should be "p->total_zero_pages +=3D
> p->zero_num; ".

Very good catch. Thanks.

That is what rebases make to you.

> By the way, This patch seems to greatly improve the performance of
> zero page checking,=C2=A0 but it seems that there has been no new update =
in
> the past two months. I want to know when it will be merged into
> master?

I am resending right now.

Later, Juan.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B334434249A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 19:26:59 +0100 (CET)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNJpq-0004Om-Pm
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 14:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNJoi-0003qH-3p
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 14:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNJof-00018v-BF
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 14:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616178344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xTszQDoi+SixteNsdkdawq8WqwTVWSFA1OVPhuVMoNM=;
 b=e83UhujyLEc/NMVS+eMpYQArhyr15bJ4sSqgiVd970T2FTtDKzwVcZxG+MO5vduuus/OYG
 gLz4MqJfrc91FuKc1Q3zIAOCnRHc5vnkylrUwNdFTbMnWe6fXIv7L5qinX4Jas6lLgmUCY
 aXNgiLTozOXN1uVyVmMcXfeqAG6SxGo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-ewXD0vGCP1ief61r0JsNag-1; Fri, 19 Mar 2021 14:25:42 -0400
X-MC-Unique: ewXD0vGCP1ief61r0JsNag-1
Received: by mail-wr1-f72.google.com with SMTP id z17so22183679wrv.23
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 11:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xTszQDoi+SixteNsdkdawq8WqwTVWSFA1OVPhuVMoNM=;
 b=cTvBH/HLDuXCAgoxztObUd2gu51XtVH/DhxA3OL+AMGCSm9l5IFZQmVTM5Dk5bZcGw
 xiWjJgFpTVpSKLKT6zfd24P/gGfx8i3IC9uk5o/8IzuON6sO7mDtMjgyD0qlEWoeDAZc
 sYXMFnsXTIk6h7UJB4LrhrSJvwWoVasqiYXDN9ftPv4CqhB5lttANYRY1GeMQ1lsAjBX
 XwU8+tWaBqlZQjaQKFbJWV3TuMpJzUETADZwBocBPeDwey2CLsYvNBnTQ7lFMxXsRuOU
 uNHkL2dt78Ozk4SB3xZnuHcdV4fskuiutISzpvXHiHKBIqA3gySdwPWabSIlrKQqIPs1
 wb6A==
X-Gm-Message-State: AOAM532y2WWL2cCcET77pifURx1mRvrOldT6UWjN9U4eWQhQVWZnED1i
 XJUBTUwvOHVTIHo79YVaLM0/WdoC0bepCFsfq5q/xIh7Y17yWHqVnJULYDmjZeTNAcqEuZN9YnJ
 /ZjrK84RfaUgq87M=
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr5797682wrw.277.1616178341206; 
 Fri, 19 Mar 2021 11:25:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB+z1ryggjGZLVpfnat1tQj08B/DCGmxDJD2vWei8Bw+Ds+AP3l/EmhCeA/PuM/2sBQ8cnIQ==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr5797661wrw.277.1616178340972; 
 Fri, 19 Mar 2021 11:25:40 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id e13sm10989765wrg.72.2021.03.19.11.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 11:25:40 -0700 (PDT)
Date: Fri, 19 Mar 2021 19:25:38 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
Message-ID: <CAGxU2F7hNoJeDpsCtU0ypKd=3+3mrxcc3QU6Yx9SK9e_7y6Khw@mail.gmail.com>
References: <1549390526-24246-1-git-send-email-pbonzini@redhat.com>
 <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
 <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
 <f33bf6fa-1fa3-4e33-bd8e-843bec2d5638@redhat.com>
 <20210319173524.rnrxslpmdjck6uxv@steredhat>
 <CABgObfZHP1aSMpbdWh6TwCN_D5gy5TS5+Q7-La8d7E5czvn7Rg@mail.gmail.com>
 <20210319182022.veha5gbcg3p4idgk@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210319182022.veha5gbcg3p4idgk@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 7:20 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Fri, Mar 19, 2021 at 06:52:39PM +0100, Paolo Bonzini wrote:
> >It's likely that the compiler will online it. But indeed it's better to add
> >-minline-all-stringops to the compiler command line.
> >
>
> Cool, I didn't know that one!
> I tried but I did something wrong because the linker is not happy, next
> week I'll check better:
> ld: pvh_main.o: in function `search_rsdp':
> /home/stefano/repos/qemu/pc-bios/optionrom/pvh_main.c:62: undefined reference to `memcmp'
> ld: /home/stefano/repos/qemu/pc-bios/optionrom/pvh_main.c:62: undefined reference to `memcmp'
>
>
> In the mean time, I simply tried to assign the RSDP_SIGNATURE macro to
> an uint64_t variable and I have this new warning, using gcc 10.2.1 "cc
> (Alpine 10.2.1_pre2) 10.2.1 20210313":
>
> In file included from /tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c:25:
> /tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
> /tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c:30:42: warning: conversion from 'long long unsigned int' to 'uint64_t' {aka 'long unsigned int'} changes value from '2329016660419433298' to '541348690' [-Woverflow]
>     30 | #define RSDP_SIGNATURE          UINT64_C(0x2052545020445352) /* "RSD PTR " */
>        |                                          ^~~~~~~~~~~~~~~~~~
> /tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c:69:31: note: in expansion of macro 'RSDP_SIGNATURE'
>     69 |     uint64_t rsdp_signature = RSDP_SIGNATURE;
>        |
>
> Using gcc (GCC) 10.2.1 20201125 (Red Hat 10.2.1-9) I don't have it.
>
> It seems a bit strange, I don't know if it's related to the fact that we
> compile with -m16, I'll check better.

Anyway I think that using memcmp() I can switch to a character array to 
store the signature, but this gcc warnings confused me a bit...

Stefano



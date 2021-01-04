Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DC02E9C5E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:51:04 +0100 (CET)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwU0U-00068K-Gn
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwTzB-0005Ue-7W
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:49:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwTz6-0008UT-Ck
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609782575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Po9p9+IvhD5H+l+Dm9n8x1nIioDhuZtXJlbL6hvOp0=;
 b=TSSuJ7mxQUUbHrbQwMn6B3sWWbTB5XKY4c+cxzcCUZpqXpr2fMEizidfqnr4C2TXYrgIvk
 xmvJGEJkXOjN4psRGg1Xk8p8HFF/ve8CLGdHLUgaMISFpibhIFfYChy7VcF2SuusMXh/KF
 oBBfEDAV/bPjYwW5vtUbSLg3gu3/hHc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-2HVHDlarPceDxyHgZGG7Rg-1; Mon, 04 Jan 2021 12:49:33 -0500
X-MC-Unique: 2HVHDlarPceDxyHgZGG7Rg-1
Received: by mail-wm1-f71.google.com with SMTP id l5so10776wmi.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 09:49:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Po9p9+IvhD5H+l+Dm9n8x1nIioDhuZtXJlbL6hvOp0=;
 b=s495U8ioY0bFIFg9nG8B/+Th0yNwsCl4SQJsnniYDI9y4/Q3LSKJrFbEtCZJOHzevt
 /FOVJWl2L2qCFAV4ocxvNKNnkuuvrQ7GAifeNupAx0biUGp6HrcS2P/jHci7IYGLFSck
 1E+8wIIZHKrdkju5K8BySXz5YsXKearTsAG2PniTBG1JXAT0dmNP3wKAOuO7KyyV0Flb
 se2LoHMVkG3k8LnGZhYeVXEiWMqqfbG1L40o4II+UYEdfiuR3OVm4TyjTb5dRt2G+z69
 o/DKwZRVX2Gcvkmgop50AbjC4hwi3G98nygzEfemwmoItwQG1AYajW17Bj11XfbgTQNg
 pJLg==
X-Gm-Message-State: AOAM531ob375EYyEGBCB7Y5Oxtb4SnxOeiZRHiPXKLH4frsmfVUgaVKs
 96IHVmLeU9AjxiHXyV/nhRd720GlAoeVsSmIVR+AK2KVbQjx/Gz9Kizio+s3PdcTTiaURZNg18L
 5d1SVIyfyb3irpH4=
X-Received: by 2002:adf:f891:: with SMTP id u17mr82123726wrp.253.1609782571946; 
 Mon, 04 Jan 2021 09:49:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztFMar8oBlIZSCt59Vz6tzAlFGC80PKo9BYFxce1sNX0PAU5zRjnVqGIvcDKDFbwZ9B+AQxw==
X-Received: by 2002:adf:f891:: with SMTP id u17mr82123711wrp.253.1609782571729; 
 Mon, 04 Jan 2021 09:49:31 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i7sm94341704wrv.12.2021.01.04.09.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 09:49:31 -0800 (PST)
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <20210104122149.GH640208@redhat.com>
 <CAFEAcA_3nv2N7zY5kwGWPLRx2dY3KB8wMAFX-MMrk_kXK1SUVg@mail.gmail.com>
 <7493bddf-d915-8faa-5612-f14a3067a574@redhat.com>
 <CAFEAcA8e916+AU4Ebvie504AOoOBP8wZ8rC90=Hcws76wpkMTQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b9198e6f-fba6-921d-4530-dc257064809e@redhat.com>
Date: Mon, 4 Jan 2021 18:49:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8e916+AU4Ebvie504AOoOBP8wZ8rC90=Hcws76wpkMTQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/01/21 16:19, Peter Maydell wrote:
> On Mon, 4 Jan 2021 at 14:40, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 04/01/21 14:21, Peter Maydell wrote:
>>>> The rest of QEMU should only ever be using QEMU's TLS abstractions
>>>> and not directly be tied to GNUTLS. So ideally the gnutls flags
>>>> should only ever be added in the crypto/meson.build, and anything
>>>> which depends on that should then get the flags indirectly.
>>> Unfortunately include/crypto/tlscreds.h leaks this implementation
>>> detail
>>
>> That is not a problem.  As Daniel said, anything depending on crypto can
>> still get the gnutls flags _indirectly_.
>>
>> In my proposed solution to the bug you'd get that via
>>
>>       io_ss.add(crypto, qom)
>>       libio = static_library(..., dependencies: io_ss.dependencies())
> 
> Does this work recursively? For instance monitor/qmp-cmds.c
> needs the gnutls CFLAGS because:
>   * qmp-cmds.c includes ui/vnc.h
>   * ui/vnc.h includes include/crypto/tlssession.h
>   * include/crypto/tlssession.h includes gnutls.h
> 
> I don't see anything in monitor/meson.build that says "qmp-cmds.c
> needs whatever ui's dependencies are".

Hmm, I would have thought it would be handled, but Roman said otherwise. 
  I'll look into it, at worst we can fix Meson and temporarily apply 
Roman's patch until it makes it into a release.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C92ED439
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:26:00 +0100 (CET)
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxY6q-0002N5-1J
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxY4w-0001ol-L4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:24:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxY4u-0007OD-JM
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610036639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTqBZ0Kc65AWIZch9OjgI5W+G2W0w65TXuUHcjkQj4M=;
 b=DeETMrk3CzcPogE5NVGUDRrN3DLEKSv/6Wh2cz/gJdGHGBiy1TYTpRWY9Axs/Zt942hbQQ
 j7JteRVMQcYaA6K9Nn2be1NZ+Qg9TOGJAbe6/f6XHEw/bOjhp5p0gevKGew+qZqAhEvisp
 HbuwWrXS3bua72rg2vDbwPlH0qG7OMM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-m3RTRNAnO8qHJJsLQrT7Fg-1; Thu, 07 Jan 2021 11:23:57 -0500
X-MC-Unique: m3RTRNAnO8qHJJsLQrT7Fg-1
Received: by mail-wr1-f72.google.com with SMTP id i4so2846749wrm.21
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YTqBZ0Kc65AWIZch9OjgI5W+G2W0w65TXuUHcjkQj4M=;
 b=STyAp0YhaI4IjN8ZNnAQOLrTAGtHPwEOOolrj6Y/TUmkpgAmsq36tohCNJ72q5P5Va
 WkIgTbunpz347pFqgtJKma/nCHDjg3YlxguONhuPTAKofOB9VHQo/IzCTxVehCt/NxBN
 c7qkCGIPt1UXsYbINdWmgN6+a1WdnI7mzqnXXtFciyR75bVO+OcsVqBwgSO3bGcdymQ1
 VDn3DWsw4g8ju0e+wMtmejn+njfKKdsMA5gIFiEJcu0pI2LPdgTrG86wFwh2OAMcJlME
 /RoYksDn8MStt9W9JRAhQFmmdFMka2ZiIDub30cD2cVH+DuhuUvGtmTZCBtN69OrYKX/
 00Fg==
X-Gm-Message-State: AOAM532AGyLrhHjvUUZ4psDr6FMy/1BLgw4Wwpdfe74hFkwb2LA7C41f
 p6vMCIgyPph6pWFpjDyk+v5GS6Lrj30XmFG8DPlHdojDxXJlJVfHRudX7pz0v0M305B1TSTCvhX
 +JZ6kWG7rmqP24BU=
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr9747472wrw.249.1610036636631; 
 Thu, 07 Jan 2021 08:23:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7X8A+zcn8DHj/6wxydP1Cu+Rx27cyzSzGYFEBV6CVQpe85PK9Tg81Nxz0D+5URmb9vp04OQ==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr9747455wrw.249.1610036636442; 
 Thu, 07 Jan 2021 08:23:56 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b7sm8612000wru.33.2021.01.07.08.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 08:23:55 -0800 (PST)
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
 <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
 <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
 <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
 <690581da-9258-41e5-14cb-bb1b162e8993@redhat.com>
 <X/cvK5Xkh6+1Qn1K@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
Message-ID: <86bebbbf-ff0f-263d-96a2-4e6df9f85776@redhat.com>
Date: Thu, 7 Jan 2021 17:23:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X/cvK5Xkh6+1Qn1K@SPB-NB-133.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/21 16:56, Roman Bolshakov wrote:
> IMO duplication of dependencies shouldn't be needed for a build system.
> Meta build system should allow private and public dependencies. Different
> rules are applied to them. Private dependency is not propagated beyond a
> target that uses it, public dependency is propagated.
> 
> Right now it seems that meson is missing the notion of public and
> private dependencies and that's where the problem arises. The post [1] (and
> the related issue) summarizes what I'm trying to say.

Meson doesn't have a concept of public dependencies because it separates 
the private (static library) and the public (declare_dependency) view. 
That is you'd have:

public_deps = [gnutls, anotherpublicdep]
lib = static_library(..., dependencies: public_deps + [aninternaldep])
dep = declare_dependency(link_with: lib, dependencies: public_deps)

The real issue is that Meson's implementation of link_whole for 
library-in-library makes sense for one use case (convenience library 
that is linked into another convenience library) but not for another 
(grouping code for subsystems).  I cannot blame them for this because 
link_with is a more common case for the latter; OTOH QEMU is using 
link_whole a lot in order to support the *_init() construct.

I really think the correct fix is for Meson to use objects instead of 
archives for link_whole, similar to how QEMU Makefiles used to do it. 
This would also remove the need for the special .fa suffix, so it would 
be an improvement all around.

Paolo

> If we resolve the issue, then we just specify gnutls as a public
> dependency of crypto and all users of crypto would get gnutls headers.
> 
> Here's an example how clearly CMake approaches the issue [2][3]:
> 
> add_library(crypto OBJECT crypto-file1.c ...)
> target_link_libraries(crypto PRIVATE aninternaldep
>                               PUBLIC  gnutls
>                                       anotherpublicdep)
> 
> 1.https://github.com/mesonbuild/meson/issues/495#issuecomment-206178570
> 2.https://cmake.org/cmake/help/latest/command/target_link_libraries.html#linking-object-libraries
> 3.https://cmake.org/cmake/help/latest/command/target_link_libraries.html#libraries-for-a-target-and-or-its-dependents



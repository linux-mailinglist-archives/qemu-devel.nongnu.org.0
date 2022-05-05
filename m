Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B580D51C212
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 16:14:29 +0200 (CEST)
Received: from localhost ([::1]:51900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmcFQ-00051f-9u
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 10:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmcDN-0003jX-3W
 for qemu-devel@nongnu.org; Thu, 05 May 2022 10:12:21 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:27599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmcDK-0003Pc-Ot
 for qemu-devel@nongnu.org; Thu, 05 May 2022 10:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651759937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3Tyg/RoDj/9QGWUqcfQPndJvTKtHy/i+6ommI6LvGE=;
 b=W+ktWurf3Oxa8M4XFKyrrFLQvvvdEhJpFZo3nN+c92rAjA6VP7ACiSvjclccVgGSRowUF3
 /QZEeDR+DMZL/ZvcNtsjuIEPDpjDbczbR+lhuMOgjGMUnEgZ9QS3pBQwc4iw4agYLW6496
 KwvHEZHSdUbHpYP7XuMfOm0uEkjDbQU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-gBE8AODvPtChDwzKiJZ1ng-1; Thu, 05 May 2022 10:12:15 -0400
X-MC-Unique: gBE8AODvPtChDwzKiJZ1ng-1
Received: by mail-wm1-f71.google.com with SMTP id
 g3-20020a7bc4c3000000b0039409519611so1757134wmk.9
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 07:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f3Tyg/RoDj/9QGWUqcfQPndJvTKtHy/i+6ommI6LvGE=;
 b=25n+t7LzkGk97zs5OffxalptSbdau12pHVPevf9GmUgoA1kaKeLLeFcWcaAY4o99cP
 C5KCbCXl+WMDdeuVUkq+kQxU3uazL6t5MqZIZ583yqwT5P9Lf8rjXZbkNGoeyJHUB5Up
 RXPzxs570dGrUSokP/6RT8x9MN6xjMCArXBYcLYkverNGdgJrGn1XL8nty+TPQpfNIQw
 t/fhrVyCtxm3ua0aKdC55VmkB72K/ibzltKJwqJG4j/BgrIA2NHObUPNZP1iV7+7nVZ9
 hsh6jHrm3WRnrJt+iw8rhGjcvCOhlBlbH0N426wdHxvQB6e16p9NW9Nr6sdNqwmLOf/f
 vONg==
X-Gm-Message-State: AOAM533xa5oK5b6GRD7mb/6PxKISkg0bVX+wsssMZoY7Txf7cVScUjZh
 LYpKDlsJSs36/GazpvMoDlUXtI1ZXWhfyWvXDOYW92/BTiYvjqT6guCwee5UFQchtqY/POPFtVP
 nS05ATnPDvIeasxY=
X-Received: by 2002:a05:6000:18a1:b0:20c:4d65:393c with SMTP id
 b1-20020a05600018a100b0020c4d65393cmr20861627wri.639.1651759934582; 
 Thu, 05 May 2022 07:12:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4Ts3XtSxD6fb+hYugSS8b8yqZMlhoA1jGtCTZ3BPV41x8qlzGEp5+z0qKGbIf98RLXfdbHg==
X-Received: by 2002:a05:6000:18a1:b0:20c:4d65:393c with SMTP id
 b1-20020a05600018a100b0020c4d65393cmr20861601wri.639.1651759934298; 
 Thu, 05 May 2022 07:12:14 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 n1-20020a1c2701000000b003942a244eebsm1492667wmn.48.2022.05.05.07.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 07:12:13 -0700 (PDT)
Message-ID: <fb070833-d9d4-4842-8470-979cf7aa859d@redhat.com>
Date: Thu, 5 May 2022 16:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] docs/about: Update the support statement for Windows
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20220505074841.406185-1-thuth@redhat.com>
 <YnOHgZWHZ3fdYXqM@redhat.com> <YnO7TUI4RV+6+WPH@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YnO7TUI4RV+6+WPH@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.74; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/05/2022 13.55, Daniel P. Berrangé wrote:
> On Thu, May 05, 2022 at 09:14:57AM +0100, Daniel P. Berrangé wrote:
>> On Thu, May 05, 2022 at 09:48:41AM +0200, Thomas Huth wrote:
>>> Our support statement for Windows currently talks about "Vista / Server
>>> 2008" - which is related to the API of Windows, and this is not easy
>>> to understand for the non-technical users. It might also not be quite
>>> true anymore, since we only compile-test QEMU with recent toolchains.
>>
>> We documented Vista / Server 2008 because that is what our code is
>> declaring it wants in terms of Windows public APIs:
>>
>> In osdep.h we have:
>>
>>    #ifdef _WIN32
>>    /* as defined in sdkddkver.h */
>>    #ifndef _WIN32_WINNT
>>    #define _WIN32_WINNT 0x0600 /* Vista */
>>    #endif
>>
>> which tells Mingw / MSys not to expose windows header file declarations
>> that post-date Vista.
> 
> Of course we rely on 3rd party libraries and in particular GLib2 is
> mandatory, and it also set _WIN32_WINNT. So our constraint is the
> newer of the _WIN32_WINNT constraint set by QEMU and whatever version
> of GLib2 being compiled against.
> 
> QEMU sets a min GLib of 2.56, and that version of GLib sets 0x0601
> which means Windows >= 7.  So even though QEMU only asks for Vista,
> in practice our minimum is 7.

Windows 7 does not receive any security updates since 2020 anymore, so I'd 
rather would bump it to the level of Windows 8.1 directly instead. Or 
directly go for Windows 10 to mimic the behavior that we have with most of 
the Linux distros (max. two major releases at a time).

  Thomas




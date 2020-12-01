Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6692CA339
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 13:58:04 +0100 (CET)
Received: from localhost ([::1]:53842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5EJ-0005RM-OM
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 07:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk5D4-0004l0-Lh
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk5D1-00039L-Tn
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606827402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZMnlTriBK1GRVPUsSFGUg6w1kZcmKIJqblbTt6WHgs=;
 b=S+3XS38Ab0pQ3xYU0EXxRlxNmwnbPhVPTSP1KLjFPpt/Rtd8xprqLcioDv9e3LO9YE/7iV
 hGPojxeXUSsUI8hfJs8GF9ophTjeT92Kz51+wqQItXJ5o1FLvs/0Pkq++Mp/mR+tyt50MB
 n+6g/kN8IiFLhxDCpvAW2yhWhd9QPZE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-rMclFyV2NiSNJTwrd66LeA-1; Tue, 01 Dec 2020 07:56:38 -0500
X-MC-Unique: rMclFyV2NiSNJTwrd66LeA-1
Received: by mail-ed1-f70.google.com with SMTP id u18so1293137edy.5
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 04:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VZMnlTriBK1GRVPUsSFGUg6w1kZcmKIJqblbTt6WHgs=;
 b=l2aCuPcEOxjDKsgS/d6k1mTpahn6qJlx6fW8UJKMEcZO4FLC/3oYv69wF5E156IbRn
 5dj/4io7b3XZvOam8/vms4nAusPdY0HYpZmsPixJ8MH9R2MAOH0Ps4aHe+5RLLddQRtS
 8WZ2SF4HxsIayWmMP26EUUxJa9WGcW6DBLApgE/eNAQbybMqvW9gvJQ24zH7jFC7lahi
 PZtIXZmIVm2wheKMpVOYLNgyssftlSWE9zlZDUR41eEVE+OuLtW9DaMF0Izs6t8i8sCc
 A8tz60m5VHmpyS6Cbb5ThxHwmq7lABGvVCK48lN47KWanOLPr6PB3JTs2lQraGOMiYlR
 +aZg==
X-Gm-Message-State: AOAM533eQom3NDXDFH3FkbudWuLw5KbDhgRYbdukEnMnWkJGsmre+Btq
 4RMFEdKo8aJrQ8EWyQ62xWLm/PRpRQ8Mc9QbGYCbQrbAwvoM1H5s369Urrt2hLQCXgCfEaNVkjN
 EPplMC13zPDcNcU0=
X-Received: by 2002:a50:d2d2:: with SMTP id q18mr2854348edg.346.1606827397238; 
 Tue, 01 Dec 2020 04:56:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4TKuLCknBWkpoDzr8PqKRGLs8EhW7ClQHJJ+ijMbb+6Oa8nnsU48+GYh7xkJwms7S1kgnhQ==
X-Received: by 2002:a50:d2d2:: with SMTP id q18mr2854329edg.346.1606827396989; 
 Tue, 01 Dec 2020 04:56:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u15sm844209edt.24.2020.12.01.04.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 04:56:36 -0800 (PST)
Subject: Re: configure: --extra-cflags are passed along C++ linker via
 QEMU_LDFLAGS
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <ca9969ca-49f4-b25b-8a4d-f3b89b42d696@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aaaeec47-4ebe-324c-806c-4dd0a715a8b4@redhat.com>
Date: Tue, 1 Dec 2020 13:56:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ca9969ca-49f4-b25b-8a4d-f3b89b42d696@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/20 13:48, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I rebased an old series I started more than 1 year ago and tried
> to build it using '../configure --extra-cflags=-Wint-conversion'
> but got:
> 
> cc1plus: error: command-line option ‘-Wint-conversion’ is valid for
> C/ObjC but not for C++ [-Werror]
> 
> QEMU_CXXFLAGS are sanitized in update_cxxflags() but when linking
> with the C++ linker the C specific flags are propagated via
> QEMU_LDFLAGS:
> 
>    --extra-cflags=*) QEMU_CFLAGS="$QEMU_CFLAGS $optarg"
>                      QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
>    ;;
>    --extra-cxxflags=*) QEMU_CXXFLAGS="$QEMU_CXXFLAGS $optarg"
>    ;;
>    --extra-ldflags=*) QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
>                       EXTRA_LDFLAGS="$optarg"
> 
> Maybe the change comes from commit db5adeaa84d:
> ("build-sys: clean up flags included in the linker command line").
> 
> Any suggestion where to filter EXTRA_LDFLAGS for C++?
> Should I add a filtered EXTRA_LDXXFLAGS (similar to QEMU_CXXFLAGS)?

EXTRA_LDFLAGS is only used in a special case for Xen, so you can ignore it.

configure already specifies $QEMU_CFLAGS or $QEMU_CXXFLAGS on the linker 
command line.  Therefore, you can remove the assignment to QEMU_LDFLAGS 
from --extra-cflags=*.

Instead, in meson.build, you can use the link_language variable to add 
one of QEMU_CFLAGS or QEMU_CXXFLAGS to the linker, just before the 
existing call to add_project_link_arguments.  It's assigned a bit later 
but it's not an issue to pull the assignment earlier.

Paolo



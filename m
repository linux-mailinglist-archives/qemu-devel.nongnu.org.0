Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7598A373DB7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:33:10 +0200 (CEST)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIaL-0004HV-Jj
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leIXK-0002cg-0j
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:30:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leIXG-0007Hq-Cf
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620224997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=94T17XIhV+xaJxWyTv+jYIFKkzfejA9yMdrxu5j8InA=;
 b=NP9M/6rdxBL9ONJScRvHC/FHISxY2vEV8sz8YmVrwJalUBFLJEE5tW3mtK1G2gawijWcFz
 mbO57R8wU/sDYuVIOhQRxZyzp70fk3/R9/u2eNez+Q8xKnoNbnBNpj7ZHnek8eZLY9C2qR
 Exjq2dXl1nPx7zerdLLeA7QQ8CpLSPQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-kpM27su9Pd27wEjLSlHsvg-1; Wed, 05 May 2021 10:29:55 -0400
X-MC-Unique: kpM27su9Pd27wEjLSlHsvg-1
Received: by mail-wm1-f71.google.com with SMTP id
 y193-20020a1c32ca0000b029014cbf30c3f2so1640827wmy.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 07:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=94T17XIhV+xaJxWyTv+jYIFKkzfejA9yMdrxu5j8InA=;
 b=HcDpr883Xq+QoXeftJRXQjcNA2AS4ixBu9Sg21cDDBMeGv4iOhOkYtaZdmnqHNnNKH
 0t8T7QT3oa3gGWMUBMPxF7TU0ad8qd7D2PUi1BTSgRkq597bWyvkOA64+aI4cDNdTK6t
 1vQa02TZWeKpyqz/qKK9yJNziVGnyct2QzG73xaTsXQL/OH9fqNjknKwoVcf8+f+vGB/
 XUecE4ktlyE5ze+k7P16IF2PupPDkEL4GDqMY+BlYCYWCkDhqnTmekPf7o6oMo8lo0t1
 E0PG0/QJDMPByMGGeLybEklGZqi9u6YvMLMGlwgTYdMxFNi6iT2eIjFfAsM2PYJFwoOJ
 wrzg==
X-Gm-Message-State: AOAM532za8JG4OJMvXJw2PN0R1vJXvIoGLx6akoku63kK44W5lQxB8Gv
 7PZQBcxSvxDGLqATEVZXz1N9cmo3X3FQW+kZGfRTiWBM2nibJuq9BJ65uxRkf0zvbLdQWdkM37S
 knQ6X30oft/NmNqM=
X-Received: by 2002:adf:d223:: with SMTP id k3mr38337183wrh.99.1620224994778; 
 Wed, 05 May 2021 07:29:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmm9keJwFxYNwLOGOTgRuKkA9yg1hgaPL36nJH23AoVPw0d3HkBJ/NOQN/u9PZBU0CxUDbJQ==
X-Received: by 2002:adf:d223:: with SMTP id k3mr38337158wrh.99.1620224994570; 
 Wed, 05 May 2021 07:29:54 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id h9sm6139530wmb.35.2021.05.05.07.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 07:29:54 -0700 (PDT)
Subject: Re: [PATCH] configure: fix detection of gdbus-codegen
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210505142412.705817-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0e80fde6-8ce6-35a6-fba5-a4cdba3595ca@redhat.com>
Date: Wed, 5 May 2021 16:29:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505142412.705817-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: thuth@redhat.com, Sebastian Mitterle <smitterl@redhat.com>,
 elmarco@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 4:24 PM, Paolo Bonzini wrote:
> "pkg-config --variable=gdbus_codegen gio-2.0" returns "gdbus-codegen",
> and it does not pass test -x (which does not walk the path).
> 
> Meson 0.58.0 notices that something is iffy, as the dbus_vmstate1
> assignment in tests/qtest/meson.build uses an empty string as the
> command, and fails very eloquently:
> 
> ../tests/qtest/meson.build:92:2: ERROR: No program name specified.
> 
> Use the "has" function instead of test -x, and fix the generation
> of config-host.mak since meson.build expects that GDBUS_CODEGEN
> is absent, rather than empty, if the tool is unavailable.
> 
> Reported-by: Sebastian Mitterle <smitterl@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



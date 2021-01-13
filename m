Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14DB2F4D38
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:37:10 +0100 (CET)
Received: from localhost ([::1]:36232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhGn-0002Y0-Sr
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzhEY-0000jg-3p
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:34:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzhEV-0007Do-QS
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610548486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bledOY2AQ3pd+7grPQWDUUwGKpBpbEymroVy8yzksZg=;
 b=TAQM9BrB7BfX589y9ezGkD6jI66gbymD7VcZ4mdsoE/H4PnqhdsOZ8kbd7GG3+1VAqR2ZU
 0dWtGWa5vxCZw9C3d+yQZj93yuvJUjbLRnnSsIRwArnjbws+Ar91t2WkJYHlQOjU1VZ+nB
 jAUNktFDA7gY6Rm+eMbkOG1YV+4Jv7s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-UQb-s2u8Mwm4A2XQuzOrKg-1; Wed, 13 Jan 2021 09:34:44 -0500
X-MC-Unique: UQb-s2u8Mwm4A2XQuzOrKg-1
Received: by mail-ed1-f70.google.com with SMTP id g6so939044edw.13
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 06:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bledOY2AQ3pd+7grPQWDUUwGKpBpbEymroVy8yzksZg=;
 b=e5+QjPHs581vtarWHXv2lm0DbQ04m/Vcr7obRbv/QtukD7oeeqODnx3FDTknCWgY/G
 toRRnR4px9s2D7ac2D1Y0bj6GstTcOu5NpRkJMnRblfm0BMLLw1XrMPpLDkEpa5GPAni
 EIt+B/H9gS5Q+yVW4MP/h0VOx0BvxA34fnzQeFVgkN6WR01W/0eLl7vuGRUMcKYE4v0p
 +rsUY1emE0bMh1Q7qaCk6/zjPeq0vsjrpHoStO10jT074EiUPPThdKFc82erDH2pEoOh
 Xga/aKYpD08/HjClk0OVpE8GWYMDXUnx0fhGfguMPbdC82QKMd/dzzRxdgspm+xTefcn
 2Ang==
X-Gm-Message-State: AOAM530Gk2zWmRWOhEIiXM7uYZ+7YmoRMl/Tvb66oq6TVoKXrVnN3RrI
 mst+DyxojHj7xGHO9FSuYn+3qvMzi3UEUQD6XRahqB6Vv8gUs5rnhvZ6ZyGfYqoOnoT2nyh3c5P
 RKiCtfTqqPpDKesk=
X-Received: by 2002:a50:b742:: with SMTP id g60mr1965692ede.113.1610548482535; 
 Wed, 13 Jan 2021 06:34:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQfLwuc55K9YoUyXCnVEcSlEiwSgPVeJbVphPeOIWbquntwgXXgFq3VaoxeqB84hPJ94FcmA==
X-Received: by 2002:a50:b742:: with SMTP id g60mr1965672ede.113.1610548482357; 
 Wed, 13 Jan 2021 06:34:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w13sm914643edx.20.2021.01.13.06.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 06:34:41 -0800 (PST)
Subject: Re: [PATCH 1/8] build-system: clean up TCG/TCI configury
To: Helge Deller <deller@gmx.de>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-2-pbonzini@redhat.com>
 <CAFEAcA9yyUUmd+hj6kgAV8KWtCC41Q55JRfE0q1zTaDaOofgOQ@mail.gmail.com>
 <a5cd4c43-2f12-2dbf-8db7-21acc7abc73d@redhat.com>
 <20210107160653.GD1029501@redhat.com>
 <d1b5a493-0658-3bba-b1b4-0116f337031d@amsat.org>
 <46e79fb0-2ce1-35a8-3ce8-44699508a1d1@gmx.de>
 <20210113135705.GC1568240@redhat.com>
 <4d81fdad-6b76-d7b7-ba44-e3d7cf545dba@gmx.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1b62c77e-fdd3-6b3c-b897-2bcf03f7bcc1@redhat.com>
Date: Wed, 13 Jan 2021 15:34:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <4d81fdad-6b76-d7b7-ba44-e3d7cf545dba@gmx.de>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, debian-superh@lists.debian.org,
 Stefan Hajnoczi <stefanha@redhat.com>, debian-hppa@lists.debian.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/21 15:23, Helge Deller wrote:
> In debian many packages directly and indirectly depend on the qemu
> source package, because it provides - beside the emulator - various
> userspace tools which are necessary natively, like e.g. qemu-img.
> In the past building those tools failed on hppa because the configure script
> detected that neither native TCG nor TCG interpreter support was possible.
> As such the configuration aborted and no tools were built.
> So, the change should still make it possible to enable building the userspace
> tools.

You could still build those, with --disable-system --disable-user.  Or 
we could rig the configure/meson scripts to do that automatically if no 
accelerator is supported.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BB2485F4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 15:26:02 +0200 (CEST)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k81cn-0008Ir-Ow
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 09:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k81c5-0007kE-56
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 09:25:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43396
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k81c2-0001Tx-VD
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 09:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597757113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oEXMGIRWKjGuL51lGthZrzPewhQctgxVztmnJ/gteDk=;
 b=XG4UlPy2IZiwpy0b/8WHyImyrFAbL96rh68fNmktv1zzXwSjmb6IVQdnZeq3L0SxYOZd3t
 FnsBRR1ve52G/ue6qMxyNDlemhEJqcB3WUXlfUOmcPy/DU6ym+aWkkBSglAIws2scrTbSZ
 OyXJmWsusRge11itxeYW/aDaKnKBDcs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-gYly4AsnPQmceHUTq-AUnQ-1; Tue, 18 Aug 2020 09:25:12 -0400
X-MC-Unique: gYly4AsnPQmceHUTq-AUnQ-1
Received: by mail-wr1-f71.google.com with SMTP id l14so8258284wrp.9
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 06:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oEXMGIRWKjGuL51lGthZrzPewhQctgxVztmnJ/gteDk=;
 b=BWsNLO/w83v/+BM8ljl637JL+EC4bg1NcE9eVN2rth/8ujd+WOk0o7ajodzLb06uhh
 RM3lPRLfBYTFC2I/0e729SdWqlys1qUCHoTfu45VvHiZuhdY0axY9wFoaRg9gtiNAzkC
 ZFojNLb142H2ftAt0SuWzUVhuefS5FnBFqUYm34Xeq4c89b+kwUzHfAdHk5uzva2KrXe
 GtPIA36MkAx6WnfMAN/0IXzozhDup0LziaLVqPqkKaoA4R1w+6bEl5JgWoXkb29cPlsI
 Zvcupfs/QmbVyAL2qbx7S07RJ0/sofO8aPMSW9kLE4ix4korjXhwagDs29HQnDeOaofJ
 fzGw==
X-Gm-Message-State: AOAM532d9MUlQakUddOt63g4A2RFmlyrY4vCWGX46S91IPytC/mKx+bY
 XsT2Tbe5DtzZZSjdlTT0e49LAmLSOfjIy5GxniWwyU1Ux0RlKOZmSbA/1kMX15Jnjn4U04uczTa
 iJflcTHOLxXSeAXI=
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr19872680wrp.355.1597757110363; 
 Tue, 18 Aug 2020 06:25:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX5NJiWAHDHyo6hK4lnuZEfx4c7N9gf9fFJ4ePMx+NeO98LQzMNuRlW3mIpyBGOknTNqPRMg==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr19872663wrp.355.1597757110155; 
 Tue, 18 Aug 2020 06:25:10 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id v12sm35424441wri.47.2020.08.18.06.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 06:25:09 -0700 (PDT)
Subject: Re: [PATCH v3 000/150] Meson integration for 5.2
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200817143723.343284-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <0be44dc6-7abd-2082-70d6-a42bd3f81ba0@redhat.com>
Date: Tue, 18 Aug 2020 15:25:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200817143723.343284-1-pbonzini@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 03:19:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/20 4:34 PM, Paolo Bonzini wrote:
> - Simplified/rewrote handling of the modules variable [Howard]
> - Fixed access to gdb-xml files [Howard]
> - Fixed cross-compilation failure due to mingw prefix [Howard]
> - Fixed SDL2 detection on cross compiles [Howard]
> - Fixed sub-makefiles that include config-host.mak
> 
> You can find it at the usual place, https://gitlab.com/bonzini/qemu.git
> branch meson-poc-next.

I'm getting this warning (nothing critical, so can be fix later):

../configure: line 183: shift: shift count out of range

which is in version_ge().

I used:

../configure \
  --enable-trace-backends=log \
  --disable-docs \
  --enable-debug \
  --extra-cflags=-ggdb \
  --audio-drv-list=oss alsa sdl pa'

Thanks,

Phil.



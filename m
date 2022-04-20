Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE2950906D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:26:28 +0200 (CEST)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFy7-0005dd-Es
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nhFnU-0007Nc-Mm
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:15:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nhFnR-0002yc-Jg
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650482124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7u0cjA0bFcE7pyR52VPyGVTY5GwUjNuBevPQq3hBf/o=;
 b=OPLFqsKS/RXAPzjKK/dBEc0wFxegRndLVtKq6rTWdFzKCP4iPgXSaGIwSJ7rfrUYDA1AEm
 Zu1AYJwnydNaODMYQKkGnQgcv30wDZqXVhvkd7jPO2OXvuh8d4cmAgL27yhdtnW8THnCdo
 7tGQL1DjUEJFccoKPW2V4h7wXd0Wez4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-C-Wg9fsxOtuHCF5XN5kMjg-1; Wed, 20 Apr 2022 15:15:22 -0400
X-MC-Unique: C-Wg9fsxOtuHCF5XN5kMjg-1
Received: by mail-wm1-f70.google.com with SMTP id
 b12-20020a05600c4e0c00b003914432b970so1353004wmq.8
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=7u0cjA0bFcE7pyR52VPyGVTY5GwUjNuBevPQq3hBf/o=;
 b=KLqAZD6BueBGjEU29m5KbvuC1bofMnQV1a/pt2WW6cYPIASfyro/AHab6TRl44P/DC
 S1OxZ9qGY2HLDdDUpCYxQau0zuu5DfzJMcytc/NMLJCXfWxWtbofvTDru9jlNH6CcEph
 c4KgUiuFEoEY+ZDtbXiheqaZsHcByHbRNszK9AzveKh1fMb+UyJTHRaxj0qu1T17LvfJ
 lgtPAo4A3Lwcyvz7n0YexFLZZgegLvs3INVgEBMyQ8QIXQyPB56/g0ndpFHVZDP7+X4a
 w2Z8zQ5QZv0UjonJOm/EYmwRvqWGZaKOvlggIg9ufTYEr2HkuNZ01WMpzfx0d5qDqZkl
 wwwQ==
X-Gm-Message-State: AOAM5324N/CF0tBnMiBPqhLMGsxh/I+M28IPU30MHwFsdBeX6MlA6UNx
 HoXfkfkLUNw2GQbXqenjpWPNAT46xRPdhoYA/XPjDDmh4DeGqQm9hPPdgSrWGQx4cWi6270Lglp
 QNUy/3v/2r+5PXEc=
X-Received: by 2002:a5d:4384:0:b0:20a:953a:4681 with SMTP id
 i4-20020a5d4384000000b0020a953a4681mr12636131wrq.266.1650482121646; 
 Wed, 20 Apr 2022 12:15:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZNPh4K6vYRgOoYQssTzpKUjgN64MLVZY4mjolUsuSxOcJCQxrTtBQxHaiMDG2IyOqHMZ7Tw==
X-Received: by 2002:a5d:4384:0:b0:20a:953a:4681 with SMTP id
 i4-20020a5d4384000000b0020a953a4681mr12636122wrq.266.1650482121442; 
 Wed, 20 Apr 2022 12:15:21 -0700 (PDT)
Received: from ?IPv6:::1? ([2001:b07:6468:f312:e558:1d17:12d7:e67d])
 by smtp.gmail.com with ESMTPSA id
 az20-20020a05600c601400b0038ffb253bb3sm203408wmb.36.2022.04.20.12.15.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:15:20 -0700 (PDT)
Date: Wed, 20 Apr 2022 21:15:07 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 17/34] configure: move Windows flags detection to meson
In-Reply-To: <CAJ+F1CLxh15FLwVdD_86euFL1mmYU=821reVPthgcBFAwZ-yvQ@mail.gmail.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-18-pbonzini@redhat.com>
 <CAJ+F1CLxh15FLwVdD_86euFL1mmYU=821reVPthgcBFAwZ-yvQ@mail.gmail.com>
Message-ID: <1CD19388-7EE0-4D89-84D1-FA7E00D10231@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Il 20 aprile 2022 20:20:20 CEST, "Marc-Andr=C3=A9 Lureau" <marcandre=2Elur=
eau@gmail=2Ecom> ha scritto:
>> +  # Disable ASLR for debug builds to allow debugging with gdb
>> +  if get_option('optimization') =3D=3D 0
>
>
>=2E=2E/meson=2Ebuild:188:5: ERROR: The `=3D=3D` operator of str does not =
accept
>objects of type int (0)
>
>Why not check 'debug' ?

In Meson, -Ddebug governs whether debug info is included=2E In configure, =
--enable-debug disables optimization (and is a string apparently rather tha=
n an int=2E=2E=2E)=2E

Paolo

>
>
>> +    qemu_ldflags +=3D cc=2Eget_supported_link_arguments('-Wl,--dynamic=
base')
>> +  endif
>> +endif
>> +
>>  if get_option('gprof')
>>    qemu_cflags +=3D ['-p']
>>    qemu_cxxflags +=3D ['-p']
>> --
>> 2=2E35=2E1
>>
>>
>>
>>
>



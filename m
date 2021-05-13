Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F193337FAB4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 17:28:59 +0200 (CEST)
Received: from localhost ([::1]:40046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhDGk-0004ue-QJ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 11:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhDEk-0003nr-W1
 for qemu-devel@nongnu.org; Thu, 13 May 2021 11:26:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhDEc-0007pb-Kd
 for qemu-devel@nongnu.org; Thu, 13 May 2021 11:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620919604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4D6cKp/Wm8il6SOOb5dOZPyXKq2u1wV2Ky2u4gE42YU=;
 b=EPRcxe2fSpjS6FKYXKUWdoxPrY8T59WdO2WV3AxKbw54L7On5T8ZZ+ga5AiZzHcf54A9wp
 eIddoVRR4R+0gjczsm9sC7VtIcTluwoze/NkzIyBNRYd1XxXcRiCKa5cdP/3f7LCPlOGep
 uz1XdlopW68qV1s9gUBT9AqFNTqe4ys=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-0NN7DfiEP2ql9Te7JCbR8Q-1; Thu, 13 May 2021 11:26:41 -0400
X-MC-Unique: 0NN7DfiEP2ql9Te7JCbR8Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 g17-20020aa7dd910000b029038843570b67so14833897edv.9
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 08:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4D6cKp/Wm8il6SOOb5dOZPyXKq2u1wV2Ky2u4gE42YU=;
 b=EnBuj3fgn+++mFiO/ym5FeQAGyiqKLmSls+spfpNGZfa8OgJCmsvL1hgNGEFmy5zUh
 YVsSk37lPFa65nCqROOS7dc5VdT+nw59zlpY5YrTUQ+kcSj3Y1ayb6LlyQsaPX1AE/hV
 D0Sc3r6FS8+B4eX7rBlp6rTSeKlA+pEKC45Ed3iEsKzFpY/qZIUSY4kK3X6MGycU5v0d
 92Fjkj3l/gQoofBmjr2a/EDDjoDGKqw1l3kgfFG+NuQG99N2K/yXdKr2cUT23NDw0Qpo
 Zk2WAqdc9MeC8fEPaC75jkeRSrEDLadnv5k7EiwfO/FpqWJqJdIKpwHTF+HsISOaFjwb
 QcIw==
X-Gm-Message-State: AOAM530w53QHM3vMe3ML/ppUMV+PTUKBA6yXgN+eIeUACS7usoFuTmmi
 s9UqTUfz2DuggvWTkS4gixtj5rTdJSspZ374xvZfB+au3zppQl6ws9y1dZJuQLmqTtW+6HbcpWj
 iiwfB31TnraPUDDU=
X-Received: by 2002:aa7:c9c9:: with SMTP id i9mr51142438edt.17.1620919600259; 
 Thu, 13 May 2021 08:26:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx1gbiqho4E+UgFu+wlVTJDGEcM5aYX/mdNg8YmQFxMZjhmtJBF6Dn53YVN1hLvaoQhnZq8Q==
X-Received: by 2002:aa7:c9c9:: with SMTP id i9mr51142414edt.17.1620919600009; 
 Thu, 13 May 2021 08:26:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w19sm2567765edd.52.2021.05.13.08.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 08:26:39 -0700 (PDT)
Subject: Re: [RFC PATCH 4/5] hw/ppc/fdt: Drop dependency on libfdt
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-5-philmd@redhat.com> <YJs938JVdO5SRYSs@yekko>
 <ead2acca-d3da-89e5-52f6-e8ae14f6e85f@redhat.com> <YJyg+h7NC2ktmHSx@yekko>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6a06ae7d-1010-69bc-8931-364d2655e850@redhat.com>
Date: Thu, 13 May 2021 17:26:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJyg+h7NC2ktmHSx@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/21 05:46, David Gibson wrote:
>> The patch makes sense in general.  The file is only needed for pseries and
>> powernv, not for e.g. e500 which does need fdt.
> 
> Yes, agreed.
> 
>> I would get rid of FDT_PPC completely.  First, before patch 3, you can move
>> fdt.c to PSERIES and POWERNV (it's too small to need its own Kconfig symbol)
>> and only leave
>>
>>     ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: fdt)
> 
> Uh... why do we need even this?

To tell Meson that a board requires QEMU to be linked with libfdt.  This 
symbol is then renamed to CONFIG_LIBFDT once it can be used with all 
targets (rather than just hw/ppc).

>> Since you are at it, remove the silly #ifdef TARGET_PPC64 in the
>> hw/ppc/fdt.c file.
>>
>> Then in patch 3:
>>
>> - add to Kconfig.host
>>
>>      config FDT
>>         bool
>>
>>      config LIBFDT
>>         bool
>>         depends on FDT
> 
> Um.. I'm not sure what semantic difference you're envisaging between
> FDT and LIBFDT.

"FDT" is set by meson.build if the library is available, LIBFDT is set 
by the board to link with the library.  In other words CONFIG_FDT is 
per-build, while CONFIG_LIBFDT is per-target.

If a board selects LIBFDT but the library is not available, minikconf 
will report a contradiction due to "CONFIG_PSERIES=y" -> "config PSERIES 
select LIBFDT" -> "config LIBFDT depends on FDT" ->  "CONFIG_FDT=n".

>> - for all the boards I listed in my review, add "select LIBFDT" in addition
>> to "depends on FDT".

This is actually unnecessary---"depends on FDT" is not needed in the 
boards because LIBFDT already has the dependency.

Paolo



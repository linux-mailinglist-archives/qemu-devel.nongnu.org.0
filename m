Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FB337B75A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 10:03:40 +0200 (CEST)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjqF-0004r2-87
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 04:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjo8-0002xs-EQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:01:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjo5-0003Wp-NZ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620806484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2QaMG998QEIBKsKEBTTUX9A1gi30ebRlTGsajf/BQ/c=;
 b=e8CxjQ+RBu936MUswySkUzsRN8BV6NTOfVI96skhVRqg5/P97Vw9yLj2H9z7+2Vqk+kcMm
 Vgm2wyMpGZWMOR7x88JFv5cfGBa49tcG8R3TYz0JDQliYiUeiqKnY875an0P/Wru7i1dPx
 IwmG/8MC1Mrw99kyhHdnDhNjaQp2gOE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-J7Z_Dl3kMIWNIPC7uQtafQ-1; Wed, 12 May 2021 04:01:23 -0400
X-MC-Unique: J7Z_Dl3kMIWNIPC7uQtafQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 bm3-20020a0564020b03b0290387c8b79486so12360124edb.20
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 01:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2QaMG998QEIBKsKEBTTUX9A1gi30ebRlTGsajf/BQ/c=;
 b=J7AzSQogjaeaftafjGlxbWOVG5qerXOdMAGuFj44EN9pbLr3S30Xj1UB0IBZzHhOLT
 TPAAwvn98fXVw9W1jG4Oc4iUI/sd9thKiUcg24Y7kpI4gxbwcOlrE7jksXgfTvSpJ5dG
 kLtQLnNZeMju+kkEQEECmnZQQfWZpQDGTZFVY/kJagVq55t39g1E/4CIv6TYhMKaz4WR
 EQCMC7ItzO1/+SxOj9yBA4z4aAgK+xDzdFHGvatZ1q21AXseDNVeDDNFns7P6HyCI4jw
 uC4t156+nPeV0h07gZV37T0+m+EakOOrC6JfmsZTBrkJZ1mrYxQyleg7nlckjFnE0+9c
 cV4A==
X-Gm-Message-State: AOAM530lTL1RMYCdl8wRknHW3YTivpoF4yGx/FzJDSVcKJnm2q3u044x
 UVlEqCeM73oLlnIDqo1/Mml0LAImXl939FcCYcMv/QYDdtl3tn5B/xPbgl4ydLnsfKAmu5sDQUT
 EdJbjYUHJMGpDs8Y=
X-Received: by 2002:a17:906:48d2:: with SMTP id
 d18mr36818072ejt.9.1620806482049; 
 Wed, 12 May 2021 01:01:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtnbzlodyh08qsYNBUlW+cV8Sws0WvZdRKDFVB39sOkQkgr07HE9n7u7Y1uobFnOEeFV8m9Q==
X-Received: by 2002:a17:906:48d2:: with SMTP id
 d18mr36818052ejt.9.1620806481883; 
 Wed, 12 May 2021 01:01:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z7sm17191089edi.39.2021.05.12.01.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 01:01:21 -0700 (PDT)
Subject: Re: [RFC PATCH 3/5] hw/ppc: Have pSeries depends on libfdt (via host
 Kconfig FDT symbol)
To: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-4-philmd@redhat.com> <YJs9BH+j1FAMIOjP@yekko>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <83800531-8c99-0dca-d324-484dd6c57df6@redhat.com>
Date: Wed, 12 May 2021 10:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJs9BH+j1FAMIOjP@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/21 04:27, David Gibson wrote:
> On Tue, May 11, 2021 at 05:53:52PM +0200, Philippe Mathieu-Daudé wrote:
>> Since commit fea35ca4b8e ("ppc/spapr: Receive and store device
>> tree blob from SLOF") the pSeries machine depends on the libfdt
>> fdt_check_full() call, which is available in libfdt v1.4.7.
>>
>> Add the corresponding Kconfig dependency.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> I don't love making this conditional.  Pseries is by far the best
> tested and most widely used ppc machine type, so it seems like it
> would break expectations to not compile this in rather than giving an
> error saying you need a newer libfdt.

It's not conditional; if libfdt is not found, scripts/minikconf.py will 
tell you about the contradiction between CONFIG_PSERIES=y and 
"CONFIG_PSERIES depends on FDT".

So we still have the same "fdt_required" logic that is already in 
meson.build, but expressed as Kconfig rules instead of a random line in 
default-configs/targets.

Paolo



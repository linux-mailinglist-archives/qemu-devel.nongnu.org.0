Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033D5321877
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:23:13 +0100 (CET)
Received: from localhost ([::1]:46796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBBA-0005He-1N
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEB7d-0001as-Oy
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:19:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEB7X-0002TC-8M
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613999961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qug2RTu/T1uSQ745n8lC2c0QqoReD0ieGgc66jNB2QI=;
 b=IS0EAR6nSPzAYXvRdd/ZYTzW1XpEK4h1C487yjWzEo9R+HPS7f0JvFLwK9gEOqAlYwZYqg
 UPrvrksOwApPxklVnBciYfSQTSqnpJkvbFGLWL1C4cL82H0fptSetaND1gmbkzQypg1Gg7
 XGp/6agFi69HVWG0VKcf1EovJQIBq6c=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-Ncs-xSRIPLmVkEn6xo0BZg-1; Mon, 22 Feb 2021 08:19:17 -0500
X-MC-Unique: Ncs-xSRIPLmVkEn6xo0BZg-1
Received: by mail-ej1-f70.google.com with SMTP id yd24so3980774ejb.9
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qug2RTu/T1uSQ745n8lC2c0QqoReD0ieGgc66jNB2QI=;
 b=UFjyVj9Sz8KtpBZB5fsOoyTbi//mo0ujaim9vg/UOjWZ4xPrD1RJADTxg5XeouygNP
 +lu2LbIC0xaSjiRO97Nfk+Fp66bgd8ewsA4E0/W9JemXKjH3UbKhnJcRpW4Q4Dp/eBAR
 Pyphp6Q5TkdPJZAHf3Ek3r50JC4S8i2ezl7ESvojAqZKFcfL3r0B9RNF2kenCBsVUEyY
 PRTmw4jSGmqRDzYBaCeQvc/mma9fcxo8/kUc/YCjeXUx0ovPezd+T5Q/Stk9Is7AiKiZ
 leFlApKM0erOJ6Cm4Azx4LB9wCXqVfG5rUbDwuyreU1LOMh3J7LxHe6es8YsIMIPjmII
 pRpQ==
X-Gm-Message-State: AOAM530gnlAz4lfmd882S8fywfpDnv7qmxnTH5aPKPeOOO+gFFuiu3Hy
 ze2PGimH8gWBlePrrx3FjZhCAxVzhQQQcADkrdYbK805dAYWacnklABJNSZ9aYjMktVkJCh4YZy
 WKZXTyEURYXT5nfg=
X-Received: by 2002:a17:906:cf8f:: with SMTP id
 um15mr5937403ejb.455.1613999956721; 
 Mon, 22 Feb 2021 05:19:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvbw/PgfA0F/25nHKxn/HTOW5jX2GdrY67Z+Yez2DT22kLFPNtBmQLRjUdkVjUL1EidwLbmg==
X-Received: by 2002:a17:906:cf8f:: with SMTP id
 um15mr5937362ejb.455.1613999956555; 
 Mon, 22 Feb 2021 05:19:16 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id kd13sm6734645ejc.106.2021.02.22.05.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:19:15 -0800 (PST)
Subject: Re: [RFC PATCH v2 06/11] hw/ppc: Restrict KVM to various PPC machines
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-7-philmd@redhat.com>
 <YDNIQiHG0nfKXNR8@yekko.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e28dc7fe-3a78-6b24-0034-830909f71f8e@redhat.com>
Date: Mon, 22 Feb 2021 14:19:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDNIQiHG0nfKXNR8@yekko.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 6:59 AM, David Gibson wrote:
> On Fri, Feb 19, 2021 at 06:38:42PM +0100, Philippe Mathieu-Daudé wrote:
>> Restrit KVM to the following PPC machines:
>> - 40p
>> - bamboo
>> - g3beige
>> - mac99
>> - mpc8544ds
>> - ppce500
>> - pseries
>> - sam460ex
>> - virtex-ml507
> 
> Hrm.
> 
> The reason this list is kind of surprising is because there are 3
> different "flavours" of KVM on ppc: KVM HV ("pseries" only), KVM PR
> (almost any combination, theoretically, but kind of buggy in
> practice), and the Book E specific KVM (Book-E systems with HV
> extensions only).
> 
> But basically, qemu explicitly managing what accelerators are
> available for each machine seems the wrong way around to me.  The
> approach we've generally taken is that qemu requests the specific
> features it needs of KVM, and KVM tells us whether it can supply those
> or not (which may involve selecting between one of the several
> flavours).
> 
> That way we can extend KVM to cover more situations without needing
> corresponding changes in qemu every time.

OK thanks for the information. I'll wait the other patches
get reviewed (in particular the most important ones, 2 and
10) before respining including this information.

Regards,

Phil.



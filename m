Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE790444296
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 14:41:03 +0100 (CET)
Received: from localhost ([::1]:39542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGVi-0006p1-Dr
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 09:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1miGSv-0004Ej-UE
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1miGSr-00069J-VD
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635946683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y5q8IIWTaSEZLY6WTjjhT1utNDut4leAxXuS5Ijx4OE=;
 b=Y6T+VGzQhlcHqdChAWH7v0Q2+aRcazp2BblvdE73rD1ammQw2/2tkOsamm2UXJzlqjD16B
 Vo9r62dxHhgGuVtxXT+FGIT38T0XtXx9WTpdcALY/q+JvvcpIqNkLOZcdHAqZN6stJqYkT
 SxtLXH1WKp80rr6sDgUh8cQSJqfABSw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-aNeEK3v9Mdu1fpHLbgl2OQ-1; Wed, 03 Nov 2021 09:38:02 -0400
X-MC-Unique: aNeEK3v9Mdu1fpHLbgl2OQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w12-20020aa7da4c000000b003e28acbf765so2514741eds.6
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 06:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y5q8IIWTaSEZLY6WTjjhT1utNDut4leAxXuS5Ijx4OE=;
 b=Kd+vhIjwiqejmEuJWpQsQrF+hZFPT34AxDDEsR3Q1nBshvBon7wJ+RYqWVb3B18UWx
 a48zxUQBS6nBNxG6PpUc0asLu2rr6vsWMLbwhRg9eZF4/vuLC2zVr8Hi1gqbwVWaIFfF
 hOBzPV6UXyJApPeCjjp4IsiFFawJxFwlD1A50MFpIx+ybYWSCkO2BFTYsuuj6wDG4h/6
 ByOTYzXJiBK2BXYn9DrWAiVwoPZWNRl8akRlqGyKo0lELe5UjUYeihR5F8/QGC3g/nPm
 O5zv0XVjFzW6G7R3GVGznr89R3PZ0dNXr1MHzQemfAx7W5eTvxaiYjcOEBjAlXQfvZ3G
 J6uw==
X-Gm-Message-State: AOAM532X9RruaFrz442gi/iSI5++/xfrCihI4TswY5BeVpWB01ffSWs0
 6t6f+vfKznX+NOtA4q4IGqtk2zu6eQMl0Q0OBwGMkZ6BHV02QaxCCy3bR06DsWhwvcscieyyoxC
 DFjJeWtfoKphwd0Q=
X-Received: by 2002:a05:6402:2550:: with SMTP id
 l16mr21332803edb.142.1635946680933; 
 Wed, 03 Nov 2021 06:38:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5boQEHPUluFtbquTr9QM0YT/g3V/BAm5GNKyH1v79iXSQU6GDR6HtRoixVoWCVmesQqUxgw==
X-Received: by 2002:a05:6402:2550:: with SMTP id
 l16mr21332770edb.142.1635946680571; 
 Wed, 03 Nov 2021 06:38:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m9sm1157584eje.102.2021.11.03.06.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 06:37:59 -0700 (PDT)
Message-ID: <e5eee498-85a4-2f22-2580-9bcd6621f746@redhat.com>
Date: Wed, 3 Nov 2021 14:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: more bogus meson warnings
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA9ha4G=AC3p9LKJRC87DkgHVqbrX3X8RPg7vVR_F1Kt1Q@mail.gmail.com>
 <CABgObfaXJZ1E5593HHMEyhXHVKNu85=KSOhg7VXbt93cKA8fvg@mail.gmail.com>
 <CAFEAcA9KF1437LXv+icrizZYcDiNZPn4KRMd0r7rEZWtDKxjpA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9KF1437LXv+icrizZYcDiNZPn4KRMd0r7rEZWtDKxjpA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.528, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 13:19, Peter Maydell wrote:
> This is not my experience. I find that:
>   * test in configure: configure doesn't enable the thing
>   * test in meson: meson produces a WARNING, but goes ahead anyway,
>     and then the final link fails
> 
>> So, in general, you _already_ have an improvement over what was there before.
> 
> Well, in practice what happened was that before the recent changes
> configure correctly didn't put dynamic libraries into the link line,
> and so my configure options resulted in a successful build.

That depends on the individual test.  There are three different cases:

- pkg-config without compile test: in that case you were already 
disabling everything.  You didn't see the improvement (WARN at 
configure/meson time vs. failure at build time) just because you already 
had the link failure years ago

- pkg-config with compile test: this was the case for a handful of 
libraries (spice, epoxy, virglrenderer, gnutls/nettle).  Here indeed 
it's not an improvement in your experience.  On the other hand, I don't 
see any reason to do this for 3-4 libraries out of the dozens that we test.

- library + compile test: the warning is likely not bogus

>> The warning is emitted in the case where the files are present but the
>> test program fails. Of course, Meson doesn't have a crystal ball for
>> the cc.links test when it says that the static lzo2 library is there
>> (apparently it is).
> 
> They're two tests under the hood, but they both need to pass
> for us to be able to use the feature. If they don't both pass,
> then meson should just quietly say "OK, we don't have this thing"
> (ie it could print a "Something or other: NO" line, but it should
> not be printing a "WARNING" line).

Of course it's possible to downgrade the warning line, but I'd rather 
first be sure that the warning is bogus.  If you _do_ have a header and 
static library, but somehow it cannot be used to link the test program, 
it would be correct to warn.  Unlike the configure script, Meson does 
have code to distinguish static vs shared libraries, so the compile test 
should be unnecessary; I would like to understand what causes it to 
fail, so that your system says "Library snappy found: YES" (and warns), 
whereas mine says "no".  I can check that using config-host.mak and 
meson-logs/meson-log.txt.

Paolo

> I just want meson to follow the convention that we have had for
> years, which is:
>   * if I say --enable-foo, then failing to find foo should be an
>     error
>   * if I say --disable-foo, then don't probe for foo at all
>   * if I say nothing, then probe for the various things we need to
>     enable the foo feature, and if they're not presentor not usable
>     for some reason then just quietly don't enable the foo option
> 
> I specifically do *not* want meson to print anything saying
> "WARNING" for case 3, because this should be a fairly normal
> state of affairs.



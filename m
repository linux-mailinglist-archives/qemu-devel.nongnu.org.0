Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E584113FB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 14:06:40 +0200 (CEST)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSI4F-0001Wo-8L
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 08:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mSI0U-0007m6-Kx
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 08:02:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mSI0O-0000J9-8K
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 08:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632139359;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGPzl9JjjjTHU8rnsMGGx1iSbsOVjQRNwJpUu+yrb1U=;
 b=T88RDE9y/N0Ydq+QJQZy/bcp9f0DFUu3fqXkb3b12EnzIX7SPu5YwokEICe/rNg0rJth1z
 jZGhDAQqovn7kQs3em0e8u7Qol/Ec9VaL5wajdWXZSZAPuEQ/N/nxxLfscyXCh9FSfX5Xm
 kPm1vFRwCwVs0t+ejgUh3T+rOmZzV+I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-tUbkC7QSMe-0xABYZHPP7Q-1; Mon, 20 Sep 2021 08:02:38 -0400
X-MC-Unique: tUbkC7QSMe-0xABYZHPP7Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 i4-20020a5d5224000000b0015b14db14deso5864703wra.23
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 05:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=VGPzl9JjjjTHU8rnsMGGx1iSbsOVjQRNwJpUu+yrb1U=;
 b=nqOe9N26fk54aqUWFeuRuF9G1KBuYkLZLcHJJ1MEkf5n5AyATu3ExT22DFC+p3FMLN
 lSAZGc9wyCo824fUyoaINbc7YYD+iC85s35vQgK6Uuk6ZeCZH+OMG2T/dHmEm9bdAdbs
 PoetUPDEYXe3JDixT8+odCYfBkheqngKMQj+UYiQffuiMsEPYpRL7cNl/OEPPo0L4pVn
 C9vDKsg3qXssno2HhgzoX2L5LECgfM9zjM234uIfQ5GAaSxv7THS+Z/6aLjKOYoXM9j1
 kgoVGF/UYXNTu+erGa8o0PppLUWHS60cJIGq40/cG6jiSGwod5CiA7kjjtXq2FDp7aWn
 0tPA==
X-Gm-Message-State: AOAM531a3nBXrgwui8DeaVn/yWVSz2YAldEuVFwthtVC8YGqxRwKq7D6
 Y+fcVex90yEigP5BsJpeB4rQrDvwHfRNc0J5h/iEr+aVQZe+KdwgGpTSR3m0MpJ+MSzxvQUaO13
 UiAXt+8VGz4FQ1aI=
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr28578496wrt.8.1632139356895;
 Mon, 20 Sep 2021 05:02:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjPRmj8ORIVFm+PrW8cViIJkH5GQUpsYG2xAgHMsaGTWtS+Cu2wdoypCKK2T2Q1LqqzvUVVw==
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr28578455wrt.8.1632139356559;
 Mon, 20 Sep 2021 05:02:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id j27sm13945736wms.6.2021.09.20.05.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 05:02:35 -0700 (PDT)
Subject: Re: [PATCH] hw/rtc/pl031: Send RTC_CHANGE QMP event
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210909122402.127977-1-eric.auger@redhat.com>
 <CAFEAcA9gs4of2tw77YfYNjYKjoeBAHy0SknkCFNuZprGa-203Q@mail.gmail.com>
 <f6aa5469-3ef4-bda1-51bd-d0eec5bf9fed@redhat.com>
 <CAFEAcA8UQ3t+Zbo_qiM5uEEgJ3D-4OPGp4GXRPyVyWSd5x1+TA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <646c0216-01f2-55e8-ffb0-25b1f25a1f34@redhat.com>
Date: Mon, 20 Sep 2021 14:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UQ3t+Zbo_qiM5uEEgJ3D-4OPGp4GXRPyVyWSd5x1+TA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: Andrew Jones <drjones@redhat.com>, Gavin Shan <gshan@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 9/16/21 8:24 PM, Peter Maydell wrote:
> On Thu, 16 Sept 2021 at 18:19, Eric Auger <eric.auger@redhat.com> wrote:
>> Hi Peter,
>> On 9/16/21 3:32 PM, Peter Maydell wrote:
>>> None of the other users of qapi_event_send_rtc_change()
>>> seem to have to track the baseline time like this. Shouldn't
>>> this be doing something involving using qemu_ref_timedate()
>>> as the baseline that it uses to figure out the change value ?
>>> (The other users do this via qemu_timedate_diff() but since we
>>> start with a value-in-seconds we might want to expose some other
>>> API in softmmu/rtc.c.)
>> I struggled understanding the various kinds of clocks modeled in qemu
>> and the PL031 implementation. Both devices calling
>> qapi_event_send_rtc_change() seem to store the base rtc in their state
>> (mc146818rtc.c cmos data or spapr_rtc tas_ld(args, )) and then
>> effectivelly call qemu_timedate_diff() on this base rtc value. I did not
>> figure to do the equivalent with the pl031. I will further investigate
>> how I can mimic their implementation though.
> mc146818rtc.c calls qapi_event_send_rtc_change() in rtc_set_time().
> It looks to me like that is just "when the guest writes to an
> RTC register such that the guest RTC time has changed, use
> qemu_timedate_diff() to find out the delta between that and what
> the softmmu/rtc.c clock has as its baseline time, and then pass
> that delta in seconds to qapi_event_send_rtc_change()".
> This RTC has a lot of separate day/month/year registers, so the
> implementation's idea of "current guest RTC setting" is a
> complicated thing that it fills in into a struct tm, and which
> qemu_timedate_diff() then parses back out into a "seconds" value.
>
> spapr_rtc() is a hypercall implementation, so the guest passes it
> a complete set of year/month/day/etc values all at once to set the time.
>
> pl031 is a lot simpler as it is essentially just a count of
> time in seconds, which we set up as "seconds since the Unix epoch".
> But the basic principle is the same: the device contains the state
> that tells you what it thinks the guest RTC value is now, and the
> value we want to pass qapi_event_send_rtc_change() is the
> difference between that and the reference time kept in
> softmmu/rtc.c.
>
> I think what you want is probably:
>
>     struct tm tm;
>
>     qemu_get_timedate(&tm, s->tick_offset);
>     qapi_event_send_rtc_change(qemu_timedate_diff(&tm));

Thank you for the explanation. It works on my end and indeed looks
similar to what other rtc do.

I will respin accordingly adding your Sob.

Thanks

Eric
>
> But I'm not 100% sure. I also feel like this is doing a
> roundtrip from seconds to struct tm to seconds again, which
> seems a bit silly (but it might matter if the rtc is configured
> to 'localtime'? At any rate it's not completely clear that
> it's always a no-op roundtrip).
>
> I've cc'd Paolo who might be a bit more familiar with the rtc code
> than I am.
>
> -- PMM
>



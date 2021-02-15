Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E731B60F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 09:57:35 +0100 (CET)
Received: from localhost ([::1]:59836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBZhG-0000Ig-TU
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 03:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lBZgC-0008Ji-3Y
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 03:56:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lBZgA-0000uu-3V
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 03:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613379384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6LvpU7kfSaPM2aIRVCbiWSbWC9wwTxGYPBVnpxBToUY=;
 b=AeQCBMEXihtX85XxT/vh4pJ/BfGoZYSYwFRzOegg/MScPe9QHKPfyuXRK09SobYpUEZr7f
 j5rUnp4Voeh/XfxMrEsYYxhexet4Gqbp9eOr7cj+5sJUWNz+i+iEA1A/yqppk57+0FLSBN
 2gQMS8mN5MfylrykC6OwZ76cqrjeryA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-WwH9QnqINvCHqZuIMQTtzg-1; Mon, 15 Feb 2021 03:56:22 -0500
X-MC-Unique: WwH9QnqINvCHqZuIMQTtzg-1
Received: by mail-wr1-f70.google.com with SMTP id r5so9666659wrw.10
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 00:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=6LvpU7kfSaPM2aIRVCbiWSbWC9wwTxGYPBVnpxBToUY=;
 b=Owg/9/HbuuO43cjFCHyemMXlQKhl0QBp6DkAZHcNyVlm9MfG2zG7DFx2EMBKNTtpmb
 7++Au8BcJh17mZj8edOiBeyoeOJs0olcCs59LCfGAFR2NPboWlofSWDhSZCXj4AYrNJf
 IXSQRiL1dJe3jINmaTWD4V3pK+gg4tZALb2FP1iT432NYefCuGFkqK4WCFxa8taz11wb
 Nj8piDq3nWYITByEWl1kBkPaFftnapmY5qL6E57noRlofz5lzsjs+//oT47D+MFP9G2O
 1cdfnd4/ix92lCK45d9lseWd2NOtnZWFHAt6bYwz0cdkKNbdynRs+vlkQooLlUHzXOfr
 ARyw==
X-Gm-Message-State: AOAM533TqHJG+RCswXFg1tQ93FTOQV5GpTUGDDp0B5FdnSUw0esY9JBQ
 5+wR7TXuMoq0dHtA74iHfYZbMfK4sJZuQrJTsYfVl7gJi0afjIXJJY1hm7ukyUhjnPGepYSbIhU
 /o8+YSSKW8C+5De4=
X-Received: by 2002:a1c:2094:: with SMTP id
 g142mr13538494wmg.101.1613379380817; 
 Mon, 15 Feb 2021 00:56:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+5iG8HacNkd3BWQHp0OqNcvKAoB99b+KY24Wn10ta7Lyt8TuAVIpSpA2+GA9SQjXSZfghpg==
X-Received: by 2002:a1c:2094:: with SMTP id
 g142mr13538474wmg.101.1613379380600; 
 Mon, 15 Feb 2021 00:56:20 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id m17sm5832868wmq.5.2021.02.15.00.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 00:56:20 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
In-Reply-To: <20210212170527.0e93e6b2@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com> <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com> <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <87h7mhl33o.fsf@vitty.brq.redhat.com> <20210212170527.0e93e6b2@redhat.com>
Date: Mon, 15 Feb 2021 09:56:19 +0100
Message-ID: <87blcllnf0.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Fri, 12 Feb 2021 16:26:03 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
>> 
>> > Igor Mammedov <imammedo@redhat.com> writes:
>> >  
>> >>
>> >> Please try reusing scratch CPU approach, see
>> >>   kvm_arm_get_host_cpu_features()
>> >> for an example. You will very likely end up with simpler series,
>> >> compared to reinventing wheel.  
>> >
>> > Even if I do that (and I serioulsy doubt it's going to be easier than
>> > just adding two 'u64's, kvm_arm_get_host_cpu_features() alone is 200
>> > lines long) this is not going to give us what we need to distinguish
>> > between
>> >
>> > 'hv-passthrough,hv-evmcs'
>> >
>> > and 
>> >
>> > 'hv-passthrough'
>> >
>> > when 'hv-evmcs' *is* supported by the host. When guest CPU lacks VMX we
>> > don't want to enable it unless it was requested explicitly (former but
>> > not the later).  
>> 
>> ... and if for whatever reason we decide that this is also bad/not
>> needed, I can just drop patches 16-18 from the series (leaving
>> 'hv-passthrough,hv-feature=off' problem to better times).
> that's also an option,
> we would need to make sure that hv-passthrough is mutually exclusive
> with ''all'' other hv- properties to avoid above combination being
> ever (mis)used.

That's an option to finally get these patches merged, not a good option
for end users. 

'hv-passthrough,hv-feature' works today and it's useful. Should we drop
it?

'hv-passthrough/hv-default' and 'hv-passthrough/hv-default,hv-evmcs'
should give us sane results.

'hv-passthrough,hv-feature=off' is convenient.

Why droppping this all? To save 9 (nine) lines of code in the parser? 

-- 
Vitaly



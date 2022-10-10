Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531785FA442
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 21:37:42 +0200 (CEST)
Received: from localhost ([::1]:60438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohyar-0003RT-BP
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 15:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ohy8J-00052S-JB
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ohy8G-0001iH-AC
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665428884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1SFTz/EXzW3lNR28d9ldJIIdtmr6pc9r2sFm0vjATo=;
 b=dy6Ox5IxlW9yRYAEeNdQxP+Efd07AVdMbjghAXd9w5eB3MU9HAXm4FNCKe4LkvnqjsXJwY
 2SUBZ3DlBTxsEOG+Yn6ykmYqDxji8CNdprtp3+LOfX4ynjC9RWqF2UKZcmzvBiFFAMQsiI
 53hMgKV5EKg5+HrjTdpwIfA/ZqSbKqY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-KafvgKsQPrm_jr4Z0_KZUg-1; Mon, 10 Oct 2022 15:08:03 -0400
X-MC-Unique: KafvgKsQPrm_jr4Z0_KZUg-1
Received: by mail-qt1-f198.google.com with SMTP id
 a19-20020a05622a02d300b0039a3711179dso2144683qtx.12
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 12:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z1SFTz/EXzW3lNR28d9ldJIIdtmr6pc9r2sFm0vjATo=;
 b=PNlynO0KYWdBHozYptEdasiHD+vn5Luz4UIPsdmPgkWtboEerrSbWXQZdbDpOl5kMS
 KYnUdFZBWcnNbxGdWrCKLDMZzCtjbQKw9WF1Q40eIdC9MlNCvgLDbARC9d6gq0Kg575l
 PQIkD7FP5PVSbKc/GFW9MQHbARY2F4CuUBqEplyOZhIcTXF74nbwJmRVmefZMXpmIxF1
 aosTYMpxSVQfii9CuIc35VVha3Y7KiYK2dBWqLji9l+4/NDTBA02ljd3TcQ08iB1DzEB
 F3KveC9MpD/EGb9L6IreNwfU0X1kro+/b3VpzB/EScJ5V/oOhQE8FYKRbz8C4IRndxES
 MfPQ==
X-Gm-Message-State: ACrzQf0jOcwsC+Z5T9ziklWHR2lccUD8VbOTgvrVoKqHNExXoRhoZead
 dzU5w4QUD2LyP8wvl+NNEs2YtiqgkWLZi557wrjn7of9gO9mnL6O8xM3+K3RDFAeR6kir3cXI5u
 1/bCQoSelNW6USuk=
X-Received: by 2002:a05:622a:120f:b0:35c:c189:a6a0 with SMTP id
 y15-20020a05622a120f00b0035cc189a6a0mr16326874qtx.599.1665428883069; 
 Mon, 10 Oct 2022 12:08:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/NA7C2qkZxX72WYuR/SrV4uGOHT61o2vUiibNexI4jq9ZFDLwoL1pNro8KJDARHGHCHPKDA==
X-Received: by 2002:a05:622a:120f:b0:35c:c189:a6a0 with SMTP id
 y15-20020a05622a120f00b0035cc189a6a0mr16326843qtx.599.1665428882842; 
 Mon, 10 Oct 2022 12:08:02 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 r10-20020ae9d60a000000b006ce51b541dfsm2079941qkk.36.2022.10.10.12.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 12:08:02 -0700 (PDT)
Date: Mon, 10 Oct 2022 15:08:00 -0400
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PULL 29/55] Revert "intel_iommu: Fix irqchip / X2APIC
 configuration checks"
Message-ID: <Y0RtkAWh28ALg1oB@xz-m1.local>
References: <20221010172813.204597-1-mst@redhat.com>
 <20221010172813.204597-30-mst@redhat.com>
 <ff11454f877ce7ccb0a02a9343715bbb8f32194f.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff11454f877ce7ccb0a02a9343715bbb8f32194f.camel@infradead.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 10, 2022 at 10:39:52AM -0700, David Woodhouse wrote:
> On Mon, 2022-10-10 at 13:30 -0400, Michael S. Tsirkin wrote:
> > From: Peter Xu <
> > peterx@redhat.com
> > >
> > 
> > It's true that when vcpus<=255 we don't require the length of 32bit APIC
> > IDs.  However here since we already have EIM=ON it means the hypervisor
> > will declare the VM as x2apic supported (e.g. VT-d ECAP register will have
> > EIM bit 4 set), so the guest should assume the APIC IDs are 32bits width
> > even if vcpus<=255.  In short, commit 77250171bdc breaks any simple cmdline
> > that wants to boot a VM with >=9 but <=255 vcpus with:
> 
> I find that paragraph really hard to parse. What does it even mean that
> "guest should assume the APIC IDs are 32bits"? 

Quotting EIM definition:

 0: On Intel® 64 platforms, hardware supports only 8-bit APIC-IDs (xAPIC
    Mode).

 1: On Intel® 64 platforms, hardware supports 32-bit APIC- IDs (x2APIC
    mode).  Hardware implementation reporting Interrupt Remapping support
    (IR) field as Clear also report this field as Clear.

I hope the statement was matching the spec.  Please let me know if you have
better way to reword it.

> 
> In practice, all the EIM bit does is *allow* 32 bits of APIC ID in the
> tables. Which is perfectly fine if there are only 254 CPUs anyway, and
> we never need to use a higher value.
> 
> I *think* the actual problem here is when logical addressing is used,
> which puts the APIC cluster ID into higher bits? But it's kind of weird
> that the message doesn't mention that at all?

The commit message actually doesn't even need to contain a lot of
information in this case, IMO.

Literally it can be seen as a revert of a commit which breaks guest with
>8vcpu from boot.  I kept the other lines because that still make sense, or
it can be a full revert with "something broke with commit xxx, revert it to
fix" and anything else could be reworked.  AFAICT that's how it normally
works with QEMU or Linux.

I am not 100% familiar with the original purpose of the patch, would
eim=off work for you even after patch applied?  Anything severely wrong
with this patch?

> 
> That's fixable by just setting the X2APIC_PHYSICAL bit in the ACPI
> FADT, isn't it? Then the only values that a guest may put into those
> fields — 32-bit fields or not — are lower than 0xff anyway.

It's still not clear to me why we need to make it inconsistent between the
EIM we declare to the guest and the KVM behavior on understanding EIM bit.
Even if enforced physical mode will work we loose the possibility of
cluster mode, and I also don't see what's the major benefit since EIM=off
will just work, afaiu, meanwhile make everything aligned.

Are you fine if we proceed with this pull request first and revisit later?
Follow up patches will always be fine, and we're unbreaking something.  I
have copied you since the 1st patch I posted and the small patch was there
for weeks, it'll be appreciated if either you could comment earlier next
time, or even propose a better fix then we can discuss what's the best way
to fix.  Thanks.

-- 
Peter Xu



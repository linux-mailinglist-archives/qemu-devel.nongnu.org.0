Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AC22FCDBC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:10:16 +0100 (CET)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ARL-0003BW-2c
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l2APS-0001dQ-N1
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:08:18 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l2APP-00029V-Pp
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:08:18 -0500
Received: by mail-wm1-x329.google.com with SMTP id c128so2297354wme.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 02:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=Y0vZsqRR9a41kPs4m8SJakjkxM7/de7QrW7LEa6XBGQ=;
 b=v6hg9OPXozbDEEtiUXbfyM5acENb1P+9HfekiJhroYtDSl52KUtFon/J50+r435L42
 Av8/iH1bZG+DrOn4S7v4h1sDSSROUO6Ba4mZen6m5wPpjb/kWiCVFm8FI0JfUM/GYBsf
 ZLy9bXCMYGbmSfHkZzlBXBE1YDR1NbEceE24yTwM3Plb/U77k90/4k0hDn+Fa9ESuhKA
 13yWJCUYI1uVDqGxRiOhTg/RkFzg3P1l9x3de1/ndkiIDp0+rUxsmEY2fwNgBBDTdCeJ
 dbMWQmfs1Uo6GsdJohZzAlfdvWkeLGCAZNkueiYe50RggbEgqVv4iEfncZCBGysA5FQJ
 cBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=Y0vZsqRR9a41kPs4m8SJakjkxM7/de7QrW7LEa6XBGQ=;
 b=sUsXMuE2V/iEPFl7/kVH9kIeZFuz2tZqrWCgwSEQo8DWsGktaQ/JUf3Gdq5GBQHy+2
 7IHUnQXKIo0PSsAh58apEqSKNHp0uEBkphz27glzrMQ4nOlpFhopVMjWzU5HPQpXGQKl
 XREY6xpwo+Gyng+yoDebIYuKZM9AvupOERA4koK+GtE1DiwXBjxP7fi9ojdeoXohiO3/
 v3BmCHXmShGUlcHCdRbo4wkz11PHPuI8ps/dtRCB1/jjCXwvUWIb4/mv9j8i0TL8ou+4
 1XJXvtNdkOKg0lcBQ8HHnzDEtxJm6CGjNJxbE1wISu1H590YLRe8fXMmQ7SWpVgdnBnv
 XKwQ==
X-Gm-Message-State: AOAM533/t/wOVI7MUGMcPMy4emjFTZqOklntCFtT7/eAB1FKuZM0VxgR
 ULZg91RcABIzOUnW3iiX8LNYdg==
X-Google-Smtp-Source: ABdhPJwIvzVxQBLAXEnx2SN8hpU0BK2irp50xHqcY6jVz46lmtGjFFNKlqaJ1il6mEVU1ifD09UKyw==
X-Received: by 2002:a1c:5941:: with SMTP id n62mr3514315wmb.63.1611137293171; 
 Wed, 20 Jan 2021 02:08:13 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id h9sm2965025wme.11.2021.01.20.02.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 02:08:12 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 564a8a90;
 Wed, 20 Jan 2021 10:08:11 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [RFC PATCH 1/2] hw/i386: -cpu model,-feature,+feature should
 enable feature
In-Reply-To: <20210120105924.3ffd1723@redhat.com>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119142207.3443123-2-david.edmondson@oracle.com>
 <20210119152056.GE1227584@habkost.net> <cuna6t499ir.fsf@dme.org>
 <20210119163052.GG1227584@habkost.net>
 <20210120105924.3ffd1723@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
X-Now-Playing: Four Tet - Sixteen Oceans: Insect Near Piha Beach
Date: Wed, 20 Jan 2021 10:08:11 +0000
Message-ID: <cun4kjb9b04.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::329;
 envelope-from=dme@dme.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-01-20 at 10:59:24 +01, Igor Mammedov wrote:

> On Tue, 19 Jan 2021 11:30:52 -0500
> Eduardo Habkost <ehabkost@redhat.com> wrote:
>
>> On Tue, Jan 19, 2021 at 04:27:56PM +0000, David Edmondson wrote:
>> > On Tuesday, 2021-01-19 at 10:20:56 -05, Eduardo Habkost wrote:
>> >   
>> > > Hi,
>> > >
>> > > Thanks for the patch.  Getting rid of special -feature/+feature
>> > > behavior was in our TODO list for a long time.
>> > >
>> > > On Tue, Jan 19, 2021 at 02:22:06PM +0000, David Edmondson wrote:  
>> > >> "Minus" features are applied after "plus" features, so ensure that a
>> > >> later "plus" feature causes an earlier "minus" feature to be removed.
>> > >> 
>> > >> This has no effect on the existing "-feature,feature=on" backward
>> > >> compatibility code (which warns and turns the feature off).  
>> > >
>> > > If we are changing behavior, why not change behavior of
>> > > "-feature,feature=on" at the same time?  This would allow us to
>> > > get rid of plus_features/minus_features completely and just make
>> > > +feature/-feature synonyms to feature=on/feature=off.  
>> > 
>> > Okay, I'll do that.
>> > 
>> > Given that there have been warnings associated with
>> > "-feature,feature=on" for a while, changing that behaviour seems
>> > acceptable.
>> > 
>> > Would the same be true for changing "-feature,+feature"? (i.e. what this
>> > patch does) Really: can this just be changed, or does there have to be
>> > some period where the behaviour stays the same with a warning?  
>> 
>> I actually expected warnings to be triggered when using
>> "-feature,+feature" as well.  If we were not generating warnings
>> for that case, it will need more careful evaluation, just to be
>> sure it's safe.  Igor, do you remember the details here?
> As part of preparation to define/create machines via QMP,
> I plan to post patch(s) to deprecate +-features in 6.0
> (including special casing for -feat behavior (affects x86/sparc only))
> and drop support for +-feat in 2 releases.
> So we should end up with canonical property behavior only like all other
> CPUs and devices.

In that case I will abandon this change and focus on getting my upstack
consumer to switch away from using +-.

Thanks.

dme.
-- 
Sometimes these eyes, forget the face they're peering from.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888A52B7A40
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:22:04 +0100 (CET)
Received: from localhost ([::1]:56406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJf9-00022f-Lb
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfJeM-0001dQ-RS
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:21:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfJeL-0004PS-3o
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605691271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Xn/FxuYCwy/zNvBRAcz1f2YR1JglHqUbgVm483yU+g=;
 b=bykHtyoD0CWY5EdMo/TqbnA12Vv1FLLAXZP5DzoAUFT8kwJEQO4yqK2BfcdugY9A5v7KGD
 tr2ffQUShgL+fxlrU0TrMF8Ve5C9dLvDtcUoi7/QoFaadfdc7SP6WFCRa97heYPpaO2baW
 tHhH8Xc/oeWLhUsKwtryxCUOee2TxdY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-I_hp99YgNYq1W_apjSwaBQ-1; Wed, 18 Nov 2020 04:21:10 -0500
X-MC-Unique: I_hp99YgNYq1W_apjSwaBQ-1
Received: by mail-ej1-f72.google.com with SMTP id a13so270273ejv.17
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 01:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Xn/FxuYCwy/zNvBRAcz1f2YR1JglHqUbgVm483yU+g=;
 b=H9DBdSkq/dlHCkeE6cJ28dEDOaNpV+tuLRa4CqlBJp4kHtKvx2Ed4TvjBnmTotnHP2
 8QTPLwW48kFWoPYtNFyClYYg/dq/ewPXHUKTRFbYLpwkGRT/NHOJCVvswZv4s3y3B4JI
 Q8UMZPDhfjztBVMnlRAXB4hy1TzTfa+QzPCqJx2+vjbWz4dox39a7LPM41nUEDOjHZfb
 tAfVivFswkDMdfuG9Al0P1Y3IncGTf+FMzF6rzeE2QsCecwfnaP9xuZnlZtwiGpgSMz8
 AjPt0+I9PdvfcJjVH/jHJoUGxwqdDqX3iAUXM4NGE97B0/H2xj8Kq4U7h0afYJuCTZiw
 JgJQ==
X-Gm-Message-State: AOAM531cov/yOMST7rforitrhKH3Orefvw0VSnTyu4zw7QDGE5nWMCT5
 eKdK1mUePAeSC78nPdJsWiUTBp9NshCdUYRfVeuW4s9BBI9OXc0xAjw42Je8TjdCePF/Ryu+ppC
 NY7y8227JsvYOBPU0ktVonBZU37J1ZB0g9UHmpsg2wwEPFAGaI4HylGWdNegYsrTZyt4=
X-Received: by 2002:a17:906:8c6:: with SMTP id
 o6mr21849902eje.230.1605691268761; 
 Wed, 18 Nov 2020 01:21:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIACbrHEt862GqiLCuUIIGZE6sIC+WATM2GEzeDxM9DoilPhkxIUeiNE1omKKfU/w/Sf794A==
X-Received: by 2002:a17:906:8c6:: with SMTP id
 o6mr21849887eje.230.1605691268425; 
 Wed, 18 Nov 2020 01:21:08 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f19sm13122181edy.13.2020.11.18.01.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 01:21:07 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net> <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local> <87ft57oycu.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
Message-ID: <b9307f87-5350-21a6-68dd-d4efbae5e502@redhat.com>
Date: Wed, 18 Nov 2020 10:21:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87ft57oycu.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/20 09:36, Markus Armbruster wrote:
> 
> The part that counts is do_configure_accelerator().  I works as follows:
> 
> 1. Look up the chosen accelerator's QOM type (can fail)
> 2. Instantiate it (can't fail)
> 3. Set properties (can fail)
> 4. Connect the accelerator to the current machine (can fail)
> 
> Aside: step 3 uses &error_fatal, unlike the other failures.  Fishy.

That's because step 3 is a user error, unlike (in the usual case) the 
others:

1. You get it from "-accel whpx" if whpx is not available; this is not a 
user error if there is a fallback.  You also get it from misspellings 
such as "-accel kvmm", which is presumably a user error, but it's hard 
to distinguish the two especially if a future version of QEMU ends up 
adding a "kvmm" accelerator

3. You get it from "-accel tcg,misspeled-property=off".  This is a user 
error.  You also get it from "-accel tcg,absent-property=on" and "-accel 
tcg,invalid-value=42".  This may be a property that the user wants to 
set but was only added in a future version of QEMU.  Either way, it's 
quite likely that the user does _not_ want a fallback here.

4. Here the accelerator exists but the machine does not support it.  The 
choice is to fallback to the next accelerato.

This means there is no way for the user to distinguish "the accelerator 
doesn't exist" from "the accelerator exists but is not supported".  This 
was done for no particular reason other than to keep the code simple.

> Failure in step 1 is "accelerator not compiled in".  Predictable with
> qom-list-types.
> 
> Failure in step 3 doesn't look predictable.

It's more or less predictable with qom-list-properties, though of course 
not the "invalid value for the property" case.

> Failure in step 4 can be due to kernel lacking (a workable version of)
> KVM, but the current machine gets a say, too.  Also doesn't look
> predictable.
> 
> Aside: kvm_init() reports errors with fprintf(), tsk, tsk, tsk.
> 
> Existing query-kvm doesn't really predict failure, either.  'present' is
> true if CONFIG_KVM.  Should be equivalent to "QOM type exists",
> i.e. step 1.  I guess 'enabled' is true when the KVM accelerator is in
> use.
> 
> While figuring this out, I noticed that the TYPE_ACCEL instance we
> create doesn't get its parent set.  It's therefore not in the QOM
> composition tree, and inaccessible with qom-get.  Paolo, is this as it
> should be?

It should be added, I agree, perhaps as /machine/accel.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9B36A5885
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:46:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyRM-0001Aa-Qf; Tue, 28 Feb 2023 06:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWyRH-00011w-Q5
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:46:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWyRA-0007NQ-Af
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677584787;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=m6cRSYLDqBxmDSEyqiKzUBHNZS0fEiYg0wE6z64pGGM=;
 b=MkAPqmXvOnAi3rLxbtZIkbezPCSjVGVlScaI9gRc3h5CEktpZyQ8YvGp95qJ71I487wBF5
 h1c12PYVGkdwvuV697RLBVHpVEh9lYNgKsHi4cHGdtyUbXpvcwNYE964ByFjJi7nh/LmeQ
 i3LOYWw/m0wimBwlstAyIEWVBvebr7Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-uiP78xkAM_y_wCxwK1Xg-w-1; Tue, 28 Feb 2023 06:46:24 -0500
X-MC-Unique: uiP78xkAM_y_wCxwK1Xg-w-1
Received: by mail-wm1-f70.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so6796780wms.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6cRSYLDqBxmDSEyqiKzUBHNZS0fEiYg0wE6z64pGGM=;
 b=sUikewmNr5WwG+FINWYWuS5ZBZqg9cfPa5I5gyo+fQxBJsb2HN+zTzB/RHO5oImGvd
 NiwZ27c+BBmzYnH4QR5AL70fI+Ovbx0wrZNjb/1oIxxGy8udtY6+8HpHx15jq7swuzct
 uGFf9Ag0R6smbiabjrr9HviO2/y7j5R6WHKkcLCuz5JGKG6nyuvefxlkKjTixHTrhXtK
 YDSBup1Kl5D3IKTAFcbtjTk8Kr4K9WJUrok5bn1q6Xxrk6FzNdjOkfFH7xPOGN7dCo1g
 evtWNdZto6TkwbEiyezs5Yc4PWBcSJ5ns45kgFy3mq/CvREo4H/CX/88fBMaCw8OLHHg
 kSKQ==
X-Gm-Message-State: AO0yUKX79jWffxbUN/r7S005mkisg2sKJb/z584G9jyaHPECLdf5vrff
 6cX4LNG1REheF3U1/YTdmD32dGXGZAURg69MDdUXl/BeItlWSSNErXHUOSh2up60vJU9eapGyac
 yXm+lXNyVfo00hgE=
X-Received: by 2002:a05:600c:4fc8:b0:3ea:e7e7:95da with SMTP id
 o8-20020a05600c4fc800b003eae7e795damr1964806wmq.8.1677584782844; 
 Tue, 28 Feb 2023 03:46:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/shMKwCM172ZTzRXWJO9JyUd7nbrrQtrMMFTF4z77g0hvfydVuvcyPD65XxdgZUTNXe8YBCg==
X-Received: by 2002:a05:600c:4fc8:b0:3ea:e7e7:95da with SMTP id
 o8-20020a05600c4fc800b003eae7e795damr1964788wmq.8.1677584782462; 
 Tue, 28 Feb 2023 03:46:22 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a7bca59000000b003db0bb81b6asm12198013wml.1.2023.02.28.03.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:46:21 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm-devel <kvm@vger.kernel.org>,  qemu-devel@nongnu.org,  Markus
 Armbruster <armbru@redhat.com>,  Paul Moore <pmoore@redhat.com>,
 peter.maydell@linaro.org
Subject: Re: Fortnightly KVM call for 2023-02-07
In-Reply-To: <Y/fi95ksLZSVc9/T@google.com> (Sean Christopherson's message of
 "Thu, 23 Feb 2023 14:04:39 -0800")
References: <87o7qof00m.fsf@secure.mitica> <Y/fi95ksLZSVc9/T@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 28 Feb 2023 12:46:20 +0100
Message-ID: <87cz5uko6r.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Sean Christopherson <seanjc@google.com> wrote:
> On Tue, Jan 24, 2023, Juan Quintela wrote:
>> Please, send any topic that you are interested in covering in the next
>> call in 2 weeks.
>> 
>> We have already topics:
>> - single qemu binary
>>   People on previous call (today) asked if Markus, Paolo and Peter could
>>   be there on next one to further discuss the topic.
>> 
>> - Huge Memory guests
>> 
>>   Will send a separate email with the questions that we want to discuss
>>   later during the week.
>> 
>> After discussions on the QEMU Summit, we are going to have always open a
>> KVM call where you can add topics.
>
> Hi Juan!
>
> I have a somewhat odd request: can I convince you to rename "KVM call" to something
> like "QEMU+KVM call"?
>
> I would like to kickstart a recurring public meeting/forum that (almost) exclusively
> targets internal KVM development, but I don't to cause confusion and definitely don't
> want to usurp your meeting.  The goal/purpose of the KVM-specific meeting would be to
> do design reviews, syncs, etc. on KVM internals and things like KVM selftests, while,
> IIUC, the current "KVM call" is aimed at at the entire KVM+QEMU+VFIO ecosystem.

I can do that.
I would have told you that you could use our slots, but right now we are
quite low on slots.

If nobody objects, I will change that for the next call.

Later, Juan.



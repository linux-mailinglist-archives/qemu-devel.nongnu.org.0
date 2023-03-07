Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D96AE65D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:23:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZa5d-0003Ew-U3; Tue, 07 Mar 2023 11:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34GQHZAYKCu0hTPcYRVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--seanjc.bounces.google.com>)
 id 1pZa5c-00039i-1K
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:23:00 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34GQHZAYKCu0hTPcYRVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--seanjc.bounces.google.com>)
 id 1pZa5a-0007OO-CA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:22:59 -0500
Received: by mail-pl1-x64a.google.com with SMTP id
 p10-20020a170902e74a00b0019ec1acba17so3947328plf.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678206176;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=dzwmgXbEnaJ8WTXtlWlG70ogHYxoTpSYg1RXe33jVAI=;
 b=qK+gWWi+Xqy+bGVhNI9pTgKz39hYB5+g2ZK1dCBkS3IAxEky7An9FabS7+yE7w5WI1
 uvRno99WwDIc7iTOdxZatPXZ0R4DLDw/iJIeAJ58NVtwhfKt2MlQvzgdOceCpcR9gDgH
 ppH3981TQ59V+aK4G1VUSTrhO5gPCnaFENvbF5n2yZgaCWI/NKuqmw4OR2pXE2n6Ah/N
 K0GywXP/Qf2NyxfRhUaY39llY1qC0gCKH19abwEzqudrhjsKep5fsi7G7ZlitAa5cr4K
 HaOxZMjqrmvBsG1o03pBwYPdXS1d6FY8/JZ9DJzJN+x4v/0spijluclabyZvBuS+Me4p
 An0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678206176;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dzwmgXbEnaJ8WTXtlWlG70ogHYxoTpSYg1RXe33jVAI=;
 b=lQe4dYBhXTqz3XFRct1xRX5jrBYZZaLLQgr3Ua4FXEOFoCu1WwXoxZ053ANj/mld23
 TitJaeuc6ETmYX6VZZ8O5acyJrjQihCOh33hCZGx9LPX9Gu1IhEbEWI3hLkAn3wyuJeo
 aUShnRcjlwDttcHnL1tIG4SPyNVeg9OOkCxstoobTs7+AqBoWf2234mRgWZltZJzrnYc
 MaxTepD06Q3fKNsScgy8kYhuydOjtzun7iQQiZksEONH1xCvfSojKOwHNuSqZZ3XHm1y
 ACnJ3Mip39scHehEh3k4kFdDjTMj0pFd0U5NkZ1veTfN4GxEXCG+1csJe/1sQbk7BEF0
 iHAA==
X-Gm-Message-State: AO0yUKVjgL0J5IT3RmXyT8FBx+vl2AmvlDQD2NM5fIxDzhYqKCxDX8iS
 XAENxNsX7IQKXt66Vpuye8H9o3jv/SA=
X-Google-Smtp-Source: AK7set8XZeEvrGzd+hynG7/OVGG4afGZ126KRN2WkaqKocUe0BagLRl+LDFnHZ6s20eiKfSqAliDNs4jvfA=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:4e04:b0:239:d0ab:a7c9 with SMTP id
 n4-20020a17090a4e0400b00239d0aba7c9mr5301262pjh.4.1678206176146; Tue, 07 Mar
 2023 08:22:56 -0800 (PST)
Date: Tue, 7 Mar 2023 08:22:54 -0800
In-Reply-To: <87cz5uko6r.fsf@secure.mitica>
Mime-Version: 1.0
References: <87o7qof00m.fsf@secure.mitica> <Y/fi95ksLZSVc9/T@google.com>
 <87cz5uko6r.fsf@secure.mitica>
Message-ID: <ZAdk3v5P/c4qpmLv@google.com>
Subject: Re: Fortnightly KVM call for 2023-02-07
From: Sean Christopherson <seanjc@google.com>
To: Juan Quintela <quintela@redhat.com>
Cc: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, Paul Moore <pmoore@redhat.com>,
 peter.maydell@linaro.org
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=34GQHZAYKCu0hTPcYRVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--seanjc.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023, Juan Quintela wrote:
> Sean Christopherson <seanjc@google.com> wrote:
> > On Tue, Jan 24, 2023, Juan Quintela wrote:
> >> Please, send any topic that you are interested in covering in the next
> >> call in 2 weeks.
> >> 
> >> We have already topics:
> >> - single qemu binary
> >>   People on previous call (today) asked if Markus, Paolo and Peter could
> >>   be there on next one to further discuss the topic.
> >> 
> >> - Huge Memory guests
> >> 
> >>   Will send a separate email with the questions that we want to discuss
> >>   later during the week.
> >> 
> >> After discussions on the QEMU Summit, we are going to have always open a
> >> KVM call where you can add topics.
> >
> > Hi Juan!
> >
> > I have a somewhat odd request: can I convince you to rename "KVM call" to something
> > like "QEMU+KVM call"?
> >
> > I would like to kickstart a recurring public meeting/forum that (almost) exclusively
> > targets internal KVM development, but I don't to cause confusion and definitely don't
> > want to usurp your meeting.  The goal/purpose of the KVM-specific meeting would be to
> > do design reviews, syncs, etc. on KVM internals and things like KVM selftests, while,
> > IIUC, the current "KVM call" is aimed at at the entire KVM+QEMU+VFIO ecosystem.
> 
> I can do that.
> I would have told you that you could use our slots, but right now we are
> quite low on slots.
> 
> If nobody objects, I will change that for the next call.

Thanks, much appreciated!


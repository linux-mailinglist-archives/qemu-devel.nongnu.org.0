Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F36A9BC8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8JL-0007Eg-Nj; Fri, 03 Mar 2023 11:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pY8JH-0006xP-Qe
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:31:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pY8JF-0004lA-Ue
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677861062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cbXxVdKVI0MvStnUdkmS7+GsdOiKehJxOLzVcQzqHrM=;
 b=GLgT5gG9doc1D4DwW/bRwkrD5JZ6aov6hTSCBSd3zGMRP/x0DCo/UqIwr+EUcgxWH2OsKc
 20iINkarXKuq9GguNHOjMsUNWjYpJmtq7wWlBWsJO/xHanJbV+qtx596BgpWKKiUkcBeu7
 5bhKkVGc3eDIG52TNYakOUdvA63G4y0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-Z6DqMzh-OuCQwFxsmp0oYA-1; Fri, 03 Mar 2023 11:30:59 -0500
X-MC-Unique: Z6DqMzh-OuCQwFxsmp0oYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5C851802D42;
 Fri,  3 Mar 2023 16:30:58 +0000 (UTC)
Received: from localhost (unknown [10.39.194.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A26A11121318;
 Fri,  3 Mar 2023 16:30:58 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrea Bolognani <abologna@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Auger
 <eauger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
In-Reply-To: <CAFEAcA-Q6hzgW-B52X5XEtZsvBX64qSr9wSKizLVYu58mPdXKw@mail.gmail.com>
Organization: Red Hat GmbH
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com>
 <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
 <87sfeoblsa.fsf@redhat.com>
 <CAFEAcA8z9mS55oBySDYA6PHB=qcRQRH1Aa4WJidG8B=n+6CyEQ@mail.gmail.com>
 <87cz5rmdlg.fsf@redhat.com>
 <CAFEAcA-Q6hzgW-B52X5XEtZsvBX64qSr9wSKizLVYu58mPdXKw@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 03 Mar 2023 17:30:57 +0100
Message-ID: <87zg8tztj2.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 02 2023, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 2 Mar 2023 at 14:29, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> On Thu, Mar 02 2023, Peter Maydell <peter.maydell@linaro.org> wrote:
>> > I think having MTE in the specific case of KVM behave differently
>> > to how we've done all these existing properties and how we've
>> > done MTE for TCG would be confusing. The simplest thing is to just
>> > follow the existing UI for TCG MTE.
>> >
>> > The underlying reason for this is that MTE in general is not a feature
>> > only of the CPU, but also of the whole system design. It happens
>> > that KVM gives us tagged RAM "for free" but that's an oddity
>> > of the KVM implementation -- in real hardware there needs to
>> > be system level support for tagging.
>>
>> Hm... the Linux kernel actually seems to consider MTE to be a cpu
>> feature (at least, it lists it in the cpu features).
>>
>> So, is your suggestion to use the 'mte' prop of the virt machine to mean
>> "enable all prereqs for MTE, i.e. allocate tag memory for TCG and enable
>> MTE in the kernel for KVM"? For TCG, we'll get MTE for the max cpu
>> model; for KVM, we'd get MTE for host (== max), but I'm wondering what
>> should happen if we get named cpu models and the user specifies one
>> where we won't have MTE (i.e. some pre-8.5 one)?
>
> I think we can probably cross that bridge when we get to it,
> but I imagine the semantics would be "cortex-foo plus MTE"
> (in the same way that -cpu cortex-foo,+x,-y can add and
> subtract features from a baseline).

I'm wondering how we should try to model this, given that
cpu_model_advertised_features is a bit of a weird mix of architecture
flags and implementation-specific knobs.

Given that there are some KVM patchsets floating around to allow
userspace to limit some features for migration compat handling, I don't
think it will be too long before we'll try to figure out how to do cpu
models for KVM in QEMU as well...



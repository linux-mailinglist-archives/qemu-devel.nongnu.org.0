Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D819D4FB84F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 11:51:50 +0200 (CEST)
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndqi5-00051W-Cl
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 05:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndqgV-0003Im-Jz
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 05:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndqgR-0000gZ-Uh
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 05:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649670607;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XWXoF9HpFMcNdT8fHg7wpqnDzBJ5ArQlGKtUeJKBfg=;
 b=bhq9cLzz1hgTQ5+wpcn0wwTWAJ2pKkFLl8tHQeVtItDMdRUobRtkeqMbIUjXeuFVOn4Fm1
 2/GzHDy+Egq4yH1yvEHDDWlnfQnBy4OYIkp9qMOYDrkW0LgGgTpJDGeeCGQSpYRx/lNtl3
 p38ggt4ubZ5da9kh8+JNBp/g7DyP1Vw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-5F5xj5AtMc-wT6pG81EYgA-1; Mon, 11 Apr 2022 05:50:02 -0400
X-MC-Unique: 5F5xj5AtMc-wT6pG81EYgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 692A883396C;
 Mon, 11 Apr 2022 09:50:01 +0000 (UTC)
Received: from [10.72.12.73] (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE40D40D0160;
 Mon, 11 Apr 2022 09:49:56 +0000 (UTC)
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220411065842.63880-1-gshan@redhat.com>
 <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <a84ed377-2428-11ca-ee17-0dc8debebcf1@redhat.com>
Date: Mon, 11 Apr 2022 17:49:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: drjones@redhat.com, agraf@csgraf.de, Oliver Upton <oupton@google.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 4/11/22 5:22 PM, Peter Maydell wrote:
> On Mon, 11 Apr 2022 at 07:59, Gavin Shan <gshan@redhat.com> wrote:
>>
>> There are two arrays for each CPU, to store the indexes and values of the
>> coprocessor registers. Currently, 8 bytes fixed storage space is reserved
>> for each coprocessor register. However, larger coprocessor registers have
>> been defined and exposed by KVM. Except SVE registers, no coprocessor
>> register exceeds 8 bytes in size. It doesn't mean large coprocessor registers
>> won't be exploited in future. For example, I'm looking into SDEI virtualization
>> support, which isn't merged into Linux upstream yet. I have plan to add
>> several coprocessor ("firmware pseudo") registers to assist the migration.
> 
> So, can you give an example of coprocessor registers which are
> not 8 bytes in size? How are they accessed by the guest?
> If we need to support them then we need to support them, but this
> cover letter/series doesn't seem to me to provide enough detail
> to make the case that they really are necessary.
> 
> Also, we support SVE today, and we don't have variable size
> coprocessor registers. Is there a bug here that we would be
> fixing ?
> 

[Cc Oliver Upon]

Apart from SVE registers, I don't think we have any more large registers
whose sizes exceed 8 bytes for now, until SDEI virtualization needs more
large registers for migration.

I'm working the KVM series to support SDEI virtualization and last revision
is v6. One of the requirement is to migrate the SDEI events and states.
In v5, the migration is done by the dedicated ioctl commands and it was
suggested by Oliver to use {GET, SET}_ONE_REG. Note that the series isn't
merged yet. So I had the prototype to support SDEI's migration through
{GET, SET}_ONE_REG. Note that those newly added registers are inaccessible
from guest.

https://github.com/gwshan/linux/commit/c2e5de5e210de6b003d1e1330eeb0958cf7007f5
(branch: kvm/arm64_sdei)

https://lore.kernel.org/lkml/20220403153911.12332-13-gshan@redhat.com/T/   (last revision: v6)
https://lore.kernel.org/kvmarm/YjtYuk+Jx1dFPQQ9@google.com/                (v5)

There are large coprocessor register sizes, like U2048, exposed by KVM.
However, it seems we never support those large coprocessor registers.
I'm not sure if we have any challenges to support those large registers,
or we don't have the needs yet?

Thanks,
Gavin



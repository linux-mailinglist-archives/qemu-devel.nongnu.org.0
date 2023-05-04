Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF486F7188
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:50:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoW-00078l-2R; Thu, 04 May 2023 13:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1puaTV-0003N6-1e
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:02:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1puaTA-00014M-VJ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683212521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8gaIe4fJeebZhZJNoEUEvjNevQ8Mn9rjK8GU2Z9g+ms=;
 b=UOkIg8Ze8OTj66SGgbBxfrjQ673ZVn8rRQoxSWEf1Bh8cktvm+xqhomCQJb/tPt7XSruhx
 fzTjbFmZqj8UiZumQITVLaPhAGemg1PEZPLc4PRv3THacX++wO5c84vwP9b2ZVLdv9Oakp
 gK7tp5ANiadLylpYlu14lqTJ5WBXOk8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-O3wbCCP1OnSmUl_h4NhPdw-1; Thu, 04 May 2023 11:01:59 -0400
X-MC-Unique: O3wbCCP1OnSmUl_h4NhPdw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA5D218A6473;
 Thu,  4 May 2023 15:01:55 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B208F492B00;
 Thu,  4 May 2023 15:01:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, Gavin Shan
 <gshan@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH v7 1/1] arm/kvm: add support for MTE
In-Reply-To: <2c70f6a6-9e13-3412-8e65-43675fda4d95@linaro.org>
Organization: Red Hat GmbH
References: <20230428095533.21747-1-cohuck@redhat.com>
 <20230428095533.21747-2-cohuck@redhat.com> <87sfcj99rn.fsf@secure.mitica>
 <64915da6-4276-1603-1454-9350a44561d8@linaro.org>
 <871qjzcdgi.fsf@redhat.com>
 <2c70f6a6-9e13-3412-8e65-43675fda4d95@linaro.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 04 May 2023 17:01:54 +0200
Message-ID: <87sfcc16ot.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, May 02 2023, Richard Henderson <richard.henderson@linaro.org> wrote:

> On 5/2/23 10:03, Cornelia Huck wrote:
>> Has anyone been able to access a real system with MTE? (All the systems
>> where I had hoped that MTE would be available didn't have MTE in the end
>> so far, so I'd be interested to hear if anybody else already got to play
>> with one.) Honestly, I don't want to even try to test migration if I only
>> have access to MTE on the FVP...
>
> Well there's always MTE on QEMU with TCG.  :-)

Which actually worked very nicely to verify my test setup :)

>
> But I agree that while it's better than FVP, it's still slow, and difficult to test 
> anything at scale.  I have no objection to getting non-migratable MTE on KVM in before 
> attempting to solve migration.

I'm wondering whether we should block migration with MTE enabled in
general... OTOH, people probably don't commonly try to migrate with tcg,
unless they are testing something?



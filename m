Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096CF4EAE6B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 15:26:44 +0200 (CEST)
Received: from localhost ([::1]:60172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZBru-0003IM-RR
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 09:26:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZBqt-0002OQ-Pt
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:25:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZBqr-0003Yo-3H
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648560335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mE+o/sKHOhvKQZXK1+u/XVpDQiFmXAyNl2lh5X/SAa8=;
 b=E/7Fls+3B0EysIPL2tWMNveC2M+lMzgJgzvpYkfRsiu/S6We/nKHESu7VNz+CurTJNa4Pz
 I7UtBEzMABOVeyVs+IFSdKPm/x3UfjXrhxsbQmHzIaSDL9MFCNyRXPz/YlfQjNN4C4BYy7
 pVanmzmVbcnnmxGVen1GB7xva1cXAQw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-ley7Pxx_NZalwhgS5pWU-Q-1; Tue, 29 Mar 2022 09:25:33 -0400
X-MC-Unique: ley7Pxx_NZalwhgS5pWU-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BD8E833960;
 Tue, 29 Mar 2022 13:25:33 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CF01C26E80;
 Tue, 29 Mar 2022 13:25:32 +0000 (UTC)
Message-ID: <7deceb9e-536d-c294-2580-a246b6fed22b@redhat.com>
Date: Tue, 29 Mar 2022 15:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] tests/qtest: failover: fix infinite loop
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220329124259.355995-1-lvivier@redhat.com>
 <f329f744-e807-fc0c-69f6-52cc3d10ab9e@redhat.com>
 <CAFEAcA9=Gjavrm3_2zOL_yeXE72KaSVP7EhjJg3zGeZKJX6epA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA9=Gjavrm3_2zOL_yeXE72KaSVP7EhjJg3zGeZKJX6epA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/2022 15.23, Peter Maydell wrote:
> On Tue, 29 Mar 2022 at 13:47, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 29/03/2022 14.42, Laurent Vivier wrote:
>>> If the migration is over before we cancel it, we are
>>> waiting in a loop a state that never comes because the state
>>> is already "completed".
>>>
>>> To avoid an infinite loop, skip the test if the migration
>>> is "completed" before we were able to cancel it.
> 
>> Is this still urgent for 7.0, or can it wait for the 7.1 cycle?
> 
> It's a test case change that fixes at least one hang I've seen
> in "make check". I prefer those to go in, at least before rc3,
> because the CI loop being unreliable makes the whole release
> process slower and more annoying.

Ok. Do you want to pick it directly, or shall I create a pull request for 
this? (I don't have much else queued right now, that's why I ask)

  Thomas




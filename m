Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F822C52C3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:18:01 +0100 (CET)
Received: from localhost ([::1]:33464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFHj-00027h-Oz
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:17:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kiFG5-00015c-92
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:16:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kiFG2-0001Aa-I9
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606389372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qfdx0Q+GLxKwetDoImDWm/Iu/yRE0CWmB3IpM87QOZA=;
 b=YeSvkwkdQ5VIQM91QjDfm+2NwH5TS8VQsKeWGkezB2eMBQQqzDilWrM5QgJH4btAUZlYOw
 C/Y/RNLJaj5PoiIIfATwMMPwOBeFXiBnDVb9t3UuA3bVBShXpsAWicFBcesbAsyLA7c/vB
 sqEfq8HCUashwlBH5ioBXE/ufmn8icc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-POpsBOvoNvS6Z-HbcEzwjw-1; Thu, 26 Nov 2020 06:16:10 -0500
X-MC-Unique: POpsBOvoNvS6Z-HbcEzwjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85CD3100946D;
 Thu, 26 Nov 2020 11:16:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 611325D9CA;
 Thu, 26 Nov 2020 11:16:05 +0000 (UTC)
Subject: Re: Proposal for a regular upstream performance testing
To: Peter Maydell <peter.maydell@linaro.org>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <CAFEAcA_O9VoXqs+BxUr5pJYYq42dkXjVTHQ_e9Z_p90tF7bNPQ@mail.gmail.com>
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
Message-ID: <6e5a1550-b2de-a06a-7e34-8f7b8d48ddff@redhat.com>
Date: Thu, 26 Nov 2020 12:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_O9VoXqs+BxUr5pJYYq42dkXjVTHQ_e9Z_p90tF7bNPQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ldoktor@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ldoktor@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dne 26. 11. 20 v 11:17 Peter Maydell napsal(a):
> On Thu, 26 Nov 2020 at 08:13, Lukáš Doktor <ldoktor@redhat.com> wrote:
>> The goal of this initiative is to detect system-wide performance
>> regressions as well as improvements early, ideally pin-point the
>> individual commits and notify people that they should fix things.
>> All in upstream and ideally with least human interaction possible.
> 
> So, my general view on this is that automated testing of performance
> is nice, but unless it also comes with people willing to do the
> work of identifying and fixing the causes of performance regressions
> there's a risk that it degrades into another automated email or set
> of graphs that nobody pays much attention to (outside of the obvious
> "oops this commit dropped us by 50%" mistakes). As with fuzz testing,
> I'm a bit wary of setting up an automated system that just pushes
> work onto humans who already have full plates. Is RedHat also
> planning to set performance requirements and assign engineers to
> keep us from falling below them ?
> 
> thanks
> -- PMM
> 

In the proposed "solution 1" my role would be to maintain, judge and help analyzing the reports if needed. As for the fixing the code I can not serve, that would have to be on the individual contributors/maintainers, the best I can do is to bisect and CC the authors.

In "solution 2" that would be on the other volunteer with my assistance, if needed. Note that currently the pipeline is not that clever so it requires manual interaction for bisection but I do have plan on improving that soon.

Also note that the purpose of this email is also a call for ideas, because maybe there is a better tool out there and if it fitted our needs better I wouldn't mind to switching to it.

Regards,
Lukáš



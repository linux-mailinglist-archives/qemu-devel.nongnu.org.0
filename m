Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FCA2261EE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 16:23:42 +0200 (CEST)
Received: from localhost ([::1]:36280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxWhh-0003AC-QS
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 10:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jxWcU-0004kz-V0
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 10:18:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27111
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jxWcR-0002zO-UU
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 10:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595254694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ImpfNHtMK6ULotLHVWg1tOLS4u3oY/I4wF2T+YlQVY=;
 b=QjZYB4Hk4wiTrBxtIGXpfCQtP2Br1so6yZLfRVt2b1c6a6Evb064Pj0ORw8J1AaqZ0tNT8
 hgenDrG3ITzQOWdWCy/bYq1Nz5a22OtrgRkNPaS38+Z165WckVzLrJiaER/5/2t5PDptkY
 QSLtaO+DVRvbEIzo5SrqEU1YDDuiPlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-RH4wIsp4NHupjCcQEFYr5Q-1; Mon, 20 Jul 2020 10:18:11 -0400
X-MC-Unique: RH4wIsp4NHupjCcQEFYr5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DCE58D7561;
 Mon, 20 Jul 2020 14:18:10 +0000 (UTC)
Received: from ibm-p8-OVS-01-fsp.mgmt.pnr.lab.eng.rdu2.redhat.com
 (ovpn-119-174.rdu2.redhat.com [10.10.119.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B918E709E1;
 Mon, 20 Jul 2020 14:18:09 +0000 (UTC)
Subject: Re: various iotests failures apparently due to overly optimistic
 timeout settings
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA_dEBT1jNLWeThhmKisFNwbaSUe+vAEEbv5bnVVb+=bjA@mail.gmail.com>
 <20200720104641.GB5541@linux.fritz.box>
 <90c29aa8-ad14-0538-0e29-c2c9c434a051@redhat.com>
 <CAFEAcA_SWO7fwR6nDAn9=HoYOVEf=L6AomjsonjbscPvTejQQA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <439a5b00-997d-dbd2-f8d9-55d440ebd567@redhat.com>
Date: Mon, 20 Jul 2020 10:18:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_SWO7fwR6nDAn9=HoYOVEf=L6AomjsonjbscPvTejQQA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 02:11:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/20 10:15 AM, Peter Maydell wrote:
> On Mon, 20 Jul 2020 at 15:12, John Snow <jsnow@redhat.com> wrote:
>>
>> On 7/20/20 6:46 AM, Kevin Wolf wrote:
>>> John, I think this is a result of your recent python/qemu/ changes that
>>> make failure of graceful shutdown an error rather than just silently
>>> falling back to SIGKILL.
>>>
>>> Should the default timeout be longer, should iotests override the
>>> default, or should iotests just always kill their VM instead of trying
>>> to shut it down gracefully?
> 
>> Let's make it longer. Since you are seeing the failures, can you edit
>> python/qemu/machine.py and find the default timeout of 3 seconds for
>> shutdown() and change it to 10? 30? 60?
> 
> Not conveniently, because this is for merge pull requests, and
> all the iotests failures are nested inside the tests/vm BSD VM
> setup.

I meant permanently, for everything -- not as a one-off for just this case.

--js



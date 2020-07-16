Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8051A2220E2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 12:48:10 +0200 (CEST)
Received: from localhost ([::1]:43514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw1Qv-0004Dz-Ji
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 06:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jw1Q6-0003or-Ha
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 06:47:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34055
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jw1Q4-0005zN-Uh
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 06:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594896436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=SevTmDn9UpndQEDEs9BpxfH768jRRfjFntodyL7LXKs=;
 b=amNvL2EYXBcYDnyQIk1NrbGeiPO/NrujuJ1Z6EELn2toKxNLoY12MsIXCRqyQD5K/30fbG
 ICEJ8hYyorAn5/22hmSXKH1UANXqq8UOSMP+BsVSx1/y/TUSCtyzojp+JfH2emZHsKVc3a
 dRyrT+Mndl59BF3L4gL2STlAo5FEo3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-eHDL7hbSNPWb2oWnsZ1iDg-1; Thu, 16 Jul 2020 06:47:14 -0400
X-MC-Unique: eHDL7hbSNPWb2oWnsZ1iDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49779106B248;
 Thu, 16 Jul 2020 10:47:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-234.ams2.redhat.com [10.36.112.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5965460C47;
 Thu, 16 Jul 2020 10:47:08 +0000 (UTC)
Subject: Re: [PATCH v2] tests: qmp-cmd-test: fix memory leak
To: Li Qiang <liq3ea@gmail.com>, Markus Armbruster <armbru@redhat.com>
References: <20200715154117.15456-1-liq3ea@163.com>
 <874kq8roev.fsf@dusky.pond.sub.org>
 <CAKXe6S+CvQ1rmnWXi2_=kiCF4yG-2T3iPut=51G25qwL+oO2Pw@mail.gmail.com>
 <87blkfpz20.fsf@dusky.pond.sub.org>
 <CAKXe6SJ5ckb=VnhQx=uO7Y6pSm6mKL87F0OX2f2+499nmiSfPQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <575a07c6-a7fd-c2c8-fcf5-5a34b0b657c9@redhat.com>
Date: Thu, 16 Jul 2020 12:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKXe6SJ5ckb=VnhQx=uO7Y6pSm6mKL87F0OX2f2+499nmiSfPQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 04:25:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Li Qiang <liq3ea@163.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/07/2020 12.33, Li Qiang wrote:
> Markus Armbruster <armbru@redhat.com> 于2020年7月16日周四 下午5:52写道：
>>
>> Li Qiang <liq3ea@gmail.com> writes:
>>
>>> Markus Armbruster <armbru@redhat.com> 于2020年7月16日周四 下午1:59写道：
>>>>
>>>> Li Qiang <liq3ea@163.com> writes:
>>>>
>>>>> Properly free each test response to avoid memory leak and separate
>>>>> qtest_qmp() calls with spare lines, in a consistent manner.
>>>>>
>>>>> Fixes: 5b88849e7b9("tests/qmp-cmd-test: Add
>>>>> qmp/object-add-failure-modes"
>>>>
>>>> The patch also fixes leaks introduced in 442b09b83d and 9fc719b869,
>>>> actually.  At least it should, but the patch appears to be incomplete.
>>
>> 442b09b83d was fine, actually.
>>
>> 9fc719b869 wasn't, and your second patch hunk fixes it.  Please add a
>> "Fixes: 9fc719b869' line to the commit message.
> 
> Hi Thomas,
> 
> Could you do this minor adjustment?
> Add also add Markus's r-b tag.

Sure, I'll add it!

 Thomas



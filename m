Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8D5342780
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 22:15:12 +0100 (CET)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNMSc-00008n-Rx
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 17:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lNMRU-00087E-DY
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 17:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lNMRQ-0006q2-SE
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 17:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616188434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7xh7wkfnEBkNmom4tyaDiwqkFQPs0TNFZLW72iNXBE=;
 b=efiGJ83CAMHXh7PanbMjlDN7wvqp1Oa+laVbBE5t8k0I//xDP8rDtFG5avsIOW/kisYMwy
 PXWcUWNEOPio1LTyCWV+URbreYUJtpxbEitBUy4MwNdwRWcP3U+ls3ScTx3fG99G4Us2p3
 sPm5d9O/xmUpYCLJEhOJwR4E+/nSiN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-chzf1gEKMC-QMwxVV0X-eA-1; Fri, 19 Mar 2021 17:13:50 -0400
X-MC-Unique: chzf1gEKMC-QMwxVV0X-eA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79F071007474;
 Fri, 19 Mar 2021 21:13:49 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-31.ams2.redhat.com
 [10.36.114.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B0A35D6D5;
 Fri, 19 Mar 2021 21:13:44 +0000 (UTC)
Subject: Re: QEMU PCI subsystem: what code is responsible for making accesses
 to non-mapped addresses read as -1?
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <CAFEAcA_M4zK1aLdO2QdOUgNROTLdHUwLHnCKoUT1BpTcF-cTMw@mail.gmail.com>
 <75fa2ebd-7a7b-a4af-54f2-290b7ffe5d13@amsat.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a0e89712-8f90-82ac-5603-d2b861594208@redhat.com>
Date: Fri, 19 Mar 2021 22:13:44 +0100
MIME-Version: 1.0
In-Reply-To: <75fa2ebd-7a7b-a4af-54f2-290b7ffe5d13@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/19/21 15:14, Philippe Mathieu-Daudé wrote:
> On 3/19/21 1:35 PM, Peter Maydell wrote:
>> I'm looking at a bug reported against the QEMU arm virt board's pci-gpex
>> PCI controller: https://bugs.launchpad.net/qemu/+bug/1918917
>> where an attempt to write to an address within the PCI IO window
>> where the guest hasn't mapped a BAR causes a CPU exception rather than
>> (what I believe is) the PCI-required behaviour of writes-ignored, reads
>> return -1.
>>
>> What in the QEMU PCI code is responsible for giving the PCI-spec
>> behaviour for accesses to the PCI IO and memory windows where there
>> is no BAR? I was expecting the generic PCI code to map a background
>> memory region over the whole window to do this, but it looks like it
>> doesn't...
> 
> Indeed, this is something I noticed in my generic AddressSpace
> cleanup series.
> 
> Currently it is (incorrectly?) done locally by each pci-host
> implementation, some register the regions behaving as RAZ/WI,
> some don't.
> 

Related discussions from the past:

(1)

[Qemu-devel] [PATCH] exec: fix regression by making system-memory region
https://lists.gnu.org/archive/html/qemu-devel/2013-11/msg00142.html

(Commits:

a53ae8e934cd ('hw/pci: partially handle pci master abort', 2013-10-14)
818f86b88394 ('exec: limit system memory size', 2013-11-04)
0fbf50b6ec12 ('Revert "hw/pci: partially handle pci master abort"',
2013-11-10)
ef9e455d645b ('Revert "exec: limit system memory size"', 2013-11-10)
)

(2)

[Qemu-devel] [PATCH] memory region: check the old.mmio.read status
https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg01391.html

The last two messages in that thread appear particularly relevant:

- https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg01524.html
- https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg01525.html

Assuming I'm not completely confused, my take-away is that it does
belong in each pci-host device model (or maybe into an extracted, parent
device model). Namely, Peter said in the last message linked above that
whether an unmapped access would cause a CPU fault was the function of
two things:

- whether the CPU supported bus faults architecturally,
- whether the bus in an SoC or board reported unmapped accesses to the
CPU as bus faults.

For the case where the first question was answered with "yes" but the
second was answered with "no", "adding a suitable io accessor to the
relevant container MR" was suggested -- and that's what the pci-host
device models do, at the moment, IIUC.

*Where* this unassigned IO MR should be implemented is unclear:

- The 2nd variable above is board/SoC dependent, so does the unassigned
IO "catch" belong in board code?

- Or else, because the PCI spec is board-independent, does it belong
with some common pci-host code?

Personally, I'd add it to the pci-gpex controller; that would fix the
symptom, satisfy the generic requirement (a function of two variables,
see above), and come with no risk of regressions, for other boards / PCI
host controllers.

Thanks
Laszlo



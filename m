Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599A9165805
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 07:53:56 +0100 (CET)
Received: from localhost ([::1]:36938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4fic-00047N-Sq
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 01:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j4fht-0003YO-BF
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 01:53:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j4fhr-0004Je-Mq
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 01:53:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40935
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j4fhr-0004JF-IS
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 01:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582181586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+XnRdYENAqU+NAlSod0ZltHnKjF0SCTDyiCZrpFAC4=;
 b=TkkQutbtogPVCcw7p8LBAavzeiEiEaKOGfHrHpDlAvYnkkOC1+1xNj6v7ORETgK5rLZ4EJ
 05FTrIVq0zHrOf0nuBtJCUXnuzrYZmV4uqeTcUdOn1ygRFI1n0nEHU/A7HfoZ/c9iiTN1E
 3vKreORoBVvSSgJBSlAARLvLzpAiBws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-jm8yOHkcPEKr5kA1ZS-eSQ-1; Thu, 20 Feb 2020 01:53:04 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C81618CA241;
 Thu, 20 Feb 2020 06:53:03 +0000 (UTC)
Received: from [10.72.12.159] (ovpn-12-159.pek2.redhat.com [10.72.12.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 137C5790D6;
 Thu, 20 Feb 2020 06:52:59 +0000 (UTC)
Subject: Re: [PATCH v7 0/4] colo: Add support for continuous replication
To: "Zhang, Chen" <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>, 
 qemu-devel <qemu-devel@nongnu.org>
References: <cover.1571925699.git.lukasstraub2@web.de>
 <20191113173559.0713c27d@luklap>
 <9CFF81C0F6B98A43A459C9EDAD400D7806309C8C@shsmsx102.ccr.corp.intel.com>
 <049fdd65-c654-f619-4de1-5a3fe0a2ad5b@redhat.com>
 <9CFF81C0F6B98A43A459C9EDAD400D780630AB3E@shsmsx102.ccr.corp.intel.com>
 <f105e19b-6f1d-a539-459d-076a031b86b8@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <42d6864e-78f1-75ee-2b2e-0e7d8adf9095@redhat.com>
Date: Thu, 20 Feb 2020 14:52:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f105e19b-6f1d-a539-459d-076a031b86b8@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: jm8yOHkcPEKr5kA1ZS-eSQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/2/20 =E4=B8=8A=E5=8D=889:38, Zhang, Chen wrote:
> Hi Jason,
>
> I noticed this series can't be merged or queued, do you met some=20
> problem about it?
>
>
> Thanks
>
> Zhang Chen


Not, I've queued this.

Thanks




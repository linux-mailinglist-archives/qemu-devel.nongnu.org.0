Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B2A193ED9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 13:30:13 +0100 (CET)
Received: from localhost ([::1]:50736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHReG-0005Xv-Bh
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 08:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45301)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jHRdK-00053J-Gs
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 08:29:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jHRdJ-0001UN-Df
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 08:29:14 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:23246)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jHRdJ-0001U7-9m
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 08:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585225752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7W+ZVjJV/FhkKVin6aMKz7E3WvQUEUefZD82TuXbYg=;
 b=Mi3KSdpIcpqgdlEpMO2stuSB/epj1q/E/x25msvOZqHn/rVlJySVQsUla30ODtDG38AtlF
 Z9NOy1zFGTnVeZya9+P6WwThukRbLFdCfKgpbBFTVs0SE6GlG7YigarUapkMLOMAAgK2bI
 sTDzW7U7p1d2zjw7FgOodUehgy3aXgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-wckSfVM7NTqBaWmn65KS1w-1; Thu, 26 Mar 2020 08:29:08 -0400
X-MC-Unique: wckSfVM7NTqBaWmn65KS1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 914D38017CE;
 Thu, 26 Mar 2020 12:29:07 +0000 (UTC)
Received: from localhost (unknown [10.40.208.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73FD060BF3;
 Thu, 26 Mar 2020 12:29:03 +0000 (UTC)
Date: Thu, 26 Mar 2020 13:29:01 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: acpi_pcihp_eject_slot() bug if passed 'slots == 0'
Message-ID: <20200326132901.7aecb9e5@redhat.com>
In-Reply-To: <CAFEAcA-oWBjOXWmnLvPww9wrty_QbSc+Xv3BY3sQAnEXFkfQbA@mail.gmail.com>
References: <CAFEAcA-oWBjOXWmnLvPww9wrty_QbSc+Xv3BY3sQAnEXFkfQbA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Mar 2020 11:52:36 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> Hi; Coverity spots that if hw/acpi/pcihp.c:acpi_pcihp_eject_slot()
> is passed a zero 'slots' argument then ctz32(slots) will return 32,
> and then the code that does '1U << slot' is C undefined behaviour
> because it's an oversized shift. (This is CID 1421896.)
> 
> Since the pci_write() function in this file can call
> acpi_pcihp_eject_slot() with an arbitrary value from the guest,
> I think we need to handle 'slots == 0' safely. But what should
> the behaviour be?

0 is not valid value, we should ignore and return early in this case
like we do with bsel. I'll post a path shortly.

> 
> thanks
> -- PMM
> 



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA4E1438E7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 10:01:31 +0100 (CET)
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itpPe-0008Ce-1O
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 04:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1itpO0-00071l-Ke
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 03:59:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1itpNx-00056N-63
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 03:59:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55097
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1itpNU-0004el-0u
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 03:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579597155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sjf9FHZtc4VkpjztGyEBsBCj+SJEHoyzJe8IovGrlBw=;
 b=cgwuymq3QKi5HwUzcGCpRAbwP5M/k+1QomCu6ABzf2Gc9Y65S5poeetaiwDQ4cd8NzU1kP
 mABaDqdguUveUEI/rFa/XiWRGGxfwEALMhd+KknX/Ycu7C1ud035+8tSFpMi6v461Z7K9u
 OOc4tIBF3Y1RmJfRvh3Kal59iRtXqRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-45iOZmHOPXiGs_Usm3hO_Q-1; Tue, 21 Jan 2020 03:59:12 -0500
X-MC-Unique: 45iOZmHOPXiGs_Usm3hO_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06CA6107ACC4;
 Tue, 21 Jan 2020 08:59:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 009261CB;
 Tue, 21 Jan 2020 08:59:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 380161138600; Tue, 21 Jan 2020 09:59:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 00/15] Replace current_machine by qdev_get_machine()
References: <20200109152133.23649-1-philmd@redhat.com>
Date: Tue, 21 Jan 2020 09:59:04 +0100
In-Reply-To: <20200109152133.23649-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 9 Jan 2020 16:21:18
 +0100")
Message-ID: <87blqxgp7r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Juan Quintela <quintela@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quick pointer to prior discussion:

Message-ID: <87ftqh1ae5.fsf@dusky.pond.sub.org>
https://lists.nongnu.org/archive/html/qemu-devel/2019-04/msg02860.html



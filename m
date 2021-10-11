Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C94A428634
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:28:22 +0200 (CEST)
Received: from localhost ([::1]:34604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZnrJ-0001VL-5N
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZnpY-0000pS-Nh
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZnpU-0003N3-SG
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633929986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rb50sbbjxiHVmLE68Ahl8tfFa15TC/ETBBEkUBFnqLI=;
 b=Bv2vezuA73KI0Gmo6KtpFqsc1ubcrODWd45kE31msWYgyoypnkEUvxjmrQFbVbp/5lpQ3v
 o7vKMp3P4WrxhnYynYfbLz1ilIawM+wJcqkwNIOOufYzABdsiy8uUb88ZbpEhuvKMYJrDR
 KWfuZff9oQ7Gzrz06SSI53gwE5exKz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-0acfh-KpNeOgMCPt58KBkg-1; Mon, 11 Oct 2021 01:26:23 -0400
X-MC-Unique: 0acfh-KpNeOgMCPt58KBkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 999271006AA2;
 Mon, 11 Oct 2021 05:26:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF99660BF4;
 Mon, 11 Oct 2021 05:26:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2B84A113865F; Mon, 11 Oct 2021 07:26:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 1/2] hw/core/machine: Split out smp_parse as an inline API
References: <20211010103954.20644-1-wangyanan55@huawei.com>
 <20211010103954.20644-2-wangyanan55@huawei.com>
Date: Mon, 11 Oct 2021 07:26:19 +0200
In-Reply-To: <20211010103954.20644-2-wangyanan55@huawei.com> (Yanan Wang's
 message of "Sun, 10 Oct 2021 18:39:53 +0800")
Message-ID: <8735p8xhc4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 wanghaibin.wang@huawei.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yanan Wang <wangyanan55@huawei.com> writes:

> Functionally smp_parse() is only called once and in one place
> i.e. machine_set_smp, the possible second place where it'll be
> called should be some unit tests if any.
>
> Actually we are going to introduce an unit test for the parser.
> For necessary isolation of the tested code, split smp_parse out
> into a separate header as an inline API.

Why inline?

> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>



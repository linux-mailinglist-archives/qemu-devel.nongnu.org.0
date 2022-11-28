Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57F863A606
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:22:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozbHD-00015u-5q; Mon, 28 Nov 2022 05:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozbGn-00012X-Cg
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:21:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozbGl-0005yD-VP
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669630906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iT+0hOoUTaja3fwHOEobWUSeoIrpSot4jBkC+UGc2ps=;
 b=ZBPp4od8t/3li83UYKaCkTaXytUT1hxIvNc6Vt2kIwoFQT4jay132feFujvYrLuiqvO9I/
 nmIYicfwC+FOWC+Q+fYn+VPfaPIuDAuEWXBS7qmYI0L3kqpIPn1WhdDUwYToHgll4hid5w
 pRXJfFRoV9i+pp+riDLXoqU+d/xgzzo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-kjpmXinnOruQDiG9yB4ivQ-1; Mon, 28 Nov 2022 05:21:40 -0500
X-MC-Unique: kjpmXinnOruQDiG9yB4ivQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 446B9101A54E;
 Mon, 28 Nov 2022 10:21:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10CDC112132D;
 Mon, 28 Nov 2022 10:21:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 003DF21E6921; Mon, 28 Nov 2022 11:21:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  mst@redhat.com,  marcel.apfelbaum@gmail.com,
 dgilbert@redhat.com
Subject: Re: [PATCH 05/12] pci: Build hw/pci/pci-hmp-cmds.c only when
 CONFIG_PCI
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-6-armbru@redhat.com>
 <5d7f3bb7-cac0-1537-0ba2-e1214be0458a@linaro.org>
Date: Mon, 28 Nov 2022 11:21:36 +0100
In-Reply-To: <5d7f3bb7-cac0-1537-0ba2-e1214be0458a@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 28 Nov 2022 09:26:27
 +0100")
Message-ID: <875yezv0pb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 28/11/22 09:01, Markus Armbruster wrote:
>> We compile pci-hmp-cmds.c always, but pci-qmp-cmds.c only when
>> CONFIG_PCI.  hw/pci/pci-stub.c keeps the linker happy when
>> !CONFIG_PCI.  Build pci-hmp-cmds.c that way, too.
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   hw/pci/pci-stub.c  | 5 +++++
>>   hw/pci/meson.build | 2 +-
>>   2 files changed, 6 insertions(+), 1 deletion(-)
>
> Squash with patch #3?

Could do, but the combined patch isn't pure code motion anymore, and I
get to explain that in the commit message.



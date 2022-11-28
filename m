Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C963A768
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 12:52:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozcfD-0001Ul-Cr; Mon, 28 Nov 2022 06:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozcfA-0001UH-6x
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:51:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozcf7-0002vS-BT
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669636259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b858Me0PS0nABbeq4lADW9REDuK/Btg3vo+pSHtlxYM=;
 b=M2FcISHk/MdlJwObCvBAX2Qo+TTZjmR/qCa4LdyOyKySbxNy8ASRl9YkKku2gJYS1yS2So
 ZyZgaibgV4sFdFD7O6uvnDpGzAPdxsr8851czegGCjep1WOTP9ADQhh1Rs8U34Qd4F+joc
 0F2jEO/RSF7A95zKUNDlpmzElMi/8NU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-F3Q7DGJqPnKEnwAEyoRe8g-1; Mon, 28 Nov 2022 06:50:58 -0500
X-MC-Unique: F3Q7DGJqPnKEnwAEyoRe8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD1CD1C06ED7;
 Mon, 28 Nov 2022 11:50:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73855112132D;
 Mon, 28 Nov 2022 11:50:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5692421E6921; Mon, 28 Nov 2022 12:50:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  mst@redhat.com,  marcel.apfelbaum@gmail.com,
 dgilbert@redhat.com
Subject: Re: [PATCH 09/12] pci: Move HMP command from hw/pci/pcie_aer.c to
 pci-hmp-cmds.c
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-10-armbru@redhat.com>
 <a904a8e1-8f99-4d12-1ddc-ad8b7bcbf07c@linaro.org>
Date: Mon, 28 Nov 2022 12:50:54 +0100
In-Reply-To: <a904a8e1-8f99-4d12-1ddc-ad8b7bcbf07c@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 28 Nov 2022 09:21:01
 +0100")
Message-ID: <87pmd7ti01.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   hw/pci/pci-internal.h   |   4 ++
>>   include/monitor/hmp.h   |   1 +
>>   include/sysemu/sysemu.h |   3 --
>>   hw/pci/pci-hmp-cmds.c   | 105 ++++++++++++++++++++++++++++++++++++
>>   hw/pci/pci-stub.c       |   1 -
>>   hw/pci/pcie_aer.c       | 115 ++--------------------------------------
>>   6 files changed, 114 insertions(+), 115 deletions(-)
>
> I suppose hmp_info_usb() is next :)

The smaller the monitor/{hmp,qmp)-cmds.c grabbags, the better.

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Thanks!



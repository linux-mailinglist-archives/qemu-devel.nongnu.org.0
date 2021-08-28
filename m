Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DFA3FA48C
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 11:15:07 +0200 (CEST)
Received: from localhost ([::1]:55358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJuQW-0003tH-Sj
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 05:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJuPZ-0003DJ-CM
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 05:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJuPU-0005KN-Bt
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 05:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630142034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d6IV4BszZaZULDhqb3iI/kQJDeC5WTlkgEPV3l2kZi4=;
 b=H216xFnIs+m9JmW4S4q0FpuYmvy0obUVWZV8YX0YjpQw9jUAAqotbCEmpVKQVC4SP2kUaW
 VKSYYypR6aJH9/TThn3wIR3uvuOuia/K+fwz4OhLDmZ6C2+EgKayEX/Xpgd9QzhhRo1YEg
 PicCjTK2OAYPMDh2LIG/ufWM5hZOtAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-2kurJ6x9PmaQohrfVMtSdQ-1; Sat, 28 Aug 2021 05:13:50 -0400
X-MC-Unique: 2kurJ6x9PmaQohrfVMtSdQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4E9C107ACF5;
 Sat, 28 Aug 2021 09:13:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5BD460C04;
 Sat, 28 Aug 2021 09:13:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3756011380A9; Sat, 28 Aug 2021 11:13:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: Re: [EXTERNAL] [PULL 08/15] whpx nvmm: Drop useless
 migrate_del_blocker()
References: <20210827045044.388748-1-armbru@redhat.com>
 <20210827045044.388748-9-armbru@redhat.com>
 <PH0SPRMB0007A274652B55CB19F742EFC0C89@PH0SPRMB0007.namprd21.prod.outlook.com>
Date: Sat, 28 Aug 2021 11:13:44 +0200
In-Reply-To: <PH0SPRMB0007A274652B55CB19F742EFC0C89@PH0SPRMB0007.namprd21.prod.outlook.com>
 (Sunil Muthuswamy's message of "Fri, 27 Aug 2021 16:58:15 +0000")
Message-ID: <877dg6aq47.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Michael S .
 Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sunil Muthuswamy <sunilmut@microsoft.com> writes:

> Signed-off-by: Sunil Muthuswamy <sunilmut@microsoft.com>

Too late; the pull request has been merged already.

Moreover, Signed-off-by means you contributed to this patch or helped
merging it.  See

    https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

You might have meant

    Reviewed-by: Sunil Muthuswamy <sunilmut@microsoft.com>

or

    Acked-by: Sunil Muthuswamy <sunilmut@microsoft.com>

Just for next time & thanks anyway.



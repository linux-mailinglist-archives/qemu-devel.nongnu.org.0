Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1DF2AB6DA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 12:32:46 +0100 (CET)
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc5Ph-0007Oj-VU
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 06:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kc5Nt-0006T4-CV
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:30:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kc5Nr-0006R1-PF
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604921451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aRMd9LM6tWMNDtlzRc3TMjk8t/7NgTYPV5qdPAZ6ke0=;
 b=AZ6nBSNtDifQQBCJMNQ3udinKymcOluKHTa/AlzuLm9BiRm7/gCX0rI7tJ1zTZsyXmwvgH
 2lveRxJhA4F5AA1wsxqQUuxhF2HKVrIvKoye0Z9Tztd2WcAQ4U85QPz9rqlpZRLba7TrHp
 /zoGgITWpZoOrZNSiDmo+91tuXnBRPQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-u72yxeSfNn2zxzmuPwCqtw-1; Mon, 09 Nov 2020 06:30:49 -0500
X-MC-Unique: u72yxeSfNn2zxzmuPwCqtw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC08B809DCD;
 Mon,  9 Nov 2020 11:30:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFAB45B4A2;
 Mon,  9 Nov 2020 11:30:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AC5A217511; Mon,  9 Nov 2020 12:30:46 +0100 (CET)
Date: Mon, 9 Nov 2020 12:30:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 1/5] hw/usb/hcd-xhci: Make xhci base model abstract
Message-ID: <20201109113046.fnv52ad22btvu4jr@sirius.home.kraxel.org>
References: <20201107111307.262263-1-philmd@redhat.com>
 <20201107111307.262263-2-philmd@redhat.com>
 <20201109095127.dt7rzwqcrtx6k7n5@sirius.home.kraxel.org>
 <a241f626-9798-933e-d5b4-1190b3da6746@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a241f626-9798-933e-d5b4-1190b3da6746@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Thomas Huth <thuth@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>  static void test_xhci_hotplug(void)
>  {
> -    usb_test_hotplug(global_qtest, "xhci", "1", NULL);
> +    usb_test_hotplug(global_qtest, "nec-usb-xhci", "1", NULL);
>  }

Better use qemu-xhci.
I'm wondering how that worked before ...

take care,
  Gerd



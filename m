Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866FF23C80D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 10:47:03 +0200 (CEST)
Received: from localhost ([::1]:35760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3F4g-0007aj-Km
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 04:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3F3c-0007B0-Vg
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 04:45:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42697
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3F3b-0008QD-CU
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 04:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596617153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=y0QIbPxDn4vM5nMUkTMjG8IALiKtExHcb2ct+XsnQ1o=;
 b=QTlrej2+nlqSKp6WSqMDu1XMoiQiI1M1uAXEetsTtZL+ARbZZleZJXbapllXQIvB1a1/hA
 rYA1Y8vHar4e0E+FDBPPovZS47IkYV5XtfvprcdE5UtpPb9tji1GYjcf5MFR1xiyIDOCXq
 yBEarYniOT066/HLdgct+JQcSYcdWsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-SYnPinn_Mq-89UFvl7ucGw-1; Wed, 05 Aug 2020 04:45:52 -0400
X-MC-Unique: SYnPinn_Mq-89UFvl7ucGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08BEE102C7E9;
 Wed,  5 Aug 2020 08:45:51 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-142.ams2.redhat.com [10.36.112.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7395A8AC1F;
 Wed,  5 Aug 2020 08:45:45 +0000 (UTC)
Subject: Re: [PATCH 02/11] target/riscv/vector_helper: Fix build on 32-bit big
 endian targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200804170055.2851-1-thuth@redhat.com>
 <20200804170055.2851-3-thuth@redhat.com>
 <d5425284-1c12-ca0a-51b9-aecd592b0cbe@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <6248cb45-b940-b93e-cfcb-a96cf22e2e30@redhat.com>
Date: Wed, 5 Aug 2020 10:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d5425284-1c12-ca0a-51b9-aecd592b0cbe@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 01:46:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/08/2020 19.46, Philippe Mathieu-Daudé wrote:
> On 8/4/20 7:00 PM, Thomas Huth wrote:
>> The code currently fails to compile on 32-bit big endian targets:
> 
> s/target/host/ here and in subject?

Yes, "host" is better, I'll change that.

 Thanks,
  Thomas




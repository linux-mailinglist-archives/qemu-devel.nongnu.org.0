Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD33C4659
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 11:51:03 +0200 (CEST)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2sac-0005VF-Hx
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 05:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1m2sZc-0004gb-8F
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 05:50:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1m2sZX-0007GU-Qo
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 05:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626083394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OM/iwwVYUbe1CyDjJQ54Gx8sBHDi8QnZ+IrtfImXwD4=;
 b=AUwSm9/HWbh3dS1vpzJwr4GGgzfaSONVVfWryBpIqYZf6snukc2/VC41ZXGjNrf/pwwJ4W
 uXREMixtLpL9b6mlkgrMN9PN5DjmUPHp5U1FqAP7alsvvFsOfUh3+kTt/byjvw5KofDzY3
 MwQkdS+9U0cVc7BC9JDmWW2Tu4cg+YU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-BFOy-0--N_qociMcxZyTLg-1; Mon, 12 Jul 2021 05:49:52 -0400
X-MC-Unique: BFOy-0--N_qociMcxZyTLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D7DA802E6C;
 Mon, 12 Jul 2021 09:49:51 +0000 (UTC)
Received: from starship (unknown [10.40.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C438860871;
 Mon, 12 Jul 2021 09:49:45 +0000 (UTC)
Message-ID: <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
From: Maxim Levitsky <mlevitsk@redhat.com>
To: harry harry <hiharryharryharry@gmail.com>, kvm@vger.kernel.org, 
 qemu-devel@nongnu.org
Date: Mon, 12 Jul 2021 12:49:44 +0300
In-Reply-To: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, mathieu.tarral@protonmail.com,
 stefanha@redhat.com, Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2021-07-11 at 15:13 -0500, harry harry wrote:
> Hi all,
> 
> I hope you are very well! May I know whether it is possible to enable
> two-dimensional page translation (e.g., Intel EPT) mechanisms and
> shadow page table mechanisms in Linux QEMU/KVM at the same time on a
> physical server? For example, if the physical server has 80 cores, is
> it possible to let 40 cores use Intel EPT mechanisms for page
> translation and the other 40 cores use shadow page table mechanisms?
> Thanks!

Nope sadly. EPT/NPT is enabled by a module param.

Best regards,
	Maxim Levitsky

> 
> Best,
> Harry
> 




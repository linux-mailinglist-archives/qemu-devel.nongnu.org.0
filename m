Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B43264BAF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 19:44:51 +0200 (CEST)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGQcs-0003gA-Cf
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 13:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kGQc0-00030n-T3
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 13:43:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58861
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kGQby-000405-Tw
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 13:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599759833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HxoTeiZNK+pH/yKGetocZELouNmPqnIEEy692krS+bc=;
 b=cxVrawI1E6o/zR8kY8Zwe2bZznsAanIkhR/CaW8ze4fzVSN4O3a5OdJzVH1pOOPrWhZfgJ
 NDSyOr3urdSBHV2BlPj5GFEs7i3R9WZ21DRz58p1t0qt1rZFBIOxvG80W+l7tlDLO2twM1
 KQUW2036qy5atUc/yxKkBAy7ClMP8v4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-zcEABAt2Oe-DBOzmN-ZVoA-1; Thu, 10 Sep 2020 13:43:51 -0400
X-MC-Unique: zcEABAt2Oe-DBOzmN-ZVoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FEE18030C4;
 Thu, 10 Sep 2020 17:43:50 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 529CD5D9E8;
 Thu, 10 Sep 2020 17:43:49 +0000 (UTC)
Date: Thu, 10 Sep 2020 19:43:46 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Master cannot execute MTE instructions
Message-ID: <20200910174346.6y24jkyd7ca4xuoz@kamzik.brq.redhat.com>
References: <CAJoBWHwtE+HWkoj3a2pdYHOkPpG7ya=+-RRFvUp-SXwuTWvm5g@mail.gmail.com>
 <CAFEAcA8spQVin2vj2V5DJYQCR_BizqrRneoRMKhqKAzFv8EiMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8spQVin2vj2V5DJYQCR_BizqrRneoRMKhqKAzFv8EiMg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:35:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Derrick McKee <derrick.mckee@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 10, 2020 at 05:17:17PM +0100, Peter Maydell wrote:
> On Thu, 10 Sep 2020 at 16:06, Derrick McKee <derrick.mckee@gmail.com> wrote:
> >
> > Hi,
> >
> > As of commit 9435a8b3dd35f1f926f1b9127e8a906217a5518a compiled with the default configuration, softmmu-aarch64 issues an illegal instruction fault when executing a memory tag instruction.  Below is a minimal code example that triggers the bug.
> 
> What QEMU command line are you using to run this?
> In particular, MTE is not enabled by default, so you need
> "-cpu max,mte=on" or similar, is not enabled for any
> board except 'virt', and doesn't work with KVM, only TCG.

Actually I think the 'max' cpu type has it enabled by default, but you
need '-machine virt,mte=on' for it to work.

Thanks,
drew



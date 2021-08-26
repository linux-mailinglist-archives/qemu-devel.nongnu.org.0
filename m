Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBBA3F8529
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 12:14:49 +0200 (CEST)
Received: from localhost ([::1]:42150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJCPC-0002b8-Qi
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 06:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJCNz-0001uG-HJ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 06:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJCNw-00036B-36
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 06:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629972802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0a9FyQ8pkS9692Sgt+LnpoD5fEBDwGdQCkploFJtYOY=;
 b=GGaFdNSbkSnuxzn/+9FuYxBvNahh8z2Hj6esAPBn3+2KGsBklGd5YwYgesUOmJLB+A8LBw
 86oKLEA+JeMc0vY1kST/7CCwXm4n7AcZU1jfStFrW3NSumqXI6qGOs7c3divJMf5cwNRdJ
 sQBkm2bEvJkIOM8PMLGVX04uAiUkVQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-P2LE4Q-cMCuIxU4yJ0A88Q-1; Thu, 26 Aug 2021 06:13:21 -0400
X-MC-Unique: P2LE4Q-cMCuIxU4yJ0A88Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA6A1800EB8;
 Thu, 26 Aug 2021 10:13:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BECD5C22B;
 Thu, 26 Aug 2021 10:13:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91BC018003AA; Thu, 26 Aug 2021 12:13:14 +0200 (CEST)
Date: Thu, 26 Aug 2021 12:13:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 04/44] vl: Introduce machine_init_done_late notifier
Message-ID: <20210826101314.bi5fkgelnkfo6d7b@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <80ac3e382a248bac13662d4052d17c41f1c21e3a.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80ac3e382a248bac13662d4052d17c41f1c21e3a.1625704980.git.isaku.yamahata@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 xiaoyao.li@intel.com, qemu-devel@nongnu.org, mtosatti@redhat.com,
 erdemaktas@google.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 05:54:34PM -0700, isaku.yamahata@gmail.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Introduce a new notifier, machine_init_done_late, that is notified after
> machine_init_done.  This will be used by TDX to generate the HOB for its
> virtual firmware, which needs to be done after all guest memory has been
> added, i.e. after machine_init_done notifiers have run.  Some code
> registers memory by machine_init_done().

Can you be more specific than "some code"?

I see only pc_memory_init() adding guest ram (and the corresponding e820
entries), and that should run early enough ...

thanks,
  Gerd



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E79E60F1A9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 09:58:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onxjR-0004kU-6n; Thu, 27 Oct 2022 03:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1onxjB-0004GN-I8
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:55:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1onxjA-0007lQ-9x
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666857299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XK/K7cB2JpXA4lJ7vp4t2yZa74m7csVs3olNlLS9PfU=;
 b=O3/7mHlMOWOLfq9Gy2x27LImjlP+CS8bHcI12ypT0SsKxyHKPA+G7KVfLmdKkcjyHgMWOt
 2ZUWtCh33nvNryV0v3SZdkhVVb+uYIRqnio52tdeDFy8v6DiTBKnossciskJBljSl1wOEy
 zZGtW/dkyJFPt0vlrAb520Fc/+DebKY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487--wx7yYu6MQGqVR-hGcOMeg-1; Thu, 27 Oct 2022 03:54:54 -0400
X-MC-Unique: -wx7yYu6MQGqVR-hGcOMeg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4996E811E81;
 Thu, 27 Oct 2022 07:54:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2477949BB69;
 Thu, 27 Oct 2022 07:54:52 +0000 (UTC)
Date: Thu, 27 Oct 2022 09:54:50 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "Meng, Bin" <Bin.Meng@windriver.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
Message-ID: <Y1o5Slh7H+scVmYi@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-6-bmeng.cn@gmail.com>
 <f3447651-dadb-c0ed-f1f8-4ad80b551acf@amsat.org>
 <DM4PR11MB53589BB8CFF45CE67683E762914F9@DM4PR11MB5358.namprd11.prod.outlook.com>
 <CAEUhbmWv3F-5rPnE37XbmdSyfuKAXb7JOwywqVPnzA7dq361Og@mail.gmail.com>
 <CAEUhbmXka0i8Jt_kO_LHNpLWEix17Q7GiMP+U+6kEf4v9M7Rfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmXka0i8Jt_kO_LHNpLWEix17Q7GiMP+U+6kEf4v9M7Rfg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 27.10.2022 um 04:45 hat Bin Meng geschrieben:
> Hi Kevin,
> [...]
> Will you queue this patch via the block tree?

Just to be sure, you mean only patch 5? Yes, I can do that.

Kevin



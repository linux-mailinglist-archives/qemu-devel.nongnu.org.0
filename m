Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56924CD2B9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:48:45 +0100 (CET)
Received: from localhost ([::1]:57336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5UK-0000SX-Ut
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:48:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ5Sp-0007Ld-LV
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:47:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ5Sm-0003zU-NP
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646390828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5tqPrayDgZ3ZKTdKtw/5FOic9eNtdprUcGyAaIB6Pw=;
 b=aQ7o5zSkg1jrFTKLf9VRgx4WhIhrCMM7ofeFSr0wOWoBraCiVp7ZdlZH6RMMnlmSaPUW+C
 4EyptTB5jZ2t2q/3dN6Y7C2yJW9cCnrAFJMHG7N7Cfqc+iohjQ1TuP8Myx69bnlzF55a4w
 rq8EgMsGqFRvw2AjHWo1a7aIY8HYer4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-62WBQlJTMEyxOKkn3oyzLg-1; Fri, 04 Mar 2022 05:47:04 -0500
X-MC-Unique: 62WBQlJTMEyxOKkn3oyzLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98449824FA6;
 Fri,  4 Mar 2022 10:47:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 761067C0DD;
 Fri,  4 Mar 2022 10:47:02 +0000 (UTC)
Date: Fri, 4 Mar 2022 11:47:00 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 0/4] qsd: Add --daemonize; and add job quit tests
Message-ID: <YiHuJCVqMvgwxZTj@redhat.com>
References: <20220303164814.284974-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303164814.284974-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.03.2022 um 17:48 hat Hanna Reitz geschrieben:
> Hi,
> 
> v1 cover letter:
> 
> https://lists.nongnu.org/archive/html/qemu-block/2021-12/msg00499.html
> 
> 
> In v2, I followed Vladimir’s suggestion to look into whether we could
> reuse os_daemonize().  Indeed we can, and it makes patch 3 (formerly 2)
> much simpler!
> 
> I decided to leave patch 2 (formerly 1) largely unchanged, because it
> seems to me like the point of contention is whether it’s at all
> reasonable to introduce a second argument pass for this feature, and not
> e.g. which arguments we parse during it.
> I believe such an additional pass is a necessity for --daemonize, so
> either we really don’t want this pass and so cannot add this feature
> (and just drop this series); or we do want this feature, and then we
> have to add this pass.

Thanks, fixed up as discussed on IRC to address the two minor comments
from Eric and myself, and applied to the block branch.

Kevin



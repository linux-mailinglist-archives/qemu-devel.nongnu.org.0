Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAAC4CDC4E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:23:41 +0100 (CET)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCaa-0007vi-RS
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:23:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQC3k-00011d-LK
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:49:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQC3j-0000oz-5x
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646416182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X2+GV8Pb+lk1UvVNmMR6R4JIE+LdEaT5hiVFMhYQ824=;
 b=XzrPb0atwId00uRdGsdFr8qGh7MfajFEhbzg0QVWOnqvfMCfbddQeiwQJOWboo+/7z+Qm3
 PuvQKyROVHHnEuLczCdscgt+gV9atvwmMIrOdy51cwRg85lhUg/oY9EPIypqeO9zA5YmjS
 BqzXnXI7SyVHRDoTYp1zxaA0cTyChw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-o1cG3zqlPNqLoSJuKqAW9Q-1; Fri, 04 Mar 2022 12:49:41 -0500
X-MC-Unique: o1cG3zqlPNqLoSJuKqAW9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90692801AFE;
 Fri,  4 Mar 2022 17:49:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41C5D86B5D;
 Fri,  4 Mar 2022 17:49:29 +0000 (UTC)
Date: Fri, 4 Mar 2022 18:49:28 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 00/10] Python: Fix qmp race condition on accept()
Message-ID: <YiJRKKMtK9sdB1+9@redhat.com>
References: <20220225205948.3693480-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225205948.3693480-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.02.2022 um 21:59 hat John Snow geschrieben:
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-accept-changes
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/479795153
> 
> This redesigns the async QMP interface to allow for race-free
> connections from the synchronous interface. It should hopefully address
> the race conditions Peter has been seeing on the NetBSD vm tests.

Acked-by: Kevin Wolf <kwolf@redhat.com>



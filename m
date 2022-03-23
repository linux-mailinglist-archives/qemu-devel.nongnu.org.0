Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3684E56B1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:44:11 +0100 (CET)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX45i-0003zP-NK
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:44:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nX3oo-0000vI-Ez
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nX3om-0000Fe-Q5
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648052800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3s1FmImi3YSq+9Kwnool8u6Qs+CR2XNaGI1ICflgaN4=;
 b=h6RA8a58ipBZpD10CdXgzSmXvtAsQ9p9o4qnJ3NiGYGLQR+q7x1BbxW7JHBGYHzk9l1cc+
 PGLS/IgsPeMn+1pS/cJl+hn2OZ2MASLYUXrsNN81of/myiCeKMuNTM9EQDyWi3D10gyR2+
 TAw/ZgO6lLF7ilOIi2OmLLokWLeuFSg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-5BHx8x3XNZa2YIMYcIDMXw-1; Wed, 23 Mar 2022 12:26:34 -0400
X-MC-Unique: 5BHx8x3XNZa2YIMYcIDMXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69E8718A6581;
 Wed, 23 Mar 2022 16:26:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D474A111F3B0;
 Wed, 23 Mar 2022 16:26:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/s390x: Fix determination of overflow condition code
Date: Wed, 23 Mar 2022 17:26:19 +0100
Message-Id: <20220323162621.139313-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Bruno Haible <bruno@clisp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two patches were suggested by Bruno Haible in the QEMU issue tracker,
but as far as I can see, were never sent to the mailing list for discussion.
Since they definitely fix the behavior of the example programs provided
in the issue tracker, I'd like to suggest them now for inclusion.

Thomas Huth (2):
  target/s390x: Fix determination of overflow condition code after
    addition
  target/s390x: Fix determination of overflow condition code after
    subtraction

 target/s390x/tcg/cc_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.27.0



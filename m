Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258B94D9C43
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:31:18 +0100 (CET)
Received: from localhost ([::1]:44478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7Ge-0005Ok-J0
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:31:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nU70m-00077k-Ui
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:14:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nU70j-00039x-J5
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647350088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PNoq9/JdNRl0RS8m2rRgbL0POusbQqI/+Dyjopp9H18=;
 b=FdjIAHMKTFH4kPtQGmbsq5OCI3nr5zEy0UqAdZqvJQd2P9KAE0gcEfXw/LC+C7b4q2VgLx
 tobIcaYSirT8VoJ5rJQz7FvT/8h/bbq+8PeN4TkLTD5fqKntq3CjMvebiwLgs7O5I2JPwR
 HqCsKg729BhCU/4fErpj/Uj/OyOzOFQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-Uqm0SAgNPEWH1qbNPZ4oWQ-1; Tue, 15 Mar 2022 09:14:43 -0400
X-MC-Unique: Uqm0SAgNPEWH1qbNPZ4oWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E45C3C19840;
 Tue, 15 Mar 2022 13:14:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 074302EFA3;
 Tue, 15 Mar 2022 13:14:41 +0000 (UTC)
Date: Tue, 15 Mar 2022 13:14:41 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 3/3] nbd/server: Allow MULTI_CONN for shared writable
 exports
Message-ID: <20220315131441.GD1127@redhat.com>
References: <20220314203818.3681277-1-eblake@redhat.com>
 <20220314203818.3681277-4-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220314203818.3681277-4-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 nsoffer@redhat.com, Hanna Reitz <hreitz@redhat.com>, v.sementsov-og@ya.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patches seem OK to me, but I don't really know enough about the
internals of qemu-nbd to give a line-by-line review.  I did however
build and test qemu-nbd with the patches:

  $ ./build/qemu-nbd /var/tmp/test.qcow2 
  $ nbdinfo nbd://localhost
  ...
	can_multi_conn: false


  $ ./build/qemu-nbd -e 2 /var/tmp/test.qcow2 
  $ nbdinfo nbd://localhost
  ...
	can_multi_conn: false

^^^ Is this expected?  It also happens with -e 0.


  $ ./build/qemu-nbd -e 2 -m on /var/tmp/test.qcow2 
  $ nbdinfo nbd://localhost
  ...
	can_multi_conn: true


  $ ./build/qemu-nbd -e 2 -m off /var/tmp/test.qcow2 
  $ nbdinfo nbd://localhost
  ...
	can_multi_conn: false


Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW



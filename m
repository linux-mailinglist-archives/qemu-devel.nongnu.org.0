Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7D31A568
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:30:13 +0100 (CET)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAe8q-00029j-Sd
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:30:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAduv-00008L-Ps
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:15:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAdus-0001ot-OJ
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613157339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PMe8XzhhTRcHG8E2p7tn562KiRWTMl+1BBocsJBcqE=;
 b=VpxI2kb7KMoXNxJU71NplSyXdGsxATKxRyQaNFIf88hCkME9LEtutRnw6/2ELZK4xC3FiA
 Xba/aBsNuEUrqJnXSAMDWpXE1mPbtsp3Z7VgViaaZRWlzFeA4XoGGyLMN3o/J0PGJs8OAj
 rxjAlrcBKMuSG0nU2VJRerztJuWKPYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-6q8z7574OAOlc1sP_qXwNw-1; Fri, 12 Feb 2021 14:15:37 -0500
X-MC-Unique: 6q8z7574OAOlc1sP_qXwNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 847DC100CCC0;
 Fri, 12 Feb 2021 19:15:36 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED5E319811;
 Fri, 12 Feb 2021 19:15:35 +0000 (UTC)
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
References: <cover.1613150869.git.pkrempa@redhat.com>
 <d9c8e9827e9b6001b2dd1b92e64aab858e6d2a86.1613150869.git.pkrempa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v3 3/3] qemu-iotests: 300: Add test case for modifying
 persistence of bitmap
Message-ID: <320e08fc-a4b8-3caa-499d-3713e3a87fa4@redhat.com>
Date: Fri, 12 Feb 2021 13:15:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d9c8e9827e9b6001b2dd1b92e64aab858e6d2a86.1613150869.git.pkrempa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 11:34 AM, Peter Krempa wrote:
> Verify that the modification of the bitmap persistence over migration
> which is controlled via BitmapMigrationBitmapAliasTransform works
> properly.
> 
> Based on TestCrossAliasMigration
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
>  tests/qemu-iotests/300     | 91 ++++++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/300.out |  4 +-
>  2 files changed, 93 insertions(+), 2 deletions(-)
> 

> +    def setUp(self) -> None:
> +        TestDirtyBitmapMigration.setUp(self)
> +
> +        # Now create another block device and let both have two bitmaps each
> +        result = self.vm_a.qmp('blockdev-add',
> +                               node_name='node-b', driver='null-co')
> +        self.assert_qmp(result, 'return', {})
> +
> +        result = self.vm_b.qmp('blockdev-add',
> +                               node_name='node-a', driver='null-co')

The use of null-co with no mention of the read-zeroes option here is a
(minor) semantic conflict with the proposal by Philippe to flip the
default of that option (minor, because all it impacts would be the
execution speed of the test)
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg04027.html

Not your fault, so I don't mind touching up your additions in the same
manner Philippe proposed (which is safe regardless of whose patch lands
first).

diff --git i/tests/qemu-iotests/300 w/tests/qemu-iotests/300
index 9d4ec6a38195..63036f6a6e13 100755
--- i/tests/qemu-iotests/300
+++ w/tests/qemu-iotests/300
@@ -615,11 +615,13 @@ class
TestAliasTransformMigration(TestDirtyBitmapMigration):

         # Now create another block device and let both have two bitmaps
each
         result = self.vm_a.qmp('blockdev-add',
-                               node_name='node-b', driver='null-co')
+                               node_name='node-b', driver='null-co',
+                               read_zeroes=False)
         self.assert_qmp(result, 'return', {})

         result = self.vm_b.qmp('blockdev-add',
-                               node_name='node-a', driver='null-co')
+                               node_name='node-a', driver='null-co',
+                               read_zeroes=False)
         self.assert_qmp(result, 'return', {})

         bmaps_to_add = (('node-a', 'bmap-b'),


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



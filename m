Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6831C17E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 19:28:00 +0100 (CET)
Received: from localhost ([::1]:45292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBibG-00039R-Ec
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 13:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBiZc-0002cp-Lc
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:26:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBiZT-000412-BW
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613413566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OzDhUGPyCukdrkizdfmCFVnDh2bxW7SBCFu+fppP9Y=;
 b=e7mx2YJMv/p5mWAq2PoTreyfkXawDvobUCHdanOIbuYWnt4PUXdhidGhjkZzEj7UnP9WGK
 CFQZ0Ihig73OcOqfMovZ4tE3GfE444FrpB0AAvWaCb5nah5bJWLOvWeIzydYCVoDAVLC/T
 eiavwF7k4b+cSZ911M/nrTCwgrkZEKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-3WzGo_ImOhWhT6x1-xZctA-1; Mon, 15 Feb 2021 13:26:01 -0500
X-MC-Unique: 3WzGo_ImOhWhT6x1-xZctA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04E2E192CC41;
 Mon, 15 Feb 2021 18:26:00 +0000 (UTC)
Received: from [10.3.114.78] (ovpn-114-78.phx2.redhat.com [10.3.114.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7613C19D9F;
 Mon, 15 Feb 2021 18:25:58 +0000 (UTC)
Subject: Re: [PULL 3/5] qemu-iotests: 300: Add test case for modifying
 persistence of bitmap
To: Kevin Wolf <kwolf@redhat.com>
References: <20210212232134.1462756-1-eblake@redhat.com>
 <20210212232134.1462756-4-eblake@redhat.com>
 <20210215123152.GM7226@merkur.fritz.box>
 <0cd1617d-b22f-4ce1-38c2-df8822c3fbbe@redhat.com>
 <20210215170902.GS7226@merkur.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <42192dc8-329c-ef2d-d8f7-3d02ae9d2c85@redhat.com>
Date: Mon, 15 Feb 2021 12:25:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215170902.GS7226@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Krempa <pkrempa@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 11:09 AM, Kevin Wolf wrote:

>>> This breaks 297:

>>>  === mypy ===
>>> +300:646: error: Dict entry 2 has incompatible type "str": "Dict[str, bool]"; expected "str": "str"
>>> +Found 1 error in 1 file (checked 1 source file)
>>
>> is beyond my skill.  The typing at line 33:
>>
>> BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
>>
>> is insufficient to allow our new 'transform' member in the new
>> transform_mapping() -> Block BitmapMapping near line 677:
>>
>>                 'bitmaps': [
>>                     {
>>                         'name': 'bmap-a',
>>                         'alias': 'bmap-a',
>>                         'transform':
>>                             {
>>                                 'persistent': True
>>                             }
>>                     },
>>
>> but I'm not sure how to tell python the right type it should be.  John?
> 
> To be honest, this looks sufficiently like JSON that I would just go for
> List[Dict[str, Any]] (as long as recursive types don't work), but if you
> really want to have an explicit type, I think you'd have to replace the
> rightmost str with Union[str, Dict[str, bool]] to allow both.

Indeed, I played with it before reading your response, and came up with
this.  Shall I turn it into a formal patch?

diff --git i/tests/qemu-iotests/300 w/tests/qemu-iotests/300
index 63036f6a6e13..7501bd1018e2 100755
--- i/tests/qemu-iotests/300
+++ w/tests/qemu-iotests/300
@@ -30,7 +30,10 @@ import iotests
 # pylint: disable=wrong-import-order
 import qemu

-BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
+BlockBitmapMapping = List[Dict[str,
+                               Union[str,
+                                     List[Dict[str,
+                                               Union[str, Dict[str,
bool]]]]]]]

 mig_sock = os.path.join(iotests.sock_dir, 'mig_sock')

@@ -602,7 +605,8 @@ class TestCrossAliasMigration(TestDirtyBitmapMigration):

 class TestAliasTransformMigration(TestDirtyBitmapMigration):
     """
-    Tests the 'transform' option which modifies bitmap persistence on
migration.
+    Tests the 'transform' option which modifies bitmap persistence on
+    migration.
     """

     src_node_name = 'node-a'
@@ -674,7 +678,8 @@ class
TestAliasTransformMigration(TestDirtyBitmapMigration):
         bitmaps = self.vm_b.query_bitmaps()

         for node in bitmaps:
-            bitmaps[node] = sorted(((bmap['name'], bmap['persistent'])
for bmap in bitmaps[node]))
+            bitmaps[node] = sorted(((bmap['name'], bmap['persistent'])
+                                    for bmap in bitmaps[node]))

         self.assertEqual(bitmaps,
                          {'node-a': [('bmap-a', True), ('bmap-b', False)],


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



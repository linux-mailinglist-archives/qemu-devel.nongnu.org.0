Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC7C372ADE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 15:23:48 +0200 (CEST)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldv1f-0008QC-DF
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 09:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldv04-0007Lk-HV
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:22:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldv00-0004pG-OS
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620134523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cb6S8sd4on4+tDET7/3EsSVzaz6HnafXlngZgwDb5pU=;
 b=HKjbaoKjRhuagX5F607hzUWNdHIPNrEn6thOyWlJNKuYbw1C7Kw3oKZPswrV+H4wStLG+g
 SyEqlFnLSVCQOKIcoajA79W57FILcYy7ndkZCLO7s6OLoe047ofJ8jiMhluvbnO+sWpUCO
 NM5dEtQ06JIC//ZfKgzyK7sZItr88sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-OWggsLwnNkCHJDxSH1CnEw-1; Tue, 04 May 2021 09:22:00 -0400
X-MC-Unique: OWggsLwnNkCHJDxSH1CnEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 747D419253C9;
 Tue,  4 May 2021 13:21:59 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6077F5D9F0;
 Tue,  4 May 2021 13:21:49 +0000 (UTC)
Subject: Re: [PATCH 2/2] qemu-img: Require -F with -b backing image
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
References: <20210503213600.569128-1-eblake@redhat.com>
 <20210503213600.569128-3-eblake@redhat.com>
 <1fc1afc3-6054-a79b-8d99-e624662385ae@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <69561584-935b-8d6c-6029-93a39bacb0a7@redhat.com>
Date: Tue, 4 May 2021 08:21:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1fc1afc3-6054-a79b-8d99-e624662385ae@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 4:45 PM, Eric Blake wrote:
> On 5/3/21 4:36 PM, Eric Blake wrote:
>> Back in commit d9f059aa6c (qemu-img: Deprecate use of -b without -F),
>> we deprecated the ability to create a file with a backing image that
>> requires qemu to perform format probing.  Qemu can still probe older
>> files for backwards compatibility, but it is time to finish off the
>> ability to create such images, due to the potential security risk they
>> present.  Update a couple of iotests affected by the change.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>  docs/system/deprecated.rst       | 20 -----------------
>>  docs/system/removed-features.rst | 19 ++++++++++++++++
>>  block.c                          | 37 ++++++++++----------------------
>>  qemu-img.c                       |  6 ++++--
>>  tests/qemu-iotests/114           | 18 ++++++++--------
>>  tests/qemu-iotests/114.out       | 11 ++++------
>>  tests/qemu-iotests/301           |  4 +---
>>  tests/qemu-iotests/301.out       | 16 ++------------
>>  8 files changed, 50 insertions(+), 81 deletions(-)
> 
> I'll need a followup to fix iotest failures in 40 and 41 (apparently
> they weren't passing backing formats, but I did not catch them in my
> original cleanup of iotests back in commit b66ff2c298)

Squash in:

diff --git i/tests/qemu-iotests/040 w/tests/qemu-iotests/040
index ba7cb34ce8cf..f3677de9dfde 100755
--- i/tests/qemu-iotests/040
+++ w/tests/qemu-iotests/040
@@ -920,8 +920,8 @@ class
TestCommitWithOverriddenBacking(iotests.QMPTestCase):
     def setUp(self):
         qemu_img('create', '-f', iotests.imgfmt, self.img_base_a, '1M')
         qemu_img('create', '-f', iotests.imgfmt, self.img_base_b, '1M')
-        qemu_img('create', '-f', iotests.imgfmt, '-b', self.img_base_a, \
-                 self.img_top)
+        qemu_img('create', '-f', iotests.imgfmt, '-b', self.img_base_a,
+                 '-F', iotests.imgfmt, self.img_top)

         self.vm = iotests.VM()
         self.vm.launch()
diff --git i/tests/qemu-iotests/041 w/tests/qemu-iotests/041
index 5cc02b24fc7a..db9f5dc540e8 100755
--- i/tests/qemu-iotests/041
+++ w/tests/qemu-iotests/041
@@ -1295,8 +1295,10 @@ class TestReplaces(iotests.QMPTestCase):
 class TestFilters(iotests.QMPTestCase):
     def setUp(self):
         qemu_img('create', '-f', iotests.imgfmt, backing_img, '1M')
-        qemu_img('create', '-f', iotests.imgfmt, '-b', backing_img,
test_img)
-        qemu_img('create', '-f', iotests.imgfmt, '-b', backing_img,
target_img)
+        qemu_img('create', '-f', iotests.imgfmt, '-b', backing_img,
+                 '-F', iotests.imgfmt, test_img)
+        qemu_img('create', '-f', iotests.imgfmt, '-b', backing_img,
+                 '-F', iotests.imgfmt, target_img)

         qemu_io('-c', 'write -P 1 0 512k', backing_img)
         qemu_io('-c', 'write -P 2 512k 512k', test_img)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



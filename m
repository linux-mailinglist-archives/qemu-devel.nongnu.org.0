Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC3A3C22A5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:13:56 +0200 (CEST)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1oSB-0004lR-50
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1oQv-00045K-7Z
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1oQr-0004aA-EV
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625829152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RsrxPY+VmgUWoAg9MKJhaPNduWnmm7OGvSAPuLOY1kY=;
 b=PuBK6m9YsSLOlU5ChyYm7i6XHVnUT45F8kjaQXraZBeylQ5QRisjF0MDOepXh2dWvWaZUx
 LBp9+UbsT/Q8jRXxtAZsETMRVN5+yBsHNGW5r6genrNyUI0e5AMb5XaXz2rIRUjNPSDZr+
 CyQCbwfbAXr3vEAmLESWtt59zSQ0EGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-l2z7FLX3NrO1iGqsFPXAig-1; Fri, 09 Jul 2021 07:12:31 -0400
X-MC-Unique: l2z7FLX3NrO1iGqsFPXAig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13443804141;
 Fri,  9 Jul 2021 11:12:30 +0000 (UTC)
Received: from redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D3051981C;
 Fri,  9 Jul 2021 11:12:25 +0000 (UTC)
Date: Fri, 9 Jul 2021 13:12:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 3/2] qemu-img: Improve error for rebase without backing
 format
Message-ID: <YOgvEPMFR8TO5yp1@redhat.com>
References: <20210503213600.569128-1-eblake@redhat.com>
 <20210708155228.2666172-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708155228.2666172-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.07.2021 um 17:52 hat Eric Blake geschrieben:
> When removeing support for qemu-img being able to create backing
> chains without embedded backing formats, we caused a poor error
> message as caught by iotest 114.  Improve the situation to inform the
> user what went wrong.
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

> diff --git a/tests/qemu-iotests/114.out b/tests/qemu-iotests/114.out
> index 172454401257..016e9ce3ecfb 100644
> --- a/tests/qemu-iotests/114.out
> +++ b/tests/qemu-iotests/114.out
> @@ -14,7 +14,7 @@ qemu-io: can't open device TEST_DIR/t.qcow2: Could not open backing file: Unknow
>  no file open, try 'help open'
>  read 4096/4096 bytes at offset 0
>  4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -qemu-img: Could not change the backing file to '/home/eblake/qemu/build/tests/qemu-iotests/scratch/t.qcow2.base': Invalid argument
> +qemu-img: Could not change the backing file to '/home/eblake/qemu/build/tests/qemu-iotests/scratch/t.qcow2.base': backing format must be specified
>  read 4096/4096 bytes at offset 0
>  4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  *** done

Wait, there is a problem in the image path...

I'm squashing in the following for patch 2, and will do the obvious
conflict resolution for this one.

Kevin

diff --git a/tests/qemu-iotests/114 b/tests/qemu-iotests/114
index 3e30b402bc..de6fd327ee 100755
--- a/tests/qemu-iotests/114
+++ b/tests/qemu-iotests/114
@@ -65,7 +65,7 @@ $QEMU_IO -c "open $TEST_IMG" -c "read 0 4k" 2>&1 | _filter_qemu_io | _filter_tes
 $QEMU_IO -c "open -o backing.driver=$IMGFMT $TEST_IMG" -c "read 0 4k" | _filter_qemu_io

 # Rebase the image, to show that backing format is required.
-$QEMU_IMG rebase -u -b "$TEST_IMG.base" "$TEST_IMG" && echo "unexpected pass"
+($QEMU_IMG rebase -u -b "$TEST_IMG.base" "$TEST_IMG" 2>&1 && echo "unexpected pass") | _filter_testdir
 $QEMU_IMG rebase -u -b "$TEST_IMG.base" -F $IMGFMT "$TEST_IMG"
 $QEMU_IO -c "open $TEST_IMG" -c "read 0 4k" 2>&1 | _filter_qemu_io | _filter_testdir

diff --git a/tests/qemu-iotests/114.out b/tests/qemu-iotests/114.out
index 1724544012..f51dd9d20a 100644
--- a/tests/qemu-iotests/114.out
+++ b/tests/qemu-iotests/114.out
@@ -14,7 +14,7 @@ qemu-io: can't open device TEST_DIR/t.qcow2: Could not open backing file: Unknow
 no file open, try 'help open'
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-qemu-img: Could not change the backing file to '/home/eblake/qemu/build/tests/qemu-iotests/scratch/t.qcow2.base': Invalid argument
+qemu-img: Could not change the backing file to 'TEST_DIR/t.qcow2.base': backing format must be specified
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done



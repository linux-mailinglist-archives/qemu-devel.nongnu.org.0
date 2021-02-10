Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C7316EB8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 19:33:40 +0100 (CET)
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9uJ0-0002Qj-8l
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 13:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l9uEC-0008Cy-6k
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l9uE6-0006kC-NH
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612981711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qK9e5p9bgUc7hwI+dysgQ3xG0x8i73SDi2OPflDv0O4=;
 b=drBv9RqHs2Ec2Oj4FB2QdBA1AVkWx+VsJb9FCq45hooAnw3kCiiWTuJ4JiEm7jzi58tjSG
 mf3JOZ2HEgWNyPnlGg5BT1a5HQYFBqaRT/NlvZBAXaHzSHdEWQBJzWtIbo4f76RjzvpP1C
 FZ+SEumZ7P/pOZBRGtGTATuh4wV8mF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-jGNTeDBnO7yffH6WwfQDkg-1; Wed, 10 Feb 2021 13:28:28 -0500
X-MC-Unique: jGNTeDBnO7yffH6WwfQDkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD53D107ACC7
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 18:28:27 +0000 (UTC)
Received: from horse.redhat.com (ovpn-113-163.rdu2.redhat.com [10.10.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCC5E5D6B1;
 Wed, 10 Feb 2021 18:28:21 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 3F6EC220BCF; Wed, 10 Feb 2021 13:28:21 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 0/1] virtiofsd: Do not use a thread pool by default
Date: Wed, 10 Feb 2021 13:27:43 -0500
Message-Id: <20210210182744.27324-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a proposal to not use a thread pool by default. It hurts
performance in most of the cases. Hence lets switch default so
that most of the users get better performance out of the box.

I have run virtiofs-tests with and without thread pool and posted
results here.

https://github.com/rhvgoyal/virtiofs-tests/tree/master/performance-results/feb-10-2021

One can notice, that except few cases, results are much better with
no thread pool.

Vivek


Vivek Goyal (1):
  virtiofsd: Do not use a thread pool by default

 tools/virtiofsd/fuse_lowlevel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.4



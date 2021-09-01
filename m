Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02033FE0DD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:03:44 +0200 (CEST)
Received: from localhost ([::1]:48420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTeJ-0003iJ-RE
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLTM9-0003uE-SV
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:44:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mLTM6-0007Mx-FS
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630514693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XKaP1oHetIDEZRX0LRa9G0bICK66ZbSaWD8fiQQYBpg=;
 b=H0ah9VWsPCUrGBBfgreBdI8C2lZ6pEJ8Qil/8LYi3T+G0mgkVr8NdGzONZeBC/UOm3aTlV
 BL6EnRjNsVvX7We6UyiViBV0zty/gLv9gf5gOVQ8lE7oDzmZCCKkBSdpiFWVIifp+dI7Sw
 zPuYuoE2zJspbd2Nk4UUHoj1vXrhttk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-_KjTkIpUPt65Bd_TK-F2cA-1; Wed, 01 Sep 2021 12:44:51 -0400
X-MC-Unique: _KjTkIpUPt65Bd_TK-F2cA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C5D680198A;
 Wed,  1 Sep 2021 16:44:50 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D75F560864;
 Wed,  1 Sep 2021 16:44:48 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/arm: Increase stack alignment for function generation
Date: Wed,  1 Sep 2021 17:44:45 +0100
Message-Id: <20210901164446.2722007-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, berrange@redhat.com,
 qemu-stable@nongnu.org, sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://www.mail-archive.com/qemu-devel@nongnu.org/msg833146.html

I tested this patch which simply increases the stack alignment to 16
bytes and it fixes the assertion failure and otherwise appears to work
(in as far as it boots the libguestfs appliance).  However I've no
idea if this is the right thing to do.

I also had to change the tabs to spaces otherwise checkpatch
complains which makes the patch look a bit odd.

Rich.




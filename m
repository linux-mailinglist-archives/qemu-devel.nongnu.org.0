Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7DC32512B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:03:11 +0100 (CET)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHEU-0006Sy-7X
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lFHD5-0005UQ-7F
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:01:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lFHD2-00087v-LB
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614261684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oWmLRpcjxM0i2MJpvkvfvOAlqiTkrate9XhXIYjPXss=;
 b=IyQ16A3UK7Riv1rkmpjlL3op3p+Kh0OQInYHCfe9PeAm81/PmO/xYo5nov8qZLnRX0hFZ9
 KB7N/ErwYWxShW92iIMgMTeeNBfIOFhR1t53K2pwTim5/hzF5dugSCq5xswqd5lCeSb7iM
 IdyxQSBvQ6rKS9PNTAtNVEa1OMsXVDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-Pl_bNO2IPRaHZLDUrQaK8g-1; Thu, 25 Feb 2021 09:01:20 -0500
X-MC-Unique: Pl_bNO2IPRaHZLDUrQaK8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28A78DF8B5;
 Thu, 25 Feb 2021 14:01:19 +0000 (UTC)
Received: from kaapi (ovpn-112-133.phx2.redhat.com [10.3.112.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 868586090F;
 Thu, 25 Feb 2021 14:01:17 +0000 (UTC)
Date: Thu, 25 Feb 2021 19:31:13 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/6] net: introduce qemu_receive_packet()
In-Reply-To: <5386f97e-0fb4-b7bc-6520-698a9c856bf9@redhat.com>
Message-ID: <90q67362-8n44-60q3-1q8o-nso367onnr3@erqung.pbz>
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-2-jasowang@redhat.com>
 <9e432ff0-793e-64a7-97f3-ff3a374ee98f@redhat.com>
 <b7d39898-d688-70bb-4546-612150a1635b@redhat.com>
 <5386f97e-0fb4-b7bc-6520-698a9c856bf9@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 BOUNDARY="-1463810559-417590442-1614260086=:488587"
Content-ID: <opq131oo-5898-1p3q-rp15-q6qooqsrn0q9@erqung.pbz>
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, QEMU Security <qemu-security@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810559-417590442-1614260086=:488587
Content-Type: text/plain; CHARSET=GB2312
Content-Transfer-Encoding: 8BIT
Content-ID: <89rs3873-11o5-r9r2-3q95-2r6s245552r0@erqung.pbz>

+-- On Wed, 24 Feb 2021, Philippe Mathieu-Daud¨¦ wrote --+
| On 2/24/21 2:17 PM, Jason Wang wrote:
| > On 2021/2/24 6:11 ÏÂÎç, Philippe Mathieu-Daud¨¦ wrote:
| >> IIUC the guest could trigger an infinite loop and brick the emulated 
| >> device model. Likely exhausting the stack, so either SEGV by corruption 
| >> or some ENOMEM?
| > 
| > Yes.
| >>
| >> Since this is guest triggerable, shouldn't we contact qemu-security@ list 
| >> and ask for a CVE for this issue, so distributions can track the patches 
| >> to backport in their stable releases? (it seems to be within the KVM 
| >> devices boundary).
| > 
| > 
| > That's the plan. I discussed this with Prasad before and he promise to
| > ask CVE for this.

'CVE-2021-3416' is assigned to this issue by Red Hat Inc.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810559-417590442-1614260086=:488587--



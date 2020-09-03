Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1782D25C81C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 19:33:29 +0200 (CEST)
Received: from localhost ([::1]:40902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDt72-0007c1-4z
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 13:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kDt5S-00066j-Og
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 13:31:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24862
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kDt5M-00031F-JR
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 13:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599154301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SH8+SMZbJeCbFn9AnGORifvX9cslj989+ZyiWnEEm2E=;
 b=aeAEYeiPyLslurR2ic0SbiK9ynzu7G6ayf0MRfBzJxGNR0UqXt5vz31nTtXfFMTbjm9Dqv
 0kXzxxt+BKJFkLjVRBtKJp2fCDyrFN4Chs/ihO/EWYLYb9o2HuggWTXmYd6LXYS0pyAC7G
 P6EhLRbVMX+M0fFXCN3Ex4Lrxn1vTtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-7_H5h0koMMmCMHeRLZqFdg-1; Thu, 03 Sep 2020 13:31:40 -0400
X-MC-Unique: 7_H5h0koMMmCMHeRLZqFdg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B26271084C80;
 Thu,  3 Sep 2020 17:31:38 +0000 (UTC)
Received: from kaapi (ovpn-113-31.rdu2.redhat.com [10.10.113.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC8F810013D7;
 Thu,  3 Sep 2020 17:31:35 +0000 (UTC)
Date: Thu, 3 Sep 2020 23:01:32 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1] sd: sdhci: assert data_count is within fifo_buffer
In-Reply-To: <ce447ded-8078-9437-daae-ffe0891494c5@amsat.org>
Message-ID: <nycvar.YSQ.7.78.906.2009032249490.2047119@xnncv>
References: <20200903070842.2125083-1-ppandit@redhat.com>
 <d7af91ab-5874-0619-b7c7-5f475ebf07ca@amsat.org>
 <ce447ded-8078-9437-daae-ffe0891494c5@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-1944992831-1599154298=:2047119"
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ppandit@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:24:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ruhr-University <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-1944992831-1599154298=:2047119
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Thu, 3 Sep 2020, Philippe Mathieu-Daudé wrote --+
| > -            assert(s->data_count <= s->buf_maxsz && s->data_count > begin);
| > +            assert(s->data_count <= s->buf_maxsz);
| > +            assert(s->data_count > begin);
| 
| Doesn't seem enough, guest crash here, having:
| 
| (gdb) p begin
| $1 = 0
| (gdb) p s->data_count
| $2 = 0

I was actually thinking of a case if 's->data_count' and 'begin' are same? It 
may lead to an infinite loop condition.

| (gdb) p s->blksize
| $3 = 0

This is strange. 

| Beh, something is wrong in this model, because when using ADMA2
| length 0 means 65536 bytes (see '1.13.4. Descriptor Table' in
| "SD Host Controller Simplified Specification Version 2.00").

* DMA length 's->data_count - begin'?

* if s->blksize is 65536, it'd set 'block_size = 0' in transfer_multi_blocks()

   #define BLOCK_SIZE_MASK (4 * KiB - 1)  <== 0xFFF

   static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)                     
   {
     ...
     const uint16_t block_size = s->blksize & BLOCK_SIZE_MASK;  <== 0


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-1944992831-1599154298=:2047119--



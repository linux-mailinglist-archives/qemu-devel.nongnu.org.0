Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9579D7E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 02:43:10 +0200 (CEST)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsGEQ-0006UO-0L
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 20:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60515)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hsGDf-00061v-5L
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:42:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hsGDe-0002zr-7N
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:42:23 -0400
Received: from mga04.intel.com ([192.55.52.120]:23076)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hsGDd-0002yd-Uo
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:42:22 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 17:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="182953515"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga002.jf.intel.com with ESMTP; 29 Jul 2019 17:42:19 -0700
Date: Tue, 30 Jul 2019 08:41:57 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Ivan Ren <renyime@gmail.com>
Message-ID: <20190730004157.GB17604@richard>
References: <1564387281-12321-1-git-send-email-ivanren@tencent.com>
 <1564387281-12321-4-git-send-email-ivanren@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564387281-12321-4-git-send-email-ivanren@tencent.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
Subject: Re: [Qemu-devel] [PATCH v2 3/3] migration: update ram_counters for
 multifd sync packet
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 29, 2019 at 04:01:21PM +0800, Ivan Ren wrote:
>Multifd sync will send MULTIFD_FLAG_SYNC flag info to destination, add
>these bytes to ram_counters record.
>
>Signed-off-by: Ivan Ren <ivanren@tencent.com>

Also this is suggested by me, it would be better to add Suggested-by.

>---
> migration/ram.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/migration/ram.c b/migration/ram.c
>index 88ddd2bbe2..20b6eebb7c 100644
>--- a/migration/ram.c
>+++ b/migration/ram.c
>@@ -1085,6 +1085,8 @@ static void multifd_send_sync_main(RAMState *rs)
>         p->flags |= MULTIFD_FLAG_SYNC;
>         p->pending_job++;
>         qemu_file_update_transfer(rs->f, p->packet_len);
>+        ram_counters.multifd_bytes += p->packet_len;
>+        ram_counters.transferred += p->packet_len;
>         qemu_mutex_unlock(&p->mutex);
>         qemu_sem_post(&p->sem);
>     }
>-- 
>2.17.2 (Apple Git-113)
>

-- 
Wei Yang
Help you, Help me


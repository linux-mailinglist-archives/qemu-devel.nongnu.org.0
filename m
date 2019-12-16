Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B26811FCEB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 03:37:21 +0100 (CET)
Received: from localhost ([::1]:45538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iggG8-00062m-C3
	for lists+qemu-devel@lfdr.de; Sun, 15 Dec 2019 21:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36721)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iggF9-00055A-6L
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 21:36:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iggF8-0005IK-65
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 21:36:19 -0500
Received: from mga05.intel.com ([192.55.52.43]:61023)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iggF7-0005GM-Sz
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 21:36:18 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Dec 2019 18:36:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,320,1571727600"; d="scan'208";a="204965226"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga007.jf.intel.com with ESMTP; 15 Dec 2019 18:36:15 -0800
Date: Mon, 16 Dec 2019 10:36:13 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v2 0/6] migration/multifd: a new mechanism for send
 thread sync
Message-ID: <20191216023613.GC21865@richard>
References: <20191026004520.5515-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191026004520.5515-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
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

Ping for comment.

On Sat, Oct 26, 2019 at 08:45:14AM +0800, Wei Yang wrote:
>Current send thread could work while the sync mechanism has some problem:
>
>  * has spuriously wakeup
>  * number of channels_ready will *overflow* the number of real channels
>
>The reason is:
>
>  * if MULTIFD_FLAG_SYNC is set in the middle of send thread running, there
>    is one more spurious wakeup
>  * if MULTIFD_FLAG_SYNC is set when send thread is not running, there is one
>    more channels_ready be triggered
>
>To solve this situation, one new mechanism is introduced to synchronize send
>threads. The idea is simple, a new field *sync* is introduced to indicate a
>synchronization is required.
>
>---
>v2: rebase on latest code
>
>Wei Yang (6):
>  migration/multifd: move Params update and pages cleanup into
>    multifd_send_fill_packet()
>  migration/multifd: notify channels_ready when send thread starts
>  migration/multifd: use sync field to synchronize send threads
>  migration/multifd: used must not be 0 for a pending job
>  migration/multifd: use boolean for pending_job is enough
>  migration/multifd: there is no spurious wakeup now
>
> migration/ram.c | 74 +++++++++++++++++++++++++++++++------------------
> 1 file changed, 47 insertions(+), 27 deletions(-)
>
>-- 
>2.17.1

-- 
Wei Yang
Help you, Help me


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E57851A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 08:42:10 +0200 (CEST)
Received: from localhost ([::1]:49946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hrzMH-0003aX-9e
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 02:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56192)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hrzJH-00089j-LW
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 02:39:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hrzJG-0005YG-Fs
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 02:39:03 -0400
Received: from mga17.intel.com ([192.55.52.151]:3485)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hrzJG-0005VH-6J
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 02:39:02 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jul 2019 23:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,321,1559545200"; d="scan'208";a="173776086"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga003.jf.intel.com with ESMTP; 28 Jul 2019 23:38:58 -0700
Date: Mon, 29 Jul 2019 14:38:36 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Ivan Ren <renyime@gmail.com>
Message-ID: <20190729063836.GA21091@richard>
References: <1564367573-6327-1-git-send-email-ivanren@tencent.com>
 <1564367573-6327-2-git-send-email-ivanren@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564367573-6327-2-git-send-email-ivanren@tencent.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
Subject: Re: [Qemu-devel] [PATCH 1/2] migration: add
 qemu_file_update_rate_transfer interface
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

On Mon, Jul 29, 2019 at 10:32:52AM +0800, Ivan Ren wrote:
>Add qemu_file_update_rate_transfer for just update bytes_xfer for
>speed limitation. This will be used for further migration feature
>such as multifd migration.
>
>Signed-off-by: Ivan Ren <ivanren@tencent.com>
>---
> migration/qemu-file.c | 5 +++++
> migration/qemu-file.h | 1 +
> 2 files changed, 6 insertions(+)
>
>diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>index 0431585502..13e7f03f9b 100644
>--- a/migration/qemu-file.c
>+++ b/migration/qemu-file.c
>@@ -615,6 +615,11 @@ void qemu_file_reset_rate_limit(QEMUFile *f)
>     f->bytes_xfer = 0;
> }
> 
>+void qemu_file_update_rate_transfer(QEMUFile *f, int64_t len)

Looks good, except the function name. Not good at naming :-)

Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>

>+{
>+    f->bytes_xfer += len;
>+}
>+
> void qemu_put_be16(QEMUFile *f, unsigned int v)
> {
>     qemu_put_byte(f, v >> 8);
>diff --git a/migration/qemu-file.h b/migration/qemu-file.h
>index 13baf896bd..6145d10aca 100644
>--- a/migration/qemu-file.h
>+++ b/migration/qemu-file.h
>@@ -147,6 +147,7 @@ int qemu_peek_byte(QEMUFile *f, int offset);
> void qemu_file_skip(QEMUFile *f, int size);
> void qemu_update_position(QEMUFile *f, size_t size);
> void qemu_file_reset_rate_limit(QEMUFile *f);
>+void qemu_file_update_rate_transfer(QEMUFile *f, int64_t len);
> void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
> int64_t qemu_file_get_rate_limit(QEMUFile *f);
> void qemu_file_set_error(QEMUFile *f, int ret);
>-- 
>2.17.2 (Apple Git-113)
>

-- 
Wei Yang
Help you, Help me


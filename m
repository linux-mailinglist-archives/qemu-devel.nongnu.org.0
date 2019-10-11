Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43457D3B5D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 10:40:05 +0200 (CEST)
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqSy-000092-1C
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 04:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iIqSB-0008BV-4h
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:39:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iIqSA-0001ve-1q
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:39:14 -0400
Received: from mga01.intel.com ([192.55.52.88]:57309)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iIqS9-0001TY-PK; Fri, 11 Oct 2019 04:39:14 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 01:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; d="scan'208";a="188251420"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2019 01:38:02 -0700
Date: Fri, 11 Oct 2019 16:37:46 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-devel] [PULL 5/5] multifd: Use number of channels as
 listen backlog
Message-ID: <20191011083745.GA17297@richard>
References: <20190904062915.6488-1-quintela@redhat.com>
 <20190904062915.6488-6-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190904062915.6488-6-quintela@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 04, 2019 at 08:29:15AM +0200, Juan Quintela wrote:
>Reviewed-by: Daniel P. Berrang� <berrange@redhat.com>
>Signed-off-by: Juan Quintela <quintela@redhat.com>
>---
> migration/socket.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/migration/socket.c b/migration/socket.c
>index e63f5e1612..97c9efde59 100644
>--- a/migration/socket.c
>+++ b/migration/socket.c
>@@ -178,10 +178,15 @@ static void socket_start_incoming_migration(SocketAddress *saddr,
> {
>     QIONetListener *listener = qio_net_listener_new();
>     size_t i;
>+    int num = 1;
> 
>     qio_net_listener_set_name(listener, "migration-socket-listener");
> 
>-    if (qio_net_listener_open_sync(listener, saddr, 1, errp) < 0) {
>+    if (migrate_use_multifd()) {
>+        num = migrate_multifd_channels();
>+    }
>+
>+    if (qio_net_listener_open_sync(listener, saddr, num, errp) < 0) {
>         object_unref(OBJECT(listener));
>         return;
>     }

My confusion is this function is called at the beginning of the program, which
means we didn't set multifd on or change the multifd channel parameter.

They are the default value at this point.

Am I right?

>-- 
>2.21.0
>

-- 
Wei Yang
Help you, Help me


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076F540A747
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 09:23:29 +0200 (CEST)
Received: from localhost ([::1]:40674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ2mu-0000co-34
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 03:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQ2fT-0005cR-Ep
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 03:15:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQ2fS-0001AP-1t
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 03:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631603745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZPPYTllzwk6z+3Wi4iQLayl+MiWJFCrwma2oGIsJ1ps=;
 b=aKXBbYZE2hi5I9FONXOOU1I0W+dPgnW9ZYLcMLsYDM5kHB1lgsnutJDnyhtlb4Zl2cfETR
 fZzhy2QUNacLbEUbtkN+/JGrIIUoXxbiFDRCFdIAqL3uCYwgdyh5LtdtOIUIZ1tvnbeH2V
 5U0enE8zl2hpHVeGTKtVe7vrfa047pE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-5h3OiB2YPgWJrwZ7T7r3dQ-1; Tue, 14 Sep 2021 03:15:43 -0400
X-MC-Unique: 5h3OiB2YPgWJrwZ7T7r3dQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF2B1802928
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:15:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF09C19724;
 Tue, 14 Sep 2021 07:15:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9AC6C180091C; Tue, 14 Sep 2021 09:15:36 +0200 (CEST)
Date: Tue, 14 Sep 2021 09:15:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 04/22] qapi: Convert simple union InputEvent to flat one
Message-ID: <20210914071536.xcq5weyshp3djdoh@sirius.home.kraxel.org>
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-5-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210913123932.3306639-5-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jsnow@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 02:39:14PM +0200, Markus Armbruster wrote:
> Simple unions predate flat unions.  Having both complicates the QAPI
> schema language and the QAPI generator.  We haven't been using simple
> unions in new code for a long time, because they are less flexible and
> somewhat awkward on the wire.
> 
> To prepare for their removal, convert simple union InputEvent to an
> equivalent flat one.  Adds some boilerplate to the schema, which is a
> bit ugly, but a lot easier to maintain than the simple union feature.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>



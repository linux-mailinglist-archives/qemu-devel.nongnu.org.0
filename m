Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABAD2D3100
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:27:56 +0100 (CET)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmgmJ-00071i-Mm
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmgYR-0004my-Qu
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:13:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmgYL-0007Nh-Od
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607447607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cx7mQ+yL8EgCt0KfMYCPQT9fKqvNff2DJFySJxuWRYc=;
 b=c5TXpnW1UExHxIOO4bOCbnRT89DU+IFO3WWiFcN0nbrSTrwlShbTMMMf4dqJD1cYqQhVHw
 wrHFup9XkJ9DsrEEXcVMdQMySEXjkZFfmRZ6Gh4Nif8t869DPWquh/wDLcehnfiSVY1iq4
 djNdn+dnst6xiai0q3A2ScHhW2kXW0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-FTn8hhLFNJCsjGJDGKEmIg-1; Tue, 08 Dec 2020 12:13:25 -0500
X-MC-Unique: FTn8hhLFNJCsjGJDGKEmIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54F98192780A;
 Tue,  8 Dec 2020 17:13:24 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B092F19C78;
 Tue,  8 Dec 2020 17:13:18 +0000 (UTC)
Date: Tue, 8 Dec 2020 18:13:17 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/4] block: prepare for 64bit
Message-ID: <20201208171317.GA24068@merkur.fritz.box>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201203222713.13507-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, berto@igalia.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.12.2020 um 23:27 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> This is a preparation series for v4 of "[PATCH v3 00/17] 64bit
> block-layer".
> 
> The whole thing is in 04, and 01-03 are small preparations.

Thanks, applied to the block branch.

Kevin



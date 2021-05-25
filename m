Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012AA39076A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:20:58 +0200 (CEST)
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llajh-00033m-0l
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1llZlc-00057t-VZ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:18:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1llZlb-0006rB-AH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621959530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mggVrPgJVfEly2aJ0lx4Bs0x4ecajLPfIRj7Hhye1g=;
 b=UgFcIPCdnA88M4MuDlvK/QkuYSes74McBfE8G/ocdAMWHpnSXPZA2BEdKfOx5cXJE+n9HW
 sG4DnqiboJ+RKiFXRoCC0xIcw38jHMKYUFYCYkKOjWc6X++pfm6iNh50BFMePgzqwMTr9R
 ai1rqItixTGBqvZtflIQEDDdOIZxLn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-BSuTl9oHPSi6NlzCSR24ZA-1; Tue, 25 May 2021 12:18:48 -0400
X-MC-Unique: BSuTl9oHPSi6NlzCSR24ZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9BEA107ACF8;
 Tue, 25 May 2021 16:18:46 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC9CE147;
 Tue, 25 May 2021 16:18:45 +0000 (UTC)
Date: Tue, 25 May 2021 18:18:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: [PATCH 0/2] vvfat: fix two crashes.
Message-ID: <YK0jZB86ZGLDTM+J@merkur.fritz.box>
References: <20210524101257.119377-1-vsementsov@virtuozzo.com>
 <E8FEBD24-139F-4918-92D9-5183EECCA8FB@gmail.com>
 <482b0f59-addc-2bdf-21b7-53d07265b651@virtuozzo.com>
 <B4968AF6-F208-48F5-B431-0E84CAE8491C@gmail.com>
MIME-Version: 1.0
In-Reply-To: <B4968AF6-F208-48F5-B431-0E84CAE8491C@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, berto@igalia.com,
 QEMU devel list <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.05.2021 um 18:06 hat Programmingkid geschrieben:
> >>> qemu-system-ppc -usb -device usb-storage,drive=fat16 -drive file=fat:rw:fat-type=16:"<path of a host folder>",id=fat16,format=raw,if=none
> >>> 
> On a related topic would you know if it is possible to use fat32
> instead of fat16 for host folder sharing? I did try replacing the text
> fat16 with fat32 but it didn't appear to work.

I think the correct syntax is fat:32:rw:<path>. But one of the first
things it does is:

    warn_report("FAT32 has not been tested. You are welcome to do so!");

So probably nobody would be surprised if it broke.

Kevin



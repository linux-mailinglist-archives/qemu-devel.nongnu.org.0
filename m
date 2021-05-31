Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F11A396202
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 16:48:16 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnjDD-0004pl-D7
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 10:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lnjBB-0003zZ-Gn
 for qemu-devel@nongnu.org; Mon, 31 May 2021 10:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lnjB5-0002PH-P2
 for qemu-devel@nongnu.org; Mon, 31 May 2021 10:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622472362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TzFOPnBKP4obf7+iCQLI1wCOAts7U8UJYpn+XFRqm0k=;
 b=G+l5FierniM7g/WYlXUUOvZaFQZKEMfR46/ptYjUrEnJ4udYnhv0nvdwKHC72LDRRYMZJG
 thTxByTzXF/HWSb8I+j1WNgZxNXekItWaggkEKoh0owCdx644WJdHFFRjqFdIe0qVJL/eq
 um5P4MCU/hvAVuiiWwElRLaiWbIk1Y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-WBxD_l3kMqC4QStYE8X2Zw-1; Mon, 31 May 2021 10:46:00 -0400
X-MC-Unique: WBxD_l3kMqC4QStYE8X2Zw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EA00801817;
 Mon, 31 May 2021 14:45:58 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-215.ams2.redhat.com [10.36.114.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ABA76064B;
 Mon, 31 May 2021 14:45:52 +0000 (UTC)
Date: Mon, 31 May 2021 16:45:50 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 0/3] block: drop BlockDriverState::read_only
Message-ID: <YLT2ni/AiShyuVFm@merkur.fritz.box>
References: <20210527154056.70294-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210527154056.70294-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, codyprime@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.05.2021 um 17:40 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> The field duplicates information in .open_flags. We have to carefully
> sync these two fields everywhere. It's simple to introduce a bug by
> forgetting it.
> 
> Let's drop the field, and fix users to call bdrv_is_read_only() and
> bdrv_is_writable() instead.
> 
> v2:
> 01: write "update_header =\n..." in one line
> 03: only change BlockBackendRootState, don't touch side logic

Thanks, applied to the block branch.

Kevin



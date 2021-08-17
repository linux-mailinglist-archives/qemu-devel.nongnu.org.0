Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75E73EF2AE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 21:33:00 +0200 (CEST)
Received: from localhost ([::1]:41838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG4pX-0008Ck-Q2
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 15:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mG4nl-0006mw-AK
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 15:31:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mG4nj-0002H4-N9
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 15:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629228667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cbJU0h0bBHyWIFkEsGF53Q6ZVqPM953Ht81TMp/eRxg=;
 b=BQ5qlwqixJpatvfoZXWPO+bhi90A27Z2R8NX16jb91ZurlDR9V5actQstrTZRX2q/byZLT
 v/kJ4EIex619qzcb+4cgvDVwRsOopIuFl1kR2CSUyhDvXD2e35ZyZDEh51hUKghbBymFpM
 p7WTcUu8m9Nr8jUKcYZW0ZpqNc/Lzgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-8pl4wVcIMnKngdCySMnd6Q-1; Tue, 17 Aug 2021 15:31:03 -0400
X-MC-Unique: 8pl4wVcIMnKngdCySMnd6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01C12801AEB;
 Tue, 17 Aug 2021 19:31:03 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 208D45D9CA;
 Tue, 17 Aug 2021 19:30:55 +0000 (UTC)
Date: Tue, 17 Aug 2021 14:30:53 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 10/25] python/aqmp: add configurable read buffer limit
Message-ID: <20210817193053.wcektcjb6k3d5qeo@redhat.com>
References: <20210803182941.504537-1-jsnow@redhat.com>
 <20210803182941.504537-11-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210803182941.504537-11-jsnow@redhat.com>
User-Agent: NeoMutt/20210205-719-68949a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 02:29:26PM -0400, John Snow wrote:
> QMP can transmit some pretty big messages, and the default limit of 64KB
> isn't sufficient. Make sure that we can configure it.
> 
> Reported-by: G S Niteesh Babu <niteesh.gs@gmail.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/protocol.py | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



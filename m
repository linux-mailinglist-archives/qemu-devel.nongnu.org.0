Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEC52F7E48
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:33:28 +0100 (CET)
Received: from localhost ([::1]:42586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QAJ-00072n-KD
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0PaT-0004nM-Px
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:56:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0PaQ-0000tt-V6
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610718982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aRfjHsDuBEXZr+AwaFtbtx1QY73fZJih4xGNp45ZbQk=;
 b=LjSdsrINXTfBkacfR7X7JLLdDFzyvrpOHslUQg6qUvNIYXV7IlZw4cFd46WzCsSe5AJsGv
 IFvyP6x2qwMTxBI2ep/PWyuxWxrQKNCPdgpui2Nt02hpkXoprVoF/XaB3FvkwdCRUgGxpz
 WTM3W/6jQxQXQjgcR96GWql/6+FPnpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-i1J_-T-kPY-81UeD7NK6EQ-1; Fri, 15 Jan 2021 08:56:20 -0500
X-MC-Unique: i1J_-T-kPY-81UeD7NK6EQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72F4E107ACF7;
 Fri, 15 Jan 2021 13:56:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-142.ams2.redhat.com
 [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 158AE5C1A1;
 Fri, 15 Jan 2021 13:56:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 85EC411386A7; Fri, 15 Jan 2021 14:56:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/1] net: Fix handling of id in netdev_add and netdev_del
References: <20201125100220.50251-1-armbru@redhat.com>
 <c9730775-08f6-322e-bb41-76ba957858e4@redhat.com>
Date: Fri, 15 Jan 2021 14:56:05 +0100
In-Reply-To: <c9730775-08f6-322e-bb41-76ba957858e4@redhat.com> (Jason Wang's
 message of "Fri, 27 Nov 2020 13:25:51 +0800")
Message-ID: <87czy6jocq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: yuri.benditovich@daynix.com, andrew@daynix.com, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason Wang <jasowang@redhat.com> writes:

> On 2020/11/25 =E4=B8=8B=E5=8D=886:02, Markus Armbruster wrote:
>> This is a regression fix, but the regression is already in 5.0.  I
>> think it's too late for 5.2.  If I'm right, then the issue should be
>> documented in the release notes (I can do that).
>
>
> Please do that and I've queued this for the next release.

Ping?



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D303F33B1F9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:02:43 +0100 (CET)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlvm-0001GF-Oe
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLlqH-0006dY-4q
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:57:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLlqF-0003uU-EI
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615809418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t/qDKFxH4AbPSwKiV+Q0B8MIHCvmTktoQGkrTJYGVEs=;
 b=HVlOuZoQZUDG0BNxrVbmCyKPvNVYXpkdlw+2SwM28d6rnNcjDPeLD6SMpfItcvkr7sBF3L
 bDkQdnsRosn23DO9nI/A320NxuVKcCjB6ICC/txE0WYvkpk6eTd3FB6k7DrWQVWaVd/W3u
 vbl+bw9MvLgaE9i/6kgFWpplSaMCx/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-kmqjJtGFOx6pqEeS9lnacw-1; Mon, 15 Mar 2021 07:56:56 -0400
X-MC-Unique: kmqjJtGFOx6pqEeS9lnacw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C23D384B9A4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:56:55 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-128.ams2.redhat.com [10.36.115.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD3565D9C0;
 Mon, 15 Mar 2021 11:56:54 +0000 (UTC)
Date: Mon, 15 Mar 2021 12:56:53 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] qom: Support JSON in user_creatable_parse_str()
Message-ID: <YE9Lhbxbi8Nf4soz@merkur.fritz.box>
References: <20210312131921.421023-1-kwolf@redhat.com>
 <87blbnxz2f.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87blbnxz2f.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: pbonzini@redhat.com, pkrempa@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.03.2021 um 09:00 hat Markus Armbruster geschrieben:
> Recommend
> 
>     qom: Support JSON in HMP object_add and tools --object
> 
> to put the most interesting bit right in "git-log --oneline".

Makes sense. I've updated my patch locally, but Paolo has already queued
it. Paolo, can you update the subject line accordingly?

Kevin



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5715BC50
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 11:03:50 +0100 (CET)
Received: from localhost ([::1]:49904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2BLZ-0004AI-Qq
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 05:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49485)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j2BKs-0003lP-DS
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:03:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j2BKr-0003lq-Hq
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:03:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24216
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j2BKr-0003lR-ET
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581588183;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIPemQMt1rSiJye7PB8uda7ri9WS3MO7nQbUNlFqGV4=;
 b=UbkgiHR1BtgAGu6s5pCRyRLCSpmAT1vhmGawpYdvt0G+syWN6vU0thHg/jFFmJSS9DVGn7
 XW7ZMq2SwuYDac/wJgCxmPjkzsKBQrZE8hbQ1og06KXzxGWA0fM+4kp+sTv9iJr1Aif3RE
 xQ4sPoZ7hYYIF+qUH3bpMYHb+2L9bGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-c2StGRiOMDW72ihspqWSbg-1; Thu, 13 Feb 2020 05:03:01 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CFD5800D41;
 Thu, 13 Feb 2020 10:03:00 +0000 (UTC)
Received: from redhat.com (ovpn-116-40.ams2.redhat.com [10.36.116.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41DF260BF7;
 Thu, 13 Feb 2020 10:03:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Zhimin Feng <fengzhimin1@huawei.com>
Subject: Re: [PATCH RFC 01/14] migration: add the 'migrate_use_rdma_pin_all'
 function
In-Reply-To: <20200213093755.370-2-fengzhimin1@huawei.com> (Zhimin Feng's
 message of "Thu, 13 Feb 2020 17:37:42 +0800")
References: <20200213093755.370-1-fengzhimin1@huawei.com>
 <20200213093755.370-2-fengzhimin1@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Thu, 13 Feb 2020 11:02:58 +0100
Message-ID: <87h7zu954d.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: c2StGRiOMDW72ihspqWSbg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Reply-To: quintela@redhat.com
Cc: zhang.zhanghailiang@huawei.com, armbru@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, jemmy858585@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhimin Feng <fengzhimin1@huawei.com> wrote:
> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



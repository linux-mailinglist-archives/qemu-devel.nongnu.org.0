Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497D2197B8F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 14:08:32 +0200 (CEST)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jItDT-000452-BY
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 08:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1jItCV-00038L-RF
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:07:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1jItCU-0005sb-UW
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:07:31 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:48647)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1jItCU-0005sJ-Ql
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585570050;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pYOTo48IK50PV9mFhZJsaGf/QMYrloZHg38wZ03BFFU=;
 b=WxgJeqSRihPLTCb5T4uAV8zcpj/FI6xf2I6+aUrc0DKeIQ0PN+wWc7s7AhikGH/bBPHTT1
 GnXjbHhAZM8a1ntN52x93++WX4JSCJOzXJ6Gv/LbIt4cEFpHJinzX923OK/ITJEbpAaqF8
 RSW5M7e/Y5vKK9Xqzm0R4j+iymaP0LQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-axDGmGCDMeCd7tXFZx4MaA-1; Mon, 30 Mar 2020 08:07:27 -0400
X-MC-Unique: axDGmGCDMeCd7tXFZx4MaA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBA1800D50;
 Mon, 30 Mar 2020 12:07:25 +0000 (UTC)
Received: from redhat.com (ovpn-112-10.ams2.redhat.com [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DDCE60C99;
 Mon, 30 Mar 2020 12:07:23 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Subject: Re: [PATCH 2/3] monitor/hmp-cmds: add hmp_handle_error() for
 hmp_migrate_set_speed()
In-Reply-To: <20200329050131.26864-3-maozhongyi@cmss.chinamobile.com> (Mao
 Zhongyi's message of "Sun, 29 Mar 2020 13:01:30 +0800")
References: <20200329050131.26864-1-maozhongyi@cmss.chinamobile.com>
 <20200329050131.26864-3-maozhongyi@cmss.chinamobile.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Mon, 30 Mar 2020 14:07:21 +0200
Message-ID: <875zemkpvq.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mao Zhongyi <maozhongyi@cmss.chinamobile.com> wrote:
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



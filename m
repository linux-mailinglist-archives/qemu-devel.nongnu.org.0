Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCFB25AD36
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 16:34:07 +0200 (CEST)
Received: from localhost ([::1]:42566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDTpu-0006v3-Et
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 10:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDTnl-0005Zq-VG
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 10:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDTnj-0002At-RR
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 10:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599057110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yORoHf+y2VBuN+BVg4KUjcNP9e47M8P2beAG2B1io0=;
 b=K2ann2z25EGn9c+I0CdbJzC0AXCyY9bEQfriF7KctLwfAxoMzF6F2hFz6Z0ysRZ8XZhPoS
 IX2ctHhQz1XwUcXiUMYuC26zzJIpHHvGvkd6QwVtJBdO0cPWC/2fANyuf8cdWY70x+k9Nm
 4lXmGFj5l/uaoiMZYigvOIaYmkvONaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-evXiPp4DOe2UI0mQ1aqh3Q-1; Wed, 02 Sep 2020 10:31:48 -0400
X-MC-Unique: evXiPp4DOe2UI0mQ1aqh3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 958C4640E1
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 14:31:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64D5B19C59;
 Wed,  2 Sep 2020 14:31:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D87E3113865F; Wed,  2 Sep 2020 16:31:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] libqtest: Rename qmp_assert_error_class() to
 qmp_expect_error_and_unref()
References: <20200902115733.1229537-1-armbru@redhat.com>
 <b7cdce86-ad58-d8fc-d081-ce5410dbcc57@redhat.com>
Date: Wed, 02 Sep 2020 16:31:32 +0200
In-Reply-To: <b7cdce86-ad58-d8fc-d081-ce5410dbcc57@redhat.com> (Thomas Huth's
 message of "Wed, 2 Sep 2020 14:00:33 +0200")
Message-ID: <87eenk8d2z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 02/09/2020 13.57, Markus Armbruster wrote:
>> qmp_assert_error_class() does more than just assert: it also unrefs
>> the @rsp argument.  Rename to qmp_assert_error_class() to reduce
>> confusion.
>
> s/to qmp_assert_error_class()/to qmp_expect_error_and_unref()/

I once again demonstrate that I'm unable to read what I wrote myself.

> With that nit fixed (I can do it when picking up the patch):
>
> Acked-by: Thomas Huth <thuth@redhat.com>

Thanks!



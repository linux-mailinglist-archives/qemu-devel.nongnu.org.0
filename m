Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E0422E63F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 09:10:02 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzxGr-0000ON-Qf
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 03:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jzxGB-0008QL-Ip
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 03:09:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29347
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jzxG9-0000qh-KT
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 03:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595833756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O7kHFAxZ9h89C05pxlz9ppkE6NsvGrrHaI4vmqviTFE=;
 b=dE/2xNOuOBCX8mnGcLi/3d2G+6sstEUWKyxL1XRrJQc9wt7YERYF65p37OaTdcE3sqmWkB
 0Xu/wh7wN23FKgwbirPCO6/tFEDMuoAtvioSBhgkS5emMLrbFFbxW8S/wMyLeQ0TVFnFC2
 T17Rja1giwe9DTkqNl43vUcXQxDS3l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-KVCfSlDbPl2akGsIrcP4iQ-1; Mon, 27 Jul 2020 03:09:14 -0400
X-MC-Unique: KVCfSlDbPl2akGsIrcP4iQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E31D102C7ED
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 07:09:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3146560C87;
 Mon, 27 Jul 2020 07:09:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BAC291138648; Mon, 27 Jul 2020 09:09:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/3] scripts/qmp/qom-fuse: Port to current Python module
 fuse
References: <20200723142738.1868568-1-armbru@redhat.com>
 <20200723142738.1868568-3-armbru@redhat.com>
 <30a62da5-6091-ee96-7614-c129cb04d350@redhat.com>
Date: Mon, 27 Jul 2020 09:09:11 +0200
In-Reply-To: <30a62da5-6091-ee96-7614-c129cb04d350@redhat.com> (John Snow's
 message of "Fri, 24 Jul 2020 12:56:06 -0400")
Message-ID: <87o8o177u0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 01:46:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 7/23/20 10:27 AM, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Honestly, benefit of the doubt on this one. The Python looks fine, but
> I don't know much about the FUSE module.

All I knew when I started this job was that the script had worked for me
before with some Fedora Python fuse package, and didn't work with Fedora
32's python3-fusepy.

>                                          Still, it was broken before,
> so if you claim it now works for you, that's more useful than it used
> to be.
>
> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks!



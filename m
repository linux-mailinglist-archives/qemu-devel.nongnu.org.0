Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A912F2692BE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 19:14:20 +0200 (CEST)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHs3X-00079F-NI
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 13:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kHqVo-00088R-I0
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 11:35:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49887
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kHqVk-0004db-HY
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 11:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600097719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7Zx8WrjZScG4lii4D4qRDxfMb5TM1IepMgieasGrls=;
 b=IYFa/OuPYlG6P7JwM/PCD0g3BYSr/vM9TS991D2bJMgkmPucJhO7WW5dLBojlLVlzRxUKA
 +gAVQXS4NCawmHAbtaBvdL+cWa6enx4BauemWPaUDiq06ymWKEHwfpM5DBdYw3j7tEDvxu
 jof6ZTSDzmbPZ66CnsIRkmkqteq9GfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-dptSxnGYNW2-z8YJp2yYbQ-1; Mon, 14 Sep 2020 11:35:16 -0400
X-MC-Unique: dptSxnGYNW2-z8YJp2yYbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F75B18C5200;
 Mon, 14 Sep 2020 15:35:15 +0000 (UTC)
Received: from [10.3.113.68] (ovpn-113-68.phx2.redhat.com [10.3.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 177EE1A8EC;
 Mon, 14 Sep 2020 15:35:15 +0000 (UTC)
Subject: Re: [PATCH v5 4/8] qapi: Implement deprecated-output=hide for QMP
 event data
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200914084802.4185028-1-armbru@redhat.com>
 <20200914084802.4185028-5-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a9a7565e-62ed-420a-02fb-332bd0fcf162@redhat.com>
Date: Mon, 14 Sep 2020 10:35:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200914084802.4185028-5-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 01:39:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/20 3:47 AM, Markus Armbruster wrote:
> This policy suppresses deprecated bits in output, and thus permits
> "testing the future".  Implement it for QMP event data: suppress
> deprecated members.
> 
> No QMP event data is deprecated right now.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   tests/test-qmp-event.c                  | 21 +++++++++++++++++++++
>   scripts/qapi/events.py                  |  8 ++++++--
>   tests/qapi-schema/qapi-schema-test.json |  3 +++
>   tests/qapi-schema/qapi-schema-test.out  |  2 ++
>   4 files changed, 32 insertions(+), 2 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E781B6306
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 20:10:39 +0200 (CEST)
Received: from localhost ([::1]:35740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRgJ4-0004Yq-PS
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 14:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRgHy-0003C2-Ri
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 14:09:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRgHx-00084q-O9
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 14:09:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28424
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jRgHx-00082v-9t
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 14:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587665368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4KnEbQzZxybKGdZp3V6Tu9Ray+o+TxeFyPTn/FYX7o=;
 b=HgyxBfmTZ2RWUcMR9lQ9TWy7BLYnpXa5uO1rLbiopc56hs05NiqsmuQeDtLsGvOSkyqsxP
 lb3fdvStltkr0M09/EQIcfTN2MN1M5zl4Se9T4FMFonf61nGTZ7MSeCGRfbZ5Zo0M69i46
 JnmihOTvs41bVfV2xm9UvSyMQ9E5WU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-ayDtDoqRM9-_gOolZtZuTA-1; Thu, 23 Apr 2020 14:09:26 -0400
X-MC-Unique: ayDtDoqRM9-_gOolZtZuTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 521821009440;
 Thu, 23 Apr 2020 18:09:25 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC3BB5C1BE;
 Thu, 23 Apr 2020 18:09:24 +0000 (UTC)
Subject: Re: [PATCH 11/13] qapi: Assert non-input visitors see only valid
 alternate tags
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200423160036.7048-1-armbru@redhat.com>
 <20200423160036.7048-12-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2ba19d06-24c4-f98e-3c3a-9c9534959495@redhat.com>
Date: Thu, 23 Apr 2020 13:09:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423160036.7048-12-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 06:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/20 11:00 AM, Markus Armbruster wrote:
> An alternate type's visit_type_FOO() fails when it runs into an
> invalid ->type.
> 
> This is appropriate with an input visitor: visit_start_alternate()
> sets ->type according to the input, and bad input can lead to bad
> ->type.
> 
> It should never happen with an output, clone or dealloc visitor: if it
> did, the alternate being output, cloned or deallocated would be messed
> up beyond repair.  Assert that.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/qapi/visit.py | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



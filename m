Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360782DE11F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:34:49 +0100 (CET)
Received: from localhost ([::1]:48016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD60-000074-6u
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqD1z-0004zU-RL
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:30:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqD1q-0000jZ-AI
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608287428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JunJhLeUNrDiKBCqtYXuRlBVownff0Qbc+E7los8DrU=;
 b=aZ6vKNnYMFD51OinODk54Gj3zyGYss7hc/RmkPcLqvrhJZkjXFYGhoBLQCV3HzmJypXYMt
 Av3Uz03/BDcvmZQfWeMNMi4Q468bvwYkJbIKXkZCRh/6c3FAMS1/r762Yoz3UNl5Lf34lw
 3n7lrnQ5qs4sUBKd7/yyHQQJYsMR160=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-cXt-G7fsNs-JVEzmLa_dbQ-1; Fri, 18 Dec 2020 05:30:24 -0500
X-MC-Unique: cXt-G7fsNs-JVEzmLa_dbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B03D18C89C4;
 Fri, 18 Dec 2020 10:30:23 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-84.ams2.redhat.com
 [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7157C2BFEA;
 Fri, 18 Dec 2020 10:30:22 +0000 (UTC)
Subject: Re: [PATCH 2/9] block/vpc: Don't abuse the footer buffer as BAT
 sector buffer
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201217162003.1102738-1-armbru@redhat.com>
 <20201217162003.1102738-3-armbru@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <fb15a94a-ecd8-d1bb-1917-76286b86b583@redhat.com>
Date: Fri, 18 Dec 2020 11:30:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217162003.1102738-3-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.20 17:19, Markus Armbruster wrote:
> create_dynamic_disk() takes a buffer holding the footer as first
> argument.  It writes out the footer (512 bytes), then reuses the
> buffer to initialize and write out the dynamic header (1024 bytes),
> then reuses it again to initialize and write out BAT sectors (512).
> 
> Works, because the caller passes a buffer that is large enough for all
> three purposes.  I hate that.
> 
> Use a separate buffer for writing out BAT sectors.  The next commit
> will do the same for the dynamic header.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   block/vpc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

(Still wondering about whether such buffers should go on the stack, but:)

Reviewed-by: Max Reitz <mreitz@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D722075EC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 16:43:57 +0200 (CEST)
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo6d2-0000cC-2U
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 10:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jo6cA-00008h-C1
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 10:43:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33613
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jo6c8-0001Wz-8i
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 10:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593009779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYz6UIgk+0eJHG1D2U/SezFcwCT2z9zlnYUJPMqWCnA=;
 b=gtvBMacu2CRwOZhJSswlxLgLIq3kHbQK4FppmT2XVfzWyu9taLhwe6/VSMEZ8s3BZBStYj
 gPFg0U955oyDld4Q1tHJkADeAsf7DBBk9IVVQoG1rQjubVjNp+yQVbVhX1N2ZyBHvwfK+N
 nJ5v+G5lXVLJm85/dWay4OAlqhJ58QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-ptWP3DJwNFCbFBa_PSNXpg-1; Wed, 24 Jun 2020 10:42:57 -0400
X-MC-Unique: ptWP3DJwNFCbFBa_PSNXpg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B133184D162
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 14:42:56 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19F165D9C5;
 Wed, 24 Jun 2020 14:42:56 +0000 (UTC)
Subject: Re: [PATCH v2 05/25] tests: Use error_free_or_abort() where
 appropriate
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200624083737.3086768-1-armbru@redhat.com>
 <20200624083737.3086768-6-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <652b13b2-2a91-f16a-26e8-f1e1bb9d3cdc@redhat.com>
Date: Wed, 24 Jun 2020 09:42:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624083737.3086768-6-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/20 3:37 AM, Markus Armbruster wrote:
> Replace
> 
>      g_assert(err != NULL);
>      error_free(err);
>      err = NULL;
> 
> and variations thereof by
> 
>      error_free_or_abort(&err);
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD82821085C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 11:39:23 +0200 (CEST)
Received: from localhost ([::1]:57034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqZD8-0002ku-0K
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 05:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jqZBz-0001XT-DH
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 05:38:11 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27403
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jqZBx-0007Em-Go
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 05:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593596288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1i0I/lXBrRxUU0YJOp6PYPJDTRrbrrM/Q/cso/LvtpU=;
 b=WXgLMX/A/EZwYlg0iYPLKkqat+vhhAJK6LoyQRnC+YroXv+0oTIQWocjobIleFEOaPkpVc
 1KFJqFpP65N91bGguVHU8+iCHkcx1RwX/JsoJNpsAUlV2KBZuKzTLEGmGovz3eXcH4i2Bm
 hEWbCvmd7hlOjy6UiZ+rd00UwH3Gq58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-vs0HHeMkO1iJxvsAQRT00w-1; Wed, 01 Jul 2020 05:38:06 -0400
X-MC-Unique: vs0HHeMkO1iJxvsAQRT00w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 283A78015CE
 for <qemu-devel@nongnu.org>; Wed,  1 Jul 2020 09:38:06 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-45.ams2.redhat.com [10.36.114.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24E38741BF;
 Wed,  1 Jul 2020 09:38:04 +0000 (UTC)
Subject: Re: [PATCH] migration: postcopy take proper error return
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com
References: <20200701093557.130096-1-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <68f18383-128f-912f-34ff-de8e39744ee3@redhat.com>
Date: Wed, 1 Jul 2020 11:38:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200701093557.130096-1-dgilbert@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 01:05:53
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

On 01/07/2020 11.35, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> This function returns a boolean success and we're returning -1;
> lets just use the 'out' error path.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Fixes: 58b7c17e226 ("Disable mlock around incoming postcopy")
> Buglink: https://bugs.launchpad.net/qemu/+bug/1885720
> ---
>   migration/postcopy-ram.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index a36402722b..bef2a3afed 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -389,7 +389,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
>        */
>       if (munlockall()) {
>           error_report("%s: munlockall: %s", __func__,  strerror(errno));
> -        return -1;
> +        goto out;
>       }

Sounds like the right thing to do here.

Reviewed-by: Thomas Huth <thuth@redhat.com>



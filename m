Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D417207C7B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 21:58:58 +0200 (CEST)
Received: from localhost ([::1]:40874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joBXt-0002ny-K1
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 15:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1joBR5-0005vl-2O
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 15:51:55 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53088
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1joBQ7-0003ZN-Ta
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 15:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593028255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTp0AOAl/za374zGgDg7swlQLdlyVD/uSBFbX4wWVko=;
 b=RJ++jmo9ag4LMOogcr5QmWV96KgEJcLdfmNFF+P5bX5YBqreUNacIcFfb38Etz4yj+Xu+F
 xbOYFyIrIxLK2mF/qgleUupr/MTm25TpTZHmKaFn9EzkEeGpwyFraV9UEnZGuIpgowjiKR
 Kq2kx4Jl0o6DthE7UkoQUiH64SdpmiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391--Svk12eQOVCYD9oTAxBiqg-1; Wed, 24 Jun 2020 15:50:51 -0400
X-MC-Unique: -Svk12eQOVCYD9oTAxBiqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65ABB100A61E;
 Wed, 24 Jun 2020 19:50:50 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB3195D9C5;
 Wed, 24 Jun 2020 19:50:49 +0000 (UTC)
Subject: Re: [PATCH 15/46] qemu-option: Tidy up opt_set() not to free
 arguments on failure
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200624164344.3778251-1-armbru@redhat.com>
 <20200624164344.3778251-16-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3f298381-d979-b9e7-e5ea-68ab081c77c9@redhat.com>
Date: Wed, 24 Jun 2020 14:50:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624164344.3778251-16-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/20 11:43 AM, Markus Armbruster wrote:
> opt_set() frees its argument @value on failure.  Slightly unclean;
> functions ideally do nothing on failure.
> 
> To tidy this up, move opt_create() from opt_set() into its callers,
> along with the cleanup.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   util/qemu-option.c | 33 ++++++++++++++++++---------------
>   1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/util/qemu-option.c b/util/qemu-option.c
> index 3cdf0c0800..14946e81f2 100644
> --- a/util/qemu-option.c
> +++ b/util/qemu-option.c
> @@ -519,36 +519,39 @@ static QemuOpt *opt_create(QemuOpts *opts, const char *name, char *value,
>       return opt;
>   }
>   

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A11CB0C5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 15:47:39 +0200 (CEST)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX3Lm-0003Eu-Pn
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 09:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jX3Jk-0000UI-4m
 for qemu-devel@nongnu.org; Fri, 08 May 2020 09:45:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50674
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jX3Ji-00006L-0w
 for qemu-devel@nongnu.org; Fri, 08 May 2020 09:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588945528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=89TaezP2YGhTAfal+R/4/ZywYldKM30CgPY5KjVJK8k=;
 b=Pfl+XXQsD7MKl9KahiwSFRmjbDXW48R5ju1s3e2NH6gO9piAI44emwBuqRzEvYjcjVMkJY
 8lHipkQEYa8f7FQcz5x1//ffgR/ERrW+o2Ldswnc6llT6/WknmDyakrnm45LLSFlZcVhcT
 v9DLKnCJCVmnuuY1wLTgAfRiU7/DdlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-5L6QjSMTN8COSImvquFvDA-1; Fri, 08 May 2020 09:45:22 -0400
X-MC-Unique: 5L6QjSMTN8COSImvquFvDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B44156B29;
 Fri,  8 May 2020 13:45:21 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F19E860BE2;
 Fri,  8 May 2020 13:45:20 +0000 (UTC)
Subject: Re: [PATCH] cpus: Fix botched configure_icount() error API violation
 fix
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200508104933.19051-1-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <85ab3d39-0916-3637-6568-70166436e7f8@redhat.com>
Date: Fri, 8 May 2020 08:45:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508104933.19051-1-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 01:34:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/20 5:49 AM, Markus Armbruster wrote:
> Fixes: abc9bf69a66a11499a801ff545b8fe7adbb3a04c
> Fixes: Coverity CID 1428754
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   cpus.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/cpus.c b/cpus.c
> index 5670c96bcf..b9275c672d 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -813,7 +813,7 @@ void configure_icount(QemuOpts *opts, Error **errp)
>           return;
>       }
>   
> -    if (strcmp(option, "auto") != 0) {
> +    if (option && !strcmp(option, "auto")) {

Another alternative would be using g_strcmp0, but this form is fine.

>           if (qemu_strtol(option, NULL, 0, &time_shift) < 0
>               || time_shift < 0 || time_shift > MAX_ICOUNT_SHIFT) {
>               error_setg(errp, "icount: Invalid shift value");
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B13729F3B7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 19:01:09 +0100 (CET)
Received: from localhost ([::1]:35936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYCEV-0006gl-Pp
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 14:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kYCDO-00063C-NH
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 13:59:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kYCDL-0000lD-U1
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 13:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603994393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvAigXjmLlJWntQEHvPTD5Lp+UTLsdISX8N8nn/gKQY=;
 b=NHku9AVoRPgbaNuD6TXc12imqBqItzkgcr17iSZTs//Gima+ANicFef4Qen5H2T0GtvsLS
 MEBVzS8Ptqw10PkS1rOByT8j8aidNIn855KCnm94hmx+qRAmzm+BDmFNubqHN6jo3dOxFe
 0gywmsEqC2gakYTc0xmGwYQTRGnIbYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-N1epc9u6MFaBXiPtlTHUjg-1; Thu, 29 Oct 2020 13:59:49 -0400
X-MC-Unique: N1epc9u6MFaBXiPtlTHUjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10A051030984;
 Thu, 29 Oct 2020 17:59:48 +0000 (UTC)
Received: from [10.3.112.145] (ovpn-112-145.phx2.redhat.com [10.3.112.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 181146EF69;
 Thu, 29 Oct 2020 17:59:40 +0000 (UTC)
Subject: Re: [PATCH 01/11] test-util-sockets: Plug file descriptor leak
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201029133833.3450220-1-armbru@redhat.com>
 <20201029133833.3450220-2-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5f33fb7d-fdc8-7f50-d161-81c0205ec69a@redhat.com>
Date: Thu, 29 Oct 2020 12:59:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201029133833.3450220-2-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.261, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, zxq_yx_007@163.com,
 kraxel@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/20 8:38 AM, Markus Armbruster wrote:
> Fixes: 4d3a329af59ef8acd076f99f05e82531d8129b34
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/test-util-sockets.c | 1 +
>  1 file changed, 1 insertion(+)

Only a test bug, but a bug nonetheless, so appropriate for 5.2

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
> index f6336e0f91..15da867b8f 100644
> --- a/tests/test-util-sockets.c
> +++ b/tests/test-util-sockets.c
> @@ -252,6 +252,7 @@ static gpointer unix_server_thread_func(gpointer user_data)
>  
>      connfd = accept(fd, (struct sockaddr *)&un, &len);
>      g_assert_cmpint(connfd, !=, -1);
> +    close(connfd);
>  
>      close(fd);
>  
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



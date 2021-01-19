Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AAD2FC0F1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:27:26 +0100 (CET)
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xb2-0006TV-Bq
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1wbm-0007Ty-8c
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 14:24:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1wbi-0008ER-Uy
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 14:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611084241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8Ciien8l5gp3cRsz9rThCqrADz7h15wKzbmwVbliDs=;
 b=bvsIymYJM51w4X3RD0MApYmcRoggKVKuMM90lBtOwRY9DB4YDV861tSae7Jfl1mPhESYiO
 L1xt2ENTECDsllr8yCmOxS84JiLQTkPS7OaXT2QkcJAz4tA+MYbLYdxw0NMAj/1ug5LxKC
 t5LzW6fmsgpArHRKLmsSt4cY5fpQ3gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-NQ6l6YTHNI-GBPtlaBfw9w-1; Tue, 19 Jan 2021 14:23:57 -0500
X-MC-Unique: NQ6l6YTHNI-GBPtlaBfw9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5FE2180A096;
 Tue, 19 Jan 2021 19:23:55 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B8125D9DD;
 Tue, 19 Jan 2021 19:23:52 +0000 (UTC)
Subject: Re: [PATCH] vnc: add qmp to support reload vnc tls certificates
To: Zihao Chang <changzihao1@huawei.com>, qemu-devel@nongnu.org
References: <20210104071128.754-1-changzihao1@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <99899535-accc-bb9f-0a81-172727ba7423@redhat.com>
Date: Tue, 19 Jan 2021 13:23:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104071128.754-1-changzihao1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: oscar.zhangbo@huawei.com, kraxel@redhat.com, xiexiangyou@huawei.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 1:11 AM, Zihao Chang wrote:
> QEMU loads vnc tls certificates only when vm is started. This patch
> provides a new qmp command to reload vnc tls certificates without
> restart vnc-server/VM.
> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---

> +++ b/qapi/ui.json
> @@ -1179,3 +1179,20 @@
>  ##
>  { 'command': 'query-display-options',
>    'returns': 'DisplayOptions' }
> +
> +##
> +# @reload-vnc-cert:
> +#
> +# Reload certificates for vnc.
> +#
> +# Returns: nothing
> +#
> +# Since: 5.2

You've missed 5.2.  The next release will be 6.0.

> +#
> +# Example:
> +#
> +# -> { "execute": "reload-vnc-cert" }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'reload-vnc-cert' }
-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



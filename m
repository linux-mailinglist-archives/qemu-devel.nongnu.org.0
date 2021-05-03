Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA2D371F10
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:59:10 +0200 (CEST)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcqb-0007Gd-Gp
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldcoZ-0006Og-8s
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:57:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldcoX-0003Ol-N9
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620064621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gF90vCkFhJF10V5QuPYUX/7jL7GjCP97+U6af0WoKvA=;
 b=giUbGKO3h6mOTffH1xHLKbkFq23236FdhMh7BclGQBeBnPTL0qH5698gMZ+qVZF3FDh0ec
 hhyyff382cFCR5lRermrELLF47sG7XUmUVobDV2C4oCb2AZ/btWETO9HgIH33oNkBMlWsM
 XMKgYjvlJSwqS4zjpPjbfz/vZR/T9kU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-HNOGNF5iMdmXPpaWLJGMuQ-1; Mon, 03 May 2021 13:56:57 -0400
X-MC-Unique: HNOGNF5iMdmXPpaWLJGMuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9B46803F46;
 Mon,  3 May 2021 17:56:56 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43EEE5D9CD;
 Mon,  3 May 2021 17:56:56 +0000 (UTC)
Subject: Re: [RESEND PATCH 03/32] qom: Add memory-backend-epc ObjectOptions
 support
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-4-yang.zhong@intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0ebd92e8-c43c-9a7b-07a2-3ad7afeab436@redhat.com>
Date: Mon, 3 May 2021 12:56:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430062455.8117-4-yang.zhong@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, kai.huang@intel.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 1:24 AM, Yang Zhong wrote:
> Add the new 'memory-backend-epc' user creatable QOM object in
> the ObjectOptions to support SGX, or the sgx backend object
> cannot bootup.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  qapi/qom.json | 2 ++
>  1 file changed, 2 insertions(+)

Missing documentation, including a 'since 6.1' blurb, for the new addition.

> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index cd0e76d564..fd6fbee597 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -767,6 +767,7 @@
>      { 'name': 'memory-backend-memfd',
>        'if': 'defined(CONFIG_LINUX)' },
>      'memory-backend-ram',
> +    'memory-backend-epc',
>      'pef-guest',
>      'pr-manager-helper',
>      'rng-builtin',
> @@ -824,6 +825,7 @@
>        'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
>                                        'if': 'defined(CONFIG_LINUX)' },
>        'memory-backend-ram':         'MemoryBackendProperties',
> +      'memory-backend-epc':         'MemoryBackendProperties',
>        'pr-manager-helper':          'PrManagerHelperProperties',
>        'rng-builtin':                'RngProperties',
>        'rng-egd':                    'RngEgdProperties',
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F79834CF41
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:42:34 +0200 (CEST)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQqHx-0007kW-Bh
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQqFG-0006SK-CN
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:39:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQqF8-0000Yv-5L
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617017977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0h/SlhtbxRhNwO+2ZroX68/tH748s4K1E9Ij0nhyFk4=;
 b=SWhvJ2sfxsi6p1FEoemqgiKx9TuwuLAoLp+T/eg3ZXmJon5z9vQPbz7ILG0ZVH5FvPgXnK
 Y5SsuxCmEVy0r/Crr72zkX5TPEozvLfqcavRmfX6nNF1hnaBno7lwpTSwfwbVlF63Byy9k
 818MkDhGS8BPAyHNQPzRlvfLBdLOvvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-QrQ_YI91MzWXapOa_tVZ7A-1; Mon, 29 Mar 2021 07:39:35 -0400
X-MC-Unique: QrQ_YI91MzWXapOa_tVZ7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C2D519251A3;
 Mon, 29 Mar 2021 11:39:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BD0A5C239;
 Mon, 29 Mar 2021 11:39:33 +0000 (UTC)
Subject: Re: [PATCH v1 5/6] tests/tcg/i386: expand .data sections for system
 tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8f12bb94-a157-fbfc-b9e6-359518760c45@redhat.com>
Date: Mon, 29 Mar 2021 13:39:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210329110303.15235-6-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/2021 13.03, Alex Bennée wrote:
> Newer compilers might end up putting some data in .data.rel.local
> which was getting skipped resulting in hilarious confusion on some
> tests. Fix that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/i386/system/kernel.ld | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/i386/system/kernel.ld b/tests/tcg/i386/system/kernel.ld
> index 92de525e93..27ea5bbe04 100644
> --- a/tests/tcg/i386/system/kernel.ld
> +++ b/tests/tcg/i386/system/kernel.ld
> @@ -12,7 +12,7 @@ SECTIONS {
>   	}
>   
>   	.data : {
> -		*(.data)
> +		*(.data*)
>   		__load_en = .;
>   	}
>   
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>



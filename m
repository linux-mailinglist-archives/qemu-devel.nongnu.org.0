Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C93131579D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:21:27 +0100 (CET)
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZVm-00017A-Ch
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9YnK-0008BN-Nj
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:35:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9YnF-0003xf-CX
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612899319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bORJykuGBhsST7wBwdAM14uT4G1IpSB4cczan/02uzg=;
 b=O/768be9Kv7b33Easl3CWuHSSUpv9FlA+yq54NJKn6PEwcj00KQPtjChrkm1RvzkGbLOpb
 YA9r+yZ93qKZR4LzRqZ57BtMg4qroC1pI3db/3+qpdki6nwWbPTxIDreuzq9wTy7BfzAhb
 8Ev/WS5Y2QHXQkjBC5/ce/+AZrWn9ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-H_bLQHLXPK6lTA_6kuCIRA-1; Tue, 09 Feb 2021 14:35:17 -0500
X-MC-Unique: H_bLQHLXPK6lTA_6kuCIRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A1A8803651
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:35:16 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC29C17AE2;
 Tue,  9 Feb 2021 19:35:12 +0000 (UTC)
Subject: Re: [PATCH 1/2] trace: fix "-trace file=..."
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210209145759.141231-1-pbonzini@redhat.com>
 <20210209145759.141231-2-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <28558ba6-21a8-0ee5-6e55-d0af04962d90@redhat.com>
Date: Tue, 9 Feb 2021 13:35:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209145759.141231-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: armbru@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:57 AM, Paolo Bonzini wrote:
> Because trace_opt_parse always deletes the options it has parsed,
> trace_init_file's call to qemu_find_opts_singleton always
> creates an empty -trace option group.  Therefore, the subsequent
> qemu_opt_get(opts, "file") always returns NULL.
> 
> To fix this, save the last "-trace file=..." option in a global
> variable and use it later in trace_init_file.
> 
> This is similar to what was done before commit 92eecfff32 ("trace:
> remove argument from trace_init_file", 2020-11-11), except contained
> within trace/control.c and without memory leaks.
> 
> Fixes: 92eecfff32 ("trace: remove argument from trace_init_file", 2020-11-11)
> Cc: stefanha@redhat.com
> Reported-by: armbru@redhat.com
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  trace/control.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F73157A4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:23:03 +0100 (CET)
Received: from localhost ([::1]:38156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZXK-0002B1-UM
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9YoI-00011j-Hq
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:36:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9YoG-0004QW-V6
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612899388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TIeTtphxEuxrOMdsCvY9zXjyjZGBoOR0AItBPuWSLnI=;
 b=coDp/TxHD/TLCguL9DIXS9yoNJl1O3lqZyYly/whzSlqeRSLqX/fviNZZYBZZtTBmwsUoP
 c3nL0KYaKNysYLSlxWmZoHnq310t7g8v+jbY5AgJwSI+Tiru2tdgduFztWQJcU9BdJ1Yny
 ec6lpECa+/1cQ+q/WiaewuLuoxlnZzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-1EZYO0mkNwWWOlsyt7xliw-1; Tue, 09 Feb 2021 14:36:26 -0500
X-MC-Unique: 1EZYO0mkNwWWOlsyt7xliw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CD40107ACE6
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:36:25 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18AEA6064B;
 Tue,  9 Feb 2021 19:36:22 +0000 (UTC)
Subject: Re: [PATCH 2/2] trace: skip qemu_set_log_filename if no "-D" option
 was passed
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210209145759.141231-1-pbonzini@redhat.com>
 <20210209145759.141231-3-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3b2e07c7-cb9e-dba9-0573-d8aa22720f14@redhat.com>
Date: Tue, 9 Feb 2021 13:36:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209145759.141231-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
> When the "simple" backend is not active but the "log" backend is,
> both "-trace file=" and "-D" will result in a call to
> qemu_set_log_filename.  Unfortunately, QEMU was also calling
> qemu_set_log_filename if "-D" was not passed, so the "-trace
> file=" option had no effect and the tracepoints went back to
> stderr.
> 
> Fortunately we can just skip qemu_set_log_filename in that case,
> because the log backend will initialize itself just fine as soon
> as qemu_set_log is called, also in qemu_process_early_options.
> 
> Cc: stefanha@redhat.com
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b219ce1f35..e67f91dd37 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2367,7 +2367,9 @@ static void qemu_process_early_options(void)
>      trace_init_file();
>  
>      /* Open the logfile at this point and set the log mask if necessary.  */
> -    qemu_set_log_filename(log_file, &error_fatal);
> +    if (log_file) {
> +        qemu_set_log_filename(log_file, &error_fatal);
> +    }
>      if (log_mask) {
>          int mask;
>          mask = qemu_str_to_log_mask(log_mask);
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



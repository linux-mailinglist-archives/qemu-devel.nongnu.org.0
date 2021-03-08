Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B729B330CAA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:48:27 +0100 (CET)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEN8-0007Vq-Q5
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJELJ-0006OH-SX
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJELF-0007FD-MC
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615203987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mocm1g2CVcnormkFNmtgvvMIonU291PFcLyn19HQgT8=;
 b=YDyyWYS7V3TKLJKeeWpcYUdz19IIVTdj0A3Soh8aqRjJOorkQeXF+eUopJYWQo2sxQdwbW
 dAMRk3I0BIOcHrt/XQVc7WTmDpvK6UJASCDK7lGSM2uZVeVguJkIQPKEY1sx743qBuCASs
 kbE5WRscjvhScAVoS1r5IEHjaf9iAXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-VEc-i5VFOCaCSaRxGJw9RQ-1; Mon, 08 Mar 2021 06:46:26 -0500
X-MC-Unique: VEc-i5VFOCaCSaRxGJw9RQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0199B81431C;
 Mon,  8 Mar 2021 11:46:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-198.ams2.redhat.com [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D445460C04;
 Mon,  8 Mar 2021 11:46:23 +0000 (UTC)
Subject: Re: [PATCH] migration: Remove time_t cast for OpenBSD
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YDNdAiOkEYOfmbhT@humpty.home.comstyle.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7eaad721-9d2a-83ed-00fc-80c8ee37e156@redhat.com>
Date: Mon, 8 Mar 2021 12:46:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YDNdAiOkEYOfmbhT@humpty.home.comstyle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/2021 08.28, Brad Smith wrote:
> OpenBSD has supported 64-bit time_t across all archs since 5.5 released in 2014.
> 
> Remove a time_t cast that is no longer necessary.
> 
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 52e2d72e4b..9557f85ba9 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2849,8 +2849,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
>       if (name) {
>           pstrcpy(sn->name, sizeof(sn->name), name);
>       } else {
> -        /* cast below needed for OpenBSD where tv_sec is still 'long' */
> -        localtime_r((const time_t *)&tv.tv_sec, &tm);
> +        localtime_r(&tv.tv_sec, &tm);
>           strftime(sn->name, sizeof(sn->name), "vm-%Y%m%d%H%M%S", &tm);
>       }

Please make sure to CC: the maintainers (see MAINTAINERS file). Done now.

Reviewed-by: Thomas Huth <thuth@redhat.com>



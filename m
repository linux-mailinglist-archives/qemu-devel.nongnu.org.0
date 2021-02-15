Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2260A31B992
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:46:10 +0100 (CET)
Received: from localhost ([::1]:45132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdGQ-0002pY-RA
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lBd4w-0004O4-LN
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:34:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lBd4u-0004Vj-Dp
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613392451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25T4yV6rV400kul9of+viny/H5Ddk77O8KcEvFpo05k=;
 b=ZIR1FLCjsld4WIHZzwZ5h5zcSghTyIHnHx+gSM+02HqTLpv3l5pt4hPBQe+6Ob7KrERvXS
 8bnjQgi0dyPZBgro34DEYjY0qgV6VLt0sFDuU2M0gvge3XGowXbWiKJUQX+0WVK8BoZs+Q
 MiOSRmEETDQaBh/JlOcS+oVkclDfgOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-_HwZgnU9NKS7V5JHxvu-Mg-1; Mon, 15 Feb 2021 07:34:08 -0500
X-MC-Unique: _HwZgnU9NKS7V5JHxvu-Mg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F38D107ACC7
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:34:07 +0000 (UTC)
Received: from [10.40.193.96] (unknown [10.40.193.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D92B5C5DF;
 Mon, 15 Feb 2021 12:34:06 +0000 (UTC)
Subject: Re: [PATCH RESEND] hostmem: Don't report pmem attribute if unsupported
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
References: <dfcc5dc7e2efc0283bc38e3036da2c0323621cdb.1611647111.git.mprivozn@redhat.com>
Message-ID: <48b5fe65-784a-17ab-c542-60e1b406e2a7@redhat.com>
Date: Mon, 15 Feb 2021 13:34:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <dfcc5dc7e2efc0283bc38e3036da2c0323621cdb.1611647111.git.mprivozn@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mprivozn@redhat.com;
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 8:48 AM, Michal Privoznik wrote:
> When management applications (like Libvirt) want to check whether
> memory-backend-file.pmem is supported they can list object
> properties using 'qom-list-properties'. However, 'pmem' is
> declared always (and thus reported always) and only at runtime
> QEMU errors out if it was built without libpmem (and thus can not
> guarantee write persistence). This is suboptimal since we have
> ability to declare attributes at compile time.
> 
> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1915216
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
> 
> This is just a resend of a patch I've sent earlier with Reviewed-by and
> Tested-by added:
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg04558.html
> 
>   backends/hostmem-file.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)

Polite ping, please.

Michal



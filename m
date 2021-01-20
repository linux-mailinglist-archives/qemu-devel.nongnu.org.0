Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D62FDCD9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 00:19:16 +0100 (CET)
Received: from localhost ([::1]:49640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Mkt-0006VN-4C
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 18:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Mj0-0005Uw-5M
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 18:17:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Miy-0003cU-Cx
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 18:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611184635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6KbY/MdeOMFRWPs/iLa2xBRMJyYmMn3+TVpv/PPf350=;
 b=GGCTiA3sgNJxlZYfChUDFCVhdmoph9IFAjSvY5IZjgfumnELx765VCLGKIqfqTRfu7LxD0
 mhpeq0xWEH0V6dDAYJ2KlZyS2U5oc+L9JrBOYZ/MEZCcNNC4nrF544ivPCL5Sa+GEw+7vX
 abY3r8fXjpdo3EcMl+FPE5DTKNAd59g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-Nka8nk5FOJCN067x9fTp_g-1; Wed, 20 Jan 2021 18:17:11 -0500
X-MC-Unique: Nka8nk5FOJCN067x9fTp_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 748AB806663;
 Wed, 20 Jan 2021 23:17:10 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E824E1A3D8;
 Wed, 20 Jan 2021 23:17:06 +0000 (UTC)
Subject: Re: [PATCH 04/11] job: add .cancel handler for the driver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <20201118180433.11931-5-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0db5f8be-46e8-775e-1eb1-4e74941ec916@redhat.com>
Date: Wed, 20 Jan 2021 17:17:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201118180433.11931-5-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
> To be used in mirror in the following commit to cancel in-flight io on
> target to not waste the time.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/qemu/job.h | 5 +++++
>  job.c              | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 32aabb1c60..efc6fa7544 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -251,6 +251,11 @@ struct JobDriver {
>       */
>      void (*clean)(Job *job);
>  
> +    /**
> +     * If the callback is not NULL, it will be invoked in job_cancel_async
> +     */
> +    void (*cancel)(Job *job);
> +

Does the call need to be re-entrant or even worry about being invoked
more than once on the same BDS?  Or worded differently,

> +++ b/job.c
> @@ -712,6 +712,9 @@ static int job_finalize_single(Job *job)
>  
>  static void job_cancel_async(Job *job, bool force)
>  {
> +    if (job->driver->cancel) {
> +        job->driver->cancel(job);
> +    }
>      if (job->user_paused) {

can job_cancel_async be reached more than once on the same BDS?

>          /* Do not call job_enter here, the caller will handle it.  */
>          if (job->driver->user_resume) {
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



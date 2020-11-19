Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F282B9C23
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:36:22 +0100 (CET)
Received: from localhost ([::1]:44280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfqfF-0003wa-Db
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfqCo-0003Qu-Hv
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:07:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfqCT-0003vg-6J
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605816375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ChtZcrM/aHKiQHXq5LKHvJgOvulGbmZ/UjVvWdUyr4=;
 b=RURyIMUF8QzNJkgCcTr+XUhKEygfTaQRoAwwvtRYVQLhWqiqPDjZaKNKbtLI5aVfQLeum0
 /QowMOkMu4QBpnuEwwN9/Q2fWBZiwf3kGYKR9w0AJEsqkVD2rv7bGMs6ZzOmk4z9rLiZ9J
 GMGZhoeBKo7x0T9v9Tr2Orgm+MASQxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-KypZ_HPpMHCK3vqBSvnMOQ-1; Thu, 19 Nov 2020 15:06:11 -0500
X-MC-Unique: KypZ_HPpMHCK3vqBSvnMOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9B6D801B17;
 Thu, 19 Nov 2020 20:06:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-109.ams2.redhat.com [10.36.113.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D329360843;
 Thu, 19 Nov 2020 20:06:06 +0000 (UTC)
Subject: Re: [PATCH 1/2] pc-bios: s390x: Ensure Read IPL memory is clean
To: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
References: <20201119165729.63351-1-farman@linux.ibm.com>
 <20201119165729.63351-2-farman@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2b887993-125d-6ebc-fee8-9e14927124ef@redhat.com>
Date: Thu, 19 Nov 2020 21:06:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201119165729.63351-2-farman@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Jason Herne <jjherne@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/2020 17.57, Eric Farman wrote:
> If, for example, we boot off a virtio device and chreipl to a vfio-ccw
> device, the space at lowcore will be non-zero. We build a Read IPL CCW
> at address zero, but it will have leftover PSW data that will conflict
> with the Format-0 CCW being generated:
> 
> 0x0: 00080000 80010000
>        ------ Ccw0.cda
>               -- Ccw0.chainData
>                 -- Reserved bits
> 
> The data address will be overwritten with the correct value (0x0), but
> the apparent data chain bit will cause subsequent memory to be used as
> the target of the data store, which may not be where we expect (0x0).
> 
> Clear out this space when we boot from DASD, so that we know it exists
> exactly as we expect.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  pc-bios/s390-ccw/dasd-ipl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/pc-bios/s390-ccw/dasd-ipl.c b/pc-bios/s390-ccw/dasd-ipl.c
> index 0fc879bb8e..71cbae2f16 100644
> --- a/pc-bios/s390-ccw/dasd-ipl.c
> +++ b/pc-bios/s390-ccw/dasd-ipl.c
> @@ -100,6 +100,9 @@ static void make_readipl(void)
>  {
>      Ccw0 *ccwIplRead = (Ccw0 *)0x00;
>  
> +    /* Clear out any existing data */
> +    memset(ccwIplRead, 0, sizeof(Ccw0));
> +
>      /* Create Read IPL ccw at address 0 */
>      ccwIplRead->cmd_code = CCW_CMD_READ_IPL;
>      ccwIplRead->cda = 0x00; /* Read into address 0x00 in main memory */

Sounds reasonable.

Reviewed-by: Thomas Huth <thuth@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D04903A7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:23:27 +0100 (CET)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9NIU-0000Ca-3L
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:23:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9NEh-0006qW-SO
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:19:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9NEe-0001vR-QZ
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642407567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wpigy0oAub9yKSY50NOkMU3eXVe3psMi8Qv62capukk=;
 b=QcTR5IxOF3xs/R1bPJXsJ59jh5hC8gYgHS6PDCHYoXCgHMYBgqvMvoOc5CvRZ+5uXacqmk
 umPjMef+VtXLWoH68C67GOGQCmVzBaIV2VIj5/RJ+XXNn6jYmZXu6VW9RaQW9sGS9CpH1X
 CbnpChSXiHoEuOb49VacB2j7cTku/k8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-gGndIMe7MAi4TNtnHmq7YA-1; Mon, 17 Jan 2022 03:19:26 -0500
X-MC-Unique: gGndIMe7MAi4TNtnHmq7YA-1
Received: by mail-ed1-f70.google.com with SMTP id
 c11-20020a056402120b00b0040321cea9d4so374127edw.23
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 00:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Wpigy0oAub9yKSY50NOkMU3eXVe3psMi8Qv62capukk=;
 b=nxCMyKjjFS3XHYl/CcxNvpGkvdEDWYI72s1dw1pcQQGIr51tg+AP3KGWkh00cJRt7D
 w4+pEOgeeufR1g05FJFVo93OtVta9VZl4rNEPT9F5Wm+mrXKI54l8Wnet4iw30kujGgw
 LQ5f0xFA66CXOuIUfn8ZacRnjibTR3PdwuPPPVPyexc/u74A8IYYpRcFXc+6QthiyERY
 ptpXY0H32FMc8hIQPAUf2Scz2JaYaSSyqm/3CVxDi1yIo5CFFd4/bNoQEHU7/xyCMjhl
 odYnQRDZ7Y886P3zlP7d3R6BCoZwKURpCWQGhHtEeaA8dEI3+UsggWDrJ2OpcspvQ0FS
 3lVA==
X-Gm-Message-State: AOAM532tHLOh+mzxN3eq5eprVc8pLAHTU40acZ00/Q/NTknLY6SLa4BB
 dgx3QuuxGBjQX+709T9A2VfIyEqOzt93I/fnUsN8fq0eszzBZpIGeGJKuH4OfirdtgRcIZ4Gfhe
 XmzQ5DjsVGzz9u2k=
X-Received: by 2002:a17:907:97c4:: with SMTP id
 js4mr16334764ejc.422.1642407565025; 
 Mon, 17 Jan 2022 00:19:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwmhGTluBh9+gTYXIdySY24k1cyKa0a+jmfJN6GKYLHM0xQIkCqn0CVcios0kHUedmcHEl3w==
X-Received: by 2002:a17:907:97c4:: with SMTP id
 js4mr16334752ejc.422.1642407564834; 
 Mon, 17 Jan 2022 00:19:24 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:dd00:68a1:1bd:6733:bde9?
 (p200300cbc705dd0068a101bd6733bde9.dip0.t-ipconnect.de.
 [2003:cb:c705:dd00:68a1:1bd:6733:bde9])
 by smtp.gmail.com with ESMTPSA id e24sm5488415edv.62.2022.01.17.00.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:19:24 -0800 (PST)
Message-ID: <eab22fd3-3466-ac47-311f-a97408bf588b@redhat.com>
Date: Mon, 17 Jan 2022 09:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 1/6] libvhost-user: Add vu_rem_mem_reg input validation
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>
References: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
 <20220117041050.19718-2-raphael.norwitz@nutanix.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220117041050.19718-2-raphael.norwitz@nutanix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.01.22 05:12, Raphael Norwitz wrote:
> Today if multiple FDs are sent from the VMM to the backend in a
> VHOST_USER_REM_MEM_REG message, one FD will be unmapped and the remaining
> FDs will be leaked. Therefore if multiple FDs are sent we report an
> error and fail the operation, closing all FDs in the message.
> 
> Likewise in case the VMM sends a message with a size less than that of a
> memory region descriptor, we add a check to gracefully report an error
> and fail the operation rather than crashing.
> 
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 15 +++++++++++++++
>  subprojects/libvhost-user/libvhost-user.h |  2 ++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 787f4d2d4f..b09b1c269e 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -801,6 +801,21 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] = {};
>      VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
>  
> +    if (vmsg->fd_num != 1) {
> +        vmsg_close_fds(vmsg);
> +        vu_panic(dev, "VHOST_USER_REM_MEM_REG received %d fds - only 1 fd "
> +                      "should be sent for this message type", vmsg->fd_num);
> +        return false;
> +    }
> +
> +    if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
> +        close(vmsg->fds[0]);

I wonder if using vmsg_close_fds(vmsg); makes the code easier to read.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



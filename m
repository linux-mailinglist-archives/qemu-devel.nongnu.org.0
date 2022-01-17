Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150CB4903AC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:23:57 +0100 (CET)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9NIx-0000di-Sb
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:23:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9NF7-0007H4-1M
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:19:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9NF4-0001y8-Iw
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:19:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642407594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mti/wPtqQrrtRt/MxDgkbBNxSJf5R4XKH4GTNnO6kqs=;
 b=OyvKaIQUPAlLiRTSz5WNTz1JDvIhSXgFfHrAHz7YhvY00xWFCS03aQoEetXEmUUzJl9FnW
 tXw/d2NjPCbjXer26ntqIXOcE8FYl4GCKoWGQ1JD+TCX94itcqvSBqy852WqC1MGqJBFyt
 3XfMFJ/uPX/s3suisWkdAWkTahGcUQA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-3ByiuLiWPgyE91NG6KeCDw-1; Mon, 17 Jan 2022 03:19:50 -0500
X-MC-Unique: 3ByiuLiWPgyE91NG6KeCDw-1
Received: by mail-ed1-f71.google.com with SMTP id
 j10-20020a05640211ca00b003ff0e234fdfso13567404edw.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 00:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mti/wPtqQrrtRt/MxDgkbBNxSJf5R4XKH4GTNnO6kqs=;
 b=VCgvaFxfBm+phUwuPMpdRIBIfFyA7H5kv0CzzS2yZFe1999BeJJCfmeaC+rvV3txpr
 zNlVjkxNrL3XfBuQlLLhSk2LNC6dVQ/ZoWP6isDiI0EYR+9Bt+gpQwNQoSHOyZL3Im7R
 2jrgfwzZD+jb2R78jan5oSsI4F4X6sSRuUkllaojYUNCaKHHcI1QxgiudFjwuX4SWOTY
 /Smeh2EGTR6REPri1KJ2fYZQ3d363WvYAYXOn/467c9el8cTAnpb7BiZOKKS6MWthIu0
 dM15F9AU8NUu8IPiETx5Lw9cc+NpRLeXQOpEITLvwPOKmZhPaKzY/vWPMEEsMhWJNZOE
 K1/w==
X-Gm-Message-State: AOAM531QJAJRc4XC06YbL47t/zrombusqX3c3gqBG4DmFSODPU1pEkHm
 bcXyOfQHaDIxcdwfXc2KRYCu04G3Nz846cH1sA754FaP22+zv8Nji9m4cFFYuTsDfmwBbg4WkLW
 Niea7NJEinZZ4Ubw=
X-Received: by 2002:aa7:d554:: with SMTP id u20mr20195572edr.322.1642407589109; 
 Mon, 17 Jan 2022 00:19:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1YnWpVHexMKuj+/Febcjn107j0wj/OJlVuVOWEhifD6qQY+mhMpv4YE3fuwLOuwdsaqLVUA==
X-Received: by 2002:aa7:d554:: with SMTP id u20mr20195555edr.322.1642407588863; 
 Mon, 17 Jan 2022 00:19:48 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:dd00:68a1:1bd:6733:bde9?
 (p200300cbc705dd0068a101bd6733bde9.dip0.t-ipconnect.de.
 [2003:cb:c705:dd00:68a1:1bd:6733:bde9])
 by smtp.gmail.com with ESMTPSA id z15sm1662789ejl.72.2022.01.17.00.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:19:48 -0800 (PST)
Message-ID: <d099d341-0027-1ba9-d319-d057d1c5ecb9@redhat.com>
Date: Mon, 17 Jan 2022 09:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 2/6] libvhost-user: Add vu_add_mem_reg input validation
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>
References: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
 <20220117041050.19718-3-raphael.norwitz@nutanix.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220117041050.19718-3-raphael.norwitz@nutanix.com>
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
> VHOST_USER_ADD_MEM_REG message, one FD will be mapped and the remaining
> FDs will be leaked. Therefore if multiple FDs are sent we report an
> error and fail the operation, closing all FDs in the message.
> 
> Likewise in case the VMM sends a message with a size less than that
> of a memory region descriptor, we add a check to gracefully report an
> error and fail the operation rather than crashing.
> 
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index b09b1c269e..1a8fc9d600 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -690,6 +690,21 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VuDevRegion *dev_region = &dev->regions[dev->nregions];
>      void *mmap_addr;
>  
> +    if (vmsg->fd_num != 1) {
> +        vmsg_close_fds(vmsg);
> +        vu_panic(dev, "VHOST_USER_ADD_MEM_REG received %d fds - only 1 fd "
> +                      "should be sent for this message type", vmsg->fd_num);
> +        return false;
> +    }
> +
> +    if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
> +        close(vmsg->fds[0]);

Same comment as for patch #1

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb



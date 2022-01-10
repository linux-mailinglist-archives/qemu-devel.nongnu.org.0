Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A764894A2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:02:23 +0100 (CET)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qZJ-0002ki-L9
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:02:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qVE-0008Pz-Fn
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:58:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qVC-0008EZ-0J
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:58:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641805085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JRr+ajg9+pOoui+ej18C05jjsCeJYZIFD8ZLHD5JJqs=;
 b=a5sHW/CeUGp5hiCq0CoXsOYAL70evIsnxRaTeUx9wEgUPMUxshafBm3HWzUInFlbLoalMK
 bNx425547HNjPQ+wUbhJcAoEFdUMXm9CfU8xcVg+/JrE/Hv8jcFNkaT2zqpYUGg1lBjHMh
 NrQXowGHBRUFrvqaYII0uT0O6JKS47A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-Pk_4nnnVMyKf3Srtj-aSlQ-1; Mon, 10 Jan 2022 03:58:04 -0500
X-MC-Unique: Pk_4nnnVMyKf3Srtj-aSlQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 ec25-20020a0564020d5900b003fc074c5d21so5193741edb.19
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 00:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JRr+ajg9+pOoui+ej18C05jjsCeJYZIFD8ZLHD5JJqs=;
 b=yPytLVlSjLkAqzl+ixLrwdrrHULIB1CHeDCNmh8azCdBW4fZS1ba6tXnZxXHgLlcU5
 k5uc3EoBV5Mo1kKkaWdKjgJTy9TjZ4yo3KLOqmOYtGOMRguRx+rJ3I/N6CqgK7mmTzqO
 l8Bwvmwezv3RXbuB+Xo8agbmtAXZvQbmHgGEYzmKYcQf2EHqCJtXiVC/PXYhKc+hlq2X
 82ay+gcolmjuhLK+e85iSUshF9iJPj9kWcuMOMVnR++fzdPbEnaNiI2/RNzlKF60SlJ/
 M0iLlKTrqne/LTW9jPBEnHeB9PSvJ9Q6u7RW+K9m6XeN2rSTsww+HW0CFZhC9F6Epozo
 gpdA==
X-Gm-Message-State: AOAM5321SYbgcTr8YoMtRhcDOazI1pRklACZenoFc6vu4AHT7UQt7cox
 /uevWWUL/32l8QGBuuW1pXXPMcTYagfBs6eEHU3aJiz9BM5+UTJg8HShy4PK99YTBf+lWT2+8EF
 /ZHtEyiAOyM7jo54=
X-Received: by 2002:a50:c3c8:: with SMTP id i8mr75069324edf.350.1641805082869; 
 Mon, 10 Jan 2022 00:58:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy10ksaRrjqHR7ACJcb8MkkIekn4z/V2DRiOIwyXWPosSUIB7Cs7zw5zUF8i690dFaKplgZHg==
X-Received: by 2002:a50:c3c8:: with SMTP id i8mr75069312edf.350.1641805082694; 
 Mon, 10 Jan 2022 00:58:02 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id ht15sm2158896ejc.122.2022.01.10.00.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:58:02 -0800 (PST)
Message-ID: <7e5aa393-cc05-d209-6e0e-f314cd5a0c2d@redhat.com>
Date: Mon, 10 Jan 2022 09:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 5/5] libvhost-user: handle removal of identical regions
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-6-raphael.norwitz@nutanix.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220106064717.7477-6-raphael.norwitz@nutanix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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

On 06.01.22 07:47, Raphael Norwitz wrote:
> Today if QEMU (or any other VMM) has sent multiple copies of the same
> region to a libvhost-user based backend and then attempts to remove the
> region, only one instance of the region will be removed, leaving stale
> copies of the region in dev->regions[].
> 
> This change resolves this by having vu_rem_mem_reg() iterate through all
> regions in dev->regions[] and delete all matching regions.
> 
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 26 ++++++++++++-----------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 0fe3aa155b..14482484d3 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -809,6 +809,7 @@ static bool
>  vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
>      int i;
> +    bool found = false;
>  
>      if (vmsg->fd_num != 1 ||
>          vmsg->size != sizeof(vmsg->payload.memreg)) {
> @@ -835,21 +836,22 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>                  munmap(m, r->size + r->mmap_offset);
>              }
>  
> -            break;
> +            /*
> +             * Shift all affected entries by 1 to close the hole at index i and
> +             * zero out the last entry.
> +             */
> +            memmove(dev->regions + i, dev->regions + i + 1,
> +                    sizeof(VuDevRegion) * (dev->nregions - i - 1));
> +            memset(dev->regions + dev->nregions - 1, 0, sizeof(VuDevRegion));
> +            DPRINT("Successfully removed a region\n");
> +            dev->nregions--;
> +            i--;
> +
> +            found = true;

Maybe add a comment like

/* Continue the search for eventual duplicates. */


-- 
Thanks,

David / dhildenb



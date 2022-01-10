Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422F4894B0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:04:24 +0100 (CET)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qbH-0006Jp-60
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:04:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qUK-0006iP-6Q
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:57:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qUE-00082m-HK
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641805024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nITW89Y0rJmPPOceVpumiYtz3qXSGRjpe1ZHcZfJKw=;
 b=ZTuCsynIes7Wlq5Fd6bWtuHO2bKgDVOiSc0fHXdIUSFv645aT18+CRCI2aZM4hqrvODHuK
 p7KuRNR/K4Amj2OzAGn7ezUvw5rJDGbdnknkIXq2F+W3P2/w++DbyeG7q/EDoEVAdqkxRY
 VYP5IIhCxIQOLwuLfNg3fi/p6HM3Ruo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-5VMzYA8qOrqYRNtPSdjQNg-1; Mon, 10 Jan 2022 03:57:02 -0500
X-MC-Unique: 5VMzYA8qOrqYRNtPSdjQNg-1
Received: by mail-ed1-f72.google.com with SMTP id
 x19-20020a05640226d300b003f8b80f5729so9480799edd.13
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 00:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7nITW89Y0rJmPPOceVpumiYtz3qXSGRjpe1ZHcZfJKw=;
 b=QSJxfrBP9QWEqurh2/h5zAuorI1I3Q/H90dKxv5WCRjHfKxvv9wFdu28Wx4H2MQsZ3
 iwNSQWTn8a19ELAuIXcQ9ZL6TvVR/RjsOpMOePP416Jw2HMxpTyXGCmW7wgQ14P93Qse
 Dk758qL+aXFKrm6W8TdWcr/2a+VySqW8AfWCRPL8FVErhnACKeNojfUpiDBsGPKA9orm
 cUNxTIJ7iN9Qu3+m0B48FzH2PojLt/brsKhxV4g3N7sRt5G8XbyKQkmhsgBtZW35RZQ2
 wLLUfAndZp6HE90a105aCaSeSr02tJWDd0xv4b+ygJLggxBF1eRMSjDv8gCRZ4ttHvya
 h+XQ==
X-Gm-Message-State: AOAM531qM9ecKVkne1xOsufxywHwXkfr/C6O158QEGVWUZfn/UMAqVOx
 gqTc2dOW/lKtBevSSeGLaPgqPu4KVhMI1PFPF9VwtrL+SR7eM9bz2+VOL4Zgeu1LLEH4EjH6xuJ
 bO2uZgguNydrQGK4=
X-Received: by 2002:aa7:d69a:: with SMTP id d26mr13843545edr.78.1641805021533; 
 Mon, 10 Jan 2022 00:57:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ0NeG0ZxgOyqa1XwSUo0b0VoF/Ks8sDg4n+OTi3ca9PZdbwhZ4zGsRac/SVsIplcsmNB9vg==
X-Received: by 2002:aa7:d69a:: with SMTP id d26mr13843531edr.78.1641805021333; 
 Mon, 10 Jan 2022 00:57:01 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id g9sm3217014edb.53.2022.01.10.00.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:57:01 -0800 (PST)
Message-ID: <9fb1a8e9-393b-0f5b-5c4d-b8f839c61393@redhat.com>
Date: Mon, 10 Jan 2022 09:57:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/5] libvhost-user: prevent over-running max RAM slots
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-5-raphael.norwitz@nutanix.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220106064717.7477-5-raphael.norwitz@nutanix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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
> When VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS support was added to
> libvhost-user, no guardrails were added to protect against QEMU
> attempting to hot-add too many RAM slots to a VM with a libvhost-user
> based backed attached.
> 
> This change adds the missing error handling by introducing a check on
> the number of RAM slots the device has available before proceeding to
> process the VHOST_USER_ADD_MEM_REG message.
> 
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 77ddc96ddf..0fe3aa155b 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -690,6 +690,11 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VuDevRegion *dev_region = &dev->regions[dev->nregions];
>      void *mmap_addr;
>  
> +    if (dev->nregions == VHOST_USER_MAX_RAM_SLOTS) {
> +        vu_panic(dev, "No free ram slots available");
> +        return false;
> +    }
> +
>      if (vmsg->fd_num != 1 ||
>          vmsg->size != sizeof(vmsg->payload.memreg)) {
>          vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions");

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



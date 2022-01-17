Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7B64903C5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:27:38 +0100 (CET)
Received: from localhost ([::1]:58572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9NMX-0003yn-Dz
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:27:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9NFu-0007UF-VI
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:20:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9NFt-0002GS-9b
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642407644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4ABglUfqFX2rQ7TClv0xxyUmaoC97CbMBuzkP3wM64=;
 b=gSW/GaQfvhYUBpKx8dtSsgsH5A1DkaHPcjAbLdWALJcFNcbQQJBiJE6N/uUa9oWlAJ5odJ
 cE4GUXW+F1LE+tuzXSkYmuWKjaFuPxua9OpN7eWPb5OMFWN8rKN9/0dXYhsmIx9P+lwVja
 L+mt1c8Q2aTlN8zlgpNA9PyKB+l/GPo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-Dq_6oCffPlGKWb1PHIannw-1; Mon, 17 Jan 2022 03:20:43 -0500
X-MC-Unique: Dq_6oCffPlGKWb1PHIannw-1
Received: by mail-ed1-f72.google.com with SMTP id
 s9-20020aa7d789000000b004021d03e2dfso3251584edq.18
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 00:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=E4ABglUfqFX2rQ7TClv0xxyUmaoC97CbMBuzkP3wM64=;
 b=pLOxR/0D77qWUTRA3FHg0chi+WwbMMo6V7xUaHxn6AnEJtG6aobwaJRVeNuMno1vPg
 Zcs5NwIk7Iaq0LoTqIWE1zLm+5HMOD3Lr+eYu931Mocyz+TUMQ8POhiRu4uaaTmY0orK
 ciDjbDbNkzFiqFWJeR2EUYu4LJHqJhqj2tSB+Ye/7ljOriIoUR13QiSKbv7xNBfB9Rv/
 0TJLnVBs0wwEsvwKJ7cJZk1+gjGTGloEL/2VeFQtQYDku700N2a1nll9TsR5bN+gFlrU
 s0J6pwSTZgtvw3mjE9kbaOSNgk9IbFdPRNMn7Gdc0281nrmthtQt7+juxQEsTjebc7pk
 6tjg==
X-Gm-Message-State: AOAM530nYtZ9czHCt7eCK0uW5qlewQfA0e4HiVi40xhUbhaR4MUlHJtw
 z2h1j3dTslWgO7xqnKlVeZ1GcYhrybVy94CRAOFCCtUEN5bCjliTWjlXQAaxbISUWdY7JRUGjEs
 tFf+K8gIsMXJBs7A=
X-Received: by 2002:a17:907:e8f:: with SMTP id
 ho15mr9994982ejc.481.1642407642095; 
 Mon, 17 Jan 2022 00:20:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaDnNtHkJZ5BCOdBoiHFxN/aMSncrPJI1TUq2Kx5MxJ1EmONCase1CC+AIBT/Oqgw0+F17GA==
X-Received: by 2002:a17:907:e8f:: with SMTP id
 ho15mr9994964ejc.481.1642407641905; 
 Mon, 17 Jan 2022 00:20:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:dd00:68a1:1bd:6733:bde9?
 (p200300cbc705dd0068a101bd6733bde9.dip0.t-ipconnect.de.
 [2003:cb:c705:dd00:68a1:1bd:6733:bde9])
 by smtp.gmail.com with ESMTPSA id gb4sm4149561ejc.90.2022.01.17.00.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:20:41 -0800 (PST)
Message-ID: <055d3a4e-521b-3f23-196a-40bdaeb96145@redhat.com>
Date: Mon, 17 Jan 2022 09:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 5/6] libvhost-user: prevent over-running max RAM slots
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>
References: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
 <20220117041050.19718-6-raphael.norwitz@nutanix.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220117041050.19718-6-raphael.norwitz@nutanix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
>  subprojects/libvhost-user/libvhost-user.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 3f4d7221ca..2a1fa00a44 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -705,6 +705,14 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>          return false;
>      }
>  
> +    if (dev->nregions == VHOST_USER_MAX_RAM_SLOTS) {
> +        close(vmsg->fds[0]);
> +        vu_panic(dev, "failing attempt to hot add memory via "
> +                      "VHOST_USER_ADD_MEM_REG message because the backend has "
> +                      "no free ram slots available");

Maybe simply "VHOST_USER_ADD_MEM_REG failed because there are no free
ram slots"

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



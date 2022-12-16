Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E83B64EC39
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:43:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AyS-000402-8y; Fri, 16 Dec 2022 08:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p6AyQ-0003zt-MV
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:42:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p6AyO-00053B-Mu
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671198119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JGdseyDfpfvPioAdvBFtWv3Ylrg5ySNb5qZS858OEqQ=;
 b=Et8HFP0iKtWJjli4t8xIJD1wq5hUdgFlmOahIpSubwI/+uRnfs77A7tA/Lud/Fh2A99uix
 NN9zyt+YPSzG5nXm6pp6b3EJNGIwEwFPzuDNztd+i8XxqzNs/KTSMgQh+PhdQxQzHCEj8I
 F/+FU2gCoRD11nvfMtCLW589ScjIzho=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-203-wATgH18JOnejB-pls76gUw-1; Fri, 16 Dec 2022 08:41:58 -0500
X-MC-Unique: wATgH18JOnejB-pls76gUw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so2588978wme.7
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 05:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JGdseyDfpfvPioAdvBFtWv3Ylrg5ySNb5qZS858OEqQ=;
 b=rMZM41UZjkjmCcswv16dRpBZEIxRotqADUz0m7/Hp8HcQtFZpUoG253CcZNk4NHoNi
 BDUAAmwheBRULrx90w61NxBlmiEvkDLIcpF33nUStRGyKrjUuBa1NOMGTQ8M6S49/mRl
 dpHhEax26N4m44jSn0VXSQKA5kSUfMXmgpsy93suNWphs/ItAyWfqdIG8/vCPXz9L//h
 3ee1620owYApRgBXYzhT41DfFTgJM9DVVVUSe+w8gOhRh6I2xss8ZPxW5H6M+R/UVB2r
 wD+CNSQdrIloP6GApPSvG9qUHxVr6FFrve4qUBS8wLkK9l9xxDVcOvvTZIuchTzVFSLG
 d4bw==
X-Gm-Message-State: ANoB5pm+xAM8oOZhAoA2Tlmsuo6aL06bz3bTnmd4NyLaMYBx0APPUZbe
 mxQgosuzl8uogQOGP49HV/gfXL0tQ4jbbtxbr2NS02YZqyGvRmFsQht8WCjMN5Tbo63NrzztBMp
 2Ykf8NRlmQEAobwI=
X-Received: by 2002:a05:600c:13c8:b0:3cf:69a5:3621 with SMTP id
 e8-20020a05600c13c800b003cf69a53621mr25523008wmg.41.1671198117262; 
 Fri, 16 Dec 2022 05:41:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7hJ81JfIUUUJ4FCRXs2Bg08rwCxHjju8DbacGH9C2OqPfSIX9xs3wg3C5GFUX7tFAWrJOUZQ==
X-Received: by 2002:a05:600c:13c8:b0:3cf:69a5:3621 with SMTP id
 e8-20020a05600c13c800b003cf69a53621mr25522991wmg.41.1671198116992; 
 Fri, 16 Dec 2022 05:41:56 -0800 (PST)
Received: from ?IPV6:2003:cb:c71c:3900:7211:d436:8d8b:531c?
 (p200300cbc71c39007211d4368d8b531c.dip0.t-ipconnect.de.
 [2003:cb:c71c:3900:7211:d436:8d8b:531c])
 by smtp.gmail.com with ESMTPSA id
 k62-20020a1ca141000000b003cf894dbc4fsm2645484wme.25.2022.12.16.05.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 05:41:56 -0800 (PST)
Message-ID: <f06e436f-223a-9318-d631-c9d5c711af1b@redhat.com>
Date: Fri, 16 Dec 2022 14:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] hostmem: Honor multiple preferred nodes if possible
Content-Language: en-US
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
Cc: imammedo@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com
References: <a0b4adce1af5bd2344c2218eb4a04b3ff7bcfdb4.1671097918.git.mprivozn@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <a0b4adce1af5bd2344c2218eb4a04b3ff7bcfdb4.1671097918.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15.12.22 10:55, Michal Privoznik wrote:
> If a memory-backend is configured with mode
> HOST_MEM_POLICY_PREFERRED then
> host_memory_backend_memory_complete() calls mbind() as:
> 
>    mbind(..., MPOL_PREFERRED, nodemask, ...);
> 
> Here, 'nodemask' is a bitmap of host NUMA nodes and corresponds
> to the .host-nodes attribute. Therefore, there can be multiple
> nodes specified. However, the documentation to MPOL_PREFERRED
> says:
> 
>    MPOL_PREFERRED
>      This mode sets the preferred node for allocation. ...
>      If nodemask specifies more than one node ID, the first node
>      in the mask will be selected as the preferred node.
> 
> Therefore, only the first node is honored and the rest is
> silently ignored. Well, with recent changes to the kernel and
> numactl we can do better.
> 
> The Linux kernel added in v5.15 via commit cfcaa66f8032
> ("mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY")
> support for MPOL_PREFERRED_MANY, which accepts multiple preferred
> NUMA nodes instead.
> 
> Then, numa_has_preferred_many() API was introduced to numactl
> (v2.0.15~26) allowing applications to query kernel support.
> 
> Wiring this all together, we can pass MPOL_PREFERRED_MANY to the
> mbind() call instead and stop ignoring multiple nodes, silently.
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---

[...]

> +#ifdef HAVE_NUMA_SET_PREFERRED_MANY
> +        if (mode == MPOL_PREFERRED && numa_has_preferred_many() > 0) {
> +            /*
> +             * Replace with MPOL_PREFERRED_MANY otherwise the mbind() below
> +             * silently picks the first node.
> +             */
> +            mode = MPOL_PREFERRED_MANY;
> +        }
> +#endif
> +


I was curios if we want to warn the user if "mode == 
MPOL_PREFERRED_MANY" and we were given more than one node.


Apart from that LGTM, thanks

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



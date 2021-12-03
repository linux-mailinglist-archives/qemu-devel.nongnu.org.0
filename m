Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E3D467D35
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 19:23:31 +0100 (CET)
Received: from localhost ([::1]:58060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtDDW-0007j9-K4
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 13:23:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mtDBa-0006ZM-LY
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 13:21:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mtDBY-0007MJ-Sd
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 13:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638555688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eI1nokn2NEJ2rkRDUCKon2gUX6h28FBSwD4gEKl1qJ4=;
 b=REmQnNrV+RAhtFdx+R86HgzZUVP51pPQlM9mQInOy4j1jPm45hmtOvggatk1fAxFXEWZfM
 iVOS6jUO3wI3D9e/DV5KkswZA0t5uy26gZR/gCRaLlxFoRE8iY9+MTw83dJs90LVanFHre
 8kYSkWJPLNTitgadyDv05q2grHC9JyM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-qXxd6n2LN-GpcwHEePRYNQ-1; Fri, 03 Dec 2021 13:21:25 -0500
X-MC-Unique: qXxd6n2LN-GpcwHEePRYNQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso1692182wms.5
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 10:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eI1nokn2NEJ2rkRDUCKon2gUX6h28FBSwD4gEKl1qJ4=;
 b=uWvi7z0H1WOWmOiADMprIANSdWUdXVvFogr1PD3xhPuQvQrst+nBVYr/xZMJEdw+MB
 Wtky1Lpg6pUtOAhrgVXxka8KIuj9peF+uCiSBx/EX7tFl1UjZCDukaEQ7PrlRzIw9bX7
 qE5myRGVMpX6kpmjhT5nAhbkjj246wK4PhZWn6Jrsu7YU9qoFrJNTijjua6b1dgvAnPz
 fj5AhuW1B2cxkCgcScn1EWS22Z7FdoPNKx55OQpuAMqVwSx22lxQ93FbU1nB0djWwjyU
 P4+b/uh2dTBeHSh055onrDE+aA+YfW2Hk/kFe779X4zZg4iuU82zU7npM2MbBWaiKome
 PtKA==
X-Gm-Message-State: AOAM533tUGKqWzCQxXIkgXD/FyMnd2qY2v/9SnwkllxoZubMWA2GcKNb
 vuVCyweX18fqwaza47EWMNP4EfwhbkXcxenjvBWDHGNzWC9VagoDalGvtBRweigxaWEAAg6g5eD
 VAlf5oH7Fpgd7bWE=
X-Received: by 2002:a1c:488:: with SMTP id 130mr17060874wme.157.1638555684070; 
 Fri, 03 Dec 2021 10:21:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzYx3yF79Ts7LgIa1DTsTOIRXhitXEgorodkNwLrmG9woiT88mX0fK98C0gVK5+DxgHJs+0A==
X-Received: by 2002:a1c:488:: with SMTP id 130mr17060835wme.157.1638555683833; 
 Fri, 03 Dec 2021 10:21:23 -0800 (PST)
Received: from ?IPV6:2003:d8:2f44:9200:3344:447e:353c:bf0b?
 (p200300d82f4492003344447e353cbf0b.dip0.t-ipconnect.de.
 [2003:d8:2f44:9200:3344:447e:353c:bf0b])
 by smtp.gmail.com with ESMTPSA id a10sm5907351wmq.27.2021.12.03.10.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 10:21:23 -0800 (PST)
Message-ID: <5cbbb142-2c77-435d-32a7-033dbf0995e6@redhat.com>
Date: Fri, 3 Dec 2021 19:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/4] s390x/pci: use a reserved ID for the default PCI group
To: Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-2-mjrosato@linux.ibm.com>
 <123ecaef-0f76-614c-2f6d-cdb824a84f56@redhat.com>
 <a5b6d5d7-e11a-9b7a-651f-feda4f2c3781@linux.ibm.com>
 <20211203000655.0c679c8c.pasic@linux.ibm.com>
 <bd39e782-0348-cf93-0d4e-0b1c0fc8cb8b@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <bd39e782-0348-cf93-0d4e-0b1c0fc8cb8b@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.938, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 richard.henderson@linaro.org, thuth@redhat.com, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.12.21 03:25, Matthew Rosato wrote:
> On 12/2/21 6:06 PM, Halil Pasic wrote:
>> On Thu, 2 Dec 2021 12:11:38 -0500
>> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
>>
>>>>
>>>> What happens if we migrate a VM from old to new QEMU? Won't the guest be
>>>> able to observe the change?
>>>>    
>>>
>>> Yes, technically --  But # itself is not really all that important, it
>>> is provided from CLP Q PCI FN to be subsequently used as input into Q
>>> PCI FNGRP -- With the fundamental notion being that all functions that
>>> share the same group # share the same group CLP info.  Whether the
>>> number is, say, 1 or 5 doesn't matter so much.
>>>
>>> However..  0xF0 and greater are the only values reserved for hypervisor
>>> use.  By using 0x20 we run the risk of accidentally conflating simulated
>>> devices and real hardware, hence the desire to change it.
>>>
>>> Is your concern about a migrated guest with a virtio device trying to do
>>> a CLP QUERY PCI FNGRP using 0x20 on a new QEMU?  I suppose we could
>>> modify 'clp_service_call, case CLP_QUERY_PCI_FNGRP' to silently catch
>>> simulated devices trying to use something other than the default group,
>>> e.g.:
>>>
>>> if ((pbdev->fh & FH_SHM_EMUL) &&
>>>       (pbdev->zpci_fn.pfgid != ZPCI_DEFAULT_FN_GRP)) {
>>>           /* Simulated device MUST have default group */
>>> 	pbdev->zpci_fn.pfgid = ZPCI_DEFAULT_FN_GRP;
>>> 	group = s390_group_find(ZPCI_DEFAULT_FN_GRP);
>>> }
>>>
>>> What do you think?
>>
>> Another option, and in my opinion the cleaner one would be to tie this
>> change to a new machine version. That is if a post-change qemu is used
>> in compatibility mode, we would still have the old behavior.
>>
>> What do you think?
>>
> 
> The problem there is that the old behavior goes against the architecture 
> (group 0x20 could belong to real hardware) and AFAIU assigning this new 
> behavior only to a new machine version means we can't fix old stable 
> QEMU versions.
> 
> Also, wait a minute -- migration isn't even an option right now, it's 
> blocked for zpci devices, both passthrough and simulated (see 
> aede5d5dfc5f 's390x/pci: mark zpci devices as unmigratable') so I say 
> let's just move to a proper default group now before we potentially 
> allow migration later.

Perfect, thanks for confirming!


-- 
Thanks,

David / dhildenb



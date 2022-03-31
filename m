Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D36D4EDEC8
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 18:27:17 +0200 (CEST)
Received: from localhost ([::1]:39320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZxdk-00026a-8V
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 12:27:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZxcp-0001Ra-Tc
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 12:26:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZxcm-0003l4-Ix
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 12:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648743975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDMFpLr+kany/n30UR1OU86h5jdA3rsQgX4WuhbwekQ=;
 b=Sq3FSOLsyetdbm77CQVD/uU6V755om5pfi+H1fKO1jpHAxBSf3ukwtkm5ACbfrCII4PWB/
 6JQR4fxAhovXI77nf8NgzhpCgJ839Wtox0q8Lb852Ftg/gYgQH3CwEIjXTRSG69FPu4BTZ
 1mNCdm+P/RbCYcApb7AuYDDgWJiwlUo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-J4xPf9yEObmcIrWfwX5PFg-1; Thu, 31 Mar 2022 12:26:14 -0400
X-MC-Unique: J4xPf9yEObmcIrWfwX5PFg-1
Received: by mail-wm1-f72.google.com with SMTP id
 f19-20020a7bcd13000000b0038c01defd5aso1360149wmj.7
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 09:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pDMFpLr+kany/n30UR1OU86h5jdA3rsQgX4WuhbwekQ=;
 b=rlptTk1hsCKoz6qdFl9NQiy6K+yb4Fu2AThUGIACFXRfzucXJ2sDLAOiRN1qbyOdEg
 dGm00yARwOBkvSnEK6YTYJcR2fbo7eT3aHY/DvioGwlrEEY+gndOcaUTxnKCAtI7bpke
 8fbboWvs1spuk2iTEJgPALeXqptLNsgiFG/eyo5jmHZFxwnkwFkeXbmY+X4asq2PvZRF
 sA/x9laO8RJhTWaMq7ctgxR1ToPLaD2g2gnkXpsgkV/Z0L+9MwUilxdoT3fQVLvqriAu
 uRple8rcafEglMnw+F9KVW+tiu6c+9G6DU7OVrNVBdLfFOEcI291dGmjrhqb4WYlMwH0
 8/gQ==
X-Gm-Message-State: AOAM530xe08DhfONaaaW6LcQxAWoPyW7uMi3oFe79U04em9/Ua/IM+25
 dwb+7Mtvz9/mvYY88QzMsHKCNX3WqrvISNZp94n32MD6u5c0j9OYCYgSCUY8leRPQjaaE0hftyh
 WFE1qpyDbNF/rKE8=
X-Received: by 2002:a05:6000:136a:b0:204:539:10c5 with SMTP id
 q10-20020a056000136a00b00204053910c5mr4753188wrz.393.1648743972708; 
 Thu, 31 Mar 2022 09:26:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyBSKzLbO9ATE6E5jgxeRN891siOAXtaUvjyOs/Z6aBVdMfbzHGfWwBDOm6LT9sYPVocECkg==
X-Received: by 2002:a05:6000:136a:b0:204:539:10c5 with SMTP id
 q10-20020a056000136a00b00204053910c5mr4753155wrz.393.1648743972297; 
 Thu, 31 Mar 2022 09:26:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:ac00:381c:2e8b:3b48:488e?
 (p200300cbc707ac00381c2e8b3b48488e.dip0.t-ipconnect.de.
 [2003:cb:c707:ac00:381c:2e8b:3b48:488e])
 by smtp.gmail.com with ESMTPSA id
 n2-20020adfb742000000b00205eda3b3c1sm1459691wre.34.2022.03.31.09.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 09:26:11 -0700 (PDT)
Message-ID: <5e7f2b0e-6aa9-3539-7a90-4e62782d6b84@redhat.com>
Date: Thu, 31 Mar 2022 18:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] softmmu/physmem: fix dirty memory bitmap memleak
To: Peter Xu <peterx@redhat.com>
References: <20220325154013.16809-1-arbn@yandex-team.com>
 <20220325154013.16809-2-arbn@yandex-team.com>
 <3888d585-c090-24b4-3be9-7be3f03ddadb@redhat.com>
 <YkWeQ26lKa3jFLU2@xz-m1.local>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YkWeQ26lKa3jFLU2@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-stable@nongnu.org,
 Andrey Ryabinin <arbn@yandex-team.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31.03.22 14:27, Peter Xu wrote:
> On Thu, Mar 31, 2022 at 10:37:39AM +0200, David Hildenbrand wrote:
>> On 25.03.22 16:40, Andrey Ryabinin wrote:
>>> The sequence of ram_block_add()/qemu_ram_free()/ram_block_add()
>>> function calls leads to leaking some memory.
>>>
>>> ram_block_add() calls dirty_memory_extend() to allocate bitmap blocks
>>> for new memory. These blocks only grow but never shrink. So the
>>> qemu_ram_free() restores RAM size back to it's original stat but
>>> doesn't touch dirty memory bitmaps.
>>>
>>> After qemu_ram_free() there is no way of knowing that we have
>>> allocated dirty memory bitmaps beyond current RAM size.
>>> So the next ram_block_add() will call dirty_memory_extend() again to
>>> to allocate new bitmaps and rewrite pointers to bitmaps left after
>>> the first ram_block_add()/dirty_memory_extend() calls.
>>>
>>> Rework dirty_memory_extend() to be able to shrink dirty maps,
>>> also rename it to dirty_memory_resize(). And fix the leak by
>>> shrinking dirty memory maps on qemu_ram_free() if needed.
>>>
>>> Fixes: 5b82b703b69a ("memory: RCU ram_list.dirty_memory[] for safe RAM hotplug")
>>> Cc: qemu-stable@nongnu.org
>>> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
>>
>> I looked at this a while ago and I think the problem is more involved,
>> because we might actually generate holes for which we can free the
>> bitmap. I think this patch impoves the situation, though.
>>
>>
>> IIRC if you hotplug two dimms and then hotunplug only the latter, the
> 
> I assume you meant "former"? :)

I remember it would have to be the one "plugged first" :)

> 
>> bitmap for the first dimm will remain as long as the second dimm isn't
>> hotunplugged.
> 
> IMHO it's fine to keep the dirty block for the unplugged hole.  It'll be
> better if we could free it, but we can fix the memory leak first which
> seems to be more severe.  The dirty memory isn't extremely large (32K ratio
> to mem size) if just to be kept idle, but frequent plug/unplug will leak
> infinite host mem.

Oh, I see, thanks for clarifying.


-- 
Thanks,

David / dhildenb



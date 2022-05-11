Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27380523036
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 12:04:48 +0200 (CEST)
Received: from localhost ([::1]:43294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nojD5-0002rZ-9Z
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 06:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nojBv-0002AZ-G7
 for qemu-devel@nongnu.org; Wed, 11 May 2022 06:03:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nojBq-0005vy-UI
 for qemu-devel@nongnu.org; Wed, 11 May 2022 06:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652263409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tK3exz3q5KlM4JN6VLRPiRAkAcpjfL/u+sfFoOEHCk8=;
 b=ZCA/cGM9sszun9rfT78Q677pZvzoD+YvNBdUaxcUQ8Juv2DIYhiL/t1X4jYISbEbLu+0rz
 NhY3GEolDnC3iSpAO1AqlGqoXTrRG5vjqQtmMZ+aXaXJgAHEOBLIdvLScKueTA3t9Mtsv8
 KuDtIsAfpUrIYGA5RVfG8KzZB1YeN+Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-y9gfU149MWeAzHmH3JCfIA-1; Wed, 11 May 2022 06:03:28 -0400
X-MC-Unique: y9gfU149MWeAzHmH3JCfIA-1
Received: by mail-wr1-f70.google.com with SMTP id
 u11-20020a056000038b00b0020c9ea8b64fso652330wrf.2
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 03:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=tK3exz3q5KlM4JN6VLRPiRAkAcpjfL/u+sfFoOEHCk8=;
 b=XS2JPBi68qRUoxnp5IoanvISisLfJRi2J9jdjaC0J5D2r1fbO7JLQJn488TrCFG/Il
 9TPtQTZfLvbz5RmjTp/fec9V3iaj0OK+ki4mSpDK5dyZpd4mazE3rjlaCqC2vLvlGujy
 5/g7BbwbjlyEcpLpuuiUGUlIlmfoBaTg+lQZr+J4PgRMMXq2LQRTfsiUflRmestBzaP2
 UASo3V5S4gMezhTyq4jLUxzVI2D8pd9JC2bBekAf0v+3D1rv3D1He+f5JoEbyL8hT8JD
 5Q+TQCLrbLJgLc0vSJsU2Jy7gFbdmpsaPDnWswFRZCT1AgOSZuRVW35xjPoLqk9KMXbf
 q5gw==
X-Gm-Message-State: AOAM530itx53/awB9FO1UKpauV/yzgb+XPFbipW1qo3kFQjJqKY9GQ08
 hJfO6J/JFWisCdBL3dJr1HciGI1nJ3zxOB1erlg4FSAZP2+nSxvjsi4/yPG+WtoqzcMCEmrpX36
 KTUmFj1i6WSgx1dw=
X-Received: by 2002:adf:cc81:0:b0:20c:df10:6c5d with SMTP id
 p1-20020adfcc81000000b0020cdf106c5dmr1471251wrj.312.1652263406821; 
 Wed, 11 May 2022 03:03:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn8awUmeKtnXVVGH4iTpELQPnrT/giLligxPsBJjG9pS2VaLBlOBQ2cSBYPSObFfll0P52YQ==
X-Received: by 2002:adf:cc81:0:b0:20c:df10:6c5d with SMTP id
 p1-20020adfcc81000000b0020cdf106c5dmr1471215wrj.312.1652263406462; 
 Wed, 11 May 2022 03:03:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:700:2393:b0f4:ef08:bd51?
 (p200300cbc70107002393b0f4ef08bd51.dip0.t-ipconnect.de.
 [2003:cb:c701:700:2393:b0f4:ef08:bd51])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a7bc056000000b003945cdd0d55sm1640627wmc.26.2022.05.11.03.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 03:03:25 -0700 (PDT)
Message-ID: <a11ca582-3d17-b064-6736-bd66ed5a5ec4@redhat.com>
Date: Wed, 11 May 2022 12:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <Ynt/v2SHmnO2afg4@redhat.com>
 <8a6b84ed-50bc-8f6e-4b71-7e15247c4ac0@redhat.com>
 <YnuDONrdbMcJT08p@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] util: NUMA aware memory preallocation
In-Reply-To: <YnuDONrdbMcJT08p@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.05.22 11:34, Daniel P. Berrangé wrote:
> On Wed, May 11, 2022 at 11:31:23AM +0200, David Hildenbrand wrote:
>>>> Long story short, management application has no way of learning
>>>> TIDs of allocator threads so it can't make them run NUMA aware.
>>>
>>> This feels like the key issue. The preallocation threads are
>>> invisible to libvirt, regardless of whether we're doing coldplug
>>> or hotplug of memory-backends. Indeed the threads are invisible
>>> to all of QEMU, except the memory backend code.
>>>
>>> Conceptually we need 1 or more explicit worker threads, that we
>>> can assign CPU affinity to, and then QEMU can place jobs on them.
>>> I/O threads serve this role, but limited to blockdev work. We
>>> need a generalization of I/O threads, for arbitrary jobs that
>>> QEMU might want to farm out to specific numa nodes.
>>
>> At least the "-object iothread" thingy can already be used for actions
>> outside of blockdev. virtio-balloon uses one for free page hinting.
> 
> Ah that's good to know, so my idea probably isn't so much work as
> I thought it might be.

I guess we'd have to create a bunch of iothreads on the command line and
then feed them as an array to the memory backend we want to create. We
could then forward the threads to a new variant of os_mem_prealloc().

We could

a) Allocate new iothreads for each memory backend we create. Hm, that
might be suboptimal, we could end up with many iothreads.

b) Reuse iothreads and have separate sets of iothreads per NUMA node.
Assign them to a node once.

c) Reuse iothreads and reassign them to NUMA nodes on demand.

However, I'm not sure what the semantics are when having multiple
backends referencing the iothreads ...


Regarding c) and alternative  I raised is that we could simply
preallocate the threads in QEMU internally on machine creation, and let
libvirt reassign them to the fitting NUMA node whenever
coldplugging/hotplugging a new memory backend.

-- 
Thanks,

David / dhildenb



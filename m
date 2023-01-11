Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D166572B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:17:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFXDw-0006sq-8T; Wed, 11 Jan 2023 04:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFXDu-0006sS-UD
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:16:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFXDs-0003Fx-Tr
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673428600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8dNhrY97yX+x1fnhZAkDchwfhUj2Oj4Bemjjtr6Vi8=;
 b=OnOIegRnJF7YN6Ji0Hk4I+aEQWp3T19G+0fksBuzfAtMiGjfkIKPl/D2O299gPTP3hcRWh
 b2fgML2lS4JSA7PMsxNPGL1IjFf4M7DAcbZA7uSXMUfjjZ449Kr33ql/GG2lI8AkJbAviI
 Ex3rmB+mvm3eFsaCeBiYYs5oJMnoNYg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-XK-sSOn3No2itwGC8c7ODw-1; Wed, 11 Jan 2023 04:16:38 -0500
X-MC-Unique: XK-sSOn3No2itwGC8c7ODw-1
Received: by mail-qv1-f69.google.com with SMTP id
 lp10-20020a056214590a00b0053180ee70f1so8150676qvb.13
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 01:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x8dNhrY97yX+x1fnhZAkDchwfhUj2Oj4Bemjjtr6Vi8=;
 b=Z7k/8XO7ZBbqGvk6BPaAzIDeJZAw7t6iWivAgIQJhzPZoIamZDS8MtV0a10go+n2tA
 UJ/11RGcMqunM0ruCKmudPFcsaG4OSNsF1f9YtW1H9qyI6timxoCyKlv7fzy2m6cOtOq
 dAYzJU25YOIeLE3r0y/l1MX7n9N/jtfQswEDr179cHE4VT5GeUF6/0u4fsz6Q4C7n+5T
 cgRM6pxI4bFICqhdAn1FAtk9JSovs8LSJwIX75K/dIezZatrOv2lTulorFxb4Q0rWQiP
 +GsYlyO1PAlsVddKhTkiZrBDmM/UvJzIr1zqkjIPuf0MY9ha6foGICJAKO3ZcrtUPwZk
 Uzbw==
X-Gm-Message-State: AFqh2kqV5lYqqUwdHhf1qdMdh+StpJnS9/DvlWVIixtKCEivZOiPvHXs
 4rj0gqJW4ONmI70Rs+IhN6AoVBOhIhn8YaxPf/9Oof6X8hk+lrGSpVf5I8ojT0/SxmZ4egwCbOH
 ESdzTWNXGLR7kJN4=
X-Received: by 2002:ac8:5297:0:b0:3a6:9cfa:d6c with SMTP id
 s23-20020ac85297000000b003a69cfa0d6cmr9009464qtn.39.1673428598389; 
 Wed, 11 Jan 2023 01:16:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv5fnEsMJF1NKHSnO+BBKktJJGt7xKEAuvJMY+2Do2GVgP4tAOoueOR2lkjpyMU3afKhso4xw==
X-Received: by 2002:ac8:5297:0:b0:3a6:9cfa:d6c with SMTP id
 s23-20020ac85297000000b003a69cfa0d6cmr9009435qtn.39.1673428598160; 
 Wed, 11 Jan 2023 01:16:38 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-91.web.vodafone.de.
 [109.43.176.91]) by smtp.gmail.com with ESMTPSA id
 c8-20020ac80548000000b003972790deb9sm7261933qth.84.2023.01.11.01.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 01:16:37 -0800 (PST)
Message-ID: <95388069-d23c-cb21-4f86-403b371da497@redhat.com>
Date: Wed, 11 Jan 2023 10:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 03/11] target/s390x/cpu topology: handle STSI(15) and
 build the SYSIB
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-4-pmorel@linux.ibm.com>
 <5cf19913-b2d7-d72d-4332-27aa484f72e4@redhat.com>
In-Reply-To: <5cf19913-b2d7-d72d-4332-27aa484f72e4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 10/01/2023 15.29, Thomas Huth wrote:
> On 05/01/2023 15.53, Pierre Morel wrote:
>> On interception of STSI(15.1.x) the System Information Block
>> (SYSIB) is built from the list of pre-ordered topology entries.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
...
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
>> +{
>> +    union {
>> +        char place_holder[S390_TOPOLOGY_SYSIB_SIZE];
>> +        SysIB_151x sysib;
>> +    } buffer QEMU_ALIGNED(8) = {};
>> +    int len;
>> +
>> +    if (!s390_has_topology() || sel2 < 2 || sel2 > 
>> SCLP_READ_SCP_INFO_MNEST) {
>> +        setcc(cpu, 3);
>> +        return;
>> +    }
>> +
>> +    len = setup_stsi(cpu, &buffer.sysib, sel2);
>> +
>> +    if (len > 4096) {
> 
> Maybe use TARGET_PAGE_SIZE instead of 4096 ?
> 
>> +        setcc(cpu, 3);
>> +        return;
>> +    }
>> +
>> +    buffer.sysib.length = cpu_to_be16(len);
>> +    s390_cpu_virt_mem_write(cpu, addr, ar, &buffer.sysib, len);
> 
> Is this supposed to work with protected guests, too? If so, I think you 
> likely need to use s390_cpu_pv_mem_write() for protected guests?

I now saw in a later patch that the topology feature gets disabled for 
protected guests - so never mind, please ignore my question here.

  Thomas



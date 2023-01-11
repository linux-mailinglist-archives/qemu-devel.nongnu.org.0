Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB4665CEA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 14:49:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFbSu-0004ED-OJ; Wed, 11 Jan 2023 08:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFbSi-00047b-K6
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:48:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFbSg-0006E4-OP
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673444893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1PHgaFgb60kwMxut3qPpI4HuoDds1SICvW4hp9F+fo=;
 b=C/0gkSkeFGJu9LRAeDS4dqwI5E1VJU9nNnRW3fu0alKy47xyUjWrXi/pH+N2sHYaCk50xU
 mNm1Rcn3MoGztW6+Fams10H21KRyPpZLPmoOfGoLJ4w+gYwMaWL3oWRNvfWPDIQRqZ4qmC
 QEhXkFtsRdhzXiGXBdQpF+YiElwABn8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-BqDFpA3-OuK6oxcceyr7Aw-1; Wed, 11 Jan 2023 08:48:12 -0500
X-MC-Unique: BqDFpA3-OuK6oxcceyr7Aw-1
Received: by mail-wr1-f72.google.com with SMTP id
 u15-20020adfa18f000000b002b129dc55bfso2719413wru.11
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 05:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :content-language:references:cc:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1PHgaFgb60kwMxut3qPpI4HuoDds1SICvW4hp9F+fo=;
 b=ePJa55iM68qpBaGg1j4DtzzH1G2RdNvB2Fw8LU0Q6ZQJHXBV/96ALuLagEWwSUpAWE
 HMQgij0JCMQW2mEq90GShOvXS794HEUtUBbQe/eXFuxP57ZYsTxJr96hNZJntpQejukE
 W1qaKpUw5emzuEYJkPJXuz2fNszxug3rcWB/flrMOJdzkoLSZTkPrW9Acq7iuhDjX0Bu
 LGsX95jzUkHpQWy8UcO7EqygLJsGays5coPaFQ19q+ioLGsocCVzBDZjozPnBE40ZawG
 SW8Wd+uh9aAy0CIEk6cxETuZHmqD5RuR4gDJgwb5EQvqMaBTasgSndeUQ75kS8/HE2tk
 tjXg==
X-Gm-Message-State: AFqh2kojZwutAEplOJk6OjBViXnTmAvmEgyUdZAFLt4WYV3gCzXdm77d
 sCbqf2lJcOm1WYsKL2bVhUjBiGoH1pmO+fDKwhSH21x/ckefrHluoz2ipkOBhvHG4IZtc3cAvZf
 KWb3QwPQrJgeNPE4=
X-Received: by 2002:a05:600c:1d20:b0:3d2:2aaf:316 with SMTP id
 l32-20020a05600c1d2000b003d22aaf0316mr52764395wms.36.1673444891104; 
 Wed, 11 Jan 2023 05:48:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuiuNJbg1r2igM2r77QzXp9e/ojRBD4sIgHgO01JtvQQuNEXAwhbUUJPBoEYKGoGNnuz8jIsA==
X-Received: by 2002:a05:600c:1d20:b0:3d2:2aaf:316 with SMTP id
 l32-20020a05600c1d2000b003d22aaf0316mr52764384wms.36.1673444890817; 
 Wed, 11 Jan 2023 05:48:10 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:5b00:5b3c:db46:8eb5:ee24?
 (p200300cbc7045b005b3cdb468eb5ee24.dip0.t-ipconnect.de.
 [2003:cb:c704:5b00:5b3c:db46:8eb5:ee24])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003cfa80443a0sm21071102wms.35.2023.01.11.05.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 05:48:10 -0800 (PST)
Message-ID: <fbde8341-660b-0ed1-4f74-0afe565d5be5@redhat.com>
Date: Wed, 11 Jan 2023 14:48:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com> <Y7W2LtO5/m1r3VaL@x1n>
 <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com> <Y7cFplyGc4hIrYZW@x1n>
 <482fadb5-7420-e07b-982d-5b0f3e8c42f8@redhat.com> <Y7xw4RqLQUFWZyfI@x1n>
 <460b6ea0-67a6-891f-f8fb-a5f23e9985c4@redhat.com>
 <c6a66296-94a7-e1ef-e0c1-098071f961d2@redhat.com> <Y73Er/n86CgQTMYu@x1n>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
In-Reply-To: <Y73Er/n86CgQTMYu@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 10.01.23 21:03, Peter Xu wrote:
> On Tue, Jan 10, 2023 at 12:52:32PM +0100, David Hildenbrand wrote:
>> The following seems to work,
> 
> That looks much better at least from the diffstat pov (comparing to the
> existing patch 1+5 and the framework changes), thanks.
> 
>> but makes analyze-migration.py angry:
>>
>> $ ./scripts/analyze-migration.py -f STATEFILE
>> Traceback (most recent call last):
>>    File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 605, in <module>
>>      dump.read(dump_memory = args.memory)
>>    File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 539, in read
>>      classdesc = self.section_classes[section_key]
>>                  ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^
>> KeyError: ('0000:00:03.0/virtio-mem-early', 0)
>>
>>
>> We need the vmdesc to create info for the device.
> 
> Migration may ignore the save entry if save_state() not provided in the
> "devices" section:
> 
>          if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
>              continue;
>          }
> 
> Could you try providing a shim save_state() for the new virtio-mem save
> entry?
> 
> /*
>   * Shim function to make sure the save entry will be dumped into "devices"
>   * section, to make analyze-migration.py happy.
>   */
> static void virtio_mem_save_state_early(QEMUFile *file, void *opaque)
> {
> }
> 
> Then:
> 
> static const SaveVMHandlers vmstate_virtio_mem_device_early_ops = {
>      .save_setup = virtio_mem_save_setup_early,
>      .save_state = virtio_mem_save_state_early,
>      .load_state = virtio_mem_load_state_early,
> };
> 
> I'm not 100% sure it'll work yet, but maybe worth trying.

It doesn't. virtio_mem_load_state_early() will get called twice (once 
with state saved during save_setup() and once with effectively nothing 
during save_state(), which breaks the whole migration).

vmdesc handling is also wrong, because analyze-migration.py gets 
confused because it receives data stored during save_setup() but vmdesc 
created during save_state() was told that there would be "nothing" to 
interpret ...

$ ./scripts/analyze-migration.py -f STATEFILE
{
     "ram (2)": {
         "section sizes": {
             "0000:00:03.0/mem0": "0x0000000f00000000",
             "pc.ram": "0x0000000100000000",
             "/rom@etc/acpi/tables": "0x0000000000020000",
             "pc.bios": "0x0000000000040000",
             "0000:00:02.0/e1000.rom": "0x0000000000040000",
             "pc.rom": "0x0000000000020000",
             "/rom@etc/table-loader": "0x0000000000001000",
             "/rom@etc/acpi/rsdp": "0x0000000000001000"
         }
     },
     "0000:00:03.0/virtio-mem-early (51)": {
         "data": ""
     }
}


Not sure if the whole thing becomes nicer when manually looking up the 
vmdesc ... because filling it will also requires manually storing the 
se->idstr and the se->instance_id, whereby both are migration-internal 
and not available inside save_setup().


Hm, I really prefer something like the simplified version that let's 
migration core deal with vmstate to be migrated during save_setup() 
phase. We could avoid the vmstate->immutable flag and simply use a 
separate function for registering the vmstate, like:

vmstate_register_immutable()
vmstate_register_early()
...

-- 
Thanks,

David / dhildenb



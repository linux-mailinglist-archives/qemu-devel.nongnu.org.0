Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FEF2CD4AD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:38:35 +0100 (CET)
Received: from localhost ([::1]:60510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmwU-0003Wz-VG
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkmv2-0002nc-Nx
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:37:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkmv0-0007wl-7e
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606995421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/MDNuwUgSMfE18vt+E7Vx/NwIDBnN+570UT7Fc48TE=;
 b=TxiHyArEUG/+XxxGSVjg+MW/gK+I271d+7sXij7pzLARYn/KC+xFikYiE1DNN159RhqRTv
 RdAC7Q0I2zPxoQ6ObtFo9p+f3/ftPuaFQwHZwRXlo2+xfPw49K6lm+1G87AdAUIs2CxEm3
 qVLTiLnlHhkHOyiV1z95wCwiFJBI6z0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-EAgJXUqLOs-xKwkG6-GCDQ-1; Thu, 03 Dec 2020 06:36:58 -0500
X-MC-Unique: EAgJXUqLOs-xKwkG6-GCDQ-1
Received: by mail-wm1-f69.google.com with SMTP id r5so1414781wma.2
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 03:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r/MDNuwUgSMfE18vt+E7Vx/NwIDBnN+570UT7Fc48TE=;
 b=sZDP6aYsX8060xD5uzfTWPLLtb6iMSpkRDm8pFeNi1hiHK7NneNvQDeaVvDFg2vsv9
 RXyrOkS+h0sQwHE2EUtLtJlzy96qja19IEjem8ELOxZhOwa9qqB4lNhfVuk4P8PHTM9T
 VrvWbCKAuHioPIDsE05bmLtR2ZjkE94EL8wfTFZC7yYSb0n3nmmZ5pmkrW1ITHAzhKxg
 PnjMKuIEeX0wlbDaJ37/P1KlN8IAWck7rTzUvQyBbSPfWtUTOpVhtlp9UKZMplvV+Ev+
 GlRv1vMbCXpLbIEYro4fD05iHU6tXjECPtg+rDpRVHK4LyowuTb67CQ1aUivJVJaM++n
 Hg4g==
X-Gm-Message-State: AOAM530AevUpjFs3oopyAkN+I79S32YaDFms/hulbyX9qPZ6AthvfF8L
 tHxIE4I2RWvhCNtfcsxEFQGXBZi0iiMKfh+lqdKHFR0/Nt+wPZfHgmHN1FlOmZ2nBTKnOKYcxyF
 EOu8dT3qL2hk8+wE=
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr2920358wmm.42.1606995417278; 
 Thu, 03 Dec 2020 03:36:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyV9VmR2w/qjThaQJ3Wy0gN8WZt/rkwshfv6z0RoRrQWbVR9RUc3cLjbOcmESIMZ5QlKZnmYw==
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr2920334wmm.42.1606995417029; 
 Thu, 03 Dec 2020 03:36:57 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id n123sm1229681wmn.7.2020.12.03.03.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 03:36:56 -0800 (PST)
Subject: Re: [PATCH v2 2/4] hw/scsi/megasas: Assert cdb_len is valid in
 megasas_handle_scsi()
To: Li Qiang <liq3ea@gmail.com>
References: <20201201191026.4149955-1-philmd@redhat.com>
 <20201201191026.4149955-3-philmd@redhat.com>
 <CAKXe6SLWrP=Jg3mvasx1yF7wHJ1vvpR6+dVHqL4UM+_odbfkTg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3cdd898b-45db-eb58-2606-fad6c218c238@redhat.com>
Date: Thu, 3 Dec 2020 12:36:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAKXe6SLWrP=Jg3mvasx1yF7wHJ1vvpR6+dVHqL4UM+_odbfkTg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Hannes Reinecke <hare@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Li,

On 12/3/20 12:21 PM, Li Qiang wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> 于2020年12月2日周三 上午3:13写道：
>>
>> cdb_len can not be zero... (or less than 6) here, else we have a
>> out-of-bound read first in scsi_cdb_length():
>>
>>  71 int scsi_cdb_length(uint8_t *buf)
>>  72 {
>>  73     int cdb_len;
>>  74
>>  75     switch (buf[0] >> 5) {
> 
> Hi Philippe,
> 
> Here I not read the spec.

Neither did I...

> Just guest from your patch, this 'buf[0]>>5'
> indicates/related with the cdb length, right?

This is my understanding too.

> So here(this patch) you  just want to ensure the 'buf[0]>>5' and the
> 'cdb_len' is consistent.
> 
> But I don't  think here is a 'out-of-bound' read issue.
> 
> 
> The 'buf' is from here 'cdb'.
> static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
>                                int frame_cmd)
> {
> 
>     cdb = cmd->frame->pass.cdb;
> 
> 'cmd->frame->pass.cdb' is an array in heap and  its data is mmaped
> from the guest.
> 
> The guest can put any data in 'pass.cdb' which 'buf[0]>>5' can be 0 or
> less than 6.
> 
> So every read of this 'pass.cdb'[0~15] is valid. Not an oob.

OK maybe not OOB but infoleak?

>>  76     case 0:
>>  77         cdb_len = 6;
>>  78         break;
>>
>> Then another out-of-bound read when the size returned by
>> scsi_cdb_length() is used.
> 
> Where is this?

IIRC scsi_req_parse_cdb().

> 
> So I think your intention is to ensure  'cdb_len' is consistent with
> 'cdb[0]>>5'.
> 
> Please correct me if I'm wrong.

I'll recheck and go back to you during January.

Regards,

Phil.

>>
>> Figured out after reviewing:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg757937.html
>>
>> And reproduced fuzzing:
>>
>>   qemu-fuzz-i386: hw/scsi/megasas.c:1679: int megasas_handle_scsi(MegasasState *, MegasasCmd *, int):
>>   Assertion `len > 0 && cdb_len >= len' failed.
>>   ==1689590== ERROR: libFuzzer: deadly signal
>>       #8 0x7f7a5d918e75 in __assert_fail (/lib64/libc.so.6+0x34e75)
>>       #9 0x55a1b95cf6d4 in megasas_handle_scsi hw/scsi/megasas.c:1679:5
>>       #10 0x55a1b95cf6d4 in megasas_handle_frame hw/scsi/megasas.c:1975:24
>>       #11 0x55a1b95cf6d4 in megasas_mmio_write hw/scsi/megasas.c:2132:9
>>       #12 0x55a1b981972e in memory_region_write_accessor softmmu/memory.c:491:5
>>       #13 0x55a1b981972e in access_with_adjusted_size softmmu/memory.c:552:18
>>       #14 0x55a1b981972e in memory_region_dispatch_write softmmu/memory.c:1501:16
>>       #15 0x55a1b97f0ab0 in flatview_write_continue softmmu/physmem.c:2759:23
>>       #16 0x55a1b97ec3f2 in flatview_write softmmu/physmem.c:2799:14
>>       #17 0x55a1b97ec3f2 in address_space_write softmmu/physmem.c:2891:18
>>       #18 0x55a1b985c7cd in cpu_outw softmmu/ioport.c:70:5
>>       #19 0x55a1b99577ac in qtest_process_command softmmu/qtest.c:481:13
>>
>> Inspired-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
>> Inspired-by: Alexander Bulekov <alxndr@bu.edu>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/scsi/megasas.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
>> index 1a5fc5857db..f5ad4425b5b 100644
>> --- a/hw/scsi/megasas.c
>> +++ b/hw/scsi/megasas.c
>> @@ -1667,6 +1667,7 @@ static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
>>  {
>>      uint8_t *cdb;
>>      int target_id, lun_id, cdb_len;
>> +    int len = -1;
>>      bool is_write;
>>      struct SCSIDevice *sdev = NULL;
>>      bool is_logical = (frame_cmd == MFI_CMD_LD_SCSI_IO);
>> @@ -1676,6 +1677,10 @@ static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
>>      lun_id = cmd->frame->header.lun_id;
>>      cdb_len = cmd->frame->header.cdb_len;
>>
>> +    if (cdb_len > 0) {
>> +        len = scsi_cdb_length(cdb);
>> +    }
>> +    assert(len > 0 && cdb_len >= len);
>>      if (is_logical) {
>>          if (target_id >= MFI_MAX_LD || lun_id != 0) {
>>              trace_megasas_scsi_target_not_present(
>> --
>> 2.26.2
>>
>>
> 



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BABE2ABB66
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 14:28:41 +0100 (CET)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc7Dr-0000w9-W7
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 08:28:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc7CC-0000Ta-PH
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 08:26:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc7C9-0004cg-UC
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 08:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604928412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ag7oBlKYFknlFtyMDapDRau+VcLbKsk08trc+vZzEU0=;
 b=OMeQLIQfz+q+GPQWyCjkghHoa/ZcUna6hZt7M8hCVttsg3p70sx3p22BLVuricD6ZkKkS2
 zCHQe1CNc9hGhkAv51oMzWU5LN3tPboMbJKCFlnu5HfUaBHcN3ETBTnPFuZd8kJh9EviIE
 EoOqw4wCWHp4sXwS6NXC4YPAY8rUvHY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-rIcqEO16MIy6Rmdle9TVPA-1; Mon, 09 Nov 2020 08:26:50 -0500
X-MC-Unique: rIcqEO16MIy6Rmdle9TVPA-1
Received: by mail-wr1-f71.google.com with SMTP id i1so4310392wrb.18
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 05:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ag7oBlKYFknlFtyMDapDRau+VcLbKsk08trc+vZzEU0=;
 b=hILZhDmxGTMN3ucMsJPBsPzjKdC2rlUUAqphqIuwexqYFlSIw8/VdKGryeAsJbn8cU
 hO/DT9D91/rdIvOuzywGy/+OSamnf4iyBAMztqtVm0UEBr7+xrguomz66YgV3gSjFALe
 Vmqtsp3ExenD+mmSiMm8slDjdLyXG8D5LNds7Vum5oZ7n5/KBTaglEOEnxPgOWwrQ0Lq
 A2IpOuVpYmn8nLkURJKBtAqCdcso4uD/o1GuL39ZzKI04t1LoIzm9DnF9FvUvdsF7tEM
 aTwnAxPbkqWPuHjZa06cAFjg8ghdFDX8G6+NRaVaF1soJTYUiMvwVrmZE+5nzp853JpF
 +qjA==
X-Gm-Message-State: AOAM531vB79V69RtoJH25NsId4lBChP4Xk6/cWOjxL+wd2sIARjHhyXA
 apV+r1TNWEJ5BbT483Ia7aw/VYNzTVb0/L751rzdx/Vo/n8WZe/l3kdScBoxqU9aqLXwf45Cc2/
 WfSOUsr1vfnREUrg=
X-Received: by 2002:a1c:208f:: with SMTP id
 g137mr14247793wmg.116.1604928409319; 
 Mon, 09 Nov 2020 05:26:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxQ6iQPxoOK8oAb2OuSB+4N3RImmmmJd68ahXcYgdYyBz3eYocqdnO8AKQXqqrqrMF4VZGEw==
X-Received: by 2002:a1c:208f:: with SMTP id
 g137mr14247773wmg.116.1604928409072; 
 Mon, 09 Nov 2020 05:26:49 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 71sm13816575wrm.20.2020.11.09.05.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 05:26:48 -0800 (PST)
Subject: Re: [PATCH-for-5.2? v3 5/9] scsi: fix overflow in
 scsi_disk_new_request_dump
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
 <20201105221905.1350-6-dbuono@linux.vnet.ibm.com>
 <ad3594d4-3541-32fd-ad61-9b57f2d08e5b@redhat.com>
 <b6dcbbe3-294f-dcf4-72a6-c29314ec0d8d@redhat.com>
Message-ID: <2382c0b4-6fe2-3e0b-e349-1ac12b47fbb5@redhat.com>
Date: Mon, 9 Nov 2020 14:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <b6dcbbe3-294f-dcf4-72a6-c29314ec0d8d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/20 3:43 PM, Philippe Mathieu-Daudé wrote:
> On 11/6/20 3:32 PM, Philippe Mathieu-Daudé wrote:
>> On 11/5/20 11:19 PM, Daniele Buono wrote:
>>> scsi_disk_new_request_dump is used to dump the content of a scsi request
>>> for tracing. It does that by decoding the command to get the size of the
>>> command buffer, and then printing the content of such buffer on a string.
>>>
>>> When using gcc with link-time optimizations, it warns that the argument of
>>> malloc may be too large.
>>>
>>> In function 'scsi_disk_new_request_dump',
>>>     inlined from 'scsi_new_request' at ../qemu-cfi-v3/hw/scsi/scsi-disk.c:2588:9:
>>> ../qemu-cfi-v3/hw/scsi/scsi-disk.c:2562:17: warning: argument 1 value '18446744073709551612' exceeds maximum object size 9223372036854775807 [-Walloc-size-larger-than=]
>>>      line_buffer = g_malloc(len * 5 + 1);
>>>                  ^
>>> ../qemu-cfi-v3/hw/scsi/scsi-disk.c: In function 'scsi_new_request':
>>> /usr/include/glib-2.0/glib/gmem.h:78:10: note: in a call to allocation function 'g_malloc' declared here
>>>  gpointer g_malloc         (gsize  n_bytes) G_GNUC_MALLOC G_GNUC_ALLOC_SIZE(1);
>>>
>>> len is a signed integer filled up by scsi_cdb_length which can return -1
>>> if it can't decode the command. In this case, g_malloc would probably fail.
>>> However, an unknown command here is a possibility, and since this is used for
>>> tracing, we should try to print the command anyway, for debugging purposes.
>>>
>>> Since knowing the size of the command in the buffer is impossible (could not
>>> decode the command), only print the header by setting len=1 if scsi_cdb_length
>>> returned -1
>>>
>>> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
>>> ---
>>> If we had a way to know the (maximum) size of the buffer, we could
>>> alternatively dump the whole buffer, instead of dumping only the
>>> first byte. Not sure if this can be done, nor if it is considered
>>> a better option.
>>>
>>> We could also produce an error instead/in addition to just dumping
>>> the buffer, if the command cannot be decoded.
>>>
>>>  hw/scsi/scsi-disk.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
>>> index e859534eaf..d70dfdd9dc 100644
>>> --- a/hw/scsi/scsi-disk.c
>>> +++ b/hw/scsi/scsi-disk.c
>>> @@ -2559,6 +2559,10 @@ static void scsi_disk_new_request_dump(uint32_t lun, uint32_t tag, uint8_t *buf)
>>>      int len = scsi_cdb_length(buf);
>>>      char *line_buffer, *p;
>>>  
>>> +    if (len < 0) {
>>> +        len = 1;
>>> +    }
>>> +
>>>      line_buffer = g_malloc(len * 5 + 1);
>>>  
>>>      for (i = 0, p = line_buffer; i < len; i++) {
>>>
>>
>> I think scsi_cdb_length() should always return >=1,
>> and scsi_req_parse_cdb() return if len <= 1.
> 
> Looking at how this works, scsi_req_new() shouldn't take
> only a pointer to buffer without knowing its size...
> We should add a buflen argument and propagate it.
> 
> Then we can check if scsi_cdb_length() <= buflen,
> and dump buflen if unknown opcode.

I did it. Will post later as this is 6.0 material.

> 
> Regards,
> 
> Phil.
> 
> 



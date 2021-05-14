Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9833810D7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:29:17 +0200 (CEST)
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdUq-0003nE-88
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhdSD-0000wM-4j
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhdS9-0003Oc-Az
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621020388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4m3XgQBNeuN2I+tcLBHvg4pj9JGolU+Q45d0wqY2ik=;
 b=S9yN0eZIvjntn6Zxjcp5SbLAPv+gT8CnDRIL2YKIxUFkSreRNi3nSIRMwdowQabLjCmwaJ
 2UfH/ogOWj9d4MPWgb2waRqcw0+e0gNszvK4Q8Ofn6gqkYNoYvcnYzWJTkg+9X2+2W8e0I
 Rtqj97sSZAcHQACjb8ldKufv/Ncan60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-fBh9G0ABNlqkzzVy8Bq2cw-1; Fri, 14 May 2021 15:26:26 -0400
X-MC-Unique: fBh9G0ABNlqkzzVy8Bq2cw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 545AFEC1A0;
 Fri, 14 May 2021 19:26:25 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33D6D136F5;
 Fri, 14 May 2021 19:26:24 +0000 (UTC)
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
To: Thomas Huth <thuth@redhat.com>, P J P <ppandit@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
References: <20210123100345.642933-1-ppandit@redhat.com>
 <6881ef3c-99a1-1f5f-cca5-0850ec2bd6cf@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <89fb8d54-707a-9965-75e2-665d4cb07d63@redhat.com>
Date: Fri, 14 May 2021 15:26:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6881ef3c-99a1-1f5f-cca5-0850ec2bd6cf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-stable@nongnu.org, Gaoning Pan <pgn@zju.edu.cn>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 3:23 PM, Thomas Huth wrote:
> On 23/01/2021 11.03, P J P wrote:
>> From: Prasad J Pandit <pjp@fedoraproject.org>
>>
>> While processing ioport command in 'fdctrl_write_dor', device
>> controller may select a drive which is not initialised with a
>> block device. This may result in a NULL pointer dereference.
>> Add checks to avoid it.
>>
>> Fixes: CVE-2021-20196
>> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1912780
>> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>> ---
>>   hw/block/fdc.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>> index 3636874432..13a9470d19 100644
>> --- a/hw/block/fdc.c
>> +++ b/hw/block/fdc.c
>> @@ -1429,7 +1429,9 @@ static void fdctrl_write_dor(FDCtrl *fdctrl, 
>> uint32_t value)
>>           }
>>       }
>>       /* Selected drive */
>> -    fdctrl->cur_drv = value & FD_DOR_SELMASK;
>> +    if (fdctrl->drives[value & FD_DOR_SELMASK].blk) {
>> +        fdctrl->cur_drv = value & FD_DOR_SELMASK;
>> +    }
>>       fdctrl->dor = value;
>>   }
>> @@ -1894,6 +1896,10 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
>>       uint32_t pos;
>>       cur_drv = get_cur_drv(fdctrl);
>> +    if (!cur_drv->blk) {
>> +        FLOPPY_DPRINTF("No drive connected\n");
>> +        return 0;
>> +    }
>>       fdctrl->dsr &= ~FD_DSR_PWRDOWN;
>>       if (!(fdctrl->msr & FD_MSR_RQM) || !(fdctrl->msr & FD_MSR_DIO)) {
>>           FLOPPY_DPRINTF("error: controller not ready for reading\n");
>> @@ -2420,7 +2426,8 @@ static void fdctrl_write_data(FDCtrl *fdctrl, 
>> uint32_t value)
>>           if (pos == FD_SECTOR_LEN - 1 ||
>>               fdctrl->data_pos == fdctrl->data_len) {
>>               cur_drv = get_cur_drv(fdctrl);
>> -            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), 
>> fdctrl->fifo,
>> +            if (cur_drv->blk == NULL
>> +                || blk_pwrite(cur_drv->blk, fd_offset(cur_drv), 
>> fdctrl->fifo,
>>                              BDRV_SECTOR_SIZE, 0) < 0) {
>>                   FLOPPY_DPRINTF("error writing sector %d\n",
>>                                  fd_sector(cur_drv));
>>
> 
> Ping again!
> 
> Could anybody review / pick this up?
> 
>   Thomas
> 

Yep. Not forgotten, despite appearances. Clearing my Python review 
backlog, then onto FDC/IDE.

In the meantime, anything anyone else happens to feel comfortable 
staging won't upset me any. I don't insist they go through my tree right 
now.



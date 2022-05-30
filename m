Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11584538878
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 23:02:55 +0200 (CEST)
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvmXO-0004MU-6e
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 17:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvmVB-0002k4-5y; Mon, 30 May 2022 17:00:37 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvmV9-0003Z3-GV; Mon, 30 May 2022 17:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lGjVpSkUXcIFL2elPBQ2FmTjJJYe4kaohC24yC6d3mE=; b=dX5PxLTpL24444lXFvRIu2cyMQ
 Y3J1PNvcq54PkW//jZuhclETf5MscYYlKM+nmMdutYK+aLZT3EEHD6AnEDE5KWKhkNLkCRUiBAtLO
 7XBtECH3geUZpulKBY0SHbuYSTRB4b41GonLoEe4oY7gqXlGCOUkctnwbDHVsrL+DpVXqJEcavnlX
 ooIqR8uaycaXiDHoTYn9s8QdrKhzYBXWeVYI9dbVBVPAqI3iPNmSrmJ1QIPc6b62UBSOP0dJuvD/s
 8E+19R/AscigoW/SUOoVb0qjItxmAT1XhMaDRMnSsK2nqouSnNydlzotGbP0lh1MA43d5cHrepeOk
 GEe28buD3Skc94az636tolRzmYLpti+y/fIbjPNM3jnhxM4vQIKfIoZ97djnaN8pHbhnImURGZNNG
 JP4v75f9twsbff/DprusfqS1w9fkooqWNj6GhfRocwMihUZJx5yULXrHHOO8o60RUmwnbTHRt2KW8
 MRhX2dYi+DDlOiJKyVuXmNg7ZfS1FTk+PfPcGdVAFOMMJ7LMqKG57QQZn1l0yzgfhc4q5cm4zKSti
 0j+tWeBRafRqYB5v2c9kr7QLTng+qNvES6e5hRR1/Ok8QZaOOzAKTWe2er6s+QK7/dM+7DT8oENtx
 bj3EH9+QmqdeLdBgq7BZnDoXNQ4HfaZHEARDMwP6I=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvmTy-0009iF-K7; Mon, 30 May 2022 21:59:26 +0100
Message-ID: <ba44b211-8d96-e42e-e56d-1f7b5013747a@ilande.co.uk>
Date: Mon, 30 May 2022 22:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <20220424164935.7339-8-mark.cave-ayland@ilande.co.uk>
 <80765f53-031d-3467-25a1-f5c19648fe6a@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <80765f53-031d-3467-25a1-f5c19648fe6a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 07/11] scsi-disk: allow truncated MODE SELECT requests
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/05/2022 13:06, Paolo Bonzini wrote:

> On 4/24/22 18:49, Mark Cave-Ayland wrote:
>> According to [1] this truncated request is accepted on real hardware whereas in
>> QEMU it generates an INVALID_PARAM_LEN sense code which causes A/UX to get stuck
>> in a loop retrying the command in an attempt to succeed.
> 
> That's for MODE SENSE, not MODE SELECT.
> 
> Truncated MODE SELECT is a bit more iffy, so I'd rather have a quirk for this as well.

Okay let me double-check this again to confirm whether the issue is with MODE SENSE, 
MODE SELECT or both. Adding a quirk to control the behaviour is fairly easy to do.

> Paolo
> 
>> Alter the mode page request length check so that truncated requests are allowed
>> as per real hardware, adding a trace event to enable the condition to be detected.
>>
>> [1]https://68kmla.org/bb/index.php?threads/scsi2sd-project-anyone-interested.29040/page-7#post-316444 
>>
>>
>> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/scsi-disk.c  | 2 +-
>>   hw/scsi/trace-events | 1 +
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
>> index 71fdf132c1..c657e4f5da 100644
>> --- a/hw/scsi/scsi-disk.c
>> +++ b/hw/scsi/scsi-disk.c
>> @@ -1525,7 +1525,7 @@ static int mode_select_pages(SCSIDiskReq *r, uint8_t *p, int 
>> len, bool change)
>>               goto invalid_param;
>>           }
>>           if (page_len > len) {
>> -            goto invalid_param_len;
>> +            trace_scsi_disk_mode_select_page_truncated(page, page_len, len);
>>           }
> 

ATB,

Mark.


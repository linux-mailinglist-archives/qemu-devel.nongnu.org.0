Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E331FBF0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:26:54 +0100 (CET)
Received: from localhost ([::1]:39846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7gD-0006F7-O0
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lD74C-0002yV-6u
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lD73V-0003hB-Cn
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613746012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLTumJIcbQpdSO2ZJhuGjh9FNnRfhMDhkG3jEec4W2Q=;
 b=S60x0ofgSlZtqJ0PLJwk35mIcV8k6AJZt889PIkxkdREQQTIXwO0TXw8qFU52+auMkMDtz
 Hl+PNlH6ez+cnF0ifUkpLY5BYHeimgj9EaHtEhI3kS4aEly68gU85yy4/5MLvtOLoq0Y06
 W9QhnQ9XYr+C5BvrDcBfUxnOD1gmTNQ=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-8PR6MpDHMmG3cexml6kZhQ-1; Fri, 19 Feb 2021 09:46:50 -0500
X-MC-Unique: 8PR6MpDHMmG3cexml6kZhQ-1
Received: by mail-oo1-f72.google.com with SMTP id t25so2817644oof.15
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OLTumJIcbQpdSO2ZJhuGjh9FNnRfhMDhkG3jEec4W2Q=;
 b=ClHoXCfmS31imjy3d9kCpVTWK/daGpBypE4qDb4gPlJJPtxaLBIX00grmjbDhGjJF4
 QSJw8lO6RmAJFk0NxDOuWoG95AgaKQvRWYaSRdo26SmaQfT1BdglljbNLuFH6h7u+sL0
 iELemAft5/uS2Tsu94QK/ZBz7H8QbYUrdgmqfaXmDBakLOyUmx3+mO+jT/MSh4wqbL0C
 k9RYBgADfr9O5WLcII70BpBf40g8Va1dlBRU4OeLgX3dZKVHMW5Z7un54NzCh/aCof+u
 zG1oWIsNPgzzViS32w1SWnaq2o4cTJD/gWN/aoFK9bZ3JmwvN8RyUspmTDKeWzGRU9po
 BQOg==
X-Gm-Message-State: AOAM533wqhhF04lJ5/VsOGXPE/6o7yHd/NIiObY7DLDdJch2W05uhKGi
 skSN9V62POQMmRYXBYd5IfWa9JqN8nlbr9Pewh1nP37DzmH2oTPbuCYPpCiuk1UkvHeUTtNKcrp
 B40QPM5XSEwqcfsM=
X-Received: by 2002:a05:6830:1b74:: with SMTP id
 d20mr7488489ote.104.1613746010027; 
 Fri, 19 Feb 2021 06:46:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLSk69Ztm+gJClzJ/yaCX0NCjkOT9Ej01UrcnXqD4+gdCFC/lPL7esYLq5H1CkSpC6+k0Xew==
X-Received: by 2002:a05:6830:1b74:: with SMTP id
 d20mr7488477ote.104.1613746009824; 
 Fri, 19 Feb 2021 06:46:49 -0800 (PST)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 v19sm130459ots.48.2021.02.19.06.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 06:46:49 -0800 (PST)
Subject: Re: [PATCH 0/2] SEV firmware error list touchups
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210218151633.215374-1-ckuehl@redhat.com>
 <5ab9738d-b5c2-a580-47f1-9ebd289903f4@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <d32f8265-c82c-b09e-87b1-18fa040ae70f@redhat.com>
Date: Fri, 19 Feb 2021 08:46:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5ab9738d-b5c2-a580-47f1-9ebd289903f4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 9:48 AM, Philippe Mathieu-Daudé wrote:
> On 2/18/21 4:16 PM, Connor Kuehl wrote:
>> Connor Kuehl (2):
>>    sev: use explicit indices for mapping firmware error codes to strings
>>    sev: add missing firmware error conditions
>>
>>   target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
>>   1 file changed, 25 insertions(+), 23 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thank you! :-)

> To avoid this problem in future (new error code added on the Linux
> kernel side) would it be acceptable to add a 3rd patch as:
> 
> -- >8 --
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 0f414df02f3..e086d3198e8 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -155,9 +155,12 @@ sev_platform_ioctl(int fd, int cmd, void *data, int
> *error)
>   static const char *
>   fw_error_to_str(int code)
>   {
> +    QEMU_BUILD_BUG_ON(SEV_RET_SECURE_DATA_INVALID + 1 == SEV_RET_MAX);
> +
>       if (code < 0 || code >= SEV_FW_MAX_ERROR) {
>           return "unknown error";
>       }
> +    assert(sev_fw_errlist[code]);
> 
>       return sev_fw_errlist[code];
>   }
> ---
> 
> which triggers a build error if scripts/update-linux-headers.sh
> added another sev_ret_code entry?
> 

I like this a lot. Should I send a v2 of the series with a third patch 
like this or shall I wait to see if these patches get applied then send 
something like this as a follow up patch?

Thank you,

Connor



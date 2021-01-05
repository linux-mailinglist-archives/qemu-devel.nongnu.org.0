Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C712EAA37
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 12:53:04 +0100 (CET)
Received: from localhost ([::1]:58598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwktb-0005P9-Gc
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 06:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwksQ-0004ol-9t
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:51:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwksO-0003Yb-Po
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609847508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JlCARGvl1SVqfUpm6A4vjuFz9uH3af6I3tZCA6K9aQY=;
 b=X+rwK6aW4LMExk+eXOqG92TmmZSNaCGUmTJS5F1pvs9TLNfBLcsTF+dZ2nSTTSJcgyJ2ID
 W9DhrIbRTQJ9FdR2gtwA7t6QponBSfOwt6WaX6Z5H70+8L3DyMTVgzBIhzYi93vcy4wJld
 LiJ2Dq7lAVUwTO9amzkC9rI5X067ksE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-4TSrLzysOY288jAWPEOFzQ-1; Tue, 05 Jan 2021 06:51:46 -0500
X-MC-Unique: 4TSrLzysOY288jAWPEOFzQ-1
Received: by mail-wr1-f70.google.com with SMTP id g16so14812724wrv.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 03:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JlCARGvl1SVqfUpm6A4vjuFz9uH3af6I3tZCA6K9aQY=;
 b=HKIfQ3FbpAv9PD0/Be6GtcpMI2dTSHvSLYBf78zVshq59AmljsGa8GJohISK4S96Gk
 38tEV7d9c870vpdIiXadugxPd0trVAFR012jhJHI0nlpBNA4Plp/fhVv7IXF7JPvsxzV
 7mhwwOEgHVVB25V5CF71r9I1f7ag47NAn5gJKclpSXtX7pKF6gl+6QFTxj/VfLzOL7ui
 W1XOxYR5vt1W0ww+xZmU/IEyFv5QTOyN37vn6T6s5uQM+2JvXllLw4cORj0giWWUgTrl
 WsI0ATnDB1NmjrLJDa3QiqTdFCz4YkUiU3DO3aX6QQB85EeBWgiIJiSBqHkNCvD0VqWH
 v3yA==
X-Gm-Message-State: AOAM533p6bQuIMXhC0cNSwOG2B/J8a+ozvqINGwHwgfnK/6uXJdiCkSq
 LyfCBy4A+M2RJDQpcV4r8F0frmcMTJMumNuun2i1OFXjrKCXBlt5lfSU8JsSdn5l1nfv5HqvDDl
 J464p0LucylwdyGA=
X-Received: by 2002:a05:600c:2158:: with SMTP id
 v24mr3070786wml.129.1609847505570; 
 Tue, 05 Jan 2021 03:51:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYF8b7c+POn2qC58uUWqhCbmH/rMKla0pm9zww8n/4K21e4pf40AEpgKptGpGjdwOB3GaytA==
X-Received: by 2002:a05:600c:2158:: with SMTP id
 v24mr3070778wml.129.1609847505456; 
 Tue, 05 Jan 2021 03:51:45 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id j9sm96084751wrm.14.2021.01.05.03.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 03:51:44 -0800 (PST)
Subject: Re: [PATCH] tests/iotests: drop test 312 from auto group
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210105100402.12350-1-alex.bennee@linaro.org>
 <2f01d619-b83d-4854-ff15-857264e04e95@redhat.com>
Message-ID: <4149e04b-8f1e-26df-1320-d6090751c5d9@redhat.com>
Date: Tue, 5 Jan 2021 12:51:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2f01d619-b83d-4854-ff15-857264e04e95@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 11:12 AM, Philippe Mathieu-Daudé wrote:
> On 1/5/21 11:04 AM, Alex Bennée wrote:
>> The "auto" documentation states:
>>
>>   That means they should run with every QEMU binary (also non-x86)
>>
>> which is not the case as the check-system-fedora build which only
>> includes a rag tag group of rare and deprecated targets doesn't
>> support the virtio device required.
>>
> 
> Fixes: ef9bba1484b ("quorum: Implement bdrv_co_block_status()")
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>



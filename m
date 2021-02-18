Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13BC31EBB6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 16:50:15 +0100 (CET)
Received: from localhost ([::1]:45976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lClZG-0003Uo-9J
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 10:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lClXi-00034g-4W
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:48:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lClXf-0005S5-9l
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613663312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4UtRqgMDL+pPW2Ml6iKWneOkuTSLpesxC/RkqekWocA=;
 b=D+W4+AZxkIYeXAU0JYIJgFmG0qMKanEMhigW0DQZp/qKjjbVyev0eg8H8fxvEhzByUFQ38
 y+j3VshcYtU/E7CbmzQ++DXfvKYnRWzO7idP+jVRWPf9Bd1bA/P6ERI4StqCbju/igo29Y
 cb1E5r3vnmve9THtW4bffSDWppS/Oyw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-lj4zpRyqP7qPilrLvAvl6A-1; Thu, 18 Feb 2021 10:48:30 -0500
X-MC-Unique: lj4zpRyqP7qPilrLvAvl6A-1
Received: by mail-wr1-f69.google.com with SMTP id r5so1158775wrw.10
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 07:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4UtRqgMDL+pPW2Ml6iKWneOkuTSLpesxC/RkqekWocA=;
 b=oLw/rKIYkzZesLusxKNYSCRPVixd/IXVZVDfmDZdStPrawNFopGI/ZNqAmSmrTzJvC
 0dn9HCYX9eoDcHWZ7EEZHDE07JqG2pmhugNcPysAACQCavCq0M4nYlAhOSQJU3Qq1ihS
 J6JYac43W7qRoZg4SzxIT8VhAI/UdiGwytwU+i/h1SyWZh6KZou8L5AgZbb8RJrc3ZJE
 Ta9ShWLBaCZAQ8iJJ+y1fElGzHRxXvbj8jXC0e5VnPc4GtW2O7Mamv47qrrZ7E/Wp3sp
 NmBSKaiEPu2mavtaRhH/SrC5CHI/duPVdDRifDCODo6Eiw+m3lH3fdot9Toy6pECGn2L
 cCMQ==
X-Gm-Message-State: AOAM533EumkboYqRHqCPaiP52Avzn7TDYpApSrxSGl7CvLx9Djbu3ElB
 wx7U/PR6hHfydoD7/5RRSDnsC6YpdSYy/craWm38c4jTGRQXcFF5NTQEMxtcryIeUg8U4Ic++6w
 DAbCLnOreNLZ8yfM=
X-Received: by 2002:a05:600c:2155:: with SMTP id
 v21mr4141441wml.23.1613663309793; 
 Thu, 18 Feb 2021 07:48:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/aefQL9UoQXH56gMXnDiaHsI6jEY19W1euGmS/WqoNt2DzaOejrtWcYNgYTDeu402milTUg==
X-Received: by 2002:a05:600c:2155:: with SMTP id
 v21mr4141426wml.23.1613663309623; 
 Thu, 18 Feb 2021 07:48:29 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f17sm9265979wrx.57.2021.02.18.07.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 07:48:28 -0800 (PST)
Subject: Re: [PATCH 0/2] SEV firmware error list touchups
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
References: <20210218151633.215374-1-ckuehl@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5ab9738d-b5c2-a580-47f1-9ebd289903f4@redhat.com>
Date: Thu, 18 Feb 2021 16:48:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218151633.215374-1-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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

On 2/18/21 4:16 PM, Connor Kuehl wrote:
> Connor Kuehl (2):
>   sev: use explicit indices for mapping firmware error codes to strings
>   sev: add missing firmware error conditions
> 
>  target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


To avoid this problem in future (new error code added on the Linux
kernel side) would it be acceptable to add a 3rd patch as:

-- >8 --
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 0f414df02f3..e086d3198e8 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -155,9 +155,12 @@ sev_platform_ioctl(int fd, int cmd, void *data, int
*error)
 static const char *
 fw_error_to_str(int code)
 {
+    QEMU_BUILD_BUG_ON(SEV_RET_SECURE_DATA_INVALID + 1 == SEV_RET_MAX);
+
     if (code < 0 || code >= SEV_FW_MAX_ERROR) {
         return "unknown error";
     }
+    assert(sev_fw_errlist[code]);

     return sev_fw_errlist[code];
 }
---

which triggers a build error if scripts/update-linux-headers.sh
added another sev_ret_code entry?



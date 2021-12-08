Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED7D46D4DA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 14:53:25 +0100 (CET)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muxNr-0005xB-8j
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 08:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1muxKR-0003u1-Pt
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 08:49:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1muxKL-00068g-1H
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 08:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638971382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uu7bMXIgwsW0Zs2RIdV143oe9JaaPCiIeDV0xP8UhIw=;
 b=RbS35MbLd0S038P2q7ApLSCtq28KOke2WyxBH+80HTEM4JwUsRdiaDgaFHvzJZgdLmw1+x
 NQAuCWzHHcNisGYNqtCtpHT3gwSG/rAI/nVV5n4ovc53jNPc8MZvVOLF/rxeUSEZxt87ZY
 mmkISg4mlvuzhjLcDUmB8NiO6FlGHns=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-qFv0QRZ9PIywXReqyGstxQ-1; Wed, 08 Dec 2021 08:49:38 -0500
X-MC-Unique: qFv0QRZ9PIywXReqyGstxQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so3032972wmd.9
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 05:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Uu7bMXIgwsW0Zs2RIdV143oe9JaaPCiIeDV0xP8UhIw=;
 b=x6opAaOrejOZQcmNGeg637aMIkRbhTvs2rEemQTnK7O/lnV8I+yWSKsJCQ2El92ybx
 uy6iRYME2bq4Cnq7CDl7Sg50NCTH5fXbU69xNtVDuPrTaGEHxSfvswGCNjI09TJ42WNG
 jk0idzocCPQHq8Bb/0f0ha2S2xSsicNV8i6diJ/VhcCqf1wIHPYqA03me8OqpW5s3GDk
 2x/JRcz3LUpOJtRMw4AtdDi9u/z06s7wmF/CmhitgbEfoqPsADMbqjw7wKFvww4iIuK1
 /10alPmraVRttfIycV2ieC56EPNPKC72N+xco+tWKyZksCkzm1GCqzdoW6UdY3XbjzhM
 FeSQ==
X-Gm-Message-State: AOAM533JqxrfEXOdxvSFO4t8QNX2g4JI2fMYj93+/5K8g7RHsc/QUSnx
 c9j6EeHzrFnaVtYBN5dxfJGvT7E+wQZe0DGw4O8xnD8VrmCenGrl6ri5MHu0qDx5hpIT2TbdH5x
 6LRYElgwbapHTDoE=
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr13988003wrd.3.1638971377132;
 Wed, 08 Dec 2021 05:49:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbRCzhzZYvnpMPwSaA/54wjs/QyfMHzgm2AXOWO93qhvnWUhSKLw6Bj6AnO20BZBGakaX3Ow==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr13987979wrd.3.1638971376942;
 Wed, 08 Dec 2021 05:49:36 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id h17sm2744873wrp.34.2021.12.08.05.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 05:49:36 -0800 (PST)
Message-ID: <3338ff2d-ecbe-a87c-642f-542c2b57ce37@redhat.com>
Date: Wed, 8 Dec 2021 14:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] ui/clipboard: Don't use g_autoptr just to free a
 variable
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20211207204038.664133-1-jsnow@redhat.com>
 <20211207204038.664133-3-jsnow@redhat.com> <YbB2qS8bpHlYccvP@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YbB2qS8bpHlYccvP@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/21 10:11, Daniel P. Berrangé wrote:
> On Tue, Dec 07, 2021 at 03:40:38PM -0500, John Snow wrote:
>> Clang doesn't recognize that the variable is being "used" and will emit
>> a warning:
>>
>>   ../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
>>       g_autoptr(QemuClipboardInfo) old = NULL;
>>                                  ^
>>   1 error generated.
>>
>> OK, fine. Just do things the old way.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  ui/clipboard.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/ui/clipboard.c b/ui/clipboard.c
>> index d7b008d62a..9ab65efefb 100644
>> --- a/ui/clipboard.c
>> +++ b/ui/clipboard.c
>> @@ -44,12 +44,11 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
>>  
>>  void qemu_clipboard_update(QemuClipboardInfo *info)
>>  {
>> -    g_autoptr(QemuClipboardInfo) old = NULL;
>>      assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
>>  
>>      notifier_list_notify(&clipboard_notifiers, info);
>>  
>> -    old = cbinfo[info->selection];
>> +    g_free(cbinfo[info->selection]);
> 
> This is a ref counted data type - it can't use g_free:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg04890.html

Doh, I vaguely remembered having already reviewed this then only
found John's v1 and finally mis-reviewed it :/ Thanks for noticing.



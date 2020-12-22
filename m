Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC052E105F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 23:48:38 +0100 (CET)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krqSL-0003r4-Fy
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 17:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krqQS-0002zf-HD
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 17:46:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krqQD-0004ug-Lq
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 17:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608677181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zcv+1HCD/fKgEPgvYsqqGxDRGBg/7PvlssguwhRDFLg=;
 b=HfZz97nxEcD450kN8mleH8GgJ9paIoZyz9KGEmHUcU8tyEdNlaRpXNVN/S2cw+vnqSu+zY
 zXYn7wfe/MmTwt/LsTZqsReH0cERWi5E6gaPVE9bs0ceYmPoInIwDrPDE+uJ3WSaGuWrv0
 Y/HcG5hmIUn++8h0xSj+ABYC1eqzJXQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-uni6GwcvMvaR1s44WUGaNQ-1; Tue, 22 Dec 2020 17:46:20 -0500
X-MC-Unique: uni6GwcvMvaR1s44WUGaNQ-1
Received: by mail-wm1-f69.google.com with SMTP id r1so2351965wmn.8
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 14:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zcv+1HCD/fKgEPgvYsqqGxDRGBg/7PvlssguwhRDFLg=;
 b=LYem/tLYEFYhizkrpDhDS7vD9b1NzSIB16D5zExQ8ClXiVVzOQ/WReJIhl3DlLhTkn
 TG/e9Rv5mjeSlZjLzdkC95y8q/fCaejsckdPOXuhROFMROfWfaf7zrmkGNR8Q5xAeBzV
 27VYcfP+wXu6fvWr3yu2X4Txp95zzOzT0JNIHRjABb09wV+lJOlG10eLtscVQ+UF+SoB
 OTUdb1krMsC4L1oCw1NOFiUEQUfxEjyvEBhWnRxZEXLLfM1WJYeo/CRacGaSRjEQcOZA
 YxxVXr84rgF1akYhTJMZByATlsO9dyAFZAFQ1R4Mp9Pbtllukr+fvejuuts0qBKrBX9N
 GtqQ==
X-Gm-Message-State: AOAM530GduxezdMepXhourmOzbI5xHJv5uedFmJUrXSP6HhB4iaAqzWH
 W65iel6HhSG3AmG/AZluwIvf8SUNJxg6oOYotffCFHd06aRkW/3BXyhz5r6DGtDdMkPSxr9I/oN
 4TxKwYqVhsrtYZ6k=
X-Received: by 2002:a1c:454:: with SMTP id 81mr23928930wme.178.1608677178806; 
 Tue, 22 Dec 2020 14:46:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKBR/aYaVzcOvTiYL+4W0tuJHGiPGcTG3nzOiKtS6b9eFBmcj7cdER8hrXN1Ws7seipyIWVw==
X-Received: by 2002:a1c:454:: with SMTP id 81mr23928909wme.178.1608677178561; 
 Tue, 22 Dec 2020 14:46:18 -0800 (PST)
Received: from [192.168.1.124] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id r20sm35103418wrg.66.2020.12.22.14.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 14:46:17 -0800 (PST)
Subject: Re: [PATCH v2] acpi: Permit OEM ID and OEM table ID fields to be
 changed
To: Marian Posteuca <posteuca@mutex.one>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org
References: <20201222113353.31224-1-posteuca@mutex.one>
 <d04375f8-f6bc-91d6-cd6e-217a689002e3@msgid.tls.msk.ru>
 <87eejh4zpq.fsf@mutex.one>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <93c58d9d-63c6-b2d8-2b12-d7ed4aa1b171@redhat.com>
Date: Tue, 22 Dec 2020 23:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <87eejh4zpq.fsf@mutex.one>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/12/20 16:39, Marian Posteuca wrote:
>>> Qemu's ACPI table generation sets the fields OEM ID and OEM table ID
>>> to "BOCHS " and "BXPCxxxx" where "xxxx" is replaced by the ACPI
>>> table name.
>>>
>>> Some games like Red Dead Redemption 2 seem to check the ACPI OEM ID
>>> and OEM table ID for the strings "BOCHS" and "BXPC" and if they are
>>> found, the game crashes(this may be an intentional detection
>>> mechanism to prevent playing the game in a virtualized environment).
>> This isn't a technical question/comment about the patch itself, but
>> about something different.  Do we really want to play this whack-a-mole
>> game? If we change ACPI table IDs, those who want to disallow running
>> their software inside qemu/kvm will find some other way to check for
>> this environment. We will change that, - just to be found again. And
>> so on.. is it productive? I don't think so.
>
> My personal opinion is that as long as it's not too difficult to mask
> that the guest is running in a virtualized environment we should try to
> do these changes. But I guess this can only be judged on per change basis.

I don't have any particular opinion against the "arms 
race"/"whack-a-mole" situation.  We played the game (and sort of won, 
they got tired of changing the drivers) against NVIDIA already.

For 6.0 I'm already planning to revamp a bunch of machine properties, 
for example making -acpitable file=xxx a synonym for "-machine 
acpi.tables.N.file=xxx".  Perhaps we could plan for that and make the 
option "-machine acpi.oem_id".

Paolo



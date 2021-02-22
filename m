Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44CE3218F7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:36:39 +0100 (CET)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBOA-00017Z-OM
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEBBp-0007Go-N1
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:23:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEBBn-0004O6-0C
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614000230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=prL1wxklib9J9Nke5mM0h/b3Ykl+iIHujrw0XIW/3PA=;
 b=TySla8GYGT2P8QOCAV5zQrm0D9M//OXPnEDLd2jHgu5JyA6pRzLmbhKhl+UL5ZbqrTixu3
 H+06GlnAUEh2qz6nM1u5gdEavHy2v1Io+YMq+QspQTCBovfxxbS2JjKH1i3BMKOzVFJT1x
 VOzw3Ps9lzSzvYiSQnwaCEkgXgWXU5o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-OyaS7FzOMKKbvcErwJ3Uvg-1; Mon, 22 Feb 2021 08:23:48 -0500
X-MC-Unique: OyaS7FzOMKKbvcErwJ3Uvg-1
Received: by mail-ed1-f72.google.com with SMTP id c14so5068379eds.4
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=prL1wxklib9J9Nke5mM0h/b3Ykl+iIHujrw0XIW/3PA=;
 b=D9c1Vi9p7nTBOJ2vLBs+F1/VotgBwZe5+zbYbgtzOibEAsaELG8lxMfAgfDWqvjMTa
 BpMYUaO3J1uNXLiGjJQR9Fch8XTL+eYQ1cOiSguki9cCMdPMJt11bH+bmsDxtE9+5Z/G
 /HNK7sqyXpXA9qSPhr9XzKZ/Qxdbt8xGvhXqA5xsnvix3BKfK7P9Vb9KJvs20WAqEtzA
 37ZCWbXpXuR4097PsZxojgSOkTa1iAGIsgCgLCroDnnzxpJjQciD6nYwAtrii2zN5bSv
 sZdkuQbDbZebjmLizSTi2C7UGXA+bf2gc8fhSu60Rabc0oF35PiGWa3VtWhgYY+/f67M
 AqnQ==
X-Gm-Message-State: AOAM5326ngm1XCu/8/N/A+iGUcXT6gehmjUJTkD2DVocEzHC/QRbwhW7
 /BpiRUk/HfYiMIEV1IL8UFS/0sEqoq3Ka04ROEW3BDSpuhhh1FE0I7bt9SqKAE6h9eIh+KG0k7N
 gjULlvQNhe4cPqwU=
X-Received: by 2002:aa7:c044:: with SMTP id k4mr22696066edo.47.1614000227596; 
 Mon, 22 Feb 2021 05:23:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqg1Bot0EGHMqRv99kXVuUFxlPgZZeueNeRneB0N0dzBaC9SIO/8wxAK7CjJlNh/PQpIhxAA==
X-Received: by 2002:aa7:c044:: with SMTP id k4mr22696048edo.47.1614000227426; 
 Mon, 22 Feb 2021 05:23:47 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z13sm11874213edc.73.2021.02.22.05.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:23:47 -0800 (PST)
Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
 <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com>
 <87ft1opa5k.fsf@dusky.pond.sub.org> <YDOuutVPzV2UNGjY@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e6b25650-93d0-c550-5788-0478c6ad95b3@redhat.com>
Date: Mon, 22 Feb 2021 14:23:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDOuutVPzV2UNGjY@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, saipava@xilinx.com,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 2:16 PM, Dr. David Alan Gilbert wrote:
> * Markus Armbruster (armbru@redhat.com) wrote:
>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>
>>> On 2/22/21 9:20 AM, Sai Pavan Boddu wrote:
>>>> From: Vincent Palatin <vpalatin@chromium.org>
>>>>
>>>> Add new block device type.
>>>>
>>>> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
>>>> [SPB: Rebased over 5.1 version]
>>>> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>> ---
>>>>  include/sysemu/blockdev.h | 1 +
>>>>  blockdev.c                | 1 +
>>>>  2 files changed, 2 insertions(+)
>>>>
>>>> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
>>>> index 3b5fcda..eefae9f 100644
>>>> --- a/include/sysemu/blockdev.h
>>>> +++ b/include/sysemu/blockdev.h
>>>> @@ -24,6 +24,7 @@ typedef enum {
>>>>       */
>>>>      IF_NONE = 0,
>>>>      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
>>>> +    IF_EMMC,
>>>>      IF_COUNT
>>>>  } BlockInterfaceType;
>>>>  
>>>> diff --git a/blockdev.c b/blockdev.c
>>>> index cd438e6..390d43c 100644
>>>> --- a/blockdev.c
>>>> +++ b/blockdev.c
>>>> @@ -83,6 +83,7 @@ static const char *const if_name[IF_COUNT] = {
>>>>      [IF_SD] = "sd",
>>>>      [IF_VIRTIO] = "virtio",
>>>>      [IF_XEN] = "xen",
>>>> +    [IF_EMMC] = "emmc",
>>>>  };
>>>
>>> We don't need to introduce support for the legacy -drive magic.
>>>
>>> -device should be enough for this device, right?
>>
>> External interface extensions need rationale: why do we want / need it?
>> The commit message neglects to provide one.
>>
>> Even more so when the interface in question is in a state like -drive
>> is.
> 
> I wouldn't be too nasty about -drive;  for me I still find it the
> easiest way to start a VM.

But eMMC isn't a bus where you can plug drives, it is soldered
on-board and is mmio mapped to a fixed address. I don't see the
point of having a drive interface for it...



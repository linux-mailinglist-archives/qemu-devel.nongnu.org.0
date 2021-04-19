Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E413648CB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:12:20 +0200 (CEST)
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXRb-000396-VQ
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYXND-0007av-8e
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYXN9-0005bE-Lk
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618852058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xr9TxwaDbcvfbVaFAU1Sew0UkydHKznf8By/m44Iw8c=;
 b=cpvAT7CchxoWHGGhzJwMpLqvJz2sw1iOyj3XwnJw4MMxoBwg6dc25SWNAn/amwaUjzl9FQ
 0oUAGehmIpTGzYOHSVGCkgBzCxg9Sug3UYOHSGM6NKi2NjSGdYW5q0OEbRMZTcrFAvYWQr
 1WLOvjsbN/5peYnhM48vqSCJ1B0rtFo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-VEdv_kOgN26Zdz0xKIMUmg-1; Mon, 19 Apr 2021 13:07:34 -0400
X-MC-Unique: VEdv_kOgN26Zdz0xKIMUmg-1
Received: by mail-wr1-f69.google.com with SMTP id
 91-20020adf92e40000b029010470a9ebc4so8283259wrn.14
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xr9TxwaDbcvfbVaFAU1Sew0UkydHKznf8By/m44Iw8c=;
 b=E7ZmqwM4yt5xNh/EpVu6B97lXx8/MVHAr2J/z2MR68coJ7s8jDuWCW41+VquKtKPd9
 4XCnPTQd0Mi8j15tMtJMkNAVQePb9sWVc3ZN0bu38vO/F3FkNJeXhMdw2eS1wS2f4OLt
 wj1GyTvmVB9zndqJGyE8qjCqmI7Ei2WX0SBtOEjAjK16qwe5cPtu8ngyQ1aMvsL7bYZd
 XOA4ngcroAAfI+IIrqM2QpJ8CMGdHj+tTnQYi5+01nxAAmh7vPQEtnj1S2N/9iKXNoZx
 +ZrTW/bkyzMQTVMvqOMNrJ6KdRz+b90t2uLjczEhwz4Wz3eTHgNS8/EN3HUarS1aXTtq
 xUrQ==
X-Gm-Message-State: AOAM532p3QgNt12AdHjYBNkJtGzZGbcpEo1fp3wqNVJHi4i48+UeOqSI
 64UcIQD+zrMF8v2bK8bPFHKaAA2sGInS4T/aGno+7IxH/vZe+LoiB4VcSJsgbEdB0S6zvoJJT7K
 TdW2b/WpREMNnFQo=
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr83533wmq.140.1618852052887; 
 Mon, 19 Apr 2021 10:07:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB1Elt2OFWj5peuS+jZ6GPoiYtc2X6uliGYLkMvtkopMR+9+278s9lQPrS8St7Ua0AS78hMA==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr83507wmq.140.1618852052613; 
 Mon, 19 Apr 2021 10:07:32 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b206sm127138wmc.15.2021.04.19.10.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 10:07:32 -0700 (PDT)
Subject: Re: [PATCH-for-6.0? v3] mptsas: Remove unused MPTSASState 'pending'
 field (CVE-2021-3392)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210419134247.1467982-1-f4bug@amsat.org>
 <CAFEAcA-NvHvstggDD=wy_HFcaeQQikWA0M46vS_Jn27=qq1gWw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9fdc42bd-c9aa-d8e4-a1f2-1c517cddd9b9@redhat.com>
Date: Mon, 19 Apr 2021 19:07:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-NvHvstggDD=wy_HFcaeQQikWA0M46vS_Jn27=qq1gWw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Mauro Matteo Cascella <mcascell@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Cheolwoo Myung <cwmyung@snu.ac.kr>, Li Qiang <liq3ea@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 6:47 PM, Peter Maydell wrote:
> On Mon, 19 Apr 2021 at 14:42, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> From: Michael Tokarev <mjt@tls.msk.ru>
>>
>> While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
>> the Megaraid emulator appends new MPTSASRequest object 'req' to
>> the 's->pending' queue. In case of an error, this same object gets
>> dequeued in mptsas_free_request() only if SCSIRequest object
>> 'req->sreq' is initialised. This may lead to a use-after-free issue.
>>
>> Since s->pending is actually not used, simply remove it from
>> MPTSASState.
>>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Message-Id: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
>> BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
>> Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")
>> [PMD: Reworded description, added more tags]
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v3: Remove now unused variable in mptsas_free_request (pm215)
>>
>> MJT patch:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg799236.html
>>
>> Since rc4 is soon, I'm directly respining his patch with my comments
>> addressed.
>>
>> This is not a new regression (present since QEMU v2.6.0) but is a
>> CVE...
>>
>> PJP first patch:
>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg02660.html
> 
> This is clearly-safe and since it's marked as a CVE and we're doing
> rc4 anyway we might as well put it in. Applied to master, thanks.

Thank you!

Phil.



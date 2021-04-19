Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8CC3644DC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 15:45:06 +0200 (CEST)
Received: from localhost ([::1]:53122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYUD3-0008QB-9S
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 09:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYUAe-0007Hy-8s
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:42:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYUAc-0004o7-0G
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618839752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XSqxCZaOohHgCA1hfEeljh0KDSws7eZvbxl+4+p/8Lo=;
 b=DoxrmLTSLDn2LJV5dBztvwrzeN1cN1AGLhDQf4ZLB7TqVrMVD+epJqTkHb6XtQwARZicHA
 Ee1ncjEbRZ5nUIjkodh8VKs7COf1f0+tYGQvu4yFrdj4XieCVTHRWJP+fDdVmejq5Jlxaf
 BOatm3pUN11uQKRZq42KwLcXLeU4HD4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-UIZMOndIOduaqLaqqR09jw-1; Mon, 19 Apr 2021 09:42:29 -0400
X-MC-Unique: UIZMOndIOduaqLaqqR09jw-1
Received: by mail-wr1-f71.google.com with SMTP id
 t14-20020a5d6a4e0000b029010277dcae0fso9048142wrw.22
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 06:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XSqxCZaOohHgCA1hfEeljh0KDSws7eZvbxl+4+p/8Lo=;
 b=OV9TI4ZjuEFAuHZFVYdNBdAsyzGqFCSn2kZnLhHzEZ1nzcFR4c/uFtqkbVKJTi1Gr5
 mgZDjV6WmMVQ395WCrh6Xw2ekA2bMt/lsaTYYbkm/qaJUFmxIapZ5+N1ddCWNOczPSeG
 isnuZLpNtf/C/kvc5y3hkf8JHtbWKTUEwcC+OAgFlpxXieRU3YV456aHGaheGl4WgtEf
 0OmIPDSz5t9hkn2byrITmWB6PyZwdocGa0PJ9AzlPRIKNPWWjtK2kuWKwgSqg91NpdBa
 rvwpYEyiFtFAOkHfjbDrCVf8pYgBPu4kYShVInnhZQwacM/GQUSHUUDraONPOL1tLeWo
 u6Fw==
X-Gm-Message-State: AOAM530o0DwMjUk/ol3DrG3yKk4cgxZSXwirG0Wnj3/17vfPB0Fzy+Xw
 n9aGaiUUdjxTHia6dr5ik+5jtPE09OUziavfNQ9rClVOmLHytBMHJWH/yo/P8jxNsdOT6jeaos/
 6onfoi0hyv5616+k=
X-Received: by 2002:adf:ce0c:: with SMTP id p12mr14414482wrn.59.1618839748003; 
 Mon, 19 Apr 2021 06:42:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbEKRWNcKs+KY+rzWQh5ZcRTGS+Lpydk/7KPKXk3gNWz1s6SaTxEgF+UodN/uTGGpXglog5A==
X-Received: by 2002:adf:ce0c:: with SMTP id p12mr14414453wrn.59.1618839747692; 
 Mon, 19 Apr 2021 06:42:27 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h63sm20101771wmh.13.2021.04.19.06.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 06:42:27 -0700 (PDT)
Subject: Re: [PATCH-for-6.0? v2] mptsas: Remove unused MPTSASState 'pending'
 field (CVE-2021-3392)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210418053039.811996-1-philmd@redhat.com>
 <CAFEAcA80RVpQt4v2LntVYbwinbptim4+YaA2+ijmQk7KEB2seQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a338f01d-afe8-fe39-4091-f06e170a451a@redhat.com>
Date: Mon, 19 Apr 2021 15:42:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA80RVpQt4v2LntVYbwinbptim4+YaA2+ijmQk7KEB2seQ@mail.gmail.com>
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
 Don Slutz <Don@cloudswitch.com>, Li Qiang <liq3ea@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cheolwoo Myung <cwmyung@snu.ac.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 3:32 PM, Peter Maydell wrote:
> On Sun, 18 Apr 2021 at 06:30, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
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
>> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
>> BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
>> Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")
>> [PMD: Reworded description, added more tags]
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Supersedes: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
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
>> ---
>>  hw/scsi/mptsas.h | 1 -
>>  hw/scsi/mptsas.c | 4 ----
>>  2 files changed, 5 deletions(-)
> 
> This fails to compile:
> 
> ../../hw/scsi/mptsas.c: In function ‘mptsas_free_request’:
> ../../hw/scsi/mptsas.c:254:18: error: unused variable ‘s’
> [-Werror=unused-variable]
>      MPTSASState *s = req->dev;
>                   ^
> cc1: all warnings being treated as errors

What a shame... Sorry, v3 coming.



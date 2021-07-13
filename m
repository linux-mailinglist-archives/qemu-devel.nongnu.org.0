Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9093C6EBF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:40:44 +0200 (CEST)
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3FqF-0005Qd-Cl
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3FlE-0000GN-Cb
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3FlC-00055K-2A
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626172528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9eY/7VZEGpalke+qqewQ9gbVCGb9zJzeUsiUN+6C7o=;
 b=gfeYGq8zq9hYythgS0MGzZu1JO1Z/aV+UccV8KZxMkJP6M2quRmSx9ppKQcugYbq06W+j9
 E4OQZ/ICUAtQ+TzPypDqh5iXvVkllOkQOqwwgjv2GcORhDA0J4dC74eCYj7vmfL/lqZWDe
 0hfo21EiL+LSJt4hpMmen78/YFh7coM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-9-mb0W3ANoKrWgHwjyEP_A-1; Tue, 13 Jul 2021 06:35:21 -0400
X-MC-Unique: 9-mb0W3ANoKrWgHwjyEP_A-1
Received: by mail-wr1-f70.google.com with SMTP id
 m9-20020a0560000089b02901362e1cd6a3so8452758wrx.13
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k9eY/7VZEGpalke+qqewQ9gbVCGb9zJzeUsiUN+6C7o=;
 b=gscEUQ5cb1Up9hzxP/5Vm/E0+20VpjrIeDBJWiottQ6I3ibEHZONiUQvvPPwbELZYV
 N++8KqfVFKl+rQDarMEQXbt/oyQ0jHpYCAGzEYLY9Oth+daJGv1ktoMvjGFW6lQIuusc
 0TLfm7Vl27Ib2JViIZVV6QmdyZEBjQ2YxrrCIDxfekd9TWcFXFJ7B7Bu9WzlFJDlrFuv
 SdwmvtixH4ECxnbyuEUSCfm1xWDVkmawn11kIzYYjVNRoQTpZBrD2dNMRqWzaBBq67Be
 YszLJHVNFw5GnskfXnkaId+45WRjohI3rSY4r7SszYQXScRc/GwAZJJvi3FEI2ByMxo6
 RzOw==
X-Gm-Message-State: AOAM5322Tgzi5EdkHSj06BalsT89cvf+ObGFfP/dNdeCG0If2Kvo2TpX
 c8WDOdgmC5ivBfAgo8VfZ8SSx9+kIirkWSndMHkEtsdzqvjxUwZch9SnuhgCx1z3XOeqbYv5olc
 WKUwp8VTFtucs9ZE=
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr19485869wmo.91.1626172520398; 
 Tue, 13 Jul 2021 03:35:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoKrodGNYiQvtdeBHaIFaZ8ULcVCKVR1QwLfEkoHRZsZW4vVk5mdklsNtcdMtlnUfSfxjfvQ==
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr19485850wmo.91.1626172520256; 
 Tue, 13 Jul 2021 03:35:20 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id m7sm2222013wms.0.2021.07.13.03.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 03:35:19 -0700 (PDT)
Subject: Re: [PULL 0/4] OVMF patches for 2021-07-12
To: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210712145630.2857814-1-philmd@redhat.com>
 <CAFEAcA8Epk4WKPj6fjFEPyYrT7FQzMRK1A8rf7hN8Buex6Xmng@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e6299310-4d65-682a-2359-24226c37a349@redhat.com>
Date: Tue, 13 Jul 2021 12:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Epk4WKPj6fjFEPyYrT7FQzMRK1A8rf7hN8Buex6Xmng@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Dov Murik <dovmurik@linux.ibm.com>, Laszlo Ersek <lersek@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 12:25 PM, Peter Maydell wrote:
> On Mon, 12 Jul 2021 at 16:02, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2:
>>
>>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' into staging (2021-07-12 11:02:39 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/philmd/qemu.git tags/fw-edk2-20210712
>>
>> for you to fetch changes up to d1e79210457323b225c369fa00e97577e0d0da95:
>>
>>   MAINTAINERS: remove Laszlo Ersek's entries (2021-07-12 16:55:23 +0200)
>>
>> ----------------------------------------------------------------
>> Patches related to EDK2/OVMF
>>
>> - MAINTAINERS: remove Laszlo Ersek's entries
>> - Introduce X86_FW_OVMF Kconfig symbol
>> - pc_system_ovmf_table_find: Assert that flash was parsed, document
>>
>> ----------------------------------------------------------------
> 
> So, even though this pullreq doesn't seem to be changing gitlab CI
> config, I get a "yaml invalid" failure in the pipeline:
> https://gitlab.com/qemu-project/qemu/-/pipelines/335995843
> 
> "'build-edk2' job needs 'docker-edk2' job but it was not added to the pipeline"
> 
> Any ideas what that's about?

For me this is related to what I tried to fix last year but
couldn't convince Daniel there was a problem. See this thread:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg773939.html



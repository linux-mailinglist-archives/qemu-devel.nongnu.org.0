Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCE4405A58
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:44:08 +0200 (CEST)
Received: from localhost ([::1]:47236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOMDf-0005fe-V9
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mOMBn-0003fQ-BK
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mOMBk-0003SR-Lf
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631202126;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pA4TN4woeGpY/7WNxz/vEeUEu1GLBGhGh6xXbdjjk2M=;
 b=gt5ctnTOqmoum29JReiHMgnd4y74Dx/1RC8s6NKEaWeYsEeHR9pFAzfdnI+EeuOuk00TNZ
 qGBRnKlCR4+jHRs2mp3x+u74UIIzkgbkRsO9sb6m/Xi4pTFRtIFD26gtjZMX1jWAv7mf/z
 WiJgZZPwd3eSSbyQn9gPjZnkY0BbroI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-kuf4jKo_MaW2Zt1tXgFJXQ-1; Thu, 09 Sep 2021 11:42:03 -0400
X-MC-Unique: kuf4jKo_MaW2Zt1tXgFJXQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 h1-20020adffd41000000b0015931e17ccfso646251wrs.18
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 08:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=pA4TN4woeGpY/7WNxz/vEeUEu1GLBGhGh6xXbdjjk2M=;
 b=ZCuFoB/M4x2Dps6gZ4+jJX1m4dgnGTDa+eUo8xDAQpeTEITbfIr9+C+pomWNt0q3GH
 Jf9bPPV1gtzinwBdPblrsAX+RP8HBjnRxj9J2WEmemuAjlVOHQ7zIKTZzU7L+DJsj2YK
 8Kl52urGaCnOnzGTAKF6LL2jLtJvWlIgm9YpMVyXo4NRF/A0Cg0v8RLrmklHtCXK0qL6
 CIbi6ezolbcHNuOpxmJfWsBZAavvmTxBvvRmQaKjhbH9OXbpuRBmwqAFY3Zzmjdb0vBQ
 mxPkA5pQqIX+rL1jtnYJkk24CRJYGacXRTomgYr3WYCeVrG1LQHvmgsr0Mmip7aanWd6
 jVkw==
X-Gm-Message-State: AOAM533C4riv0ZMsN8gRwESMa9s2pQwtGBvu/QmE/UBIyZltL+WzLqbB
 UduCh/hMBtnbi97FoPo2uPfKtJSZB4nTwve3EwD1SXJagRQnRiqIi8PG9gubVOf1CS1Wj1fLqbo
 yoWi1VaTEgvDxSjw=
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
 m14mr3590559wmq.186.1631202122111; 
 Thu, 09 Sep 2021 08:42:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGtfQnBU7xf4uZDlJR8osO/pITAfT91zKVQto7Uor/+U00132IGswE/EW08js2h8fy/0mDdA==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
 m14mr3590536wmq.186.1631202121951; 
 Thu, 09 Sep 2021 08:42:01 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id l16sm2374496wrh.44.2021.09.09.08.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 08:42:01 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
To: Andrew Jones <drjones@redhat.com>
References: <20210906123139.93593-1-eric.auger@redhat.com>
 <20210908091404.ov2ku6t3dl6s2ui3@gator>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <bfd8f1d1-3b36-15d3-23a5-a6da53928d2d@redhat.com>
Date: Thu, 9 Sep 2021 17:41:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210908091404.ov2ku6t3dl6s2ui3@gator>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.975, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, gshan@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, Hongbo Zhang <hongbo.zhang@linaro.org>,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 Leif Lindholm <leif@nuviainc.com>, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 9/8/21 11:14 AM, Andrew Jones wrote:
> On Mon, Sep 06, 2021 at 02:31:36PM +0200, Eric Auger wrote:
>> This series generates the ACPI DBG2 table along with machvirt.
>> It applies on top of Igor's
>> [PATCH v2 00/35] acpi: refactor error prone build_header() and
>> packed structures usage in ACPI tables
>>
>> The DBG2 specification can be found at
>> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.
>>
>> DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
>> behind is Windows requires it on all systems).
>>
>> The DBG2 is used to describe a debug port, used by the kernel debugger.
> Hi Eric,
>
> Did you test this in some way with a Linux guest?

no, I don't know how to test it functionaly. As I diff'ed against
sbsa-ref generated table maybe guys using the sbsa-ref have some proper
testing use case of it? Adding Hongbo and Leif in CC.

Thanks

Eric
>
> Thanks,
> drew
>
>> This series and its dependency can be found at
>> https://github.com/eauger/qemu.git
>> branch: dbg2-v2-igor-v2-fix
>>
>> History:
>> v1 -> v2:
>> - rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
>>   and build_append_int_noprefix()
>>
>> Eric Auger (3):
>>   tests/acpi: Add void table for virt/DBG2 bios-tables-test
>>   bios-tables-test: Generate reference table for virt/DBG2
>>   hw/arm/virt_acpi_build: Generate DBG2 table
>>
>>  hw/arm/virt-acpi-build.c  |  64 +++++++++++++++++++++++++++++++++++++-
>>  tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
>>  2 files changed, 63 insertions(+), 1 deletion(-)
>>  create mode 100644 tests/data/acpi/virt/DBG2
>>
>> -- 
>> 2.26.3
>>



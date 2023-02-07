Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17CF68DA3A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:14:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOiQ-00009a-BL; Tue, 07 Feb 2023 09:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOiM-00008u-Kr
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:12:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOiK-0003PB-Dq
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675779171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tf90iYsbA2tTlNxoKXvxtMh5klez5zJLxDeO08WzgIs=;
 b=MF5HZ+orJp9Jw2/R4Fh+K8A2KzuWwuXUJL5I3+JAmUnx1SSStVdF47qfvXWnKZtqlh4Amr
 yk641lBluYZmJM6ZtcPTvvvVtDa05MNYJ6GBemrS7VvP85JPXEhjiVTyEMH37viJ4r2HTG
 PWAV0G3WDEbPwDE0Xe1V9rKbnajdgdU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-JlmnP1WSO_iR8CTq6p62Yg-1; Tue, 07 Feb 2023 09:12:50 -0500
X-MC-Unique: JlmnP1WSO_iR8CTq6p62Yg-1
Received: by mail-qt1-f199.google.com with SMTP id
 cr22-20020a05622a429600b003b694a9f291so8571386qtb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:12:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tf90iYsbA2tTlNxoKXvxtMh5klez5zJLxDeO08WzgIs=;
 b=ojI0FECiEa7ub85bjKJqCpkDERWxMXx4qHROMY2lMFVLJjzGFH77faaN+rGwEbT0+Z
 Kv/+3lDSxpk28vxfDZ/Ce6I4PWA6a0QnWiOSulIabjqmXO9s7kSecT18XxMLZheEhMYQ
 WzPUobzCzL1wy8V7smVCYacJ7SUBL8ut1Q4P71DjJGnArT5kEvK4K3el7JAuSVoSUbU9
 JcHUmmWQOSRu2k873AZgujo3gwKl7YZoCKgqTmT85g/DR+THRN5SI9eEyaKU/N4MjI6H
 0LT7E7d9gJRfloF8Y+szdCbclQSZId8fR9IkrLFi/J04h+fEig+mJBGWz1Mu9eHbjoDC
 B6Tw==
X-Gm-Message-State: AO0yUKWvBUH5xFsSvRw74I12blS2AN1LB6jK7wQF3Pt8IlAREfLtQjVi
 xeV7RIEKqnpSEyLEfDyvs6ScFR68htwvn/dkLChVB6m4C8X33I7GiG7XDcoRbAGFF8cl72+jkMt
 5Ndq3Nbty9WXM4z4=
X-Received: by 2002:a05:6214:260a:b0:56a:7a8d:37fe with SMTP id
 gu10-20020a056214260a00b0056a7a8d37femr5361464qvb.43.1675779169637; 
 Tue, 07 Feb 2023 06:12:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8jmwukdVyzNF5C7XMqxIiuPIQLGMjU9y8PmTLvPM4mWO6bWl8UDMnyTc1SyuTG68XfqZcZQw==
X-Received: by 2002:a05:6214:260a:b0:56a:7a8d:37fe with SMTP id
 gu10-20020a056214260a00b0056a7a8d37femr5361425qvb.43.1675779169383; 
 Tue, 07 Feb 2023 06:12:49 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 b6-20020a379906000000b007186c9e167esm9508420qke.52.2023.02.07.06.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:12:48 -0800 (PST)
Message-ID: <52435c65-9ed6-f7c3-c9c8-907883700f2d@redhat.com>
Date: Tue, 7 Feb 2023 15:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 02/12] tests/qtest: Do not run lsi53c895a test if device
 is not present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-3-farosas@suse.de>
 <c612ab5f-157b-264b-31e5-94b16b3c30b3@redhat.com> <878rh9o9o9.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <878rh9o9o9.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/02/2023 15.02, Fabiano Rosas wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 06/02/2023 16.04, Fabiano Rosas wrote:
>>> The tests are built once for all the targets, so as long as one QEMU
>>> binary is built with CONFIG_LSI_SCSI_PCI=y, this test will
>>> run. However some binaries might not include the device. So check this
>>> again in runtime.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>>>    tests/qtest/fuzz-lsi53c895a-test.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
>>> index 392a7ae7ed..a9254b455d 100644
>>> --- a/tests/qtest/fuzz-lsi53c895a-test.c
>>> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
>>> @@ -112,6 +112,10 @@ static void test_lsi_do_dma_empty_queue(void)
>>>    
>>>    int main(int argc, char **argv)
>>>    {
>>> +    if (!qtest_has_device("lsi53c895a")) {
>>> +        return 0;
>>> +    }
>>
>> I'm a little bit confused right now ... We're already checking
>> CONFIG_LSI_SCSI_PCI in meson.build, and we're only adding the test to
>> qtests_i386 there ... so how did you end up in a situation where you needed
>> this change?
> 
> I building with
> --target-list=i386-softmmu,x86_64-softmmu,aarch64-softmmu,arm-softmmu
> and the arm machines are selecting the CONFIG
...
> hw/arm/Kconfig has:
> 
> config REALVIEW
>      ...
>      select LSI_SCSI_PCI

Ah, right, thanks for the explanation, I missed that some machines have this 
device built in this way. Ok, patch makes perfectly sense now:

Reviewed-by: Thomas Huth <thuth@redhat.com>



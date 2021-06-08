Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC7239F316
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:57:19 +0200 (CEST)
Received: from localhost ([::1]:53638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYU2-0003Ui-75
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqYLv-0004uE-Pd
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqYLt-0006pC-TF
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623145733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztjOwBWVWRcLBeGlv9kV0M01VSWdGwRS4cSf3jXheyY=;
 b=IB9eyaAH8+gMBFSz/8YSt8yiwBDX0+yk4zxYzzjjorFq6jSnFKxOcxPmcBVx6YXT3c4O+r
 kqRsEpVWW9UKqBWcFsLRg8bpkNvlp3o1VYxkII/0mB63/1dahwCh5B/y7+BhFgsG+PlD9m
 FuTTxHjTHU1eMUffXeASEbHhsIY/dQ4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-FQkDKMAeOraOIBl3t82RvQ-1; Tue, 08 Jun 2021 05:48:49 -0400
X-MC-Unique: FQkDKMAeOraOIBl3t82RvQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 t14-20020adfe44e0000b029011851efa802so9153495wrm.11
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ztjOwBWVWRcLBeGlv9kV0M01VSWdGwRS4cSf3jXheyY=;
 b=VylbYmCs5elKBuuNo8GuiogwqssP2WaDiioXVvKy2MizRpbBhfpeRA5EjGolbKPYH+
 k/zY/+tb9VHML9z/pySmldIxBGqSsx3c6mqKGLjSwwn8UjMQp8phfv3BEpozI+rZsL8+
 r416xhcn62hCRzzGq+iCfL2EEz/aOjsy/4hZ3O43N2LrSX50Eykry8uOVXD4YADs4IC8
 cBHVBPyiyB0ZoKVGAvVsP3tj55jbR+qA6NXHOaVi+jYKaJGRvNdFwN8qL+Ibjx/R7NR1
 AG3bRlzrsnaOsMXz1WZVWn7+syRrhWMCogFxfW3PR9UyIT6Dp/Te42dv8ujeL6cwWaVt
 4eHg==
X-Gm-Message-State: AOAM532CWAmcaF0mVPnYlVcgKIk5MiPUZHAIRQDAMTfckLtLWuIZqU9J
 xfNGHuRSv5ayyut41ygN88oqVi6Unofvn+O79q7C+J7LfGzdYi4c3kSd7+TBdPo99gRpTP2Lk3V
 XsPEGQXL8a44JNtg=
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr7725731wrt.281.1623145728692; 
 Tue, 08 Jun 2021 02:48:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOGbPvTFl5ww25elABEHXjRB2EHWNhddvCsqDnWfFIbxCtToqSdyInTKiTRQb5pl6/UPaeNw==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr7725702wrt.281.1623145728442; 
 Tue, 08 Jun 2021 02:48:48 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id z188sm17739635wme.38.2021.06.08.02.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 02:48:48 -0700 (PDT)
Subject: Re: [PATCH v16 03/99] qtest: Add qtest_has_accel() method
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-4-alex.bennee@linaro.org>
 <088d554c-ef63-0f79-cedb-bdc89b532490@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7410b765-7252-3d19-af96-399fd34d94dc@redhat.com>
Date: Tue, 8 Jun 2021 11:48:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <088d554c-ef63-0f79-cedb-bdc89b532490@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 3:16 PM, Thomas Huth wrote:
> On 04/06/2021 17.51, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Introduce the qtest_has_accel() method which allows a runtime
>> query on whether a QEMU instance has an accelerator built-in.
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210505125806.1263441-4-philmd@redhat.com>
>> ---
>>   tests/qtest/libqos/libqtest.h |  8 ++++++++
>>   tests/qtest/libqtest.c        | 29 +++++++++++++++++++++++++++++
>>   2 files changed, 37 insertions(+)

>>   +bool qtest_has_accel(const char *accel_name)
>> +{
>> +    bool has_accel = false;
>> +    QDict *response;
>> +    QList *accels;
>> +    QListEntry *accel;
>> +    QTestState *qts;
>> +
>> +    qts = qtest_initf("-accel qtest -machine none");
>> +    response = qtest_qmp(qts, "{'execute': 'query-accels'}");
>> +    accels = qdict_get_qlist(response, "return");
>> +
>> +    QLIST_FOREACH_ENTRY(accels, accel) {
>> +        QDict *accel_dict = qobject_to(QDict, qlist_entry_obj(accel));
>> +        const char *name = qdict_get_str(accel_dict, "name");
>> +
>> +        if (g_str_equal(name, accel_name)) {
>> +            has_accel = true;
>> +            break;
>> +        }
>> +    }
>> +    qobject_unref(response);
>> +
>> +    qtest_quit(qts);
>> +
>> +    return has_accel;
>> +}
> 
> This spawns a new instance of QEMU each time the function is called -
> which could slow down testing quite a bit if a test calls this function
> quite often. Would it be feasible to cache this information, so that you
> only have to run a new instance of QEMU once?

Good idea!



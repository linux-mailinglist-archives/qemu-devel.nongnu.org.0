Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C442D2EF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 08:50:00 +0200 (CEST)
Received: from localhost ([::1]:56710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mauYx-0002Rk-Ov
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 02:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mauUw-00063e-2W
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 02:45:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mauUt-0003iN-Tb
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 02:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634193946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/m/xkFblJzH81qDW36S/vvVqfgBTJBPlfowz+hYf2Kg=;
 b=DUY0pflWrPh6VUpFV2yIHLF1Og5//NllSUk5N3tjt5uFBSw1wJKzBsP+OziHjrJTu9cujZ
 bbDThlaBK0nXZ+DFECLARmHkhYQxviLSXo7xJRKLKU1HZCIH48tUchEo/HOdmhdhvQRyxN
 Uu54cpomGDuqNK+bOh+9pCOijdcMBTE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-xUoUrhgRPJiqJCk_wp45fA-1; Thu, 14 Oct 2021 02:45:44 -0400
X-MC-Unique: xUoUrhgRPJiqJCk_wp45fA-1
Received: by mail-wr1-f71.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so3744107wrc.22
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 23:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/m/xkFblJzH81qDW36S/vvVqfgBTJBPlfowz+hYf2Kg=;
 b=5R4uBt1av5PPfSQUleDJp0DlMkJl1o3rTyyeHiwxCUkMs0FH2AQV13Maq3Q5XtSb0c
 pc5T/dIbGL/B9OlG99gOVw8f0SU4yKpsCTbypRktM/vA2r7HkHCyJtZikUSxDN+B3U2v
 ek41NoEKW7Ckj36DWIaDAXaD2fcEHQ3o/cVMzbMlM2HM5tpkxHGkX8H4qOeUa6ef32im
 bhTkgMLkdlOZXcgittmgGj1HAgiAZt+lP65mAlGgxWfMLqvWcLMdGwNB8qAOPvOr8Yxu
 KP660w1tUEe4iieIFg4hXuocJb+wtGG4tIKfm+a/j3Lc8XzqNQUo+K465kE/E46bDdwM
 /fpA==
X-Gm-Message-State: AOAM53167/ezko/DGCQpQVF//7jGyRPZYBZaYkcxe9vXosXFkuaz2kLT
 pMwYmwJxmup6yjVGsMzDroDOIZqrtwdUaQpNpKSjx+pAI4XaOlWo51IM7UvyXMbPYIPnvz00hoR
 nzEzHMWceObCiiNQ=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr74013wmc.176.1634193943613;
 Wed, 13 Oct 2021 23:45:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiuz2UFURNyHdA1+lMbyqqfNMmcar9SsXArDVWpW3zM3/ggygTPN7nusgO2KfIV/Ai5gsP4A==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr73991wmc.176.1634193943385;
 Wed, 13 Oct 2021 23:45:43 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id q12sm6923055wmj.6.2021.10.13.23.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 23:45:42 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210811095949.133462-1-thuth@redhat.com>
 <CAFEAcA_t48rMSX7SKnJNNMPXPmKpy12iXc2N41EywTBYfapKtg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest/vhost-user-blk-test: Check whether
 qemu-storage-daemon is available
Message-ID: <e45f67c4-70c5-3891-4b8d-dfbff8dc6f3e@redhat.com>
Date: Thu, 14 Oct 2021 08:45:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_t48rMSX7SKnJNNMPXPmKpy12iXc2N41EywTBYfapKtg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/08/2021 13.08, Peter Maydell wrote:
> On Wed, 11 Aug 2021 at 11:00, Thomas Huth <thuth@redhat.com> wrote:
>>
>> The vhost-user-blk-test currently hangs if QTEST_QEMU_STORAGE_DAEMON_BINARY
>> points to a non-existing binary. Let's improve this situation by checking
>> for the availability of the binary first, so we can fail gracefully if
>> it is not accessible.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/qtest/vhost-user-blk-test.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
>> index 8796c74ca4..6f108a1b62 100644
>> --- a/tests/qtest/vhost-user-blk-test.c
>> +++ b/tests/qtest/vhost-user-blk-test.c
>> @@ -789,6 +789,14 @@ static const char *qtest_qemu_storage_daemon_binary(void)
>>           exit(0);
>>       }
>>
>> +    /* If we've got a path to the binary, check whether we can access it */
>> +    if (strchr(qemu_storage_daemon_bin, '/') &&
>> +        access(qemu_storage_daemon_bin, X_OK) != 0) {
>> +        fprintf(stderr, "ERROR: '%s' is not accessible\n",
>> +                qemu_storage_daemon_bin);
>> +        exit(1);
>> +    }
> 
> It makes sense not to bother starting the test if the binary isn't
> even present, but why does the test hang? Shouldn't QEMU cleanly
> exit rather than hanging if it turns out that it can't contact
> the daemon ?

Sorry for the late reply: I think this happens due to the way we run that 
qtest: The test program forks to run the storage daemon. If that daemon 
binary is not available, or exits prematurely, the original program does not 
notice and hangs. Maybe we should intercept the SIGCHLD signal for such cases?

  Thomas



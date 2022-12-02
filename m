Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD036407B0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 14:31:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p168J-0006nT-0G; Fri, 02 Dec 2022 08:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p1687-0006n6-R2
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:31:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p1685-0006k4-R1
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669987861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9VvcTjW89utnJqEO2e6kKo0qFnbMnxEuf1HBRgQM/bU=;
 b=g1yuGyHaor/fBdGexyA3CqJoYAzeGcqLaFJuEZS367pnoL83Nf9V4j4084bV/e3dmx/Nnu
 yTAlaLYU3ml4Y3cyH4+GGZPHpT1QEAPmfZ6olaF9eD0ZAkOS77kkMpUkokLXyFUMMPCIw5
 FnxJ2a0dNZWmXTmV1YXYlyTtKsbN5xs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-9Pz_ygiTM72LUIcT98dw-w-1; Fri, 02 Dec 2022 08:30:57 -0500
X-MC-Unique: 9Pz_ygiTM72LUIcT98dw-w-1
Received: by mail-wr1-f72.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so1082775wra.13
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 05:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9VvcTjW89utnJqEO2e6kKo0qFnbMnxEuf1HBRgQM/bU=;
 b=Ijj8BntEh1dJT7+diJBNF4BaR1mtJ/qWLClhT8UaWb18T2fuRLT/yst5A5mW0oiyLM
 dvRcUSlh3sIIrjZ3uTh5UkTVEFMHVoOSEjq8ssfn7ghKoEzz6SsCDFQ73DrtSbDNAHDA
 7Ydsky1nzPpEBg5WF1VCCnJpMgJfOp5pO1pwDdmvX+0ovRGQ4Wm1gTt13Z691A7qP5Yo
 CH4G/PPuNz2roOEJjIjsO08SjiRMwGjQZ7T5Ikvqmp2FnBam8jdz6B3Ot5Nwke7XiIYi
 tPPZiGzDF4heMCwTtXLaUvvdfxDTQ5wB0gyhlFa4LKGq41fl7ftWG09kRusGN2txQccS
 mrbA==
X-Gm-Message-State: ANoB5pnZjFEBIWY9ciq0fEth5w/J9ykdZgWVdLWWQlsajq9mNWQBrZQg
 7nhvfT4aZPQaVYec7qt+zAUSxU9OU6+mfcHayHQJI/ILvejVjxjOqwb6CYI1Ib5nTkgk0D7N7//
 D52xaEWiwtVS6mag=
X-Received: by 2002:a5d:4dd2:0:b0:242:451c:1c35 with SMTP id
 f18-20020a5d4dd2000000b00242451c1c35mr1877596wru.463.1669987856471; 
 Fri, 02 Dec 2022 05:30:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf41JFNT2ztZdRS8ScV+2WCM80EEDCtvnEEfdCV3WuaH6aVskp/1k4bRKM/GnGzK/jszuIi+XA==
X-Received: by 2002:a5d:4dd2:0:b0:242:451c:1c35 with SMTP id
 f18-20020a5d4dd2000000b00242451c1c35mr1877581wru.463.1669987856178; 
 Fri, 02 Dec 2022 05:30:56 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-86.web.vodafone.de.
 [109.43.178.86]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b003cfd64b6be1sm16892680wmo.27.2022.12.02.05.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 05:30:55 -0800 (PST)
Message-ID: <b88d2c24-d2da-123b-d219-8c3ce9bf14c5@redhat.com>
Date: Fri, 2 Dec 2022 14:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/vhost-user-blk-test: don't abort all qtests
 on missing envar
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Coiby Xu <coiby.xu@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <E1oybRD-0005D5-5r@lizzy.crudebyte.com>
 <2ff3f1f2-ac25-294c-c994-78474fa5eab4@redhat.com>
In-Reply-To: <2ff3f1f2-ac25-294c-c994-78474fa5eab4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01/12/2022 12.03, Thomas Huth wrote:
> On 25/11/2022 16.58, Christian Schoenebeck wrote:
>> This test requires environment variable QTEST_QEMU_STORAGE_DAEMON_BINARY
>> to be defined for running. If not, it would immediately abort all qtests
>> and prevent other, unrelated tests from running.
>>
>> To fix that, just skip vhost-user-blk-test instead and log a message
>> about missing environment variable.
>>
>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> ---
>>
>>   I also tried g_test_skip(errmsg) from the setup handlers instead, but it
>>   always caused the tests to abort with an error:
>>   ../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process
>>   but encountered exit status 1 (expected 0)
>>   I haven't further investigated.
>>
>>   tests/qtest/vhost-user-blk-test.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/qtest/vhost-user-blk-test.c 
>> b/tests/qtest/vhost-user-blk-test.c
>> index 07a4c2d500..dc37f5af4d 100644
>> --- a/tests/qtest/vhost-user-blk-test.c
>> +++ b/tests/qtest/vhost-user-blk-test.c
>> @@ -983,6 +983,12 @@ static void register_vhost_user_blk_test(void)
>>           .before = vhost_user_blk_test_setup,
>>       };
>> +    if (!getenv("QTEST_QEMU_STORAGE_DAEMON_BINARY")) {
>> +        g_test_message("QTEST_QEMU_STORAGE_DAEMON_BINARY not defined, "
>> +                       "skipping vhost-user-blk-test");
>> +        return;
>> +    }
> 
> Could we use g_test_skip() here?

Maybe I should also read the lines between "---" and "diff", sorry!

Would be interesting to know why it does not work, though, anyway, for this 
patch here:

Reviewed-by: Thomas Huth <thuth@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA9A4B152F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:24:01 +0100 (CET)
Received: from localhost ([::1]:36454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIE6p-00082U-Lg
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:23:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nICHf-0006j9-DG
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:27:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nICHd-0004bA-3O
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644510420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g95KYrKRdRpa+tHVsL89COL0CIN63tlOLkBjS1NDNPQ=;
 b=BtQs6//OI7teuajwqUtJ0DR0ly+pI0m5yhrfKFPNnXDn81Xyb+OH8K4oDvA9NbTHifFfe/
 Jjv9szdcblBUx8mYH2nKJBw8YVTkGZiBo8gq3yseFNSaM7IhS15EqpGthxLT+M6V9MnHta
 p89VJuqua7P+C21Z85TtJTTpHcbIVIM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-VJi0pQWbOuOZURzGredM6Q-1; Thu, 10 Feb 2022 11:26:59 -0500
X-MC-Unique: VJi0pQWbOuOZURzGredM6Q-1
Received: by mail-qk1-f198.google.com with SMTP id
 d11-20020a37680b000000b0047d87e46f4aso3919942qkc.11
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 08:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g95KYrKRdRpa+tHVsL89COL0CIN63tlOLkBjS1NDNPQ=;
 b=rkDjvkugZvt6IFfjQFXCJ2xXUXglAthXaebaaJwktBACj31HQS4P9A0wYaOXq0m3cJ
 FLrIioQNv8T0A3JCKYafmcd4k+DJjUTrdP1v49+0fpL+TeyTTp9eZTDEPc0rysfsueVp
 HKWJ6HdaSdMYJpEYUtQFlzmH9hNTTRLU4/BotKFhGGcznxilDXD58hE9bvkOg4UJsduu
 bJAB2g06sc5P9DTLx9sLyf6bF8P2K38V1diE4W04kwgpxQFxCvShD995c4vzckeMBpLT
 MWH6yIdUW4Y4q0tQ+rD4PDi8ht6uNZv4ppxfrS8jGMl4nBndtxd0sOlYesG4ermFSqFB
 KZBA==
X-Gm-Message-State: AOAM530qbPdojYnpSPgobWbByFnqbCFBBYyaC/ipUCP9IHE9ooAxQuTv
 ksHqzdlu9F35wRMVKU9rqVCbTZ9kEziy/+BNDpJDzXUA8Pz3wExKR02hB5elamdrFBPakKCZt+D
 6H6oJAW4dDuRa1HQ=
X-Received: by 2002:a37:6604:: with SMTP id a4mr4206214qkc.410.1644510418800; 
 Thu, 10 Feb 2022 08:26:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT7FhrBzEhBu1DUVjB1+6sIGUczHFWFNtv7HtOjmtQYDsYWO3b8CXVoDqaSIjWz5ZWzE+rhQ==
X-Received: by 2002:a37:6604:: with SMTP id a4mr4206192qkc.410.1644510418599; 
 Thu, 10 Feb 2022 08:26:58 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id t15sm5124159qkp.48.2022.02.10.08.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 08:26:56 -0800 (PST)
Message-ID: <8607b985-22a9-c256-af1f-ff3ba250701f@redhat.com>
Date: Thu, 10 Feb 2022 17:26:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 02/20] job.h: categorize fields in struct Job
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-3-eesposit@redhat.com>
 <YgUx60M7dB+VLi3p@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YgUx60M7dB+VLi3p@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/02/2022 16:40, Stefan Hajnoczi wrote:
> On Tue, Feb 08, 2022 at 09:34:55AM -0500, Emanuele Giuseppe Esposito wrote:
>> Categorize the fields in struct Job to understand which ones
>> need to be protected by the job mutex and which don't.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  include/qemu/job.h | 59 ++++++++++++++++++++++++++--------------------
>>  1 file changed, 34 insertions(+), 25 deletions(-)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index d1192ffd61..86ec46c09e 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -40,27 +40,50 @@ typedef struct JobTxn JobTxn;
>>   * Long-running operation.
>>   */
>>  typedef struct Job {
>> +
>> +    /* Fields set at initialization (job_create), and never modified */
> 
> Is there a corresponding "Field protected by job_mutex" comment that
> separates fields that need locking?
> 

That would be the comment

    /** Protected by job_mutex */

situated right after the field "ProgressMeter progress;".

Do you want me to change it in "Fields protected by job_mutex"?

Thank you,
Emanuele



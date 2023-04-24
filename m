Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4540E6EC69F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 08:57:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqq7e-0000m9-Br; Mon, 24 Apr 2023 02:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqq7a-0000lh-9G
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 02:56:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqq7Y-0003hU-Og
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 02:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682319377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+5553P875Ish8sLCIWq73ZeI9sJi8j2ZJpWYHoYf24=;
 b=SOjfAJNA/YuRQLTo2vWNv6RxjV2NjlLLyDKz6eCgJmCYqdVxbbMubhb3yNyH1+D/wF2kBQ
 aOk8Lm7zK9WEjOKQ2jbe7+JOpo25s1xfG4pSk16TS/vQ6YOrRaQIKX6i6N/jsbTg8UltX4
 w3rmK7b8rZ8gcjTBI/Sa1xVFJLYaf48=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-fsVrGrk3OgWMymIegONJUg-1; Mon, 24 Apr 2023 02:56:15 -0400
X-MC-Unique: fsVrGrk3OgWMymIegONJUg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e32aso1416280f8f.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 23:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682319374; x=1684911374;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R+5553P875Ish8sLCIWq73ZeI9sJi8j2ZJpWYHoYf24=;
 b=cicgQf9MAcEeYAgClrHfse3JSqe27Beh0IDuTVBf84ew0Gne7YRAQpixNKN58vD4J7
 Qlskacpq0cK5KNAfIr/do2ZMwSMjprWMAycnVUGqoi527D6RDdgoj/K6u5z0GZesXvCj
 J3SK1YZGewc0/ICzwPXwGcWQUBDLG532tKZCIQ3PxSSK88yIcuZXf4RYszabRnbwCaCj
 yx8Tz5lqzW54zFzh4wTDmFZuITOijA7EvKcReDztBBmrfAI2vGeFNNh3B5LEiih9A23A
 8dXY1oqQjG/OxD9xkwAVPk21qbgFdOrDCxxkUU1Eja5o6Z+GUkeiICrWObN/r/HR14pb
 xyIg==
X-Gm-Message-State: AAQBX9eJrqrTh4Lt9lpMTgKGX3E95L9Y6lr0UWt8eimf611LQrnmqrMk
 lLSybZm6XxZ3AfU/Y7Ck1Ky3JDzoSYT7D4T2+sMx8ZOOllUCWWr7a+Iiz6g+hAZ/XJ+jmooO+GM
 IabaDsxIn0e02pwM=
X-Received: by 2002:adf:ec02:0:b0:2fb:aa2f:3e50 with SMTP id
 x2-20020adfec02000000b002fbaa2f3e50mr8437743wrn.59.1682319374563; 
 Sun, 23 Apr 2023 23:56:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350YFKuAuYxE20K0Qp3FqtUW7TmTvfXKc3Cyl/Gl8DUgWuf5U89HiGnE0W4mhFdj5BaVbHReHTw==
X-Received: by 2002:adf:ec02:0:b0:2fb:aa2f:3e50 with SMTP id
 x2-20020adfec02000000b002fbaa2f3e50mr8437733wrn.59.1682319374326; 
 Sun, 23 Apr 2023 23:56:14 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-102.web.vodafone.de.
 [109.43.178.102]) by smtp.gmail.com with ESMTPSA id
 z14-20020a5d4d0e000000b002efb4f2d240sm10072195wrt.87.2023.04.23.23.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 23:56:13 -0700 (PDT)
Message-ID: <2262e333-0d18-2358-310f-dfadb8da0ee2@redhat.com>
Date: Mon, 24 Apr 2023 08:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 6/6] tests/migration: Only run auto_converge in slow
 mode
Content-Language: en-US
To: quintela@redhat.com, "Zhang, Chen" <chen.zhang@intel.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Li Zhijian <lizhijian@fujitsu.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-7-berrange@redhat.com>
 <MWHPR11MB0031E5A085809AEAA22AFB519B669@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87sfcpu8i4.fsf@secure.mitica>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87sfcpu8i4.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/04/2023 07.58, Juan Quintela wrote:
> "Zhang, Chen" <chen.zhang@intel.com> wrote:
>>> -----Original Message-----
>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>> Sent: Saturday, April 22, 2023 1:14 AM
>>> To: qemu-devel@nongnu.org
>>> Cc: qemu-block@nongnu.org; Paolo Bonzini <pbonzini@redhat.com>;
>>> Thomas Huth <thuth@redhat.com>; John Snow <jsnow@redhat.com>; Li
>>> Zhijian <lizhijian@fujitsu.com>; Juan Quintela <quintela@redhat.com>;
>>> Stefan Hajnoczi <stefanha@redhat.com>; Zhang, Chen
>>> <chen.zhang@intel.com>; Laurent Vivier <lvivier@redhat.com>
>>> Subject: [PATCH v2 6/6] tests/migration: Only run auto_converge in slow
>>> mode
>>>
>>
>> What kind of scenario will the qtest open this g_test_init() -m slow to trigger the slow mode?
> 
> The only way that I know is:
> 
> export G_TEST_SLOW=1
> make check (or whatever individual test that you want)

Or even simpler:

  make check SPEED=slow

Or if you want to run the test manually:

  QTEST_QEMU_BINARY=./qemu-system-x86_64 \
  tests/qtest/migration-test -m slow

HTH,
  Thomas



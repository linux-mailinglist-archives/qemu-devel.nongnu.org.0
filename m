Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947115572F3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 08:18:19 +0200 (CEST)
Received: from localhost ([::1]:39048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4GAS-00041K-EN
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 02:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4G6r-0002tS-Ui
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 02:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4G6o-0000cn-8c
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 02:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655964869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0bGDd3Z0rdFUvGSxHGq+P6axjphqaqL8tbCb8KgZiU=;
 b=hVTKv7S6kgQMEOKzQ4wFBp1RZJsdNIF59vGbjE6V+F1pU31fUbpYnr/UGKzpYFnWeWan00
 zVgVrEVnYO3UGBUK9BvXzxGo887j+rrlwCLeUWBxDQjy/YN9ioON5ACeP5buKJWwUSbv3C
 RNrYg2Asr93PUnb5WptepkgFpjxSfzw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438--TxKnwEnO9KzGn2pMpagrw-1; Thu, 23 Jun 2022 02:14:27 -0400
X-MC-Unique: -TxKnwEnO9KzGn2pMpagrw-1
Received: by mail-wm1-f72.google.com with SMTP id
 o3-20020a05600c510300b0039743540ac7so6491474wms.5
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 23:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n0bGDd3Z0rdFUvGSxHGq+P6axjphqaqL8tbCb8KgZiU=;
 b=jbzripZwNUzSsvWC4+nFTQHlqGZw+BnjkJUgwHyQJ1IQ8Tw0nu/MMHQkQIcXWHW4Ge
 LOZoizn8qelWZhGQlKX+tgs/aBvSoBNgodaLmuNcol6XHNhhCoNZSAcfgSVIH96BU4sq
 6/2jgj82uj79sZVE7dDoamVDJSMlpmuslb2B5LjAGFZh7F2BxZb5D2FADyiGbtHZvW2E
 qm83r94UMXjL4OJyqgu42R7neBlQbBgzsHYOhsw2kMOvef8RwK0yMsBvaqCGvUt+JNP1
 fHsgK6PZAYSed/G2wsJLNTYsF3HpuDRkbkaZZDfNGsovKrI8ln0kkOx9PHDfXXKVRtlQ
 jm/g==
X-Gm-Message-State: AJIora8SDWrL7LlaGeg2qJRsuPhTJxqvXRs37FQEcbj8KxLixNOQqKVM
 lPdAAxv9+/T6Uwp9rT/NKTDrTXGCZd2HFXhv0Xv5uNtpaX71owlons4VMSvkVxLP6RGr5EjkN83
 EE71O1q3IU4iAlmc=
X-Received: by 2002:a5d:66c3:0:b0:21b:994a:a6fa with SMTP id
 k3-20020a5d66c3000000b0021b994aa6famr6619732wrw.15.1655964865958; 
 Wed, 22 Jun 2022 23:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uEswK81M9gSMukbABK8EAsbOih/+3CQ3F/wZ0ZXXGaIekud/CBTSxDpEmkM6U3/ftTUXaDUg==
X-Received: by 2002:a5d:66c3:0:b0:21b:994a:a6fa with SMTP id
 k3-20020a5d66c3000000b0021b994aa6famr6619713wrw.15.1655964865726; 
 Wed, 22 Jun 2022 23:14:25 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-18.web.vodafone.de.
 [109.43.177.18]) by smtp.gmail.com with ESMTPSA id
 q7-20020adf9dc7000000b0020cdcb0efa2sm14977715wre.34.2022.06.22.23.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 23:14:25 -0700 (PDT)
Message-ID: <3dfbe8c9-c6f3-0588-c955-c0e25803299b@redhat.com>
Date: Thu, 23 Jun 2022 08:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] fuzz: only use generic-fuzz targets on oss-fuzz
Content-Language: en-US
To: Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
References: <20220622155028.2086196-1-alxndr@bu.edu>
 <m2sfnwk7nl.fsf@oracle.com> <20220622162635.eacnjindlfolsoqe@mozz.bu.edu>
 <m2pmj0k612.fsf@oracle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <m2pmj0k612.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/06/2022 18.38, Darren Kenny wrote:
> On Wednesday, 2022-06-22 at 12:28:40 -04, Alexander Bulekov wrote:
>> On 220622 1703, Darren Kenny wrote:
>>> Hi Alex,
>>>
>>> This looks good to me, so:
>>>
>>> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
>>>
>>> But, if it is at all possible to use Bash glob in a '[[ ... ]]' test
>>> such as:
>>>
>>>    if [[ $target == generic-fuzz-* ]]; then
>>>
>>> that might read better - but it seems the default is that we don't
>>> assume that, or am I wrong? (This is probably a question for others on
>>> the CC-list)
>>
>> That sounds good to me. Should we change the script to #!/bin/bash, to
>> be safe?
> 
> If it is acceptable to use the '[[ ... ]]' syntax then you'd definitely
> want to ensure that it is bash that is used.

This is not a script that has to run on arbitrary host types, so I think 
it's OK to change the shebang line to use bash here.

  Thomas



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B556399BBC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 09:40:21 +0200 (CEST)
Received: from localhost ([::1]:49110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lohxk-0006hP-BP
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 03:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lohwH-0005si-9r
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lohwB-0004UT-VF
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622705921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3xlrkxbjl76Zdl98exJ1Fl8WJSrJCtgh2baTRVVano=;
 b=BGXOeRfmKb7wYB7wQlqzRl04bYM8K+/DFxrbLmU0p3GkX9UnIBS7d5SUXRgvubd2o/Z24V
 8WEw/KW9iKy49DDpOri3oaA0sz0hCUES2rWB9aP1RKJ5BEgOcG4hz3UKZqLLbcZKCtQV4E
 Rsx2EJT71oh+KQX/ByNCkXTqUlbZCIA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-H5Fv_UHfPUWhV_94OYTWlA-1; Thu, 03 Jun 2021 03:38:37 -0400
X-MC-Unique: H5Fv_UHfPUWhV_94OYTWlA-1
Received: by mail-ed1-f70.google.com with SMTP id
 m16-20020a0564024310b029039182495fb1so552593edc.16
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 00:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b3xlrkxbjl76Zdl98exJ1Fl8WJSrJCtgh2baTRVVano=;
 b=f/CjQ4/nfCVvHHGw6uwXk+4SLZnG70sFRK4JwW17F817XqRIfnMJniodhQ3dyLObL8
 IcBt70Ks/DpbRG5ZGC7UAUtnku7894VDatkQM2nvYFYso/jQXZzlK0hv1beCFNh4Vuf3
 1kyreV5h0XCH1okAbpuO7XS+DALUq9eCr6UpeCEQORVs7O6hP467LrpdX15xKxV94p0k
 WPGTcmaQbE0aHp3m/NgWfMk7GUBRmVl0bHEwfpsBzLmeHNtMns4rKva/QPP8ulvhIXxm
 Jmfisn+kiOtqd3cGjTbrRsfscbQlh5UJIJ7lYd+W6cmemc2Abw5dsL6h1sFLxW+P7pmR
 1dng==
X-Gm-Message-State: AOAM531pI8E8mkABkvrThN1Cy4vJuzY1ZTCLt81Tb/jqA1bkcDVmoADC
 D9J/t4iHQDXW+mIBdoPNzn1AKBBMP32h2GDPJa2y3RZTCXnoXRGggYITiKBSC+dVzdOvR6nLAlD
 H8U+F/lGA9SW/Ej4=
X-Received: by 2002:a17:906:f9d1:: with SMTP id
 lj17mr17436574ejb.345.1622705916696; 
 Thu, 03 Jun 2021 00:38:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk6U7FYy67qNMigRW5UV1yRAoLND/QYKO9yQXAujfNJJk4PYjK6XXZW20vvkbK302wRtXPqw==
X-Received: by 2002:a17:906:f9d1:: with SMTP id
 lj17mr17436560ejb.345.1622705916521; 
 Thu, 03 Jun 2021 00:38:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cf26sm1146607ejb.38.2021.06.03.00.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 00:38:36 -0700 (PDT)
To: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210528141628.44287-1-vsementsov@virtuozzo.com>
 <YLdLrrTszu8MMxPv@stefanha-x1.localdomain> <YLd33jBVl5k3RAZK@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/2] block-copy: small fix and refactor
Message-ID: <151b2470-9c6c-cda9-a77b-64cdb10a7550@redhat.com>
Date: Thu, 3 Jun 2021 09:38:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLd33jBVl5k3RAZK@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: eesposit@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/06/21 14:21, Kevin Wolf wrote:
> Am 02.06.2021 um 11:13 hat Stefan Hajnoczi geschrieben:
>> On Fri, May 28, 2021 at 05:16:26PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> Hi all!
>>>
>>> This is my suggestion how to refactor block-copy to avoid extra atomic
>>> operations in
>>> "[PATCH v2 0/7] block-copy: protect block-copy internal structures"
>>>
>>> Vladimir Sementsov-Ogievskiy (2):
>>>    block-copy: fix block_copy_task_entry() progress update
>>>    block-copy: refactor copy_range handling
>>>
>>>   block/block-copy.c | 79 +++++++++++++++++++++++++++++++---------------
>>>   1 file changed, 53 insertions(+), 26 deletions(-)
>>
>> I posted suggestions for the doc comment on Patch 2, otherwise:
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> Thanks, fixed up the comment accordingly and applied to the block
> branch.

I'm a bit confused.  Vladimir said in his review of Emanuele's patches 
that he was okay with patch 7 and that he would rebase this refactoring 
on top of it.

Vladimir's main complaint for the s->method state machine was the extra 
lines of code.  Here we have just as many new lines of code and new 
parameters that are passed by reference.  Kevin, can you please look at 
Emanuele's patches and possibly unqueue the second patch here?  It seems 
to me that it should have been tagged as RFC.

Paolo

[1] 
https://patchew.org/QEMU/20210518100757.31243-1-eesposit@redhat.com/20210518100757.31243-8-eesposit@redhat.com/



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B66BB90F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 17:07:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcTdM-0006bf-02; Wed, 15 Mar 2023 12:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pcTdJ-0006bN-IA
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pcTdH-0000xp-Kz
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678896343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8087H9SoZxZgFlumNUuWtCvDPZk5P7i2IdiBno9wF8=;
 b=PLT9xIfxxfZQwMvCxQkile/z4g8qLpVQ+RSamZlXvnK0OV1TjfcyHkOesaddR7tdCRcSX7
 FdaI8vWRN8J+bj/1JwBvGx3UWT9sHNXNjIsiq07JCpxxOygc+28OFUT33VivYwacTP97D4
 fJYEUFZZC3wUADmuRIvBKqZW1aQnWgM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-6XVZcXHDN5CtGspVssXAfQ-1; Wed, 15 Mar 2023 12:05:41 -0400
X-MC-Unique: 6XVZcXHDN5CtGspVssXAfQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 b7-20020a056402350700b004d2a3d5cd3fso27374271edd.8
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 09:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678896328;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y8087H9SoZxZgFlumNUuWtCvDPZk5P7i2IdiBno9wF8=;
 b=Se2x6tT8iXFFxQURvAuBrJJiHuCtHmcAMV77d809Wz991ywO7OzpnaOSjlMv8Y6GYT
 fGK3Mg7GDN84VVL2o9uE7F0N1QV0d5hH2xm4L6uMCizz/kTq4BBGB7IFD+NILulTWqj/
 nMtsv8gzUoMeIbN/22LvK2Ok/pZBb0wVNq+CYSEC3H2xZq8eTvkLWtZgQ4+Bk/Bv0m6I
 YtKz4zEXvQ9IGaQF0vS8BA9u5AmM9z+Moz+TpeSF8sUHdXF2a89GzdXDCt/Y/4X+8AtQ
 2hrQrBmruJT80tJJPrOq19B2+yovO/2O3lYlaV89aZXVXWfYqxC/rQDDuWyGz3wfKijj
 L+vw==
X-Gm-Message-State: AO0yUKXyL7hG/c1k95+f4TtJKLet4cVTx9DVnB7bguowb927AAp/LGVV
 JnmTOU6TDqm1AzJ3h1dpA2vT2heRg0Vq0n7XU1soD6xRLQW5h+/x7zTzAtpKGSNKcKRpccewFYm
 8QqCE8PlVSE/SZLA=
X-Received: by 2002:a05:6402:7da:b0:4fa:e8f3:968b with SMTP id
 u26-20020a05640207da00b004fae8f3968bmr3025829edy.19.1678896328658; 
 Wed, 15 Mar 2023 09:05:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set9mrHIBqWiNG23ed65XaRrRCbA4WOzmp8GWT/Wc4Xc6lBEoNazC/hchTT6qsLJi2pYd6VKlKw==
X-Received: by 2002:a05:6402:7da:b0:4fa:e8f3:968b with SMTP id
 u26-20020a05640207da00b004fae8f3968bmr3025794edy.19.1678896328266; 
 Wed, 15 Mar 2023 09:05:28 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a509994000000b004aef147add6sm2686944edb.47.2023.03.15.09.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 09:05:26 -0700 (PDT)
Message-ID: <783b08e1-435b-a854-66cb-8c0587fb4cf9@redhat.com>
Date: Wed, 15 Mar 2023 17:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 0/2] Split padded I/O vectors exceeding IOV_MAX
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230315121330.29679-1-hreitz@redhat.com>
 <20230315152941.GD16636@fedora>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230315152941.GD16636@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15.03.23 16:29, Stefan Hajnoczi wrote:
> On Wed, Mar 15, 2023 at 01:13:28PM +0100, Hanna Czenczek wrote:
>> Hi,
>>
>> We accept I/O vectors with up to 1024 (IOV_MAX) elements from guests.
>> When a guest request does not conform to the underlying storage's
>> alignment requirements, we pad it with head and/or tail buffers as
>> necessary, which are simply appended to the I/O vector.
>>
>> As of 4c002cef, we (sensibly) check that such-padded vectors do not then
>> exceed IOV_MAX.  However, there seems to be no sensible error handling;
>> instead, the guest simply receives an I/O error.
>>
>> That???s a problem, because it submitted a perfectly sensible I/O request
> Looks like there is an encoding issue. I get 3 question marks instead of
> an apostrophe. lore.kernel.org also renders mojibake:
> https://lore.kernel.org/qemu-devel/20230315121330.29679-1-hreitz@redhat.com/

Hm, yeah, no “charset=UTF-8” in that mail’s Content-type...  I think 
that’s because it just uses what’s in the patch file and sends it, and I 
needed to force it to be format.headers="Content-type: text/plain" in 
.gitconfig at some point because of some Mimecast thing.  I hope putting 
format.headers="Content-type: text/plain; charset=UTF-8" will fix that 
for the future.  Thanks for telling me!

Hanna



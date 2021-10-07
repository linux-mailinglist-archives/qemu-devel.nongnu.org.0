Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F79E4254D4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:54:27 +0200 (CEST)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTqr-00064a-SV
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYTkS-0007aW-JY
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYTkR-0004yS-5K
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633614466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KeoVPw8kyhsiA36HEc2TuH5v6xuhD9iadsT0IEUkGls=;
 b=G2+BTC6jHBVnGSijIJNB5QhxBdeYIS7ja6qAQmRf6uuEkG+nya4JwZZ0TDM+PrjKAO9fP0
 b3o/jJRQbtJpbkr4U/bon0mx/yp7tMVtI5o0zu9nE8yKuOy0ot/DK5mYkSVFMIforPSyUT
 roKHBWpVI56QxBMWZi9J6MEuYulFTkk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-rqiUlybiP6mUFhVPr9wdXA-1; Thu, 07 Oct 2021 09:47:45 -0400
X-MC-Unique: rqiUlybiP6mUFhVPr9wdXA-1
Received: by mail-ed1-f70.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so5958082edl.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KeoVPw8kyhsiA36HEc2TuH5v6xuhD9iadsT0IEUkGls=;
 b=i3vNE8CNQdoAZF03ue2sXRTJNR4qerOD3hUdAiXR71uJj2yw/Emth3PdR1mNQHGSbx
 u7bHDnE1MennnbSol1iacIFAOZhEgt2T+OBVI8O+xAh2YCJuA7EL9oZWJq1PFy0mN8p/
 IiGc+4jLEQpui/yTxwlhCFBGxRFFSAKAHAcVkBfpOHhOgS2eARWhYwoQjkGJ02s9vQpV
 j+OcBtokkhGR09K5unA2zUHf9qez1wk7uiEtnMw1oVj3nCsY+QrbB5bzPmRd/pHY/yd3
 HYHWx47CNidRoRfwPEKfBkj6dlgIxqCuspGKikZJ/itSf0NQuum1AAXaWae9Q7KTolI+
 pOqA==
X-Gm-Message-State: AOAM5313ZXrHqnt2J5mGkMJMARO+eTarfLk5bvPjn+iiTek5JuWrVZzT
 NXfai/JsE40Cchb7ehn3XgEfwGAW5ReH0AD1zRJa1YsaQlrJ4Qt6aplzma8NHBNCpVnGCgDWrdb
 LJLhSNyYFju5ifDc=
X-Received: by 2002:a17:906:16d0:: with SMTP id
 t16mr5757178ejd.199.1633614464125; 
 Thu, 07 Oct 2021 06:47:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCsW+CgWBnN3L++4TQ8xYf+uNB81MTshEVDdUrawUAu4Ihft7liXPllqiVyUNuefQ0VGi3sA==
X-Received: by 2002:a17:906:16d0:: with SMTP id
 t16mr5757143ejd.199.1633614463948; 
 Thu, 07 Oct 2021 06:47:43 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 e3sm9973430ejr.118.2021.10.07.06.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 06:47:43 -0700 (PDT)
Subject: Re: [RFC PATCH v2 08/25] block: introduce assert_bdrv_graph_writable
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-9-eesposit@redhat.com>
 <9a778b91-d175-8062-6783-740ba42c4321@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <4dfda254-2ff0-8977-9e42-8c0f5f1075d8@redhat.com>
Date: Thu, 7 Oct 2021 15:47:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9a778b91-d175-8062-6783-740ba42c4321@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/10/2021 14:02, Paolo Bonzini wrote:
>> --- a/block/io.c
>> +++ b/block/io.c
>> @@ -739,6 +739,11 @@ void bdrv_drain_all(void)
>>       bdrv_drain_all_end();
>>   }
>> +void assert_bdrv_graph_writable(BlockDriverState *bs)
>> +{
>> +    g_assert(qatomic_read(&bs->quiesce_counter) > 0 || 
>> qemu_in_main_thread());
>> +}
> 
> Hmm, wait - I think this should be an "&&", not an OR?
> 

You are right, && makes more sense. But as you said, using an AND will 
make the assertion fail in multiple places, because the necessary drains 
are missing. So I am going to remove the check for drains and leave it 
as todo. I will handle this case in another patch.

Thank you,
Emanuele



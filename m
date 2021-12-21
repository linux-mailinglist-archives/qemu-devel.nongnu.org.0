Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527A447BB93
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:15:45 +0100 (CET)
Received: from localhost ([::1]:58456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzaJE-0001GI-Dh
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:15:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzZgD-0007mB-BJ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:35:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzZgA-0005DA-DV
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640072120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PWfD0n2dcpX+P7D4SnTum1Qoz921rza0Sq9CXZEDN0Q=;
 b=O3Lp1bL0yg3ck6/O5QqhOxl6Dc7uO8fo3a64dtJqS+Wp+ljiDaKfE3lqGMaZdF97VZRXWr
 WTOnVAX3VGxRSXesD+X17cqdyLIVOIdIJmmTPwt3KlDs7sDjKfpYSO0LQQF0rbt0a8nwzR
 8wRcdlHjUG5YODRvzqC4sRtjSqYdino=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-V-7zvm6ON7KcgciH4ZnsVg-1; Tue, 21 Dec 2021 02:35:19 -0500
X-MC-Unique: V-7zvm6ON7KcgciH4ZnsVg-1
Received: by mail-wr1-f72.google.com with SMTP id
 x20-20020adfbb54000000b001a0d044e20fso4392316wrg.11
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 23:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PWfD0n2dcpX+P7D4SnTum1Qoz921rza0Sq9CXZEDN0Q=;
 b=klz6cTnKmEluSIIZ3Lh+CaSgBbf4DIzU/X089dvZ0Dr/qWpVxpA5txMpO1ii/EtFXy
 ciG9zz2TXQk2XwxmreT9c7OIHtJY7eZZro/TSEUJK6Ls187X1DaSMBSFMzusilCy0DFx
 AUOPZ5hY+Ukz8wlKi/EY8K1vInm0qbZ5adh9oovw42wPmbX5XfMUY9u65gRgkj0cBBiQ
 ZsDI/8utcsCJ5UikFvdu+zSujmzHPDmHFMRgRq2lFXK8qe14Gwp8G8bqfxq0JskafMwi
 yC2VUuTmD8H/HyQ/ORgYexSNc9bnwRVl7YflAh2izWHKRSZGQ2c3KBRLGXe/EB+SAkNS
 4Q+w==
X-Gm-Message-State: AOAM532zgWuZ9snP7jJa+NLkshYFoqTk1NKnPXj/ollRogEw4N/+XMcO
 qRF+iaiDuPs/pdHcCcQVNQEtRluNd0nDMssFC6vhZ85AK/gPndMjeclb3v3f87MwdaloRkDPhvD
 qbL5tg7x4ipX3znY=
X-Received: by 2002:a05:600c:34ca:: with SMTP id
 d10mr1506325wmq.133.1640072118700; 
 Mon, 20 Dec 2021 23:35:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtKQxTP7X/ujzw2zdz7IGSkt4AItmUD8RAut77/HEw2d0v23ljwZZ5Fqo+ADN9aFuyVP9L5g==
X-Received: by 2002:a05:600c:34ca:: with SMTP id
 d10mr1506309wmq.133.1640072118537; 
 Mon, 20 Dec 2021 23:35:18 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id b2sm9753615wrd.35.2021.12.20.23.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 23:35:18 -0800 (PST)
Message-ID: <6f1f9403-04a7-e149-2eb7-6cbd32a57902@redhat.com>
Date: Tue, 21 Dec 2021 08:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] tests/qtest: Make the filter tests independent from a
 specific NIC
To: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>
References: <20211220103025.311759-1-thuth@redhat.com>
 <MWHPR11MB0031244B90C10F7E048744B29B7C9@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <MWHPR11MB0031244B90C10F7E048744B29B7C9@MWHPR11MB0031.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/12/2021 07.38, Zhang, Chen wrote:
> 
> 
>> -----Original Message-----
>> From: Qemu-devel <qemu-devel-
>> bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Thomas Huth
>> Sent: Monday, December 20, 2021 6:30 PM
>> To: qemu-devel@nongnu.org; Laurent Vivier <lvivier@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>; Yang Hongyang
>> <yanghy@cn.fujitsu.com>; Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
>> Subject: [PATCH] tests/qtest: Make the filter tests independent from a
>> specific NIC
>>
>> These filter tests need a NIC, no matter which one, so they use a common
>> NIC by default. However, these common NIC models might not always have
>> been compiled into the QEMU target binary, so assuming that a certain NIC is
>> available is a bad idea. Since the exact type of NIC does not really matter for
>> these tests, let's switch to "-nic" instead of "-netdev" so that QEMU can
>> simply pick a default NIC for us.
>> This way we can now run the tests on other targets that have a default
>> machine with an on-board/default NIC, too.
>>
> 
> Oh, It's my and Hongyang's abandoned mailbox.

Sorry, I only looked at the top of the *.c files and copied the e-mail 
address from there.

> Looks good to me.

Thanks for the review!

> By the way, should I add the test/qtest/test-filter* to the MAINTAINER file?

That might be helpful indeed to get you CC:-ed correctly next time.

  Thomas



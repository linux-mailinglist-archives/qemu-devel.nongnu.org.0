Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2807A323ACA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:52:23 +0100 (CET)
Received: from localhost ([::1]:59606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErmI-0003wA-5V
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lErjq-0001WN-Aq
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:49:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lErjn-0008Ok-Qb
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614163786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CxSZUmYoPrPbmVg1fW4AorcG4ePO8PgNCrthxvk2LYo=;
 b=abFHDXwqDuQLFDabFDBcySjUHoOTQqj9NPU3vJy5+FVyWR+qjRkAXZe+m99Fx4R0VBix/o
 h3Bqx+jtI5REzGBFsr23+PRWjj+xpO1BCQEmifIpt6d5hvM1dEyyJDEGzezOLv/PyzftX6
 vgyEyuBl6wI8E8sWpow/c4huFJPCGx8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-8EVP5iOkNhKigdZxo0S2Vw-1; Wed, 24 Feb 2021 05:49:44 -0500
X-MC-Unique: 8EVP5iOkNhKigdZxo0S2Vw-1
Received: by mail-ed1-f69.google.com with SMTP id c7so662145ede.17
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 02:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CxSZUmYoPrPbmVg1fW4AorcG4ePO8PgNCrthxvk2LYo=;
 b=kBr2QakKPehTOpMNoVvg21rbz4WApbd72WIsDXnc/CU4iDl+pOpHPJ8mLTGC7E19kN
 dtaK/sWVhLMkK6sG/JrDipSCMr91+uz/kpDM5Ng1Dku4mt6W6vm+vh76qq9qZ5g6JCAS
 afVbArqVakJL4NWP9xl+Dc06f8QdrzPz8SvBDdIryqYvtaHQ6eNSxE5Ps20KB8tce7WF
 aPJeEOAn9ch/rJvB028bE51Lyzl1dOV0kMZFzhn8RiH1PriCB9KBx9Ui4+PrBEfmx33L
 756Zrw8D8fFRgXVbHbIa9jbKJ//zPZAS3oLDV/Lis3DQq1lLTubnhTfmrcz4FTS1MQai
 Tynw==
X-Gm-Message-State: AOAM530rMsNaEf72Ji3rAPu/xUljYBP+E+mZEj6CM3od3epuUhUq3qrY
 Z4PNjHu/aeJF+7m5dXh9woYOzWPx1YmD4SvBBA5SFewId3bH9xQgXfyVQGCFFxe3HQhKSzglbGr
 3b6DW4ZYQMJH8DvE=
X-Received: by 2002:a17:906:3a10:: with SMTP id
 z16mr30235481eje.483.1614163783423; 
 Wed, 24 Feb 2021 02:49:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGwHX8pGDsbDsq3u++Da6+dyY+Xqfbt7X9c/1rLqxkLRx/oJcWqSHcamJlv4hv1MbmmGLfNw==
X-Received: by 2002:a17:906:3a10:: with SMTP id
 z16mr30235469eje.483.1614163783259; 
 Wed, 24 Feb 2021 02:49:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z13sm1199627edc.73.2021.02.24.02.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 02:49:42 -0800 (PST)
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
References: <20210224101810.52851-1-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] libqos/qgraph: format qgraph comments for sphinx
 documentation
Message-ID: <ec53c449-b719-07cf-0993-352bdbd32725@redhat.com>
Date: Wed, 24 Feb 2021 11:49:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224101810.52851-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/21 11:18, Emanuele Giuseppe Esposito wrote:
>     qtest
> +   qgraph

It may make sense to add instead a "toctree" directive in qtest.rst.  I 
haven't checked what the result looks like, though.

> + * DOC: Qtest Driver Framework

Is this needed since you have the heading already in qgraph.rst?

(Also, the whole section could move to qgraph.rst.  This is what was 
done with qom.rst for example).

> + * More specifically:
> + *
> + * .. code::
> + *
> + *   x86_64/pc -->contains--> other_node <--consumes-- my_driver
> + *                                                         |

You can end a paragraph with "::", and the following block will 
automatically become monospaced.

Also "-->contains-->" has an extra ">" sign.

> + * ``"-netdev something -device my_node,addr=04.0 -device other"``

Maybe the quotes can be removed since you have monospaced text.

The main issue with the text overall is that it was written before 
having experience with developing QGraph drivers and interfaces.  It's 
already a good thing to have it in the manual, so the smallest possible 
change (as you did in this patch) is already an improvement.

However, it would also be nice to replace the examples with something 
more "real world", based on the code in tests/qtest.

Thanks!

Paolo



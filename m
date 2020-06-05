Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E421EFC8E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 17:35:12 +0200 (CEST)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhEND-0000yg-CS
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 11:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jhEJ1-0006Hg-0Y
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 11:30:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48872
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jhEIz-0007m6-GJ
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 11:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591371048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REZXbo6/ge1uPfdtOP1hHGpJR2810n8nhb5B+dcMaTA=;
 b=ZP6TXFq4W8ZIyfi43OratMOj8FLvEURo2207+5TibhXmniHUPPPb7gsnox4RRdgAOLpSX8
 ObcVoz+OjJPo0w9cMnbSwBp7BenV8lRn/a24tMCjFt7HrsmTtv+qvnmp6lkWh9UmWberk9
 1NhUEUmKUnlBVSnRkOubXHrOq6BuTf8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-sQtQN2A1PiOG2l3ryPZF7g-1; Fri, 05 Jun 2020 11:30:46 -0400
X-MC-Unique: sQtQN2A1PiOG2l3ryPZF7g-1
Received: by mail-wm1-f69.google.com with SMTP id s15so3136254wmc.8
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 08:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=REZXbo6/ge1uPfdtOP1hHGpJR2810n8nhb5B+dcMaTA=;
 b=UzzxJM5JUN76kGEt57Bj7xGvEIOXibQPTjDuEvgkhKxxqj45IH7VzsWKaFJWzJaGW/
 n+dAnuCfaSY+TrfS/uxDtrBerWGsc5kC2VFRFF9h/cquQXrcgYiygm5B5PwwRIrOlFmN
 raPcSpFiO8ZIe4+k03H6nxt8RVvgrmlB4oAqps0AZJDJgpg2jlH7xhNR+R4Qf7vbxZZp
 fQh4nNdRnKq+3pv+XgXlVNBeNBU+cJqTanzW5wx2RKrHFN4XqAtyiRfjLqBNFcaCJqQZ
 r4Hf2N0yHy67SUMK4ewhkoNp58Mb/lNcWIIiQFY2Yqf3X8mhJ4Eddl4/hQ8L20j9XXnI
 9KSw==
X-Gm-Message-State: AOAM532inVY+p1MBSmoatKQShD/Mxvfa9SXKCSg+XcSDBkunNzAo4Gbk
 162Fn2JvX98vShIwIO2saTWBJyuG2EqWDMI5tIo7mh/HwLfuySC7eY6CKYVgYrfPwtz3OSOzTm5
 qmoAHondqLe9ovao=
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr10850218wrr.164.1591371045577; 
 Fri, 05 Jun 2020 08:30:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHbUddnjDUd5x4YT9T0whXTTCmQB2U+GchiyVNyYzSVUmpAkvwQBbLcKTQP9HmIscxk8ZuBQ==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr10850185wrr.164.1591371045274; 
 Fri, 05 Jun 2020 08:30:45 -0700 (PDT)
Received: from [192.168.178.58] ([151.20.243.176])
 by smtp.gmail.com with ESMTPSA id a6sm11598698wrn.38.2020.06.05.08.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 08:30:44 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] exec/cpu: Cleanups around "exec/hwaddr.h"
 (reserved to system-mode)
To: Cornelia Huck <cohuck@redhat.com>
References: <20200526172427.17460-1-f4bug@amsat.org>
 <525ebf16-1265-e403-54b6-e1168d84e4f4@redhat.com>
 <20200605161801.4bba0d0e.cohuck@redhat.com>
 <2c5a04c3-0c3b-5acb-d03a-a4649c9222a2@redhat.com>
 <20200605171356.68475d8d.cohuck@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7fbd1eeb-db24-a545-075a-f3f6c69ff088@redhat.com>
Date: Fri, 5 Jun 2020 17:30:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200605171356.68475d8d.cohuck@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:40:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/06/20 17:13, Cornelia Huck wrote:
>>> So, I guess I should unqueue patch 5-7 from s390-next again?  
>> I can unqueue them too, no problem.
> Would probably be easiest, then I can send a pull req in a few minutes.
> 

Go ahead!

Paolo



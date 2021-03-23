Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4447346742
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:10:01 +0100 (CET)
Received: from localhost ([::1]:51234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlTc-0006C6-QW
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOkOE-0000OJ-6n
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:00:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOkO7-0006h8-0g
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616518813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqIAWTm9iV4WzSSJRzsr195qTvzkgtkSDhbDs8OToZU=;
 b=RpKZoleX/rGEfCn02D7p+yIUdEBc74yvjvKbzj98cNabZVojQQuj1559b9s33qJE9ku2F+
 dlt5e5tl/tdR8qa2wh6cBPhyrM53gdHS4z3906y4iLzg7bsi3aDoEruZTroI5z8z97uEHA
 75JoCO1a4IjP+NGHAwQJjOzopMl9i9k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-mva3oUf0NMSSFEMAB6K_fQ-1; Tue, 23 Mar 2021 13:00:10 -0400
X-MC-Unique: mva3oUf0NMSSFEMAB6K_fQ-1
Received: by mail-wr1-f71.google.com with SMTP id s10so1389466wre.0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 10:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VqIAWTm9iV4WzSSJRzsr195qTvzkgtkSDhbDs8OToZU=;
 b=Vb44rbJ/DhfPZrW3KpoRBEBw3goLjsOpHrDpKrwoD1ORnFGdLgv9joiNx1mJUz1NLp
 pKxw/g61SXiLhoknWpCr+kC5smuDcBIFdvCP38xD7oBlQzX+BNvqrhO0dp4yCo1Ayv1D
 JtwABFTIue9IGEv63IWSpl/vDYn8hZpYqk+ILY/huGON8enIbMH7LluIRkFlddq7OI2X
 GwXVTiR9RcwR9vURWd+WypyJpfgJXhn1uPtjDJL04zdb1jEJbneVfrMyctoPapRjpQos
 ijKQfYs/TlYCs7X4X6fl1RfsBCrUKW3EIMF1KvSMvYE8giwWAQdS5SVgg5XwShOqghMK
 dxAA==
X-Gm-Message-State: AOAM533bseMxF2+CTLwYhhbrmWLvUF4tgzcVy4FFaHkljJme12OIjBB7
 oqZWMG2VAG1yzFfyToUA8HmQ1tA4PI29/h+KqbCyVKKy+s/JV58KLpY9CNUD4/+2GH6Ab/D6ZTd
 HR66cs0rBs1z7Hr8=
X-Received: by 2002:adf:ed46:: with SMTP id u6mr4955445wro.350.1616518809190; 
 Tue, 23 Mar 2021 10:00:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsTx6AmiObTVo0/hIFOIT6s++IvOLkNIY+fLzxkA9qpZfCaHMmI4PZ4BVE2FlYTUs2bxa7Tw==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr4955420wro.350.1616518808979; 
 Tue, 23 Mar 2021 10:00:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q19sm25517620wrg.80.2021.03.23.10.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 10:00:08 -0700 (PDT)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-4-pbonzini@redhat.com>
 <ac3b47aa-344a-a6aa-a1d8-2c2dba2d540c@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/4] qemu-iotests: let "check" spawn an arbitrary test
 command
Message-ID: <14ed8b41-f8bc-b350-c859-2ac51a54663a@redhat.com>
Date: Tue, 23 Mar 2021 18:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ac3b47aa-344a-a6aa-a1d8-2c2dba2d540c@virtuozzo.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: eesposit@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/21 17:43, Vladimir Sementsov-Ogievskiy wrote:
> 
> Interesting that REMAINDER documentation disappeared from latest (3.9) 
> python documentation https://docs.python.org/3.9/library/argparse.html , 
> but exists here https://docs.python.org/3.8/library/argparse.html  (and 
> no mark of deprecation)

Whoa.  https://bugs.python.org/issue17050 says:

---
Since this feature is buggy, and there isn't an easy fix, we should 
probably remove any mention of it from the docs.  We can still leave it 
as an undocumented legacy feature.

There is precedent for leaving `nargs` constants undocumented. 
`argparse.PARSER` ('+...') is used by the subparser mechanism, but is 
not documented.  https://bugs.python.org/issue16988
---

The problematic case appears to be when you have more than one 
positional argument, which is exactly the case with the 3.8 documented 
use of REMAINDER.  Hence the decision to drop the documentation.

However, "check" works fine because the REMAINDER argument is the only 
positional argument:

     $ ./check 001 -d
     Test "tests/-d" is not found

Another possibility is to pre-process sys.argv like this:

     if '--' in sys.argv:
         cmd = True
         args = sys.argv[0:sys.argv.index('--')]
         posargs = sys.argv[len(args)+1:]
     else:
         cmd = False
         args = list(x for x in sys.argv if x.startswith('-'))
         posargs = list(x for x in sys.argv if not x.startswith('-'))

But getting the help message right etc. would be messy.

Paolo



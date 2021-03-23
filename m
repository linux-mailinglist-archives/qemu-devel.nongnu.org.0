Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711D3467A9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:32:00 +0100 (CET)
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlos-00075k-Qb
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOkjk-0005f4-Ew
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:22:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOkjf-0001HD-EU
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616520146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54e92v7jhZryHJvJf8FPFwirS1w+4SKGXCx0yd24Zbk=;
 b=DV6kh06zA8XxkkvVd/xae0g/k1VEkT2GdfMGqyuRvzGwVrXcJa1bQ0QiJz05/VCp5Y6Ykf
 AS+GNyujwskwzze36xC7yl57aEjPL9li69ypE08yOWcWJxlsMkQv3T3acvIRpywbrX/kd2
 V5cYCBNmPhPObjUoKMMktghdBKHLsrU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-GKeOajwWNUOkwh2yYBMGAQ-1; Tue, 23 Mar 2021 13:22:24 -0400
X-MC-Unique: GKeOajwWNUOkwh2yYBMGAQ-1
Received: by mail-wr1-f69.google.com with SMTP id h21so1382504wrc.19
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 10:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=54e92v7jhZryHJvJf8FPFwirS1w+4SKGXCx0yd24Zbk=;
 b=CzncefzUK8wHSrZWWDxWGDvKyjYpAeQx6HnJydLxUI0YRP5dzjYMQZYIpZtwk2SBnO
 AOlpYGDuES+BT5slgJDshgTjwwyw+Bq+aZmNgPOWqbrpZNFacy2X5RC7lw2u1TFM+/2V
 m9JwQF0mNwxdp6i9UVAYF2q/KHR9tU/+gpX3glGkq5OeT9ahZkvLPGBm81pAuw6s40to
 miUfoZE6apfphFgcbbfMxe26UorKRoGaAvrsk9cQb/7cXszwHDB8a5Y7jLT9nvRtXsXj
 uao37RrhfXOxOqIckfcNtV5kCIuvVbhtAoNyrNrF+QIqIF5v9wz2UcY31OjJjt7fYCjv
 X61w==
X-Gm-Message-State: AOAM531kC7QlWff9mAvUuuQW9FVPIr4611/LmSiMa0VgplKU5s1uO3AR
 3+UUnqtg3Ce7aGM7y02GeSXewzuu1yq4AxrK0XeiHGmluyLCe93C/EsLN+1dVij6XTyZX0pHPjS
 BaLpHt41ufQIq+34=
X-Received: by 2002:adf:e38a:: with SMTP id e10mr5108311wrm.37.1616520143107; 
 Tue, 23 Mar 2021 10:22:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF0S4gLEGOcPt7sPDWfxP5caO8DxicjoIB707UUrkixQjFvcbPaOTYrwhm67IQY0h7nku0YQ==
X-Received: by 2002:adf:e38a:: with SMTP id e10mr5108295wrm.37.1616520142949; 
 Tue, 23 Mar 2021 10:22:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p14sm3294440wmc.30.2021.03.23.10.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 10:22:22 -0700 (PDT)
Subject: Re: [PATCH 3/4] qemu-iotests: let "check" spawn an arbitrary test
 command
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-4-pbonzini@redhat.com>
 <ac3b47aa-344a-a6aa-a1d8-2c2dba2d540c@virtuozzo.com>
 <14ed8b41-f8bc-b350-c859-2ac51a54663a@redhat.com>
 <b89670c6-153d-8434-da06-b212b887bc88@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0046f47b-6a46-6299-5816-44b7517a207a@redhat.com>
Date: Tue, 23 Mar 2021 18:22:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b89670c6-153d-8434-da06-b212b887bc88@virtuozzo.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 23/03/21 18:11, Vladimir Sementsov-Ogievskiy wrote:
>> If you have positional arguments that must begin with - and don’t look 
>> like negative numbers, you can insert the pseudo-argument '--' which 
>> tells parse_args() that everything after that is a positional argument:
> 
> So, as I understand argparse supports '--' feature out of the box. So, 
> we can keep '*' as is, and it would parse all remaining positional 
> arguments which are either tests or the command, and '--' will be 
> automatically dropped. So, we only need to check existing of '--' in 
> original sys.argv to chose our behavior.

There is still a difference with REMAINDER:

./check aa -- bb
=> REMAINDER: error because ./-- is not a test
=> look for '--':  invoke "aa -- bb"

So I think REMAINDER provides the best behavior overall.

Paolo



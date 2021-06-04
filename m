Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5239B3B7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:21:13 +0200 (CEST)
Received: from localhost ([::1]:37966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp48m-0003L0-4z
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lp47M-0002J8-1y
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lp47I-0007Zl-2k
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622791178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTNdndLN4Cy/Lef1Rv6xqsNhe3UqKCPBd4NuS/1MRgQ=;
 b=dMkgUynZKbGoFvOsiGsNDOfk6ajPodPQ8nPaq88D1l+EY1VfEMd2aIye01itAfBiMjkkAV
 GhIXwy8IFRcTYnwmyEFZkoTo8PUBTe6TegNg/Vz5k7nxpAz2lVzjQbIWj0XtW0beZPTgon
 v/fk9bzaq71d3L7y1QI48YWHBgmLU5Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-yLngQJk-PYCGAdQq_nBtkw-1; Fri, 04 Jun 2021 03:19:36 -0400
X-MC-Unique: yLngQJk-PYCGAdQq_nBtkw-1
Received: by mail-ed1-f70.google.com with SMTP id
 h23-20020aa7c5d70000b029038fed7b27d5so4497144eds.21
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 00:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gTNdndLN4Cy/Lef1Rv6xqsNhe3UqKCPBd4NuS/1MRgQ=;
 b=sqpwVOH5kPSn8nrLNSzLNUpRUro9EBM7KKTZzbY3eh5mHEV3E5syhP1Pa6KWTAlhLA
 qnBofNXpXUWeUOfgEK5jPHdyKtPY+RK6Jg5GQ6Dcz5GudCBlfgvzRkvQ0dYpt0Rx1L8d
 dpeaG3ZrkLTPaL3zBF6G2WkWaX0eHWCJPGDsMy7VkWt0yOIaNGluiyFvUm0rbDSXlpcC
 +ELEedHcMBRhqkzhnODSsio5UEqVjZknqUtlh7TeFnMEW5KdBEVkjNNY1aTC+ifFV6hm
 yAA5go+W1Riq2NE8vNWNwDIH1SldTovLeaBLv409UEuexcXJL7eF+d6zALA2vaFvGCdO
 +ohA==
X-Gm-Message-State: AOAM530LYpxlEycWaD/FZNnf2FZDQ+0KycPuOfftp7JKLgbTwHedMFYy
 OBDe3OlGw/MtXrDCLTwWWhmWazQRlTTNo48WpRuLMUZCppBOsqKVOvCOAJCv8kffQKQ4AUqBeiQ
 fjCdKtGjW3ItaL0E=
X-Received: by 2002:a17:906:63d2:: with SMTP id
 u18mr2901749ejk.186.1622791175674; 
 Fri, 04 Jun 2021 00:19:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSyaWiPC3bB6A0wzPdvd2+2ZRKUV5PHmheAjKk2Gor8OnxBshctV8QHiJoQ9iMT6QGkwEp2Q==
X-Received: by 2002:a17:906:63d2:: with SMTP id
 u18mr2901722ejk.186.1622791175420; 
 Fri, 04 Jun 2021 00:19:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d24sm2782252edr.95.2021.06.04.00.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 00:19:34 -0700 (PDT)
Subject: Re: [PATCH] iotests/check: move general long options to double dash
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210526181659.365531-1-vsementsov@virtuozzo.com>
 <3d086c41-80c0-a970-367d-00e19ce55817@redhat.com>
 <ebfba20f-badc-422b-f71d-28b9280f65cb@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2ed9f244-722f-83ed-dd53-205e1833dc27@redhat.com>
Date: Fri, 4 Jun 2021 09:19:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ebfba20f-badc-422b-f71d-28b9280f65cb@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, eesposit@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/06/21 14:19, Vladimir Sementsov-Ogievskiy wrote:
>>
>> Double-dash options give extra information to the user that short 
>> (single-dash) options can be combined, while this is not the case for 
>> iotests/check.
> 
> You can combine short options for check script, as argparse supports it.
> 
> We don't have many short options yet.. But something like
> 
> ./check -ng auto
> 
> makes sense and works..

Oh, I missed that.  Then it's okay, thanks!

paolo



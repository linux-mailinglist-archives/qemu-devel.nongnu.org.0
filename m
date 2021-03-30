Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5AD34E6E8
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 13:53:26 +0200 (CEST)
Received: from localhost ([::1]:60430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRCw1-0007Bm-5d
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 07:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRCus-0006L0-FQ
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:52:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRCuq-0001v1-LM
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617105131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MG0UF+BrxzpXeo/t/eA0/7XXcEA4e4VjQdlGRAjpu9I=;
 b=aRUjHzpll622PQlLLCpCjHQnUKk92PM6YVPpLhVdOmRNbNnvQaZJIrVbJnwHLmIpFyLTk7
 s3dndM9Er5UhuY5pY7uXCnqo0IHJsF4f5KeYiSOlW3JsefYhc8EotBqaplZn4cORBoSB/j
 zNvvRkPzgnJlgKSYSmbSIDu2J9Hsktw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-A9vS6ETYOhu7cgi4yIM-9A-1; Tue, 30 Mar 2021 07:52:10 -0400
X-MC-Unique: A9vS6ETYOhu7cgi4yIM-9A-1
Received: by mail-ej1-f69.google.com with SMTP id bg7so7091940ejb.12
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 04:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MG0UF+BrxzpXeo/t/eA0/7XXcEA4e4VjQdlGRAjpu9I=;
 b=gYdqHUFnnjfMx7JU8UM8JEy6foAznwekkj9lg1GHYCNZsirKFhlzgzD5EZyEyi1e+j
 CAVFp2xiYcrOIZXuldcuoIHkW5Tp/p9YQZNYrTYDRmMBam4124VAi9w6Nzt6a+GjeDcw
 cWLCmKxob+cv+x3Hw3q5rClBbtdJWCw/bHdTvirco7C4Rtn6UB72t/TCHtvKMhR63KdV
 gfM/vTwjx0Y++W0/JCvsRGfatktjTlnRrAMhoS27AAE32ggnfbIpwKGJafN9We6igYZn
 GNy/3MdM9JDVstm9ElbiyIrFSbuelLO4N0Ee4ddtkAzvn8p5Xe+fYJ1wA4rthQ8wDoc5
 LNFQ==
X-Gm-Message-State: AOAM532bcfHaGx+ALdmWMeWRLCEORcuG7g2ANHQoWNXCpAMkVsHlgMFe
 P+NAs4YlyAREfzPe793gHyuleHpLPloyo0zcLbxWNKxBhfxySWyp4v3LF2DenfTl1EvqAL6vhIt
 2j9wTdzWQziBuLU4=
X-Received: by 2002:a05:6402:6cb:: with SMTP id
 n11mr33857803edy.198.1617105128624; 
 Tue, 30 Mar 2021 04:52:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOtB85ZX/48yr3/Tvx2P9e82CFCgdCORH+eqepvreFYOg9gJ89G5hTFAdEM5erxasfqhWqAw==
X-Received: by 2002:a05:6402:6cb:: with SMTP id
 n11mr33857793edy.198.1617105128500; 
 Tue, 30 Mar 2021 04:52:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a9sm11163861edt.82.2021.03.30.04.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 04:52:07 -0700 (PDT)
Subject: Re: [PATCH v3 0/5] qemu-iotests: quality of life improvements
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210326142359.431127-1-pbonzini@redhat.com>
 <6028fcec-ead5-bcc7-4c61-632322dbd2af@redhat.com>
 <a6b0d60c-af40-a16c-8c97-c00348984d98@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aadda300-ab72-292b-8d25-419ae934bfbc@redhat.com>
Date: Tue, 30 Mar 2021 13:52:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a6b0d60c-af40-a16c-8c97-c00348984d98@redhat.com>
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/21 13:44, Max Reitz wrote:
> On 30.03.21 13:32, Max Reitz wrote:
>> On 26.03.21 15:23, Paolo Bonzini wrote:
>>> This series adds a few usability improvements to qemu-iotests, in
>>> particular:
>>>
>>> - arguments can be passed to Python unittests scripts, for example
>>>    to run only a subset of the test cases (patches 1-2)
>>>
>>> - it is possible to do "./check -- ../../../tests/qemu-iotests/055 
>>> args..."
>>>    and specify arbitrary arguments to be passed to a single test script.
>>>    This allows to take advantage of the previous feature and ease 
>>> debugging
>>>    of Python tests.
>>>
>>> Paolo
>> Thanks, I’ve amended patch 4 and applied the series to my block branch:
>>
>> https://git.xanclic.moe/XanClic/qemu/commits/branch/block
> 
> I’m sorry but I’ll have to drop it again.  At least iotests 245 und 295 
> fail; I assume it has something to do with `iotests.activate_logging()`.

Ok, will look into it.  Can you give me the exact set of ./check 
invocations that you use?

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ADD41B52B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:34:02 +0200 (CEST)
Received: from localhost ([::1]:41176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGzR-00024N-CA
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVGxC-0000QB-RL
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVGx9-00026H-F6
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632850298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EEnUUCKrAl3oCzp0fXs39NR2+e367nZ/vwc7QJsNnGc=;
 b=hB1Lma49JC6UIjGS5m6G7Y5pzXx+oaasWLeSG577dROHzI2MGvIomSeSU4Cl3KhoA4QEsw
 wh9Coi8RGqppYLaWCANEpC2UpC5eSIKiE9jPkXFkr1+3NUELj7IGSzXSDuZGdjkmuu8v3M
 FiRlYTsr9uh3nwlhWUUeVYcCd/rN33w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-mKZXZhpFP0mCBcQkFPrSYA-1; Tue, 28 Sep 2021 13:31:32 -0400
X-MC-Unique: mKZXZhpFP0mCBcQkFPrSYA-1
Received: by mail-ed1-f69.google.com with SMTP id
 z62-20020a509e44000000b003da839b9821so4289516ede.15
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 10:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EEnUUCKrAl3oCzp0fXs39NR2+e367nZ/vwc7QJsNnGc=;
 b=P5sSVHTNQble1bqnyR1DXk1jyZz4PJd9z1TJXH+FU1l2fBKpW/2VXImHFDqf/MG8C5
 CxRlyWT/hbZgCCkUWSEE0Dm/1ayG0enRkXMzF3t8/Gy4CyeFwUpW0zzwRZkIAYlZqK4S
 CQmWh4M07kPbl8pA91l5mS2kcfRQUXj73yfjfDqSgFp9Ho7uzmVaI1sgFnkh8lq141A7
 ts6iD7vCFGTFvIxYQWtSPDRFK/kYoK7E5LUMQo5S5Gq/dDTGc9b9N/4PAKL+fMvBM9pB
 RG/yi+KYd70CuZvUfyhPZ/0NdgBjEo3orbJpBGbjFxvFfd67hYwmj1wXzDWxyhCIwvHW
 PF4A==
X-Gm-Message-State: AOAM533GeAcP2eYqx36smfwxICcWiEBkJBjBaOpKDG7AgphVBJftNio1
 MbndghDOLKKDX0x37JILWZH7f1xArxfLRUTK5GjpzHe3zOjGxwGEyqVnie/h2k+bmE41X7HXc8n
 fY+cNExECEg3t0nI=
X-Received: by 2002:a50:a2a5:: with SMTP id 34mr4744771edm.207.1632850291393; 
 Tue, 28 Sep 2021 10:31:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRiKN3cSWkZQIxUeOEZHHeYlA8Y/wGS55sryXNJdKWWoeC5IaycQV1HpmlV1212pO/tjTGyw==
X-Received: by 2002:a50:a2a5:: with SMTP id 34mr4744745edm.207.1632850291180; 
 Tue, 28 Sep 2021 10:31:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r22sm10759262ejj.91.2021.09.28.10.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 10:31:30 -0700 (PDT)
Message-ID: <36a4b1a7-2027-dd67-cc4f-64f5f525c7d6@redhat.com>
Date: Tue, 28 Sep 2021 19:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/3] rSTify SubmitAPatch, TrivialPatches, and SpellCheck
 wiki pages
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20210922121054.1458051-1-kchamart@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210922121054.1458051-1-kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/21 14:10, Kashyap Chamarthy wrote:
> As of writing this, qemu.org is down, so I've used a one-month old
> copy[1] of the wiki from 27Aug2021 to do the rST conversion.
> 
> My main motivation was to convert SubmitAPatch (when Peter Maydell
> pointed out on IRC that it's still on the wiki).  But it links to a
> couple more small wiki pages; so I converted them too:
> 
>    - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck
>    - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches
> 
> [1] https://web.archive.org/web/20210827130706/https://wiki.qemu.org/Contribute/SubmitAPatch
> 
> Kashyap Chamarthy (3):
>    docs: rSTify the "SpellCheck" wiki
>    docs: rSTify the "TrivialPatches" wiki
>    docs: rSTify the "SubmitAPatch" wiki
> 
>   docs/devel/spell-check.rst        |  29 ++
>   docs/devel/submitting-a-patch.rst | 460 ++++++++++++++++++++++++++++++
>   docs/devel/trivial-patches.rst    |  53 ++++
>   3 files changed, 542 insertions(+)
>   create mode 100644 docs/devel/spell-check.rst
>   create mode 100644 docs/devel/submitting-a-patch.rst
>   create mode 100644 docs/devel/trivial-patches.rst
> 

I think this is missing a link to the new documents in the toctree?

Also, I would prefer to have the headings as "===" "---" "~~~" 
consistently (I have posted some patches this morning that do this for a 
few more files).

Paolo



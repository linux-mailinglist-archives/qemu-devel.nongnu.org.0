Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516649540D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:20:58 +0100 (CET)
Received: from localhost ([::1]:35918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAc3M-0005Zy-Rz
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:20:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAXOy-0002vf-K4; Thu, 20 Jan 2022 08:22:56 -0500
Received: from [2a00:1450:4864:20::32a] (port=45640
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAXOw-0001UK-O0; Thu, 20 Jan 2022 08:22:56 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso13647504wms.4; 
 Thu, 20 Jan 2022 05:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=abvL9BE60xn66JxYehLV63YmF/GHq86Op/hYBvY3xk8=;
 b=mFUhm1sctHL/owd/TXrshPfWoJN164v5J6S/lQdv565FdQpwmpqk2VdRGd5fP8DK4/
 oyKyf0Y5i7h9+CzTqqPDeuld5HKDEs5y0HU3BM3TY8pQr5DVFZ1MZUzJtuc4pl5MR/0z
 CWLpASiiYU+eoPwrlP33Bmd1IJWDsvRY6jhirghU1KYBCeCCSsRg7PIcpoBBxNxBtr51
 KqXPCNUA/ZaV5C8UTSLaIoCN3HSdRANjmlT1HGeiUOxiO23SHje8r47MBnA8Fj7I7qV0
 OP8gz6gGw4ASqtX0IOub3K/NIjW8snh6HcuezsaA37TgE7okw3I/avx6K+wpjUBl5R1Z
 Uy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=abvL9BE60xn66JxYehLV63YmF/GHq86Op/hYBvY3xk8=;
 b=NnjQ2W0urK+eKoWzwINC2k5CRbFQ6MUpzVOw4hFCmCZ1g3cX0pR54H8K5BkGxMc9S9
 vDzzIYATzd+d2n3Jrzis4tZUlRQ1pKKSfR/YXxDV7x/OzS2FfyHZGOc3+hSVG9G6jtPM
 vKhVZl1es6jUzCu9q2G3lZC4Nb7mSOcE9rdZgzj//+S+/bXlD5nk0tmXMvJBLZxBbTMw
 TYwXSunSVHGC8WA7iDhq4Y68JiU9i79nlSBGEAzEmFZaqvMYd6DxucL0ySjX1d/RQFz3
 +uxvZfDZK2o5ov/PcvX/6hUF8KImjVOlijJ5D5iCZSYCc2i4VCAbguhBzimD/Vj0PCmX
 uOrA==
X-Gm-Message-State: AOAM532h23yCLKWwOCd9y41E5m8wyLsVciO8fbpeg9QIc/eWe2Lk5xvk
 gdiZaopWAmkyCB6KRuPuwoE=
X-Google-Smtp-Source: ABdhPJzp0+zWvd8NXeZbzIT/u7/yz/tqLzBOvrzClH2QO6puKCht8q9qb0EaGPge1p789U9DOgRIgg==
X-Received: by 2002:adf:ef04:: with SMTP id e4mr6048291wro.459.1642684972822; 
 Thu, 20 Jan 2022 05:22:52 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id s9sm2237577wmh.35.2022.01.20.05.22.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 05:22:52 -0800 (PST)
Message-ID: <a32d2d69-7af4-3748-6de1-4367b51e4985@redhat.com>
Date: Thu, 20 Jan 2022 14:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 28/31] block.c: assert BQL lock held in
 bdrv_co_invalidate_cache
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-29-eesposit@redhat.com>
 <56deaef1-6a4e-c544-9916-42a20cc20c7a@redhat.com>
 <9ca5c434-ddf6-2ed3-08ae-92da5fc98013@redhat.com>
 <b1e190b3-7466-0d4e-554b-bd9d4ce5a43e@redhat.com>
 <YehZwkGVPK6phrc2@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YehZwkGVPK6phrc2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 19:34, Kevin Wolf wrote:
> So if we go back to a bdrv_invalidate_cache() that does all the graph
> manipulations (and asserts that we're in the main loop) and then have a
> much smaller bdrv_co_invalidate_cache() that basically just calls into
> the driver, would that solve the problem?

I was going to suggest something similar, and even name the former 
bdrv_activate().  Then bdrv_activate() is a graph manipulation function, 
while bdrv_co_invalidate_cache() is an I/O function.

Paolo


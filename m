Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4653972D0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:51:01 +0200 (CEST)
Received: from localhost ([::1]:60122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2vE-00076T-Me
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2sI-0003tT-A6
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:47:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2sD-000593-LK
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622548071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yimQeVGK/0M8TGAAnyLu9cEQtPIfamVuOLAG1HV3TI=;
 b=JjKTK00qfG9H+Mn6Cpr8t3sn0NEgFjucT33Z5bVXyh8+U3rGEX+2guSZl4ri2DacOL6egR
 vRt0zzeHWibAxIXoV1Hn/9tlO/TPh6cuDryfACcfnAr9Ry/GSYSbX9ZIDVvd1y+hSf2rl2
 kjIU8YIgPFGZDmqltgoaY7FZzTyC3rk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-8At6-SrAOK-7EJrSytvuQg-1; Tue, 01 Jun 2021 07:47:49 -0400
X-MC-Unique: 8At6-SrAOK-7EJrSytvuQg-1
Received: by mail-ej1-f70.google.com with SMTP id
 bw21-20020a170906c1d5b02903df8cbe09ccso3246598ejb.11
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 04:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9yimQeVGK/0M8TGAAnyLu9cEQtPIfamVuOLAG1HV3TI=;
 b=ftfmj1uCl/xFeyWq3u3xlUe6TV7iEI2LNlpY3ZkLel2pFI/Vr392WJFuUd59Ikoix7
 /q7qbO/Bg5XZWUT/rnq5T8+b9yTDk6cHvNFXitH5JhgQTBLFpDL7qCWKJAyBLKMM8+La
 YNbGp6DiMtKe/lYlxFpDU5OerBuXRorFy9BlsQ5ja+V2PE7XL7kwz8wN/5AdLCATS7uT
 TexuzQWZQYtuO9XQG+AwEocTUoI+Mu4cJxpvO12tf33XjU4j4pAU3aCeQj8oBYN3IFRe
 q77LEuyQeOXqEyeZib9To39phAE+nLWYwX7JKflSMSlYn+AUT2b/kYOpeiahbOtfnqcT
 BjMw==
X-Gm-Message-State: AOAM530v0CpQhKFbb3kszh1zoAKG9jt1/MR4c1+oFX1gPHNVQGMTckoW
 OobMRBhFA9eO1q5igd0y+lkoVxWrlwwrU37iFTv9AqbJFvl1tswpcDb9sb9ZYSJD7afzn/vRnyM
 FvibdKyYkue9fL80=
X-Received: by 2002:a17:907:7848:: with SMTP id
 lb8mr29401515ejc.494.1622548068247; 
 Tue, 01 Jun 2021 04:47:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdjWI84LxY/JeKPZarl0lRaSErFXT1qeSfM4TTOZWFkIHNdEuHb3maEin3IHkpHXQYO5qxjg==
X-Received: by 2002:a17:907:7848:: with SMTP id
 lb8mr29401490ejc.494.1622548067962; 
 Tue, 01 Jun 2021 04:47:47 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 gb27sm601200ejc.18.2021.06.01.04.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 04:47:47 -0700 (PDT)
Subject: Re: [PATCH v2 32/33] iotests/image-fleecing: prepare for adding new
 test-case
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-33-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <00c08321-13d1-a0b1-a629-e8177d08d3fd@redhat.com>
Date: Tue, 1 Jun 2021 13:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-33-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:22, Vladimir Sementsov-Ogievskiy wrote:
> We are going to add a test-case with some behavior modifications. So,
> let's prepare a function to be reused.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/tests/image-fleecing | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>



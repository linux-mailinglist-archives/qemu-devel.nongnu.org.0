Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C82A40966C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:55:35 +0200 (CEST)
Received: from localhost ([::1]:34282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnMs-0000v7-5k
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPnLo-0007hi-44
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:54:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPnLk-0002gF-S0
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631544864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cylTRe8NF6YcrDRr2NkSs3EgFqnxHTRWicgNGSP4cDc=;
 b=MQphWnVVmEp8v5Ib+4P7kl6k0G7GpJW6AahAz6bOBfg+mpBZ5LKEFQKeqmisvVigLVPDGI
 hWtHeCKzrAhyDAfq2n0RCJ5f3doDROMPE5TRQdYCq9F3L8oTUDugPy+2b6G3C2Nb1GOpf8
 ExfE4IYbSBRpL7PMQbeF9ma71kjfl1I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-8VjkF7mlOFKcF5-vma56Vw-1; Mon, 13 Sep 2021 10:54:21 -0400
X-MC-Unique: 8VjkF7mlOFKcF5-vma56Vw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so2798094wrl.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cylTRe8NF6YcrDRr2NkSs3EgFqnxHTRWicgNGSP4cDc=;
 b=HvZ7aqBQwc7Sz/eQvmcgY1TyVR5DIwewVSF+2GnyAQvQ8ErFpc447R4Xr9UxTzBNw8
 zRqSiZWpYj9/6uiRfNXLvfThJspWla0LxVfvj7n4hwiQXGzprFZA8HoCUbNxBVxXUi8s
 cKyHE3RmFgjHHbYCTqluDL1TDNhJ7u4ok88aJ7eBS8lS1qVcDTqeplgBiR5DYQpkAC+y
 uCsMpRPiq8afC842+4O2QJoF9ZZOqblBw0f4EINt6LaIQ/5Rplh0EyPNNz4elIQRaPb8
 AbxdKzEF+cD8KoQBaA1wDeoNeKz5XJ57emdfKn2EePqLkjxChUVvIEjtRBSMxyAZfpKY
 lYeg==
X-Gm-Message-State: AOAM530nAc1vobmxicIMziQfdMP5ydhMhDTOoSDqawvqQPwJR3mvcHKX
 NkjqkbhrR5xvLotZlfLrkU14qnQE5eebczQoz2e7NLRq5CmlsxySz+FpCENe6SAJQ7aSj9J5pp/
 3v0QYw6DrpsZnvac=
X-Received: by 2002:a5d:48c5:: with SMTP id p5mr12743735wrs.303.1631544860455; 
 Mon, 13 Sep 2021 07:54:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynpKe2PHdc2rB3oasXMKV72108Cf9GE9tdDDnJuHheJLT1aGqfe1cVOaT8y9sbSsPwIJvC9Q==
X-Received: by 2002:a5d:48c5:: with SMTP id p5mr12743716wrs.303.1631544860297; 
 Mon, 13 Sep 2021 07:54:20 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id j4sm7876966wrt.23.2021.09.13.07.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 07:54:20 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] qcow2: relax subclusters allocation dependencies
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210824101517.59802-1-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <1a018440-5ff2-cffc-3e28-c15923e1c292@redhat.com>
Date: Mon, 13 Sep 2021 16:54:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824101517.59802-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, eblake@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 12:15, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
>
> v2:
> 01: improve documentation
> 02: add Hanna's and Eric's r-bs, add tiny grammar fix
> 03: fix test by filtering instead of reducing number of writes

Thanks, I’ve fixed the typo in patch 3 and applied the series to my 
block branch:

https://github.com/XanClic/qemu/commits/block

Hanna



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0F40FA1F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:25:34 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREo1-0001Zi-Gi
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mREmH-0000mr-3b
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:23:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mREmC-0002C0-FO
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631888618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1u/TMeoM1KouwUHSsb4ePtvOgIVe/SP1DHW3hsrYj8=;
 b=drKL44HPhqdYPp5pqOPgqHh+h6FNpMfREXbUuPKYg5vKeRXip/tJf0yllsfZ71eA+w5UB6
 galW2nflIc/a+crQ1+4IUli7M7dQeR3B8nb6fyHW5VPMkb3ZNh7SNGi3vWQRgZD5ajmhti
 P+n19j3DEtabVeHpOYm6SA0q41xjks0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-2d02yLf0O8WQE_0Lnf2fzQ-1; Fri, 17 Sep 2021 10:23:36 -0400
X-MC-Unique: 2d02yLf0O8WQE_0Lnf2fzQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 y23-20020a05600c365700b003015b277f98so1789702wmq.2
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 07:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=q1u/TMeoM1KouwUHSsb4ePtvOgIVe/SP1DHW3hsrYj8=;
 b=sMg78AqZl/u608uQMyvYsaohYn9+itPD4dCgE51snS5RW0HGK4AfKWSgn/iWvnjZQB
 XeQLY/94iOtBwkollQOdem1b3htvzcamw1D7H/NYKhctERYn+cDXeFjcyGB2Do1T+6A6
 34UYfmh6k9TviXBZLywlvZgm7sqPJgSLaDg8W12wXDzLpX4oaZY9K+sf+Xu5azjIXs2a
 2rgzjLi4zcvow03husbYQfTS52RmOBa4gBGjPWXDayC77jdjPmvkV/tL+33VU61mY0z+
 NfBu6V+M6GTQMZ0FvLV90pf5XbYe/CEcajKZstK/VYbCKUrQp0/Dyd87VcPfwBXV/b3p
 vFaA==
X-Gm-Message-State: AOAM533wzZfwfQibbAejZnEx1DO5etEVtS3flwLElcq0aoJM/T1fXiez
 5ooREN86qEz19bOqAzkOBzsoUqGpmfhBYqMbBFZQe7bMQhzIaWsA65X2XXHXNRfvJrm36gChNGV
 AzPpDvVe2Fxznw4I=
X-Received: by 2002:adf:e603:: with SMTP id p3mr12553195wrm.357.1631888615837; 
 Fri, 17 Sep 2021 07:23:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNWKFMLBvyQn3pvaNopJ00nUXRaFTzoAEoHo1QW0QE6AxoSgT6uf6Wo0kvPgF1LMiMEJ6nJw==
X-Received: by 2002:adf:e603:: with SMTP id p3mr12553160wrm.357.1631888615607; 
 Fri, 17 Sep 2021 07:23:35 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id u25sm10802696wmj.10.2021.09.17.07.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:23:35 -0700 (PDT)
Subject: Re: [PATCH 11/15] python/aqmp: Create sync QMP wrapper for iotests
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-12-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <5896598a-ebd3-daf4-aff2-0bee44ea8d5e@redhat.com>
Date: Fri, 17 Sep 2021 16:23:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-12-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 07:40, John Snow wrote:
> This is a wrapper around the async QMPClient that mimics the old,
> synchronous QEMUMonitorProtocol class. It is designed to be
> interchangeable with the old implementation.
>
> It does not, however, attempt to mimic Exception compatibility.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/legacy.py | 131 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 131 insertions(+)
>   create mode 100644 python/qemu/aqmp/legacy.py

Looks reasonable to me, although I can’t give an R-b in good 
conscience.  I’m tempted to give a neo-tag (“Looks-okay-to:”), but let’s 
just be boring and do an

Acked-by: Hanna Reitz <hreitz@redhat.com>



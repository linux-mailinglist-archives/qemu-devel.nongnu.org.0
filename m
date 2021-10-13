Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F6842BA3A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 10:27:31 +0200 (CEST)
Received: from localhost ([::1]:34698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maZbm-0004lz-Fx
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 04:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maZYp-0003vZ-Kl
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maZYm-0006ax-1t
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634113463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8W23AkSKSZ/JQiE0XSApMyFPBVaIkKtVcyS8jPB9mIU=;
 b=Eq5hBNLmtPKPlHqlyWOAAvWtdORvaVZX+umy9rne7Q2HODJw6x3uq+YdC2eGHAx7sf2jy/
 2urYMXXJYo4yAu9Dd2KoPAJMz1y0iocEuMK+SjRqlJX++oDacQ9cK1PMr81vS++pM2U7z5
 s/b5N/HGsbH2srsmnLvIXMVFNf5h4o0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-q0JTL3WAPmGvMpM_NsuIRA-1; Wed, 13 Oct 2021 04:24:22 -0400
X-MC-Unique: q0JTL3WAPmGvMpM_NsuIRA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso1315141wrg.16
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 01:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8W23AkSKSZ/JQiE0XSApMyFPBVaIkKtVcyS8jPB9mIU=;
 b=N3oRRNHe07eDi56LRccV/0J43MFihV4RrPyhRilfz50Qak+dLFAaa1+3b6NzNPm6Gx
 GC+hrFRAPlaYNQlhhrW25CWr/mTWYh8ACSXdoo1XXmTcrCqODV7lUspHvY8u4UTNHyPQ
 EuBuE9oQAfsRisctNAxrl/rKtW/HTyM+ityVJaBs0eC6KVubr9T87iRgtSaCwRYZjK95
 USI4pnhQimkk3EmTGc6G70C4N4Z/HK8KoJcM6gFSmpXCP7zq1uBE5tMWpVNm9t7fivyc
 3inpziV6M+VLoHIRicv5E/Sbn2MHYOWJjm+sIodqiuRjhJUMR2cyOIIxGtvOSzw8DETy
 WxBQ==
X-Gm-Message-State: AOAM532usEtiGfUOQhpO+3cD3xiVgM+W0Exy1sLF+9iz9wQuh6J3B15t
 5o4qxRYEGzj0M5Kang/EYxdy9fLV0pYY6WdRM/FKzbtNdDMVImmdyEQRhc09FDtQaCN5Bs/gARq
 vhQUlVXrgjGeAszg=
X-Received: by 2002:a5d:6d51:: with SMTP id k17mr28235605wri.233.1634113461189; 
 Wed, 13 Oct 2021 01:24:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxuUgt4XprMLp9LHzcB0VtCvg7tkxPfFBeg/EdhGHRXA9pY52yXLKRhMCeBRHFe6U0YduBjA==
X-Received: by 2002:a5d:6d51:: with SMTP id k17mr28235585wri.233.1634113461070; 
 Wed, 13 Oct 2021 01:24:21 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id m36sm5405378wms.6.2021.10.13.01.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 01:24:20 -0700 (PDT)
Message-ID: <26f6facd-8d54-478a-d30e-3a0a2d43e226@redhat.com>
Date: Wed, 13 Oct 2021 10:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 6/7] python/aqmp: Create sync QMP wrapper for iotests
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211012223445.1051101-1-jsnow@redhat.com>
 <20211012223445.1051101-7-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211012223445.1051101-7-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 00:34, John Snow wrote:
> This is a wrapper around the async QMPClient that mimics the old,
> synchronous QEMUMonitorProtocol class. It is designed to be
> interchangeable with the old implementation.
>
> It does not, however, attempt to mimic Exception compatibility.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/legacy.py | 138 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 138 insertions(+)
>   create mode 100644 python/qemu/aqmp/legacy.py

Acked-by: Hanna Reitz <hreitz@redhat.com>



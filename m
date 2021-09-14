Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A91940B5A9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:10:06 +0200 (CEST)
Received: from localhost ([::1]:37092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQBwb-0003EK-4H
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQBvI-0002Kq-LQ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:08:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQBvH-00030B-6G
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631639322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tHuF5tDXpwTyyE9i5D1O1THwJuvyx5m3litSonptixY=;
 b=ZIUEJZdydmUq0PnAOJ72EfthqKpNqNe+Iy/ov4OFolHBAPmvl8dDtPJ6aAadCzbnhJ5gRy
 fE60OkTNvbwSzPxWLu5y3sCn2BG/1Ru3auVQCWohTNnYPiY8wWSB09P8TdMAqEGZY0MIks
 3fAS+2xgqDL3xUOJkoYWZ7CrbbRhANM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-_gOCm0ShOeqBsgO4nDbbaA-1; Tue, 14 Sep 2021 13:08:39 -0400
X-MC-Unique: _gOCm0ShOeqBsgO4nDbbaA-1
Received: by mail-wr1-f71.google.com with SMTP id
 n1-20020a5d4c41000000b00159305d19baso4231237wrt.11
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tHuF5tDXpwTyyE9i5D1O1THwJuvyx5m3litSonptixY=;
 b=mhXaFBPbA+DFvg2qTgDdCZT/DdK9mX1MiT0bq5zH7OYNPmOYryxqKK2m32uR5SHeL4
 uITMID6ctu2q2KmtPPC4QjvA5aFV6grZST2bNEqu7mfzjyG8Ef2xuYzS+Sgl/VGg6nl+
 hB7kaD2cjN6hhNOQBQZvzlaU5w2r/uFsyXgE240K/XoRUdj6HbMVPJtzjwTHV7ahHrM+
 zM7pi2epqjepbatp9VT9eh4jF43YTgCN+XZHSfNpcwXS2X4sRUZ/mhg1jhShkpdVJ1v6
 dHl/9hl8TEXCg77Gpg9Bx2zeBQEeIMynkpSbwtPUSjXv4rsk0clznYVnUdqQqiSLRKl/
 ir/g==
X-Gm-Message-State: AOAM532J9MO3HsjcNlOLXOv92CsDu/OBsVpuT01Sb+IBbDeazzUFG7Oe
 1rBJlLTmPqibXG0fVc5HkPOxiZtOW/4QDYC9FzqOZzzLvZ9OonaB6Y/5n8CtLRV3G/RsDdg374s
 r1LG+lmGevD95yBw=
X-Received: by 2002:adf:c501:: with SMTP id q1mr259120wrf.150.1631639317794;
 Tue, 14 Sep 2021 10:08:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHCW493IBoWMNRABWao+hmFXx+PRpcMgCpeVMsW8dZ+XhZe+UQoI0utIsJfo28p20xJl+a6g==
X-Received: by 2002:adf:c501:: with SMTP id q1mr259079wrf.150.1631639317421;
 Tue, 14 Sep 2021 10:08:37 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id n17sm3830479wrp.17.2021.09.14.10.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:08:37 -0700 (PDT)
Subject: Re: [PATCH v3 00/17] iotests: support zstd
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <b0fb7a33-c273-33e2-fc80-d5488fbce877@redhat.com>
Date: Tue, 14 Sep 2021 19:08:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.09.21 12:25, Vladimir Sementsov-Ogievskiy wrote:
> These series makes tests pass with
>
>     IMGOPTS='compression_type=zstd'
>
> Also, python iotests start to support IMGOPTS (they didn't before).
>
> v3:
> 02-04,06,08,14,17: add Hanna's r-b
> 07  iotests.py: filter out successful output of qemu-img create
>        fix subject
>        handle 149, 237 and 296 iotests
>           (note, 149 is handled intuitively, as it fails :(

It was also reviewed intuitively. :)

Thanks, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

Hanna



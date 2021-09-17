Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8919440F90C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 15:26:20 +0200 (CEST)
Received: from localhost ([::1]:48750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRDsh-0003VT-Ce
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 09:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRDrQ-0002cY-21
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:25:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRDrO-0004Lx-FO
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631885097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzVhBZLbLBcaPUXCrooo7hbDQUjkyKZUc2AAYhI2TYw=;
 b=BWCOL4ErUUnY0xNWOVwn2k1HMVhvpPNZnp9IH4y/SPL48HqjxLGVeyAiQPi2T6BaN4+9AM
 Qbu/58EvmnhXiIYWbHJAabxSyIRmd5Q24ZugF/u+WeR50b8W8VDTfMj94ATauhuxNDI5Hk
 KVZ/aJtGMym05ObWxd8joAXTI0yOv/8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-dbHDUgqhN7-92w_wLdhVDw-1; Fri, 17 Sep 2021 09:24:56 -0400
X-MC-Unique: dbHDUgqhN7-92w_wLdhVDw-1
Received: by mail-wr1-f69.google.com with SMTP id
 g1-20020a5d64e1000000b0015e0b21ef04so3738642wri.17
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 06:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rzVhBZLbLBcaPUXCrooo7hbDQUjkyKZUc2AAYhI2TYw=;
 b=Mbdp55+vY0cFI/6CU8WI/AstRyWZ91VOdcONgI+iKvM+e3tqKmzDjqlc3+kU5CZJcH
 psX+bzmOmlo+ezHJubcysqG1Ra24dlMeG9m6WEg/CyYd7HnzCoJIeo+pgFgBy09Ba2Je
 mPHzm84SZSpzR6GRc2jTc1ITlCklFXBF+J2TtEWyIg8dxfpYubxVLu+aqfr7kKTxwC1k
 5yS6X7ls4avDh1IFGiQpleUZ3w0jWeOL6IylARl9TWpEOPSxw5sqtF3+v73wRCe0XMEh
 MRbdNl4w31Ai2cUuDs0ZNQ/ORXATENGLNI90KNPthpKHjv/4aCmkA7Zut2AI/VuoMTat
 BobA==
X-Gm-Message-State: AOAM5300hY4tswxajkV995VLXLgfHUQH409OYJZAWfLuR/Ibhp/H1yDa
 OyXc8x9Isn2slo58abtp/+hM8fWNSeVgpK+zW6q5g/VCix/R0CbynXEhFCV/ik6hfxFoQcDtoqA
 z3qGlx80CqQ66dRc=
X-Received: by 2002:a05:600c:21d6:: with SMTP id
 x22mr10368618wmj.121.1631885095291; 
 Fri, 17 Sep 2021 06:24:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqOWYGmh2APPM18X3EXLG+zafxcd+dykfNcTmEARiPmXBbmbzeSygVw9Sp0RimTouFceJ4hg==
X-Received: by 2002:a05:600c:21d6:: with SMTP id
 x22mr10368601wmj.121.1631885095176; 
 Fri, 17 Sep 2021 06:24:55 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id m4sm10945602wml.28.2021.09.17.06.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 06:24:54 -0700 (PDT)
Subject: Re: [PATCH 06/15] python, iotests: remove socket_scm_helper
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-7-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <83a002ab-8d19-07a2-96c5-f3a92ee2ef81@redhat.com>
Date: Fri, 17 Sep 2021 15:24:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-7-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 07:40, John Snow wrote:
> It's not used anymore, now.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/socket_scm_helper.c | 136 -------------------------
>   python/qemu/machine/machine.py         |   3 -
>   python/qemu/machine/qtest.py           |   2 -
>   tests/Makefile.include                 |   1 -
>   tests/meson.build                      |   4 -
>   tests/qemu-iotests/iotests.py          |   3 -
>   tests/qemu-iotests/meson.build         |   5 -
>   tests/qemu-iotests/testenv.py          |   8 +-
>   8 files changed, 1 insertion(+), 161 deletions(-)
>   delete mode 100644 tests/qemu-iotests/socket_scm_helper.c
>   delete mode 100644 tests/qemu-iotests/meson.build

Oh, huh.  Nice.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



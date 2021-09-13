Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5132409820
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:57:15 +0200 (CEST)
Received: from localhost ([::1]:57684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPoKY-00085v-Ui
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPoIM-0006Oj-W0
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPoIK-0004gD-0H
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631548494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykbGnKQTYi5vS8ZPGJz5WVaF/lt4qkTPkqj1DmaUAzU=;
 b=WvjXRcvo32XLph3MNvfz3AHdxwsPFGSy/Aw63cIjLcJopGY+p89rCo0Q8aNUgitcglYgdO
 70jIQ9FrhPa8dod8i77u6K0Nga45hYKaOlcEUpKI6thLNqo/O0qw6YGZkTtWrmjO6qAgVF
 9x7oiJpU41O4RQlYIVEKepY1Q+83RdI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-saDY8kczMO2OCRyKub8wng-1; Mon, 13 Sep 2021 11:54:53 -0400
X-MC-Unique: saDY8kczMO2OCRyKub8wng-1
Received: by mail-wr1-f71.google.com with SMTP id
 n1-20020a5d4c41000000b00159305d19baso2847359wrt.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 08:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ykbGnKQTYi5vS8ZPGJz5WVaF/lt4qkTPkqj1DmaUAzU=;
 b=XV5/t96RKqxkDlRaiVgSCpaS95yBm0vgfo3I9Q3xuGuthgzJI4p0SDy4hD5O0G8oLr
 dw3c/gJqOlm9KXE3UxwXjWYJtwfT+sqKh0tEq07aquFsfXupYn3QuGTB9ysuiM2yTUFe
 sVYBTKzsKVatp+kvsm0CO+YS4mLbSdxLp/5J7uFYBs0eCQszfuIedBsizNFndVHNZWxw
 I6CLURWdNHDhwzMfqxJqjv6yPRxOhg69zozFApUk9BSgb84ZZcbPSvh/mOWd2vTSOHaW
 Opp3T8+EB0De6pgcT23lCeeGSp/rjwmstIJpn4BbOKJgfgZEA+i/W+E2xHP9s453tAZI
 lTXA==
X-Gm-Message-State: AOAM531MqHsoNr66o1xPxgXZPLXQ+2RxTplEvkz75qTdVUizyx5tko0R
 loPd5M6wD0oxArlL2wUs676SufmAg+jRjcqLZ9TkEBTgWGzpuEvmMn3nWf8aA3Qx593IW+/sVmB
 CGZHvhnYSBorFXr8=
X-Received: by 2002:a5d:48c5:: with SMTP id p5mr13092326wrs.303.1631548492393; 
 Mon, 13 Sep 2021 08:54:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7zYl8pIOpBNCGY/Y3fuWtdE4/bYu7SFDTpPM/hrRfDHW3wmgJm3xzuhFGTnBQl5JMo3pp5g==
X-Received: by 2002:a5d:48c5:: with SMTP id p5mr13092305wrs.303.1631548492220; 
 Mon, 13 Sep 2021 08:54:52 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id q11sm7288649wrn.65.2021.09.13.08.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 08:54:51 -0700 (PDT)
Subject: Re: [PATCH v3 04/10] qcow2-refcount: introduce fix_l2_entry_by_zero()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-5-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <1cc10afa-cca1-642f-159f-9dd38879d0b5@redhat.com>
Date: Mon, 13 Sep 2021 17:54:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210524142031.142109-5-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
> Split fix_l2_entry_by_zero() out of check_refcounts_l2() to be
> reused in further patch.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   block/qcow2-refcount.c | 87 +++++++++++++++++++++++++++++-------------
>   1 file changed, 60 insertions(+), 27 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



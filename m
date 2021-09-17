Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D740F779
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 14:28:35 +0200 (CEST)
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRCyn-0004y2-Tx
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 08:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRCwZ-0002wy-6D
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:26:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRCwL-0005Hc-7u
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631881559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5pf1nF6zLyo/mPNmEnMAL8xaEfyjQ7M42WGerMumj4=;
 b=I+pD3TUX6R5qCb9c0zJJr6iF53v67ezs7QDIsqpfXJQ60Grzlx1cq3sBpU/KXgRZ5xAkVa
 vYRSsfCPG85PUBrXcAKwj9OyG9UF7dQbmzmEzhBj2gq/QqF4J9V9jPrM3nKFPGtMZR4nEi
 FBT3qaiF54o/pVuu7UJ7tTA0O5cI9zU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-ekaFaScAM_mXwA6JMrN-Fw-1; Fri, 17 Sep 2021 08:25:58 -0400
X-MC-Unique: ekaFaScAM_mXwA6JMrN-Fw-1
Received: by mail-wm1-f72.google.com with SMTP id
 b139-20020a1c8091000000b002fb33c467c8so4562347wmd.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 05:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=n5pf1nF6zLyo/mPNmEnMAL8xaEfyjQ7M42WGerMumj4=;
 b=GdTeQpEMWu8MkLW1lOA0T3xSzm45lvJJXmOQJzbcwUOSFJCZXheN75K04NVk+aSuYi
 Qfx4kg2+NJfgOHxMn9p5lqLaZYraSIXMzv0a+IWlyeAWkFverAQhgRZ4nrB/7WKBVnqZ
 yK/KOpR2zj/CNjtuaqZjoXZP8/rpVriuVLyAzwKGFPIb8dNQdSVts4FISldI4pEJ/oO9
 KrFeGjSK6n36dKaWXUNmVH3S+r9574c968nUGZ5ZKSccITIJV0Ip8sAFLeJQMScjsYgw
 /sxT8YoE86svVhCBttH4Whac2haW9e40osmB/fd76Tnx84WpI3/ZRFR3IbVwdbp7mWeQ
 CHAQ==
X-Gm-Message-State: AOAM530NXM2XsFS5gWC9vA62mqVfULyh7g4v9SmamhLgcQ1ASBoFGy2b
 K6NxflCniQUPSLnUx+XdG+fo6w3HjA2oesu83fkiRgDomhP7hkhOawCjWUX/oyiC+UEJ3DYYi21
 LoyOl/UUr2FlR/X8=
X-Received: by 2002:adf:d1b2:: with SMTP id w18mr12101072wrc.6.1631881557058; 
 Fri, 17 Sep 2021 05:25:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoLIkqW1kT2XZS24ucVmyrVWwEVD2adGLB7XcGx1yU7wfLXJ6mVnBkAI59/CyhV931RYKqIQ==
X-Received: by 2002:adf:d1b2:: with SMTP id w18mr12101047wrc.6.1631881556872; 
 Fri, 17 Sep 2021 05:25:56 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id o1sm6564273wru.91.2021.09.17.05.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 05:25:56 -0700 (PDT)
Subject: Re: [PATCH 02/15] python/aqmp: add .empty() method to EventListener
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-3-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <4c7436a0-6924-13cf-5e27-e89266d2ee9b@redhat.com>
Date: Fri, 17 Sep 2021 14:25:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 17.09.21 07:40, John Snow wrote:
> Synchronous clients may want to know if they're about to block waiting
> for an event or not. A method such as this is necessary to implement a
> compatible interface for the old QEMUMonitorProtocol using the new async
> internals.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/events.py | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



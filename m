Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21D5463505
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 13:59:08 +0100 (CET)
Received: from localhost ([::1]:54894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms2ix-0003QB-Bi
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 07:59:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ms2hv-0002gt-QC
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:58:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ms2hs-0003NG-0N
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638277078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fyt3+fj2tcovLtmwq5G7EYqQGa7ZtLjYN+hmJMF2hg=;
 b=KgFL+9/LDqivSyVMv5OcZFavTohH3WBwA7ZQyRiefjLyYVdtIZnyGNA+SjxKI6mZOsff6c
 Kf+D4xxyXnWEDbs1yJt4hxioAWnmImhW2CmMBAeoeF85+a/fdNnzDyRqp7Js6dNeypO9HZ
 2a1TK+pXnRSTR0AQj3khZAusc9klU3M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-QNIiFdRWN26sQxbtx9-DBQ-1; Tue, 30 Nov 2021 07:57:56 -0500
X-MC-Unique: QNIiFdRWN26sQxbtx9-DBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so10386999wma.1
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 04:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/fyt3+fj2tcovLtmwq5G7EYqQGa7ZtLjYN+hmJMF2hg=;
 b=YFVO7zGcM41OcII8ht3GJSePIBTCNu4J00ePxkqmJWbOaZPN3x5E7b6WuAd++ywKzq
 XylQhcVlO+z2jEc+MAvuchHvmTf9x6oTo15GlWdxf8sFolxeRxkJ4CLKn21pWcYR8V8e
 ntZcquh+fXtQBk9GZDUJvd9A7ORtgW9hfmqLrv2Lulip7TuLTIZMxqEn1Dff6Or5szd/
 blV28Yhjf/NabKJYDNDY5ectx3TowUD4wM2a+wbv8mKMlFxrRAD0a4NCBid38pkvn7Ae
 iLrwEndSrLQtwjX3LchRuiG4rNn3qfRGNRHgT80XjyWCXBCkU0plWk2I/SB6fYg3pOqO
 o29Q==
X-Gm-Message-State: AOAM532vkgendh7V1dYEZG0xVqjy24ZPlo5X7vqK05DyEU65ArziNoJI
 yhORQgyvFmwGoUcjNkw+VM1LOERHnfQ2Oun8UWtLYqUdsB/mZHShf1VSydjeXAN/gIW6AwFsjj1
 Ikz2aw8+qh7qUnPw=
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr40528935wrw.21.1638277075259; 
 Tue, 30 Nov 2021 04:57:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrHnzVWXZEpEmqcaMydxZ27rB+RVsp5isjb0UeVx2aQaHt2O4QmG1mgrJnmh+4pPVIZbEnEA==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr40528912wrw.21.1638277075032; 
 Tue, 30 Nov 2021 04:57:55 -0800 (PST)
Received: from xz-m1.local ([85.203.46.194])
 by smtp.gmail.com with ESMTPSA id q26sm16717582wrc.39.2021.11.30.04.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 04:57:54 -0800 (PST)
Date: Tue, 30 Nov 2021 20:57:47 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v7 0/3] support dirty restraint on vCPU
Message-ID: <YaYfy7YqZpOopold@xz-m1.local>
References: <cover.1638267778.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1638267778.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Markus ArmBruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 30, 2021 at 06:28:10PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> The patch [2/3] has not been touched so far. Any corrections and
> suggetions are welcome. 

I played with it today, but the vcpu didn't got throttled as expected.

What I did was starting two workload with 500mb/s, each pinned on one vcpu
thread:

[root@fedora ~]# pgrep -fa mig_mon
595 ./mig_mon mm_dirty 1000 500 sequential
604 ./mig_mon mm_dirty 1000 500 sequential
[root@fedora ~]# taskset -pc 595
pid 595's current affinity list: 2
[root@fedora ~]# taskset -pc 604
pid 604's current affinity list: 3

Then start throttle with 100mb/s:

(QEMU) set-dirty-limit cpu-index=3 dirty-rate=100
{"return": {}}
(QEMU) set-dirty-limit cpu-index=2 dirty-rate=100
{"return": {}}

I can see the workload dropped a tiny little bit (perhaps 500mb -> 499mb), then
it keeps going..

Further throttle won't work too:

(QEMU) set-dirty-limit cpu-index=2 dirty-rate=10
{"return": {}}

Funnily, the ssh client got slowed down instead... :(

Yong, how did you test it?

-- 
Peter Xu



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9C648C676
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:51:03 +0100 (CET)
Received: from localhost ([::1]:33814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7exq-0001m2-GZ
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:51:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7dmV-0003nC-ON
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:35:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7dmT-0006lY-SI
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641994513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LBkcrFBwzNA2vdDQwwOkq2onfqxdhvWvijw36YDILhA=;
 b=b4Dk2TrMdbd/38svEjMa8QR9Y63hUo6EAvbZWFCkjP0A+8ZwVo8GPLrMOaHUG9npkYTCK6
 4p8uAXPp2tgLL0tK00j+S4A/F+RWap+wZv97zHDE3tKQmYbJSMQag1ZTm2uwNeQMMzKXS7
 RU7nVVJTY+pKkLtyDvdD0EBRF5/WFmU=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-GTbc6y60Pb6_oTfmSC_zIw-1; Wed, 12 Jan 2022 08:35:06 -0500
X-MC-Unique: GTbc6y60Pb6_oTfmSC_zIw-1
Received: by mail-ua1-f69.google.com with SMTP id
 a11-20020ab0080b000000b002feae8ac89aso1678292uaf.23
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:35:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LBkcrFBwzNA2vdDQwwOkq2onfqxdhvWvijw36YDILhA=;
 b=6KfT416ZM5bGILlWpQZOf6a58kpA/WaorFeg6BiZfpEtCKWaLODV6ghVMJNaIzlPM1
 WcyYK45tbrHfOaC+y7zfZJfUcCZiU+bdYNNXxvSHSqt2H52HtWbUv0XUbkSwzXa+IAh5
 si+U1xZ48x2mLybUP+hnz/xN7FxaktsXAo7uq/mVwNsSOxBVnqLcKgvolPYhcfsM4KPC
 m0OQLhZ6+wZOL+xdNoQhVman27QcE0xqAexMT1Efy24rvMwwKMz4je4N15rDvdDZsu7i
 Hll1uipA/qPfbz09JJhADaEFS3oBlxbNHz9/lpO5ICRDAJlUXEarc7MJ9R/Bc91C0owy
 wWUw==
X-Gm-Message-State: AOAM533rCsR9dmAyAeK832spY3iECUiqfUWw37g8d6Q76ABX0xTpQ05z
 1vw4Vg4/oo2FYvBOZbdmrs0x/57faEKb/tdSX6KylX9Twmn2emrlu+fnUIWTlLg3TaJeBuk3Pru
 WoeI945FBc/8cJKg=
X-Received: by 2002:a05:6102:1153:: with SMTP id
 j19mr3703715vsg.49.1641994506123; 
 Wed, 12 Jan 2022 05:35:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyixnwIpuJxMc3b2zPZ/KDKhubJZY1eWXs3tMyjr3AmaC0FDgndcAgQh8ChmaYPMgLtJPkPfw==
X-Received: by 2002:a05:6102:1153:: with SMTP id
 j19mr3703707vsg.49.1641994505930; 
 Wed, 12 Jan 2022 05:35:05 -0800 (PST)
Received: from localhost ([2804:18:8ca:405a:c209:ac99:1eeb:4fa6])
 by smtp.gmail.com with ESMTPSA id j11sm7602451vkd.38.2022.01.12.05.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 05:35:05 -0800 (PST)
Date: Wed, 12 Jan 2022 10:35:03 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 10/31] python/aqmp: rename AQMPError to QMPError
Message-ID: <20220112133503.4engnbjbwtlsuxxa@laptop.redhat>
References: <20220110232910.1923864-1-jsnow@redhat.com>
 <20220110232910.1923864-11-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110232910.1923864-11-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wainer Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 06:28:49PM -0500, John Snow wrote:
> This is in preparation for renaming qemu.aqmp to qemu.qmp. I should have
> done this from this from the very beginning, but it's a convenient time
> to make sure this churn is taken care of.

s/this from this from/this from/

--
Beraldo



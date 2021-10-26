Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D6443B04B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:39:52 +0200 (CEST)
Received: from localhost ([::1]:44046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJrz-00049u-W7
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfJhm-0001Rg-6y
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfJhj-0004d8-CF
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635244154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5S5tPe9rb6IrhH1ahV+rrARdWP9anGgGeDgYh9GUkU=;
 b=Tg7q1ZPW7ABASOndyL+cGl7+afyD+yjeAtVM+aXXWanOy0eDFZ4kQ7Fn9amk1GGzSz7GtH
 TjsCxTIsLaRl6XSQq1XqVtCOQU2wlr9zXDWO22w33CAaFQ2e1o3lO+XOMflV7jCST4jmDc
 4Eq3zgwW2gfUydnKMmBKPXbfy+60018=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-D0A8kPqxNy-063wp9-2wdQ-1; Tue, 26 Oct 2021 06:29:13 -0400
X-MC-Unique: D0A8kPqxNy-063wp9-2wdQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 g9-20020a1c9d09000000b0032cc23db051so760309wme.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p5S5tPe9rb6IrhH1ahV+rrARdWP9anGgGeDgYh9GUkU=;
 b=dGj+mcJIJZVEXxIa/YoMXswASxqHjXwxlgykwEUUYLryS7Zrnl+WiPZBPZLiXS1eQH
 NKZmU6WNVjj5hrjLigeeD3kLfAC/Se3/ku7AeWk3HqFLpmVE8RZX4o4aSaPnG5ufotAn
 cnzemqksHsDX2G9ObPMuo21xCtbvZCoYpbBFOJ/byIqzGaB3Y0h26VnW8sjc2tlk0Lr+
 gisvQkzEWGrxzo1RTe/1xXQZhHiFYI0ZU/fKVnClrhiMCGsXxEbzyOjevxLq9XHgimWX
 wux0+Ms4PMRKLg2c2/KxpIpJSofCXpp0uWuXl/CtoYqKOVLI4vc0nS7ZIv7GGo+oHMiG
 iMjQ==
X-Gm-Message-State: AOAM531tPDBOLkF8WzRQIiy6AYMxJgoJGjwI86zOqHeNp4jQS5bVfKOG
 RhFM89ga3NuV1L7aYCWjTgQHgq3vKHuP98FvG48SgSV8cFH/DiitKila6im+K6sREjAdctGrMyj
 7FCuTi5rMZzXzCTE=
X-Received: by 2002:a1c:f615:: with SMTP id w21mr26304746wmc.16.1635244152395; 
 Tue, 26 Oct 2021 03:29:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/3SLh/fLNyOJWfc2ROE2RuR4513gCY+4vkM6Wp1LpC6xft14kJ+62YVfRgD0CNeB960/IPQ==
X-Received: by 2002:a1c:f615:: with SMTP id w21mr26304718wmc.16.1635244152173; 
 Tue, 26 Oct 2021 03:29:12 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id g10sm254233wmq.13.2021.10.26.03.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:29:11 -0700 (PDT)
Message-ID: <6ab178e6-2fde-e681-cff2-834f132562a6@redhat.com>
Date: Tue, 26 Oct 2021 12:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 10/15] iotests/297: split test into sub-cases
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-11-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211019144918.3159078-11-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.10.21 16:49, John Snow wrote:
> Take iotest 297's main() test function and split it into two sub-cases
> that can be skipped individually. We can also drop custom environment
> setup from the pylint test as it isn't needed.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297 | 63 ++++++++++++++++++++++++++----------------
>   1 file changed, 39 insertions(+), 24 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

(while heavily scratching myself to ease the itch to turn this into a 
unit test now)



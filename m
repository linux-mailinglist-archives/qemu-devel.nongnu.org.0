Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965583F61FD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:48:50 +0200 (CEST)
Received: from localhost ([::1]:56602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYfR-0005hP-75
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIYeI-0004kL-3n
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:47:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIYeF-0003ZX-Q9
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629820055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrPh40+dTEhUvWwLJERGScSq0psY9MzF6ReeJVy0u1s=;
 b=IZAPOeVkLd+HvA/9Cn5qe3QtbHAFz8Wc5FZOApPf9L4z1AthFkAjraynqIANdqN4tPPgU2
 WTQd+keAO/170Hfe2CJ39ktyoGCvzi42etKd+vnNn1S9REBArU4PumulVazKnoNEuLy1yr
 Lg2v4eilayEd51BfrKAPrMNw0U30m9Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-horkMO90MfGLQRYvEZfkKg-1; Tue, 24 Aug 2021 11:47:33 -0400
X-MC-Unique: horkMO90MfGLQRYvEZfkKg-1
Received: by mail-wr1-f70.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so1952499wrv.16
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 08:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MrPh40+dTEhUvWwLJERGScSq0psY9MzF6ReeJVy0u1s=;
 b=F+gz8/o4Qi/WlAjg9qTZ7xAhHUhQSBnQb1zDcy1MBygr1lCUg2kKifr5S4xRhG8L09
 +1/dEM/2+dhTOhvsBy3z2A4YAk6Kv1HtbKsitH66XmZWISb6wQxhzpr5coZ8B+OZtgNd
 0gyTE7q84yW70NRuA0XbKn226PszsQGC7HhGsmxcIKwnuQnM3ibVQGJshu3CzGawCoh6
 d2a6OadApiqnrV/OptDSctV6is8dfE8+EXTWY7mjRr/xyX4R5MzUJ1A1Q70WvaveOeIt
 30RY4vCX5c+oTDkKSoS5Aw4u8dFlEEu5rsmoF8orQQeVUJA103ljTeoEeSaez2bwsipf
 ryNw==
X-Gm-Message-State: AOAM530PDYcFRSZViCRSc8upV8oFy3V8t4jamfY5FLvUDsy78mZJIKW6
 teRS7ohSkLyA0GxQdVeUANPmgVpULg3DpeBBO5p3RqU9DVkZ/gjrnpszjY1dwWbV1jmEj2rt80u
 L8CMNmtoKUlx/sursCoWTXRLw452E9FdECBA7FTepGQFx5d7SHCeqcPlumLwnf4Wl
X-Received: by 2002:a5d:4f02:: with SMTP id c2mr20634189wru.311.1629820052070; 
 Tue, 24 Aug 2021 08:47:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSmOjea4Aq8/G0ZvRK+ZzY43LuES8CcwLChwkap++8yvgr07fGFzAgDO08Ir4fO+gM4FYO+g==
X-Received: by 2002:a5d:4f02:: with SMTP id c2mr20634164wru.311.1629820051891; 
 Tue, 24 Aug 2021 08:47:31 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d24sm2640092wmb.35.2021.08.24.08.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 08:47:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] iotests: Fix unspecified-encoding pylint warnings
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20210824153540.177128-1-hreitz@redhat.com>
 <20210824153540.177128-2-hreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2404b821-78bf-bfcd-417e-0f4bb9eb911c@redhat.com>
Date: Tue, 24 Aug 2021 17:47:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824153540.177128-2-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 5:35 PM, Hanna Reitz wrote:
> As of recently, pylint complains when `open()` calls are missing an
> `encoding=` specified.  Everything we have should be UTF-8 (and in fact,
> everything should be UTF-8, period (exceptions apply)), so use that.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/297        | 2 +-
>  tests/qemu-iotests/iotests.py | 8 +++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



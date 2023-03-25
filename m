Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE26C91C2
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 00:56:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgDkS-0006X8-16; Sat, 25 Mar 2023 19:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pgDkQ-0006Wb-07; Sat, 25 Mar 2023 19:56:34 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pgDkO-0001we-9B; Sat, 25 Mar 2023 19:56:33 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id q88so4388468qvq.13;
 Sat, 25 Mar 2023 16:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679788590;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gK4rrOArOPhgJyyhpPo+OHcYRkC4gfjTbATXxPJZWR0=;
 b=oASEzszAkkTMEJoiBNMlEqJ961JHuVp2gPrOzzMbGBoYo5W6/oYpVcUWoxttEbov2b
 Wh7ly2MYHFukSYyiw+6K7qV33wY4qNpibD1I7JlT60oHu+YX7ZW6ueugs87q0vQtNm5V
 7ZCXTP4igjDwsId9llfSq0v1FBEzIZ5aDdOeK5yQ+98JVG4JKsZ73ttVQDPWHyGg4mDv
 pS6bjegUcanoJQQi8UFmbP3NRfEi5xbBHjFt6S8zYNiOfF40cB0fGkN8PYCpdRyj4klX
 baomJsuxGhttWaD3H0YZcRmzvF146T2NdkC+vc7/DY2JQXr6dreVn+FKWXCa0P8jIrYZ
 854g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679788590;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gK4rrOArOPhgJyyhpPo+OHcYRkC4gfjTbATXxPJZWR0=;
 b=rt3R1uLC6uyJ7AuoFHjYOyl2BSYzVHLq+0QU1XCED3xTbDmohH0UBGdOsp9hplFa/K
 Dm3XT4TD774ahkQLpb2BtBCvUUB8Hoz2cwgV9EKXpC1K/nswOhx4t9SlmWZwEtjQczW6
 iRmc8ZhLwpimIr80ZT1FNdMdguNVdBJ0SnOVOeXRShE4VjzHGSfcEl+3/6/vWfjDwpaX
 DJd0DSQOchz+WLGtq2qOEga/JGr5qV7dSCf5r5AJ5mXp3R+GJwaMV89Z0j3UtvrZ9i6E
 ByTN3c1IJOl0q/ze9xy4n4Tj+HVLEHScDAFmj2FJhITM7bO2lwRUWhP3eaFAk8nC+KS6
 EJWw==
X-Gm-Message-State: AAQBX9eKJ3Jjjf0ht4cbKm5xlcO2KWkmYQDCgwVhtx9bEUqK9f6sd18D
 IZsmAF4SUepyzVt8SljtEg==
X-Google-Smtp-Source: AKy350YtsLQjI/lL8sjYwd0aeF0lZrO54ZFJD9alEjtTt85xpqDQCbb/ld2gIV5/T3SX2g/FxRDgww==
X-Received: by 2002:a05:6214:1250:b0:5a3:44a1:788d with SMTP id
 r16-20020a056214125000b005a344a1788dmr13039459qvv.29.1679788590517; 
 Sat, 25 Mar 2023 16:56:30 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 207-20020a3703d8000000b007468ec2e5dcsm9226219qkd.87.2023.03.25.16.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 16:56:29 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:2e5a:fe58:7b33:b7a])
 by serve.minyard.net (Postfix) with ESMTPSA id B30641800BD;
 Sat, 25 Mar 2023 23:56:28 +0000 (UTC)
Date: Sat, 25 Mar 2023 18:56:27 -0500
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com, peter.maydell@linaro.org
Subject: Re: [PATCH v2 2/7] docs/specs: IPMI device emulation: main processor
Message-ID: <ZB+KK/RuLEOB6+c5@minyard.net>
References: <20230324230904.3710289-1-wuhaotsh@google.com>
 <20230324230904.3710289-3-wuhaotsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324230904.3710289-3-wuhaotsh@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=tcminyard@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 24, 2023 at 04:08:59PM -0700, Hao Wu wrote:
> From: Havard Skinnemoen <hskinnemoen@google.com>
> 
> This document is an attempt to briefly document the existing IPMI
> emulation support on the main processor. It provides the necessary
> background for the BMC-side IPMI emulation proposed by the next patch.
> 
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
> +* An external BMC simulator or emulator, connected over a chardev
> +  (``ipmi-bmc-extern``). `ipmi_sim
> +  <https://sourceforge.net/p/openipmi/code/ci//master/tree/lanserv/README.ipmi_sim>`_

Nit, you have a double slash above.

Other than that, this does a good job of explaining things.  I'm good
with these docs.

-corey


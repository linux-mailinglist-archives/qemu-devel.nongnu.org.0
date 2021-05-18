Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B33880BD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:48:28 +0200 (CEST)
Received: from localhost ([::1]:45474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5hb-0007gP-H6
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lj5eh-0004mq-KO
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:45:29 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:46842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lj5ec-0005tc-2J
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:45:25 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso9649733otb.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=n6hDRj/0zdfqKP8jGO1PVblpxafckSj7SrKcUWmdCcc=;
 b=HSnpx06GrgFMmiG7I1WwMMNxhpULtrDGMSrwcrw+4w6f6gYEvNfgeXwlyoyL4vvHau
 gFKi7rmlC/PmmFVA5eTEXAYN5HAJOZi9axIcvA+1yISbyu6umGPBrUQ9+H8h4SfRYLuR
 ikN7KrkNwJa46wCmexkKXsJ2nYKfr19aV1o8vB8GAwepWCQrcSnG5Um5KuMFwX0mRXX+
 fvz/zlA+7RrJ2vbc3wWKzp7caz3QPjqevecWuGN0AAkLTR1zcbeMWGFB3K/vkg3GedqJ
 1tWWmRqgCG1+TVdt6xVItQdIfLUPd5Fjhb+1PQlE8NOMwkFpoN9kloITjqjOxLrfMQ9U
 fMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=n6hDRj/0zdfqKP8jGO1PVblpxafckSj7SrKcUWmdCcc=;
 b=jcEGKNYGhqVz5hwaAUZs3/0pbOwYa8wqN+U/EivjsW4gPkmpqmZRtuZXqE7KwT536N
 3+yXyFQH+Vdu5wFjplxN0+97uJfkEtA9FKGPmO0uf5/CavIVPS5YImH85Y04CdX4BR4P
 5sriGcHTHZ6BhR2tlBxK1nm+hJdBwn8ebUAG7xkCBD3IRVSrS+ZMUPnIzei8Qt3KNarl
 xG72lgGWwPKMIrIxnbCjLtFEFLMzgVYtOzIOKHtmRcRilquIUwLwQjAXgArXlHqmLAFT
 qGbl9U8X+TsNB9uFBfYKtJQvND3XQPC7hGGEuLNDF5NZ0GT7AvvYMfQt68vrD4nGCOTS
 4UZQ==
X-Gm-Message-State: AOAM5322COnvpw7/s3tciJYeLYUiyIDoa8dg/c3IPYGhGO+N84H66b3O
 awjdvX8RuTjhEOgPlbFeIn/BtA==
X-Google-Smtp-Source: ABdhPJwr9gYMA/cLjZK9mjuyxflBTpVAx5s52luYa04MVt8BqfwFBJ5HHt/nAF2VkUNwyYzN7UHvhg==
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr5890631otc.286.1621367120728; 
 Tue, 18 May 2021 12:45:20 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:9144:ba66:ea13:f260])
 by smtp.gmail.com with ESMTPSA id m189sm3529083oif.45.2021.05.18.12.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 12:45:20 -0700 (PDT)
Date: Tue, 18 May 2021 14:45:18 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Titus Rwantare <titusr@google.com>
Subject: Re: [PATCH v3 0/5] Add support for PMBus in QEMU
Message-ID: <20210518194518.GY11196@minyard.net>
References: <20210518184527.1037888-1-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210518184527.1037888-1-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=cminyard@mvista.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 18, 2021 at 11:45:22AM -0700, Titus Rwantare wrote:
> Hello,
> 
> This patch series adds an interface to start supporting PMBus devices in QEMU.
> I’ve included two PMBus devices: MAX34451 and ADM1272.

I've reviewed all these patches, and beyond my one comment, they look
good.

I'm not too excited about putting the device files in misc.  I know some
SMBus sensors are in there, but they really aren't miscellaneous.  They
are really sensors.  But unless we want to create a sensors directory
and move things into that, misc will have to do, I guess.

-corey

> 
> PMBus is a variant of SMBus meant for digital management of power supplies.
> PMBus adds to the SMBus standard by defining a number of constants and commands
> used by compliant devices. The specification for PMBus can be found at:
> 
> https://pmbus.org/specification-archives/
> 
> Currently, the goal for these devices is to emulate basic functionality by
> reading and writing registers. Timing, and some logical operation is not
> implemented. This implementation supports nearly all available registers for
> PMBus including:
>    - Voltage inputs and outputs
>    - Current inputs and outputs
>    - Temperature sensors
> 
> Unimplimented registers get passed through to the device model, and device
> models can opt out of using the standard registers with flags. The included
> devices make use of these fields and illustrate how to interface with the pmbus
> class.
> 
> Datasheets for sensors:
> 
> https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
> https://www.analog.com/media/en/technical-documentation/data-sheets/ADM1272.pdf
> 
> Since v2:
> - bump for feedback
> - removed commented out code
> 
> Since v1:
> - addressed Joel's comments
> - split out tests into their own patches
> 
> Thanks for reviewing,
> 
> Titus Rwantare
> 
> Titus Rwantare (5):
>   hw/i2c: add support for PMBus
>   hw/misc: add ADM1272 device
>   tests/qtest: add tests for ADM1272 device model
>   hw/misc: add MAX34451 device
>   tests/qtest: add tests for MAX34451 device model
> 
>  include/hw/i2c/pmbus_device.h |  506 +++++++++++
>  hw/i2c/pmbus_device.c         | 1596 +++++++++++++++++++++++++++++++++
>  hw/misc/adm1272.c             |  543 +++++++++++
>  hw/misc/max34451.c            |  716 +++++++++++++++
>  tests/qtest/adm1272-test.c    |  445 +++++++++
>  tests/qtest/max34451-test.c   |  336 +++++++
>  hw/arm/Kconfig                |    3 +
>  hw/i2c/Kconfig                |    4 +
>  hw/i2c/meson.build            |    1 +
>  hw/misc/Kconfig               |    8 +
>  hw/misc/meson.build           |    2 +
>  tests/qtest/meson.build       |    2 +
>  12 files changed, 4162 insertions(+)
>  create mode 100644 include/hw/i2c/pmbus_device.h
>  create mode 100644 hw/i2c/pmbus_device.c
>  create mode 100644 hw/misc/adm1272.c
>  create mode 100644 hw/misc/max34451.c
>  create mode 100644 tests/qtest/adm1272-test.c
>  create mode 100644 tests/qtest/max34451-test.c
> 
> -- 
> 2.31.1.751.gd2f1c929bd-goog
> 


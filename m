Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FBC4C82AF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 06:01:41 +0100 (CET)
Received: from localhost ([::1]:44006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOudo-0000et-61
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 00:01:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelo.schmitt1@gmail.com>)
 id 1nOsDM-0003Kd-L1; Mon, 28 Feb 2022 21:26:12 -0500
Received: from [2607:f8b0:4864:20::c35] (port=44556
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelo.schmitt1@gmail.com>)
 id 1nOsDL-0005vT-0a; Mon, 28 Feb 2022 21:26:12 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so21056998oot.11; 
 Mon, 28 Feb 2022 18:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=MnNhFIgMAn/jAADic9V1Aj+2bLQDoMvnVPOMDxBpfds=;
 b=dKs/d67B6u9aU4yHfNlHR6Hv3HEfyLPmaiRqJ+s8TBBbW4A0r9uWlxkLpU2VvtGWvw
 974yGwKZO7hADo0oVXU+XKynExo9vaFPi70L4a19oLgGm99B4BMUQtA0d5hwBbOXeYs2
 7aOtjnpXjTiLqAqbenaYbXDTjpe24cat+gbypa9OuMRGtWVHY+dGuQHXtiugCOY7wYx4
 w1hwLEgkJcXAG+5iviLZeSZkJcXkmEXl0KbtKQv2HfL41c/RAdpmvJSg2kbnOVaUZl/s
 jmkn/LISoMZd9FasKyO5GKH3AmgawhaBdfj8rkSLNwScbn7C0zKx1gyNHJ4elgQFh3fx
 WR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=MnNhFIgMAn/jAADic9V1Aj+2bLQDoMvnVPOMDxBpfds=;
 b=VTmnZeJvClzsePmn06m0HEoFNgzb99W6MZeijSVXo56hUjYfnNrr4zrYKsQPAcan6a
 nsz+AEA/GexRVO5qy21gxdxNVvgErYtXTHRavQWj1+TQlT+C0PWXiJZV2tMCtLPCAq6I
 jCuFf6XxUgyElFgUWAh9PeoebVHiJ1hswXBYW8aPcb8Mkm7qmWpKxpVzKZn03WXr/4Pv
 f0zpV3ozNSoBKBqmzS3oxFITH8PzxyxzQqq/c1a8biiHkc70Fqu709UKdkBPPz7ffNyY
 Q8+XbdXZXaigS01J7btSJNmdjbtWwGdLqzr2RUzLM1EwUZhZ5sdxCuiaakWvX7B9K6Au
 BlLg==
X-Gm-Message-State: AOAM533UuY67cpmRlSmcH+7uo5bIBNwziWvXDRACas3wbP1KglX5HLyz
 zQ9UZHnH/IjNDLaHSaSMe4NzrQSxwVY=
X-Google-Smtp-Source: ABdhPJyjZSA2Ve70ITPggPJwK0Mge3hwXQLTdTKTIl0Bx5Wrkk/DeV0iHYtB8rG+Rt89fvx9SldnIg==
X-Received: by 2002:a4a:2a4e:0:b0:2c6:c823:e6b4 with SMTP id
 x14-20020a4a2a4e000000b002c6c823e6b4mr10717886oox.29.1646101568736; 
 Mon, 28 Feb 2022 18:26:08 -0800 (PST)
Received: from marsc.168.1.7 ([2804:30c:b7a:7b00:70e:e3d5:be94:991])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a056870d20700b000d1614be328sm5310656oac.27.2022.02.28.18.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 18:26:08 -0800 (PST)
Date: Mon, 28 Feb 2022 23:26:05 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: qemu-arm@nongnu.org
Subject: SPI support for the virt platform
Message-ID: <Yh2EPSvM0xLUYW45@marsc.168.1.7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=marcelo.schmitt1@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 23:59:18 -0500
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
Cc: qemu-devel@nongnu.org, theobf@usp.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I'd like to know the opinion of the QEMU community on some topics.

In 2021, a pair of patch sets for drivers of the Linux IIO subsystem was
proposed based on some QEMU hacks that added virtual devices with which
it was possible to test the proposed modifications to the Linux kernel
[1, 2, 3].

Most Linux IIO drivers connect to the system through either SPI or I2C.
So, it ends up that these buses are needed to do some tests on IIO
drivers. Because of that, those QEMU changes included hacks to the virt
platform to add SPI or I2C buses.

The documentation says that virt is a generic virtual platform [4]. In
this regard, adding more buses to virt could turn the platform into
something less generic. However, if support for SPI/I2C were added, then
it would reduce the effort needed to develop virtual devices to aid
driver testing. Before putting effort to develop something concrete, I'd
like to ask just to make sure:
Would SPI/I2C support be a good addition to QEMU virt?

Another possibility would be to add support for SPI and I2C buses on
Raspberry Pi boards emulation [5]. Would this be a better idea?

Also, the QEMU devices developed could be upstreamed. At first, I
thought that developing virtual devices would be a win-win situation in
which we could extend Linux's test coverage and add support for new QEMU
devices. However, as these would be dummy devices, I'm not sure how QEMU
would benefit from them. Anyhow, I'd appreciate it if anyone could give
a word about that.


Thanks,
Marcelo

[1] https://lore.kernel.org/linux-iio/20210314181511.531414-1-jic23@kernel.org/
[2] https://lore.kernel.org/linux-iio/20210614113507.897732-1-jic23@kernel.org/
[3] https://github.com/jic23/qemu
[4] https://qemu-project.gitlab.io/qemu/system/arm/virt.html
[5] https://qemu-project.gitlab.io/qemu/system/arm/raspi.html


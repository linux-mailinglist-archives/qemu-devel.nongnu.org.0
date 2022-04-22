Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EE750B146
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 09:20:25 +0200 (CEST)
Received: from localhost ([::1]:50536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhnaZ-0007fp-Sn
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 03:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <renzhengeek@gmail.com>)
 id 1nhnXj-0006mj-GX
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 03:17:27 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <renzhengeek@gmail.com>)
 id 1nhnXh-0002PG-Px
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 03:17:27 -0400
Received: by mail-pl1-x630.google.com with SMTP id c23so9013018plo.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=3vVNIVAlBH80TocSXjA7ROsLn6o/cil8RIwOaIjfHNs=;
 b=YfTmyZz3EEYO4KOWIctJgxKFn0hDle4us+0wcpuYWnMGj4FgL2R7Vdu93ThkpA6hzq
 Ip1ndM1IWsSdDQV3WrXb3O+q9hC6YZjgO1GsVVSUwUPoDtNu5t6uVVVSqthUunwG8lZy
 OL/BVgyUVIe2fg0xBWd1hwTW9xKV/+9O7AHKa06NQXpvMIzMsBPKZJvqr/IhH8OQqr4T
 gYq5fNG6lF01OFPKfS4Fj47JsoZqee/VJUcrsBLe6PLoHTve6cgOh0uxRf1ITb3Z8xgu
 mkQmzSzFJ9MqP9BLstOKEb42HSAfCFbtW2MLCSCUSzsJs7sIok2TCNa0Lx8a0KIgeruM
 Jb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=3vVNIVAlBH80TocSXjA7ROsLn6o/cil8RIwOaIjfHNs=;
 b=6ahPjoL4ocHjGOJ09+ezPzLOnROAcnS0X/16C5zSGZiy8OMqGlewD3ovaMT9G6vvID
 vDhEo55VmOSg+UG+28SIaGA6+svOc8ZGy0p97Cv3LYqmWeHc8++XUsFDMRJWCn4RF08P
 EJjSOAQmeuPSgiDO6vu2ww0WfovUo6RIQhx7CD2MkzHC2biImN6ngJv2UUmO8sS/mKeL
 hNqzb/gAQAxaB5O9hugNdKIV2hPJfZpP4vOuBdjl8bCwnYSyTzSd3jXwfCsLqyHNi5/F
 qte8wd2Tgvb85zw0lg0/N7UE9KK1YntqAccWi5GMiP7qR5Jwm0JRYwcTPkRZ32WGldM9
 K38g==
X-Gm-Message-State: AOAM5309/j6gAQ9krxGFDIgR79einSjShjCUfXTJ9XicpxIR2Y/f+z0R
 aXg3HiPAohw/Zpjcihgu8bDOQWSLoXa60bPBdGU=
X-Google-Smtp-Source: ABdhPJxaRid07VWpA8PrxQSaGIbzTqQhDWw9TMSXB7yoWGApNkxTTXUJnz5uoUqOjM4LHMzG5viX6nGXknQQC/e9Qs0=
X-Received: by 2002:a17:902:7d81:b0:14f:e18b:2b9e with SMTP id
 a1-20020a1709027d8100b0014fe18b2b9emr2999519plm.160.1650611843704; Fri, 22
 Apr 2022 00:17:23 -0700 (PDT)
MIME-Version: 1.0
From: Eric Ren <renzhengeek@gmail.com>
Date: Fri, 22 Apr 2022 15:17:11 +0800
Message-ID: <CAKM4Aewqpfy3AGFi3Y+roA4jDigYOEbW6oBb3XpsVyxFCYne7g@mail.gmail.com>
Subject: Is it possible to support hotplug device to PXB bridge?
To: marcel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=renzhengeek@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marcel and all,

It fails when I want to hotplug device to PXB bus. Then, I find this
commit that explicitely declares the fact that PXB bus does not support
hotplug device onto it.

7b346c742cd9 ("hw/pxb: declare pxb devices as not hot-pluggable")

Could you please help confirm the possibility to make PXB bus hotpluggable,
and the main work to achieve it if possible?

Yes, pxb-pcie with Q35 do support hotplug, but we use i440 machine a long way,
not  willing to change machine type to have it.

Thanks,
Eric Ren


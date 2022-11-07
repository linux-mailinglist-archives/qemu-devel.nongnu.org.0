Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303AE61ED70
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 09:50:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orxod-00030R-PY; Mon, 07 Nov 2022 03:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1orxnp-0002ye-W7
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 03:48:26 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1orxnm-0006rM-PT
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 03:48:21 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h9so15122729wrt.0
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 00:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BrsZNPdUEiOXz5kOMyQgmWm0LBz2fMMpURsquXo8K1U=;
 b=GvRrP93++pUPRWC9MP23tCQufATFRyt+GrUuh86ehUoyqat96Mg5guHUh9Y2LBsb/W
 /UxwoFH8/x7YSeiQn4PDdyOkVKy5wbCaK4Ok7xhTmbUwgDlvMUu+YgdP1yJYh0YENLWP
 vluf/cm+rdb+4rkCiXQvJi4JYVjidHoJS27v5zlJNod9Eq78Zx6EqXvLXIu5wZ71m0sW
 BKi3n+ViBzzTkN1JR+ehlu01G8aiPXAB33K7xjWxopo8Cr1KolYCJmff/BN0HZbQ5Ltw
 bytfne8GvbFhT4wedVR7rGL8nFBG2q3BKqnFncJVYmdfvs2kSXA+Zty7HVLnHZ7Lt+g0
 T4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BrsZNPdUEiOXz5kOMyQgmWm0LBz2fMMpURsquXo8K1U=;
 b=i5JCYEZGLDUIcfsLENp8kZYX3bklsJmD99x7ikc0Mn89GZuiSyCwX8gqoTF6r7Emg/
 Z++AmZ4RufMlzMacPTttlewtdsnHLNDBLOsMf9ZdILr+dfs65Z1kHNywKNP/AVJ3O6lC
 Pj3kW0jum6AUGRAUbVG3k837yavyljjog2WJSd1xIysmYCkmEZKiZi9ux8DJLOQ2F6Br
 ko80K6INAA+aQMMaf0rstXFrCw1rZNTn5Ykz9NdHjt48AjwwGzRnXImpDhF7oCWJ7vsN
 JL7TTBpSr3dy/cqqqH+qDt6sXKWtSTLYwy8YatWCK4gUNeAnNoARwgi5FFXHpTdahQS1
 B1gQ==
X-Gm-Message-State: ACrzQf0bh6cY3vapFAKZfeV2Yy/5rGRGB+FMhjsZH/glOl4XPL7Jh0b2
 xZtehPQ/zCC3zQERJptr7o550g==
X-Google-Smtp-Source: AMsMyM73r3WIRN6+QD24QQfPuqr1WgCJHxLIdENaJZpiQE7Lor7GXOTLQaeAIW2H16wxw4GI3h1qEA==
X-Received: by 2002:a5d:60d1:0:b0:237:46c8:1f6d with SMTP id
 x17-20020a5d60d1000000b0023746c81f6dmr15543700wrt.232.1667810885541; 
 Mon, 07 Nov 2022 00:48:05 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b003b4c979e6bcsm11606634wms.10.2022.11.07.00.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 00:48:05 -0800 (PST)
Date: Mon, 7 Nov 2022 09:48:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Mike Maslenkin <mike.maslenkin@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <20221107084803.myuc77xssykljyxv@kamzik>
References: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
 <CAL77WPADAWY8+2FZSQ=4PRcuUrwuUQ22CU+NoVLABM_r+px0pw@mail.gmail.com>
 <Y2ibaoOzna0iT7Sa@sunil-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2ibaoOzna0iT7Sa@sunil-laptop>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 07, 2022 at 11:16:00AM +0530, Sunil V L wrote:
> On Sun, Nov 06, 2022 at 10:20:57PM +0300, Mike Maslenkin wrote:
> > Hello Sunil!
> > 
> > What about virt_machine_done() function?
> > kernel_entry variable still points to the second flash started from
> > virt_memmap[VIRT_FLASH].size / 2.
> > 
> 
> The base address of the flash has not changed to keep things flexible. So, I
> didn't change this portion of the code to keep the changes minimal.

I think we should change virt_machine_done() to be consistent with
create_fdt_flash() and also add a comment in virt_flash_map() explaining
the base addresses are statically determined from virt_memmap[VIRT_FLASH],
but the sizes are variable and determined in virt_flash_map1().

Thanks,
drew


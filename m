Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B485E9825
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 05:06:19 +0200 (CEST)
Received: from localhost ([::1]:50022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oceRl-0005ep-Kw
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 23:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1ocePi-00042c-PE
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 23:04:10 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1ocePc-0001wo-OI
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 23:04:07 -0400
Received: by mail-pf1-x433.google.com with SMTP id b75so5350689pfb.7
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 20:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
 bh=yOzUTV+fDqQ5+LFmYZo90E5qrlh0/QJZlz+yc5r2lWY=;
 b=sjHSA3Rh5Qej9vz0Xw1GSMZPID84cNS1PlxuiN7Sv6sRN4vd/bhqfhp2YqTN1OSiRt
 Y+NOIQoVgkLXZb3is1uOboTgsWo7SNtNpDwXDp/mlp3InRa5h5Vy68BujchoDAdGqZf6
 AcH+W/SKGv+N68wytioO0QdyFy+/yMADVQfbNDOWfEF3/vcMgz8LibMyEicP3EIPG5K3
 DNfITzFcbdcA36OFqG9oNkEnER/c4FWHa0ljA+ZMDUHpDdqgXLmg5iMxe9R8oHiVdBiR
 DYflE9lKl8d6LFrTmT7wvUEMME5NyGNVtnUnMt0K6XtzPAfyYA5RK3d8MAGaJnCTs+ut
 1aSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date;
 bh=yOzUTV+fDqQ5+LFmYZo90E5qrlh0/QJZlz+yc5r2lWY=;
 b=Y3C6b/KFi9p+xC8/tnQ5HXUYZV80P2hX00CpIZph2UUHCcRAtaUmz2fn92XqUfDHCU
 XEvCbsvuIJ4xKQSCIBMR4buL9B3KExU/Z/WEEuoGx74m0DwrJ4mzwnW9BRF8ThePAbKr
 L/jifyUnV0HFBrEkI+9G61rLs5uAw7FYYQhpyl+wxySnXomDhL5Ez1SY7+YK7idlwsbd
 Cgsg6Tv5QBy9Q7kEJ8V9nPgJEoTeq3nTeWbZKQsLd+mkfwFtvlx1mBmrRAxjyocjPDwC
 tCUIjqw5Mvj2hWOz7bTaJnZ7H2IsqiSr+ROPOXwUqUJ+lv+cWfoyi72s/qtsvoaD7yz/
 7zPg==
X-Gm-Message-State: ACrzQf1RaLQiweG68PGi8MY4YjytMAuVAXJEf2mIDKuL64Q5hZx53HZQ
 y64D0i1+m3prhVGoNreB0L6Zo+9ibJVVsg==
X-Google-Smtp-Source: AMsMyM4GFB6adRRjq3+wKjeogANtrHaUl8HjlRwdN2qOazqtHvuutaqlh2or/Mu4YHi4HmlgcdHT1g==
X-Received: by 2002:a63:8bc3:0:b0:43c:a42d:e363 with SMTP id
 j186-20020a638bc3000000b0043ca42de363mr4665465pge.301.1664161440899; 
 Sun, 25 Sep 2022 20:04:00 -0700 (PDT)
Received: from [10.254.92.165] ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id
 w62-20020a623041000000b0053e156e9475sm10730534pfw.182.2022.09.25.20.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 20:04:00 -0700 (PDT)
Message-ID: <8790edcf-c38d-5855-e8b9-ef4725c52fdf@bytedance.com>
Date: Mon, 26 Sep 2022 11:03:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Cc: helei.sig11@bytedance.com, berrange@redhat.com, arei.gonglei@huawei.com,
 mst@redhat.com, pizhenwei@bytedance.com
Subject: PING: [PATCH 0/4] Add a new backend for cryptodev
To: qemu-devel@nongnu.org
References: <20220919035320.84467-1-helei.sig11@bytedance.com>
From: Lei He <helei.sig11@bytedance.com>
In-Reply-To: <20220919035320.84467-1-helei.sig11@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/9/19 11:53, Lei He wrote:
> This patch adds a new backend called LKCF to cryptodev, LKCF stands
> for Linux Kernel Cryptography Framework. If a cryptographic
> accelerator that supports LKCF is installed on the the host (you can
> see which algorithms are supported in host's LKCF by executing
> 'cat /proc/crypto'), then RSA operations can be offloaded.
> More background info can refer to: https://lwn.net/Articles/895399/,
> 'keyctl[5]' in the picture.
> 
> This patch:
> 1. Modified some interfaces of cryptodev and cryptodev-backend to
> support asynchronous requests.
> 2. Extended the DER encoder in crypto, so that we can export the
> RSA private key into PKCS#8 format and upload it to host kernel.
> 3. Added a new backend for cryptodev.
> 
> I tested the backend with a QAT card, the qps of RSA-2048-decryption
> is about 25k/s, and the main-loop becomes the bottleneck. The qps
> using OpenSSL directly is about 6k/s (with 6 vCPUs). We will support
> IO-thread for cryptodev in another series later.

PING, sorry if it made noise, can anyone help take a look at this patch,
thanks.

Best regards,
Lei He
--
helei.sig11@bytedance.com



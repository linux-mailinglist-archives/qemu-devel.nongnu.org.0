Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F282F3057
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:12:23 +0100 (CET)
Received: from localhost ([::1]:33790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJTC-0005I3-9u
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:12:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzJPd-0003d0-C0
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:08:41 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzJPa-00025t-I7
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:08:41 -0500
Received: by mail-ej1-x634.google.com with SMTP id e18so1966503ejt.12
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 05:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GWXW4QYH2OWM/ZQe/9Etir1Fy7gAFL71ZMwb3fbkeZM=;
 b=oHmZaTWg0PsgAXxhwF+SLEVLXVTfbyG5UFK3yxGVUU9AwE8oVyzbXAnznbovAaG4ET
 JX8ZlNcOZeD5qDJ4tz8G3djS/G1TwSLKB+E69WvWDfyeqz+0SMXsoZ0h/7XbBlGERi3L
 KzC+9VsbhCmIV7Fvov0W1meu4XDwYeC5daldWBIFGiNK78V3wJ0mxtZaDiPT56aJSDbi
 Uujn+Grg19Eu5kyxAOWWQwpnBQTNuxsGOSCnVc7kY3ilUZy3De0n+R7H9PkCzbQF+PSQ
 3gwC0F8ReqLqRFm/NkhR8AX/AjZiKkD6Ji3LN3eG/QaRtrGqMMkMeMlTRa0fG8ficwBy
 bEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GWXW4QYH2OWM/ZQe/9Etir1Fy7gAFL71ZMwb3fbkeZM=;
 b=YKHEHJ8aUq0kU0mpw0TxTE4GXIkO6yqPi4CU1mLFJ3QRZPwgc2NOYDh/VHSieTeHI1
 VPYiNdcVzgcYMmpps07Qvsg8dd1FfSBpUXY6r3Do5ZgrE1tB5zhJl//6FP8kK7xFh58f
 i/DTA3rfUMYzPCItOA1HYkDPtTt+KV4XLUsqr1xGZHbED8w+3LvwgGtGNOqpQ9eSbbH1
 gJY/TtbolJTAl6uwFQEC8uM+zVHfY75c1oI7UJA1g/pN/azMmgA/Qp08R7yk2f3akiZu
 vlo4tsWpexIKaW6ahqwOk5gUHPzWlS2u/ciE1Hqoi7+5Ssch1wBa62COoU/slgzSr/lD
 ZMWw==
X-Gm-Message-State: AOAM530N8kz4YaBwYGY8gRAx0ZqrSzGiBsCX5duW7Dik9XK+7S4/er4U
 XL5FYrXqqehV1xyE5xZRO0Y=
X-Google-Smtp-Source: ABdhPJz4O/59zLT1Zvqo3LlzpFlGfUJzgIphcjpgA9BpJD67DUtlzY15M9ySjJl2+UjqZ7AFCUpCCw==
X-Received: by 2002:a17:906:b217:: with SMTP id
 p23mr3188121ejz.461.1610456913185; 
 Tue, 12 Jan 2021 05:08:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id a20sm1406796edr.70.2021.01.12.05.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 05:08:32 -0800 (PST)
Subject: Re: virtfs-proxy-helper fails due to bogus libattr test
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20210112105110.2f0e4fbb.olaf@aepfle.de>
 <2315616.PpvBb8DKss@silver> <20210112122900.GH1360503@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <13c2a785-a8a8-6a17-3265-b3597fc5d734@redhat.com>
Date: Tue, 12 Jan 2021 14:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210112122900.GH1360503@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Olaf Hering <olaf@aepfle.de>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/01/21 13:29, Daniel P. Berrangé wrote:
> The -O0 might come from a pkg-config file
> 
> $BUILD_DIR/meson-logs/meson-log.txt
> 
> might show where it comes from.

It's added by Meson for compiler checks.  It's useful for example for 
functions that are declared as const or pure, and would be optimized 
away by the compiler.  However, it does not matter apart from causing a 
warning to show up in the logs.

(The warning is probably caused by -D_FORTIFY_SOURCE=2 in the CFLAGS 
environment variable, though I cannot say that with certainty.  QEMU is 
able to add -D_FORTIFY_SOURCE on its own).

If I do

$ CFLAGS='-O2 -g -D_FORTIFY_SOURCE=2' ../configure --enable-attr

I get the same warning in the logs, and nevertheless the summary reports 
that the test is successful:

                ATTR/XATTR support: YES

as well as in config-host.h

#define CONFIG_ATTR
#undef CONFIG_LIBATTR

Unfortunately, from Olaf's report I cannot understand what the 
virtfs-proxy-helper failure is like (since no "make" log was included) 
or the exact details of the build environment (since no 
meson-logs/meson-log.txt is included).  Olaf, can you expand on that?

Paolo


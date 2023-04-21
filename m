Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B946EB202
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 21:03:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppw1H-0000OQ-Al; Fri, 21 Apr 2023 15:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ppw1E-0000Nn-Ih
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 15:02:04 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ppw1A-00011d-5I
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 15:02:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f7a7f9667bso1320859f8f.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 12:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682103718; x=1684695718;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=feuCjneQzEafoveiAYEavrlx45kQbUtLGqTQlKENo74=;
 b=sHD6eJvUGNAJmD2G3kz/I0NcJcigMEsu+JlTfZOaBstkrZIk/J5VPVz3L8k5NDajcC
 hoxeOpUu4BcWFho5a+E4wMp2kyVApRKV6W15i+gRG6iFJdThRlBBz7wBikf0oIlXXqOA
 3O/Ghd/xznTIiUTnU8VGGbQoK3FYId/CWJSGS53dx0O+LGiZCbzxBPix1SDqKjZxFEJN
 CycW1qcoDMHVtFK2BqJvVTT6WGnwGShm7f6gokmPSwlI8OgbVrYVtYxGXGGugSOWmRBa
 8xT11zUUPukTNpRBCrl2Wh25dcWkfoN9Le9ApfOyPNbo/8mcFYiw8liuHSB9g2UnUn7l
 /QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682103718; x=1684695718;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=feuCjneQzEafoveiAYEavrlx45kQbUtLGqTQlKENo74=;
 b=NOCfw8rbSVUjQBk1XQOTvQaVQ3PbYMkUCP3iEusE2p/RdrnI8oI+FA46liJ5WC3RXR
 Px/bzJE3qLAf5dJuRGRN8kBB9FIJDpYcbXwlaPhSvPTYE49JQyqlsmbtcV2ol7NT+DMR
 iIZbmvzpPkjZW6ua4pFtTAoNDMs7az/iSeI9wwC5fb4pBsOeqJZ4DbPBIXaLn4N3r4pR
 QeNyTpRi/eRjCGFS1PZ0yHdcX3HEvCdfI0aJjqq+3heBVGHQJoao5mnAOhd+VgmE/b6K
 LWX09shqkKmDMPnME57zyY+s+MiPQ8roc7ZHQ/7dENLgmzN0X9bHAG/AILgLL10nWO8B
 JU3A==
X-Gm-Message-State: AAQBX9dLyl8zZKU0etgeRnF6qf5rCPMixGbHhqg8Gnh76bUb6YWkdCDd
 klYUvumQIhfnU59UHad+hifJjg==
X-Google-Smtp-Source: AKy350ZOQ2Zn4Sqvkc1kthlHLa0Tb92euChIPL2UizFOpALnPJTGTwfpWlDXEWTrv0HuPIb5MXoOqw==
X-Received: by 2002:adf:f48c:0:b0:2fb:2a43:4aa1 with SMTP id
 l12-20020adff48c000000b002fb2a434aa1mr4579803wro.42.1682103718532; 
 Fri, 21 Apr 2023 12:01:58 -0700 (PDT)
Received: from [10.43.13.97] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 f8-20020a5d4dc8000000b002f9e04459desm4931600wru.109.2023.04.21.12.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 12:01:58 -0700 (PDT)
Message-ID: <e7775d5f-292c-2a88-afaa-5731ee1bc897@linaro.org>
Date: Fri, 21 Apr 2023 20:01:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/20] Block patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20230420120948.436661-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420120948.436661-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/20/23 13:09, Stefan Hajnoczi wrote:
> The following changes since commit c1eb2ddf0f8075faddc5f7c3d39feae3e8e9d6b4:
> 
>    Update version for v8.0.0 release (2023-04-19 17:27:13 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to 36e5e9b22abe56aa00ca067851555ad8127a7966:
> 
>    tracing: install trace events file only if necessary (2023-04-20 07:39:43 -0400)
> 
> ----------------------------------------------------------------
> Pull request
> 
> Sam Li's zoned storage work and fixes I collected during the 8.0 freeze.
> 
> ----------------------------------------------------------------
> 
> Carlos Santos (1):
>    tracing: install trace events file only if necessary
> 
> Philippe Mathieu-Daudé (1):
>    block/dmg: Declare a type definition for DMG uncompress function
> 
> Sam Li (17):
>    block/block-common: add zoned device structs
>    block/file-posix: introduce helper functions for sysfs attributes
>    block/block-backend: add block layer APIs resembling Linux
>      ZonedBlockDevice ioctls
>    block/raw-format: add zone operations to pass through requests
>    block: add zoned BlockDriver check to block layer
>    iotests: test new zone operations
>    block: add some trace events for new block layer APIs
>    docs/zoned-storage: add zoned device documentation
>    file-posix: add tracking of the zone write pointers
>    block: introduce zone append write for zoned devices
>    qemu-iotests: test zone append operation
>    block: add some trace events for zone append
>    include: update virtio_blk headers to v6.3-rc1
>    virtio-blk: add zoned storage emulation for zoned devices
>    block: add accounting for zone append operation
>    virtio-blk: add some trace events for zoned emulation
>    docs/zoned-storage:add zoned emulation use case
> 
> Thomas De Schampheleire (1):
>    tracetool: use relative paths for '#line' preprocessor directives

32 failed CI jobs:
https://gitlab.com/qemu-project/qemu/-/pipelines/844927626/failures


r~




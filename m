Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29EE374DD0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 05:07:19 +0200 (CEST)
Received: from localhost ([::1]:43764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leUMA-0007Kv-H9
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 23:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1leUJx-0006h7-5M; Wed, 05 May 2021 23:05:05 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1leUJv-0002QS-Bi; Wed, 05 May 2021 23:05:00 -0400
Received: by mail-oi1-x234.google.com with SMTP id k25so4229112oic.4;
 Wed, 05 May 2021 20:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gdw2jFIMcThZTTxIoPSGwrRcEL8emCAS9GyEWUFVI9M=;
 b=DpJ3NCS/oq9/sFN2NpHmvpLPm2fGM31sS6Tym9bP0C2x+HEdwPr61pP5N0fNmVSAWr
 7T/+rn4V8QwwSvKb8rbVCLVnNZDCC+G209oCQSrdy53ipu5rW7fW+c2zBYTfMgdyE2WE
 HbC3pB83wrU+VjeeYw890SzMlVOizsDaLnA9uQDDBXIF0l2qf0Hvlc+aUT2T/NroPfzP
 wEduVMUkUJup7pZ6qFNnW2rglS4/F7GX5CxdmkC2uFRnohpMdhT3HX6jrXhGh1UaGnxP
 Mznk9CFSG+2leb/+EJhbnLfj6oQcvkhUqswmPXlCmyP24PSFDjUl+hdsxb6AwVE7YXRl
 /EgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=gdw2jFIMcThZTTxIoPSGwrRcEL8emCAS9GyEWUFVI9M=;
 b=XpLa8Tn7yBHWNSENBLYlG47+KHny4vuEQ3ZHj4HdzXnHtBYtPtqg8zDZa6czhL6/pm
 wznDyALPqKZMMkPUKo0U/Mw582Wf/8PVkuaAhRDkT4ujh/NDgZZIG3nBF4tgKNSPa1DU
 bWrbn6QGgspkgaiIDeFMvCBA3hnXKlxpvAQlr6yomR0niqPY4gGDHJXJoA7dJb9esEUR
 vFZyRQuEnxmR0jzXnQset/BZheY46EmKGBoLgPnFhC4gbzXGHkWFP2IzfbGNMafgT+V1
 8jY9pLNDHy8WVT3ZLpcvlBNk2XxCcqbCoe3W9CqcvyN4mVAm47U+dwdpBKRNgtERnpPB
 4QpQ==
X-Gm-Message-State: AOAM532M1xy2dLHhO0ummGBGnNYr1i2m2q04LfDC4igR6cPlBWtoCjGA
 UaVGB//3T3V/Krm9st0Zc1s=
X-Google-Smtp-Source: ABdhPJzrR4Ey+hi3gT3KFGQjtoXiigElsuoWWIfGRFytR27+glC3gmhj4j0Ek6PeOXty1DHMJRctiA==
X-Received: by 2002:aca:408a:: with SMTP id n132mr1488126oia.70.1620270297882; 
 Wed, 05 May 2021 20:04:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l8sm309517otk.36.2021.05.05.20.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 20:04:57 -0700 (PDT)
Date: Wed, 5 May 2021 20:04:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] hw/net/imx_fec: return 0xffff when accessing
 non-existing PHY
Message-ID: <20210506030456.GB741106@roeck-us.net>
References: <20210502160326.1196252-1-linux@roeck-us.net>
 <CAEUhbmWC_jVkrF9V=rs+A2A021ahqefimFtehsxgfvTxphwKZQ@mail.gmail.com>
 <bffabe57-013a-1aca-e854-38a211738049@roeck-us.net>
 <982bc15e-1e88-8871-54b4-3dc74f540727@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <982bc15e-1e88-8871-54b4-3dc74f540727@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 06, 2021 at 10:24:52AM +0800, Jason Wang wrote:
[ ... ]

> Ok, please send V2.
> 
You should have it by now. Please let me know if it got lost.

Thanks,
Guenter


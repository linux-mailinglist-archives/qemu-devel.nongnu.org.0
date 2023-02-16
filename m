Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E929699667
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:54:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSei4-0001Fh-H8; Thu, 16 Feb 2023 08:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSei3-0001FQ-BZ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:54:03 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSei1-0006ko-SX
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:54:03 -0500
Received: by mail-wm1-x333.google.com with SMTP id p5so1613952wmg.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TQ442iw9QPbRaJ8g3n9S9lRb53UDu2jxW7R63YiAGYk=;
 b=WrUD/Qdp1S/ZipXGy6+4d9Jk1D4twlJdj8Gzn5s3mY8rKL3POqS7VDNCHxQ0hKOky4
 FcCq9I9dnn/cHaLXaJIQDao7yBaSpi+J8YlwLuh8gcwcAAIcZNMFJFLo/DLCneQ+pRHr
 kxktPprbENeGpZGjFxxKG130hlTw/CGKmUmExufhiAzQ7ah5RQ2dzCZnP3xjwxilD24b
 xvC6+JvH0/GKSuXm+7p7ekvMW5wfvnnlnMPEgMjk2eZ1vL6TM7hANj5Axuly1KfGmb7+
 UuTkj6X8tw90bm9vuA++Erehv4yDdqKRnddbGR8GTTwDGcUoX20JL4CWU9AOqtDUN0r8
 w5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TQ442iw9QPbRaJ8g3n9S9lRb53UDu2jxW7R63YiAGYk=;
 b=18dH8nrf27nozffIZpRydBTii8Sk+nFA3W6hSXqxPcyNPDRQi+lrP1PiGAAYwNwKE6
 1sQ3wM3HSSJC5SfVc0WXmHGrQhDNCeIi57ZKP5tLs+CD1o4FxFI0uMEZ4l3EXIGdvg8p
 L3T027PlAc5kpiAV4VpLC5DLZIVhbE/T7swW81lWTlpOqKuB8r5hy2JQ+ehDDzNUvhlB
 9UeY8yDAhSSFtQhZPot9jCVWZ8HD0KfZpbEAu3QCXpCjHJDrfKJA0x6Q/noVscR/utPX
 z265Se4His6KJwfM0pgKEdcmr9OtCBeUhBGTW+yl8jyv3pAhqQ4hIj+JpC+JUWU2KTGZ
 uXWA==
X-Gm-Message-State: AO0yUKW2uRHqPRDH4Bkk7NzKOso4CdziR9OEWkMHqW/24ahKbR6X64sU
 4Ujvnni8tCKFBFEvEoxUrVcHWQ==
X-Google-Smtp-Source: AK7set+Y6C+gCXuf5xdGFPcGBuf5H/y/eJUhM6EXzG0HAIxfCXF2Zkyr1Sl1NP9bEds61cNRATZauA==
X-Received: by 2002:a05:600c:1d25:b0:3dd:c896:d2b1 with SMTP id
 l37-20020a05600c1d2500b003ddc896d2b1mr230677wms.0.1676555640342; 
 Thu, 16 Feb 2023 05:54:00 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 d8-20020adfe2c8000000b002c3ea5ebc73sm1559925wrj.101.2023.02.16.05.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:53:59 -0800 (PST)
Date: Thu, 16 Feb 2023 13:53:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 12/16] hw/arm/smmuv3: Add VMID to tlb tagging
Message-ID: <Y+41c8x5SCoPfZck@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-13-smostafa@google.com>
 <ae0d6155-138e-5005-733f-f3932a14c6b3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae0d6155-138e-5005-733f-f3932a14c6b3@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=smostafa@google.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi Eric,

On Thu, Feb 16, 2023 at 11:17:34AM +0100, Eric Auger wrote:
> >      }
> >  
> > -    *key = smmu_get_iotlb_key(cfg->asid, new->entry.iova, tg, new->level);
> > +    *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
> > +                              tg, new->level);
> >      trace_smmu_iotlb_insert(cfg->asid, new->entry.iova, tg, new->level);
> you may update the trace point as well
I can add a stage argument here, however I don’t think it is necessary
now as TLBs are either used for stage-1 or stage-2, not both.

Thanks,
Mostafa


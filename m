Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A604E609D60
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 11:02:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omtFi-00052R-JW; Mon, 24 Oct 2022 04:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1omtFf-000521-MQ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:56:07 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1omtFb-0002Vt-U8
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:56:07 -0400
Received: by mail-pf1-x42e.google.com with SMTP id g16so3004338pfr.12
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 01:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vI7+sH2MkxIGRAMgYMCX6kO6TmdVdUfOBwywroU48HM=;
 b=2LxRCXDlgWikIjfKRUUlJtlbnucmWMt5/8CswD9SNz/0pMx8Vsn2LgZloHhXgL5CXN
 cmUPCyHD9AG92LgbBarUa4+SW6zOKs7ygu7XZuJ+V0uauq4rwJJl1KXmBKiZati9wCuO
 m0HSvgFQhE35aangm00bTxU6BPARx5yUJAPb52bNEpYQHURWJZrB2oi4Lh0A6sbw9I2M
 QVTh4T55PbIqPs3PgLIXK95EZmnfHohtghVYlhODE6QM3GlhJBFoOzT68XzvhowGNSVC
 ZCZPIemoujEGOgPiQNVaHgeLepMetJJYRiJbqr46Q9Or7lcXoCB9Gm3OrCYvbuMdCgeY
 YSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vI7+sH2MkxIGRAMgYMCX6kO6TmdVdUfOBwywroU48HM=;
 b=NNekPsgwQdUaX67pC50McUZLu9t1VMEr2T3yd8FjAHteI2i8nnlNcNQ42wU18nImhI
 Zp7+9bAObZGGbru3/ASC7i0jLUZoFUxA9Q1smvz9JyvD+AlIolRfalVZY+TOa8m9/Y80
 SazAEYIyL5PNpQiVl30hY1eOSX7z3thcc0qltYE47QqhFY+vDswgdX6PnsvySgXLpOjv
 cgaw3M8g5bvqIoM2pUMSz32OUnbCEwEm9yPtIWxv/B/owd5CgOkqOja3kO2hf1lwnjxc
 upBL2ECRiYen4n9UO6hJKhaK5XS/1xm2NW5eOaBedVtfml0BJxCcrhfbkk/FNvef2lld
 1t0w==
X-Gm-Message-State: ACrzQf2VN38JhScVoaSf/NoYny1J2S7IWYkTvwQeEb1ZGS7TJzZ6ht2U
 JNiL9yc/aEc9IeYhZbOmC+ORMg==
X-Google-Smtp-Source: AMsMyM4GJtiWi/+9RNzVwEbM7Pl7TD19AYEecmVp+zTxgniWhK7G7DMvZr+r+85n5dQ0RwVhvt8Ygg==
X-Received: by 2002:a63:d01:0:b0:46b:2eed:50b9 with SMTP id
 c1-20020a630d01000000b0046b2eed50b9mr27448439pgl.71.1666601760777; 
 Mon, 24 Oct 2022 01:56:00 -0700 (PDT)
Received: from [10.254.65.179] ([139.177.225.246])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a1709027d8800b001743ba85d39sm19007476plm.110.2022.10.24.01.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 01:56:00 -0700 (PDT)
Message-ID: <e42736d8-bf32-d467-19f1-7c037ac57630@bytedance.com>
Date: Mon, 24 Oct 2022 16:55:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Cc: helei.sig11@bytedance.com, pizhenwei@bytedance.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/4] Add a new backend for cryptodev
To: berrange@redhat.com, arei.gonglei@huawei.com
References: <20221008085030.70212-1-helei.sig11@bytedance.com>
From: Lei He <helei.sig11@bytedance.com>
In-Reply-To: <20221008085030.70212-1-helei.sig11@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2022/10/8 16:50, Lei He wrote:
> v1 --> v2:
> - Fix compile errors when neither 'nettle' nor 'gcrypt' are enabled.
> - Trivial changes to error codes when neither 'nettle' nor 'gcrypt' are
> enabled.
> 

Hi, lei:
   Daniel has reviewed the crypto part of this patch(thanks a lot for 
Daniel), can you help to have a glance at rest codes? Thanks.

Best regards,
Lei He
--
helei.sig11@bytedance.com



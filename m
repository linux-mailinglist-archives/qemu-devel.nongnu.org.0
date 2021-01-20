Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B4F2FDC6D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 23:24:58 +0100 (CET)
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2LuL-00057C-OK
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 17:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2LrS-0003PI-JM; Wed, 20 Jan 2021 17:22:00 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2LrN-0002FM-Dx; Wed, 20 Jan 2021 17:21:56 -0500
Received: by mail-pg1-x52a.google.com with SMTP id v19so16156613pgj.12;
 Wed, 20 Jan 2021 14:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=WtECB52bAxlu9MLRv2K98UQYEPtL7kWJL33mORt49ZkVY5kWP3QME1ZivaMfP6+c8F
 c3kBd2PonlkzCnCJrwqZ2eXI/dIGRZPF5WTAV3H2yF3RGx6QhBKPeZqOYEJptWCTXYgi
 fC88lgcTFwysM8kTGYUM+b5h4YWkqZqtLKAsdati0ui5UUCLidMSAGRzwJTJea5U0hmW
 jBHNfyGHk1qO7iNUu2JgD4LI/sLqCsKP+9KSbIDtPrqspQWQyUUWc4suemN3Se6nKRoN
 wDDfTMf/qrvepo9Yzb0zWitd+fTZWHq0Ja+7s1zR9NaIteMTN5GRf3Lkx/gHXCvm5eBk
 ZnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=JXxfh6DcTrBT8gOCNPeThLRCr6+EId4s52pzoEJHe7lTn+vHsn7tazWGsEkyPPg4fH
 4V6y9ajRFYO1R0/IZ6UthuFVBvrZXUzobJYrp20KSPTNzUu7aYKsa/bnlWk8JXJJreRB
 4DDWeMGrRW5qTCkux1f0K5FiRlGdfY9wyVHYedcMTgJpRo4uSMC1LCMeW2gXy4nB6OC4
 R4TQ2x8gZJlJ0WWdCMFeDV1as7hfUqDUh5tFT8pVgwQigUyYVNZGY/iT601gg+2OUfEh
 vPbGwyVIQk0vfa+Ah/pPOjIyILHzCefQiqkXzyuvS3oY0iT7/stfMkg3uQNtKs+4++YL
 VZSQ==
X-Gm-Message-State: AOAM530X+a3dTITn/X4AlU80ikJuXYW6mAJXvmqWZOFB56v95kKIlWxO
 sITo69jZ3RZWoBon9o7SkH0=
X-Google-Smtp-Source: ABdhPJyqJgXZoh9EIXw7kRoMwpNwpr2Z7C7LhMJHfHywS2OwmX3k9+l5+c2an9bFwLifOqsMlIPc4g==
X-Received: by 2002:a62:2606:0:b029:1a5:a755:5568 with SMTP id
 m6-20020a6226060000b02901a5a7555568mr11236816pfm.65.1611181311445; 
 Wed, 20 Jan 2021 14:21:51 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id gb12sm896355pjb.51.2021.01.20.14.21.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Jan 2021 14:21:50 -0800 (PST)
Date: Thu, 21 Jan 2021 07:21:49 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3 07/12] hw/block/nvme: remove redundant zeroing of PMR
 registers
Message-ID: <20210120222149.GB2645@localhost.localdomain>
References: <20210119101504.231259-1-its@irrelevant.dk>
 <20210119101504.231259-8-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210119101504.231259-8-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>


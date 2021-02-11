Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CF5318CC8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:00:40 +0100 (CET)
Received: from localhost ([::1]:38504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACWN-0006NF-Gv
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lABjl-0000rE-CS; Thu, 11 Feb 2021 08:10:26 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lABjh-0004Zj-SU; Thu, 11 Feb 2021 08:10:25 -0500
Received: by mail-pg1-x52c.google.com with SMTP id o21so3820348pgn.12;
 Thu, 11 Feb 2021 05:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=iVYfR0quz2FMOk9iqaURKHUNeIHQ4gNb/M70KwHLmIhIPCUrEfX+HD+wO9ylDXHQjv
 OMVFf5xmqvZfaJyaZqFcVxhCf4hy4GvZMvsnL8Pzy/INiLi2lRnowexkB0RIWNcvIK0C
 BxLq8LpWVZqMthNWKuLKdpGw/spKjBB8yFRYXyQK7ajw1yEMRTSAIy/kLFeN5xI+cs51
 kzfVSxQPAuFpiXob0G6ZZu9+W1tdaxLLs04lYjsI4ZTysTKI4r1USBforYu2pmQ4fY3o
 7xeJoo1qTIBRtaVWG92UpMEI/TfKcA3SFb491Yuur9gVQt5k/5sDjtF7b9CaZsQauoXq
 ffag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=kH/8AnLroxE30u6yF2mdIOt40UEN/evS3cAL5X4l2r/cFKDNxAm5VFigfn2VwdkLQw
 2fAh3yDlDq0olJwQJ0r+KbrXsBVLxyYuUeHlSLRnCRT8t3EqPYUbE8JSCfF+5CGyF4eF
 n+HKf3HZV+w/Gt7xyUY+RUbbKW9NSeG20YgEUdAqzkE5P8koMbcB9QLcFMeSmQ+K9OqN
 i8wFZwEH0Qfq/vrPG0RkeY19IlD+ogIZktfhuEd9hZpKdoS+3tn5uWyIPMkW2elamxxD
 z5PgQXLRKbcNHJq7UUO9325mjeBDFAvmokAvv2dikoOZC8zuQEb9Y+KLfUHPx1EnWv16
 es7g==
X-Gm-Message-State: AOAM530GjDD14xvfEZZhM/Lr6Ti5snFbS57dJlPIJbpsDSkBYlzm0jWr
 o8H5LZZ+7HFJmYEiDaEPJj0=
X-Google-Smtp-Source: ABdhPJwPEC+LekxxofZmFgkR6WXgR/HykV0n8FSRLsRUsdHGXGpPsK0HgLxjKUYjuTcGnkDmBg1XwQ==
X-Received: by 2002:a63:6381:: with SMTP id x123mr3760346pgb.177.1613049019029; 
 Thu, 11 Feb 2021 05:10:19 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id w3sm5324930pjb.2.2021.02.11.05.10.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Feb 2021 05:10:18 -0800 (PST)
Date: Thu, 11 Feb 2021 22:10:16 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: fix error handling in nvme_ns_realize
Message-ID: <20210211131016.GH24885@localhost.localdomain>
References: <20210211130721.997302-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210211130721.997302-1-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52c.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>


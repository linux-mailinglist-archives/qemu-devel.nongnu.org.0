Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD52DBF93
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:41:16 +0100 (CET)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpVBD-0000m5-CX
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kpV98-0008Ij-9d
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:39:06 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kpV95-0005MK-EF
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:39:05 -0500
Received: by mail-wr1-x431.google.com with SMTP id d26so9632286wrb.12
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 03:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=94SxtjdOq2nT4CrZ9t3bhVr5wHCEXdQAffz6QM94ebw=;
 b=wuTHzLL7qkC+newP1GRHB3Rx3uGrfzRxLYfH43gNDJBf8rjCBqe5vPFNY+6yQHP5FO
 02WxB/vmp88bGp8WpNknTVB5kqRasqmGWkka/zIajAcJdOI+FwsnNu49OBz4lNdQ2sB3
 vT7inBgDisSnI3/YBAL+uf9Eu47pxL7jeG+UQtyrEEKsCHDQFG1MU2fz/fGjOrzO4/Hm
 QVL/t/kpBSI/+RbrB4LiT6I890z0ESEB/i3TbGm6NYNZCddskJ5HCCS2csA7EFNbCXCN
 4ESc1ztVP+NxjxkDJ6pNSyZJvf/tiCUQkSjb7fylY5uXhuOFdk0A3cGWXDp8o/iAKZc+
 LMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=94SxtjdOq2nT4CrZ9t3bhVr5wHCEXdQAffz6QM94ebw=;
 b=W8kB48OwQpqpBCdJ9baVEpruePBfM+w24XdSJbkIvPx6SkEgIhW0fBJkqcV/Ef2ijB
 hjkbJb+YiUhRd9wwQ9rgiip8kvTlEgnu5HwjNZ2mvHL75tilGyN8WVHvoSNCOvE1p+ph
 hc+CUFyTXanX81/x1RFvlFb+6o9qQybjaKCvyHtN9BMSklfliAWkISnrs3P/eAyfLhM4
 iMxJxSmb1S61vxtZf/yhacazbFln3jtClrgmLeCLN/pj5YmuDB6/k/XQvus37ckj1qHk
 eapRVKOYcUaMQ0azYIvFfp2AFSTvRL9FjazFn/HOhLKvgDNdhes6YmiMufnlSL8GTFrF
 fzkg==
X-Gm-Message-State: AOAM5310qNernao/BV23FSW6hlBXy7WccQTLKdu8nbItlDryKZ4q8hWe
 9ycZtA120DDeuz1gdqh8aHEvrg==
X-Google-Smtp-Source: ABdhPJwErqesLgSW4tgUnrEgVT9lbxr5Wq3V+igOGOFcfDd/eFWOLTv7FX3Nj1FHw7XU5YqvNWUFoQ==
X-Received: by 2002:a5d:488d:: with SMTP id g13mr37501945wrq.274.1608118739392; 
 Wed, 16 Dec 2020 03:38:59 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id l8sm2549553wmf.35.2020.12.16.03.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 03:38:58 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 11d1b2b2;
 Wed, 16 Dec 2020 11:38:56 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] block: report errno when flock fcntl fails
In-Reply-To: <20201216112940.GB7548@merkur.fritz.box>
References: <20201215190127.1765595-1-david.edmondson@oracle.com>
 <20201216112940.GB7548@merkur.fritz.box>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Wed, 16 Dec 2020 11:38:56 +0000
Message-ID: <cunwnxit1yn.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::431;
 envelope-from=dme@dme.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2020-12-16 at 12:29:40 +01, Kevin Wolf wrote:

> Am 15.12.2020 um 20:01 hat David Edmondson geschrieben:
>> When a call to fcntl(2) for the purpose of manipulating file locks
>> fails, report the error returned by fcntl.
>> 
>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>
> Is appending "Resource temporarily unavailable" in the common case (a
> file locked by another process) actually an improvement for the message
> or more confusing? It would be good to mention the motivation for the
> change in the commit message.

Distinguishing between the common case and others is at least a start
when trying to figure out why it failed. We have potentially useful
information to assist in diagnosis, why throw it away?

In the case I encountered the failure appears to have been caused by
SELinux misconfiguration.

> Either way, this breaks some qemu-iotests cases whose reference output
> needs to be updated.

Will fix and send a v2.

dme.
-- 
We're deep in discussion, the party's on mute.


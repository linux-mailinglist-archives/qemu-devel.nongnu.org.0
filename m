Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE039BA8D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 16:05:27 +0200 (CEST)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpARy-0004Qf-66
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 10:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+347305.be9e4a-qemu-devel=nongnu.org@mg.codeaurora.org>)
 id 1lp9zu-0003Wt-CZ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:36:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+347305.be9e4a-qemu-devel=nongnu.org@mg.codeaurora.org>)
 id 1lp9zo-0007aY-3m
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:36:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622813780; h=In-Reply-To: Content-Type: MIME-Version:
 References: Reply-To: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=mYUarrntt97rMdUDKY84iFz41ldiH/00Qm8O70nDza8=;
 b=kDVHN//NuTW/2MNs5UwJBHjJG41XZAF2fcrIWg0jCyX4LYA4Lhh9MpoV5EbLf4eNn9iuFMIk
 VdgiwG+epUbvxzDdhVOICSf8FxwVplFPd/tCzse+tNFiKygw/OKWyDETqkwxaN6jB54EaWja
 YaRFxL1kJl+PqU8xPITrl+W6KMQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxNGFmMSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60ba2c50e570c056194430c4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 13:36:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DEC50C433D3; Fri,  4 Jun 2021 13:36:15 +0000 (UTC)
Received: from quicinc.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: svaddagi)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 06128C433F1;
 Fri,  4 Jun 2021 13:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 06128C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=vatsa@codeaurora.org
Date: Fri, 4 Jun 2021 19:06:08 +0530
From: Srivatsa Vaddagiri <vatsa@codeaurora.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [Stratos-dev] [PATCH 0/5] virtio: Add vhost-user based RNG service
Message-ID: <20210604133607.GB21481@quicinc.com>
References: <01000179c92c4e24-efe56a44-af19-489d-b9c4-04386251a7de-000000@email.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <01000179c92c4e24-efe56a44-af19-489d-b9c4-04386251a7de-000000@email.amazonses.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Received-SPF: pass client-ip=69.72.43.7;
 envelope-from=bounce+347305.be9e4a-qemu-devel=nongnu.org@mg.codeaurora.org;
 helo=m43-7.mailgun.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Jun 2021 10:03:13 -0400
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
Reply-To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Cc: stratos-dev@op-lists.linaro.org, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mathieu Poirier via Stratos-dev <stratos-dev@op-lists.linaro.org> [2021-06-01 20:03:14]:

> Hi all,
> 
> This sets adds a vhost-user based random number generator (RNG),
> similar to what has been done for i2c and virtiofsd.  In fact
> the implementation for vhost-user-rng and vhost-user-rng-pci
> follow what was done for vhost-user-i2c.

Is there a Rust language based equivalent that is planned as well (just like
what was done for virtio-i2c)?

- vatsa

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


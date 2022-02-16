Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B64B9317
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 22:22:00 +0100 (CET)
Received: from localhost ([::1]:46600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKRkN-0000TD-Jf
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 16:21:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nKRjW-000870-KV; Wed, 16 Feb 2022 16:21:06 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:56088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nKRjN-0005vV-8U; Wed, 16 Feb 2022 16:21:06 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4F17CB81FC5;
 Wed, 16 Feb 2022 21:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B39C004E1;
 Wed, 16 Feb 2022 21:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645046445;
 bh=3ONfFmhUq7JTWAZagk6nrGXgxgp2rWZLCXy7gh8bHNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WwXPmPzF6a1lj7HlsPIFkACFl5AcmmYXIu5j3KP5QXheAQNbf+DIDPkvpghXQvA9v
 EfLLO/5lNfeD4nS84+M1V3/aqmIHNPMlSxwZQZfOAlNSh45hS4l1xHalpw3zcCidJ8
 Wh5KCpU3dNiZKb/8+9/qIGd7mKrsovpYAetV0GuGmvOVDWdF3s8YFlNjwVIE4yasYA
 MIGKkvA4ZHuYz/GoFrtyXjIQZS9OWUx4yn0e4NfsQQsuPWcyD2xdEV9U4PGdQXmqCP
 YgxSrX6LFQEnkOL2QZDnm6+NALrZC1XW0OOpAcfVgoesjAMs2mUjoIL6mb2jQBUiud
 TG1EBGhZaA72w==
Date: Wed, 16 Feb 2022 13:20:43 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 6/6] hw/nvme: 64-bit pi support
Message-ID: <20220216212043.GA1949599@dhcp-10-100-145-180.wdc.com>
References: <20220214123029.106404-1-its@irrelevant.dk>
 <20220214123029.106404-7-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214123029.106404-7-its@irrelevant.dk>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Naveen Nagar <naveen.n1@samsung.com>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 01:30:29PM +0100, Klaus Jensen wrote:
> @@ -384,6 +389,12 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
>          return -1;
>      }
>  
> +    if (ns->params.pif != NVME_PI_GUARD_16 &&
> +        ns->params.pif != NVME_PI_GUARD_64) {
> +        error_setg(errp, "invalid 'pif'");
> +        return -1;
> +    }

In addition, the requested metadata size ('params.ms') should be checked
against the requested PI option. The function currently just checks
against 8 bytes, but the 64b guard requires at least 16 bytes.

Otherwise, looks great.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9EB3183CB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 04:01:50 +0100 (CET)
Received: from localhost ([::1]:45372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA2Em-0006CJ-QN
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 22:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lA2DP-0005ZC-75; Wed, 10 Feb 2021 22:00:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:41110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lA2DM-0003wT-2w; Wed, 10 Feb 2021 22:00:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 234C564E2E;
 Thu, 11 Feb 2021 03:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613012417;
 bh=Ek73MQJt0fnnijnG67iXAzHiO1PaCNsBUmSYG1U4zfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e7EwIqOp8ADvH+sUenUuT/t/pjXLgdA3pabILnbI9PXbauXhgufpQBCnSLkruHdjV
 84uiWC5OlFDo52FxQ5HX/+gRfX9dGW/dkw65Hzn4x7ABkSX8moU/wnL3QhcUfnlcdM
 EhOBZP/MmOtL1Dal0I2WtPMRToytGNmJvFpmBQ+H7LAmosFYUrYq0FRhnWDbqEyjuP
 M00qqbtdoerkQEsBLRhwi92Oru4jSgl2Uw+TLvl0Z0w9K2IMcjZoYHso744OOo6QSK
 dYyITjo7STUeifCYtP2yq9woW+zXuvFj8NS2bjVbbN+iI68MMFNOegMVKMyHfnH38Y
 wDOdUz+hfvLyg==
Date: Thu, 11 Feb 2021 12:00:11 +0900
From: Keith Busch <kbusch@kernel.org>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH 3/3] hw/block/nvme: add nvme_inject_state HMP command
Message-ID: <20210211030011.GD23363@redsun51.ssa.fujisawa.hgst.com>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-4-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210195252.19339-4-minwoo.im.dev@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 04:52:52AM +0900, Minwoo Im wrote:
> nvme_inject_state command is to give a controller state to be.
> Human Monitor Interface(HMP) supports users to make controller to a
> specified state of:
> 
> 	normal:			Normal state (no injection)
> 	cmd-interrupted:	Commands will be interrupted internally
> 
> This patch is just a start to give dynamic command from the HMP to the
> QEMU NVMe device model.  If "cmd-interrupted" state is given, then the
> controller will return all the CQ entries with Command Interrupts status
> code.
> 
> Usage:
> 	-device nvme,id=nvme0,....
> 
> 	(qemu) nvme_inject_state nvme0 cmd-interrupted
> 
> 	<All the commands will be interrupted internally>
> 
> 	(qemu) nvme_inject_state nvme0 normal
> 
> This feature is required to test Linux kernel NVMe driver for the
> command retry feature.

Once the user sets the injected state, all commands return that status
until the user injects the normal state, so the CRD time is meaningless
here. If we're really going this route, the state needs to return to
normal on it's own.

But I would prefer to see advanced retry tied to real errors that can be
retried, like if we got an EBUSY or EAGAIN errno or something like that.

The interface you found to implement this is very interesting though.


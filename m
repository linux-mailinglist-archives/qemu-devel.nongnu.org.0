Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54BA4865D5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:10:58 +0100 (CET)
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TTl-00009E-Oe
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:10:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1n5Slz-00079c-59
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:25:43 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:45042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1n5Slx-0002TZ-6N
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:25:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55B5BB8212E;
 Thu,  6 Jan 2022 13:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8685EC36AE3;
 Thu,  6 Jan 2022 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641475535;
 bh=buV0gYWbk3HVWfvOrcfUs3J4fxNfedsrK8daEDtIzx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hD91Fm1JArQgrZOznJTSwWQEL/6hIlrqxutgzox5t1nFaTWlgdyHlSKHCIk29EqM7
 q0jq3/k1z/szOUrbA/H2GMjBYnnw9U2nKArcAeNP1QtN6yHgHcGAduWoZsob0X+1CW
 /ZGsqaX0JXae6lNEvno75wK3IZ5gebq9lSaltiYg=
Date: Thu, 6 Jan 2022 14:25:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] qemu_fw_cfg: use default_groups in kobj_type
Message-ID: <YdbtzL59aCePeDnt@kroah.com>
References: <20220105183133.2812848-1-gregkh@linuxfoundation.org>
 <20220105175546-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105175546-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=gregkh@linuxfoundation.org; helo=ams.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Gabriel Somlo <somlo@cmu.edu>, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 05:56:26PM -0500, Michael S. Tsirkin wrote:
> On Wed, Jan 05, 2022 at 07:31:33PM +0100, Greg Kroah-Hartman wrote:
> > There are currently 2 ways to create a set of sysfs files for a
> > kobj_type, through the default_attrs field, and the default_groups
> > field.  Move the firmware qemu_fw_cfg sysfs code to use default_groups
> > field which has been the preferred way since aa30f47cf666 ("kobject: Add
> > support for default attribute groups to kobj_type") so that we can soon
> > get rid of the obsolete default_attrs field.
> > 
> > Cc: Gabriel Somlo <somlo@cmu.edu>
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: qemu-devel@nongnu.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> OK then you know best I guess
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> feel free to queue.

Thanks, will do!

greg k-h


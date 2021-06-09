Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9413A0A5A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 04:56:52 +0200 (CEST)
Received: from localhost ([::1]:45360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqoOg-00005R-PX
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 22:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1lqoNz-0007s1-O0
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 22:56:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:33638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1lqoNw-0002nJ-Qa
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 22:56:07 -0400
IronPort-SDR: XReY1X/drI7forCng5ayWhdSTYvtuL+u56n3Ps6bDnPFrmelboy38J39GLmFC+M1mnyo3IIm4b
 8voHHFXsWH1w==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="226354991"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="226354991"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 19:55:57 -0700
IronPort-SDR: NrIVQpomnET+m298jWaV5+6p1+E1JkWRQejmBFmB/qm+EvHzeckMZ2jDKEGpKFm+WKfgYmAQnJ
 QbqXiZpKYoaQ==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="419129266"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.212.5.106])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 19:55:56 -0700
Date: Tue, 8 Jun 2021 19:55:55 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v1 2/5] ui: Add a helper to wait on a dmabuf sync
Message-ID: <20210609025554.GA694@dongwonk-MOBL.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=dongwon.kim@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, FAKE_REPLY_C=1.486,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

Our goal is to block virtio-gpu driver running on the guest from writing
on the buffer that hasn't been completely blitted yet. If we do
graphic_hw_gl_block, it will block the next commands from being processed but
won't stop the guest fill the scanout buffers and send commands, I think.



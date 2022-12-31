Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B4C65A4BE
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 15:02:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBcQ1-0006tt-4j; Sat, 31 Dec 2022 09:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pBcPu-0006s1-Kp
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 09:00:57 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pBcPs-0007Kx-Oj
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 09:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yH9/1vxQV4MTNA4VCA+3l1JqO154ssTglHVCuZ+iO5w=; b=dSjea300rx6n4StBieMQD0E7JM
 zKnYekl6zRhxOyKy6L3hM3N4VgR8+SU0PIQ2DJcMUUbF5hjL66iVW3zNgh30VPCJaSoq97l8YuOXm
 GQgHw2Zc0+6DIG9rG/1TvfPIEXbu7jJbAhdBahw6GxT6UocQRgRM0rhD6FJHkLbPWBLg=;
Date: Sat, 31 Dec 2022 15:00:20 +0100
To: Thomas Huth <thuth@redhat.com>
Cc: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, philmd@linaro.org, peter.maydell@linaro.org,
 bcain@quicinc.com, quic_mathbern@quicinc.com, stefanha@redhat.com, Anton
 Johansson <anjo@rev.ng>
Subject: Re: [PULL 17/21] target/hexagon: prepare input for the idef-parser
Message-ID: <20221231150020.7da0d8e2@orange>
In-Reply-To: <fb4c2dc9-544e-9f8c-59e8-69c6c9a20178@redhat.com>
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <20221216204845.19290-18-tsimpson@quicinc.com>
 <fb4c2dc9-544e-9f8c-59e8-69c6c9a20178@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 29 Dec 2022 11:41:22 +0100
Thomas Huth <thuth@redhat.com> wrote:

> I'm now seeing changes to scripts/meson-buildoptions.sh after
> rebuilding QEMU ... looks like you likely forgot to update that file
> with the automatic update after changing meson_options.txt ?

Ah, there seems to be another couple of unrelated missing updates to
scripts/meson-buildoptions.sh.

`Makefile` seems to rely on modification dates of files in the source
tree, but git does not track those.

    git clone ...
    mkdir build
    ./configure ...
    make update-buildoptions # Does nothing
    touch ../meson_options.txt
    make update-buildoptions # Actually makes changes

Also, AFAIU the `update-buildoptions` target is not available in ninja.
However maybe this is not a bug since the doc says to use make.

Anyway, patch coming soon!

-- 
Alessandro Di Federico
rev.ng Labs


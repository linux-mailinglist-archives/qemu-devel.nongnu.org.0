Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1759C65C2F6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 16:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCjBG-0000Ye-5Y; Tue, 03 Jan 2023 10:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pCjBE-0000XO-2Q
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 10:26:20 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pCjBC-0001Dy-0w
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 10:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tb5hoq4Hzvt3M/QZQma9algxPjicQSUQXa01TkeyHkU=; b=t4R05SIJrtCSEjZKJRCL9Mw0Mm
 X+9cHJtseHb33haElXTZ55z4ilT8lOWMA6aNTjrvlmbMfIyfcYZDPb/wOGRBi3ks1EjxUe6szsQHY
 QlM5XM/6hQ95TUQSmsg0/z9aCxRTO811ugDSmu9FTRPL8GO6XuL6mWleaxzEc1GGeitE=;
Date: Tue, 3 Jan 2023 16:26:03 +0100
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Taylor Simpson
 <tsimpson@quicinc.com>, Anton Johansson <anjo@rev.ng>, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] Update scripts/meson-buildoptions.sh
Message-ID: <20230103162603.74f631aa@orange>
In-Reply-To: <CAJSP0QVbvgr6wHY9e6f7UgZ-vum5vGUNH+h0Lf93BpdEcFJf0A@mail.gmail.com>
References: <20230102104113.3438895-1-ale@rev.ng>
 <CAJSP0QVbvgr6wHY9e6f7UgZ-vum5vGUNH+h0Lf93BpdEcFJf0A@mail.gmail.com>
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

On Tue, 3 Jan 2023 09:37:51 -0500
Stefan Hajnoczi <stefanha@gmail.com> wrote:

> I don't understand the issue. Can you describe the steps that cause
> meson-buildoptions.sh to become out-of-sync with meson_options.txt?
> 
> This will continue to be a problem in the future. Is there a way to
> fix it permanently?

In Makefile we have:

    $(SRC_PATH)/scripts/meson-buildoptions.sh:    $(SRC_PATH)/meson_options.txt

(Cc'ing Paolo since he's the author of this line)

This means make will regenerate
`$(SRC_PATH)/scripts/meson-buildoptions.sh` if its last modification
date is older than `$(SRC_PATH)/meson_options.txt`.

However these files are in the source directory, so this will behave
properly only under certain circumstances.

For instance if, for some reason, someone committed a new version of
`meson_options.txt` but not of `meson-buildoptions.sh`, a fresh clone
of the repo will not have the dates set correctly to trigger the
Makefile rule above:

    $ ls -ln scripts/meson*
    -rw-r--r-- 1 1000 1000 28913 Jan  3 15:58 scripts/meson-buildoptions.sh
    -rw-r--r-- 1 1000 1000    91 Jan  3 15:58 scripts/meson.build

This is because git does not update file dates depending on the last
commit changing them.

This, on top of the fact that invoking `ninja` does not trigger
regeneration (which works for most other use cases), leads to a good
chance of forgetting to update meson-buildoptions.sh.

We could add the target to ninja to mitigate the risk, but still, the
dates problem remains.

An alternative solution would be to avoid committing generated files and
simply regenerating it every time.

On my machine `meson.py introspect --buildoptions` +
`scripts/meson-buildoptions.py` take 1.070s.
`./configure --help` takes 0.162s, so it's a bit sad.
On the other hand an actual invocation of configure can take
significantly longer (`./configure` takes 29.150s on my machine).

To avoid re-running it every time we could invoke `make
update-buildoptions` in `configure` but keep
`scripts/meson-buildoptions.sh` in the build directory.

-- 
Alessandro Di Federico
rev.ng Labs


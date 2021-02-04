Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B54730FB38
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:23:05 +0100 (CET)
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jHU-0004Gp-7P
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l7hS6-00021U-Br
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:25:54 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l7hS1-0006De-9D
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:25:54 -0500
Received: by mail-wr1-x429.google.com with SMTP id z6so4191520wrq.10
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ICegscDpA44ZHUwg2DhrNE8HxCsriublYSAsxAd3WY=;
 b=K5+JN3UAM6oQW3UNzCTqnasKm3LWjs+C0B4Wkzin0lg1nSFMeQ/DvFPM7sjAKs6flJ
 KvcXzlIt5iswZfjovT6bLsbhMWyNGoKLEdDVoIlx6S+IVK6q/qOA8Z/a848jm/fG87Ra
 Pnkmd3Nf7KCy4ialVs/6Dj4u+7FqQS93OSvkRrPSp3aik08rHX3jUPnDwam4LvdpMbPa
 BrBvVnT8yedzfg8Q4ImreX5Ok/hdbDyWqcgwuIZV+M4Vk5UCg726eTqlVCVsOSC60+76
 UDUlDkCHn/baA/u3aA7n/sFK5raJyCLeYifYQWZOxnVzLqXBH1ohW3qyVWAcPPkWgdcE
 z9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ICegscDpA44ZHUwg2DhrNE8HxCsriublYSAsxAd3WY=;
 b=rXwL+86SgzziKSEFuD36BEji8AjQ3iuE01iK474pbsZHAw9qDASNNNSvQusBVonYOc
 JUsttzYwNjFp6bovl7LTEstrEJ8OACg58gp6AMO44CJSOY5zpvPiOloQqn320OFJWP6e
 j/6ohE/ItbSM8qLX7HE35/YO/9IKc9S6YR095Xkj24KZ38Svb7Ku6zXdMbTBHjh5Gb7r
 Yq/saHmNQ6JDf6YtkcRkICAzlrOS2WpAp3HtoUm5TlwT2J6hnrxjXJGXPriCqx7JESf8
 Yoby4VWY80lM7DwWXRED7AvOZ00FfU2pDEHC98r3m+b45Y10vu99fsj2FTNChdGKy3v1
 w0dg==
X-Gm-Message-State: AOAM5331zVd9MA29xcawdASmFh38T/Nw5s9FhaLxhh4aEw6G8UFLLuCr
 ALDyvblr+IH7NNK6FvxfCzRVkCbNIfObcw==
X-Google-Smtp-Source: ABdhPJx6XLSZWWo7qUh5idYaIgJtyzuBcPr3QqRWNpvgdUbxTTL1TKo4cMo+6Nc//5HROa0p8tYAHA==
X-Received: by 2002:adf:e404:: with SMTP id g4mr128512wrm.416.1612455946394;
 Thu, 04 Feb 2021 08:25:46 -0800 (PST)
Received: from localhost.localdomain ([2a01:e34:ec19:cd20:9163:769f:ccfe:9091])
 by smtp.gmail.com with ESMTPSA id l11sm8312273wrt.23.2021.02.04.08.25.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 08:25:45 -0800 (PST)
From: phillip.ennen@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] net/macos: implement vmnet-based network device
Date: Thu,  4 Feb 2021 17:25:42 +0100
Message-Id: <20210204162544.65439-1-phillip.ennen@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=phillip.ennen@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Feb 2021 12:43:24 -0500
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
Cc: stefanha@gmail.com, jasowang@redhat.com, phillip@axleos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Phillip Tennen <phillip@axleos.com>

This patch series implements a new netdev device, reachable via -netdev
vmnet-macos, that’s backed by macOS’s vmnet framework.

The vmnet framework provides native bridging support, and its usage in
this patch is intended as a replacement for attempts to use a tap device
via the tuntaposx kernel extension. Notably, the tap/tuntaposx approach
never would have worked in the first place, as QEMU interacts with the
tap device via poll(), and macOS does not support polling device files.

vmnet requires either a special entitlement, granted via a provisioning
profile, or root access. Otherwise attempts to create the virtual
interface will fail with a “generic error” status code. QEMU may not
currently be signed with an entitlement granted in a provisioning
profile, as this would necessitate pre-signed binary build distribution,
rather than source-code distribution. As such, using this netdev
currently requires that qemu be run with root access. I’ve opened a
feedback report with Apple to allow the use of the relevant entitlement
with this use case:
https://openradar.appspot.com/radar?id=5007417364447232

vmnet offers three operating modes, all of which are supported by this
patch via the “mode=host|shared|bridge” option:

* "Host" mode: Allows the vmnet interface to communicate with other vmnet
interfaces that are in host mode and also with the native host.
* "Shared" mode: Allows traffic originating from the vmnet interface to
reach the Internet through a NAT. The vmnet interface can also
communicate with the native host.
* "Bridged" mode: Bridges the vmnet interface with a physical network
interface.

Each of these modes also provide some extra configuration that’s
supported by this patch:

* "Bridged" mode: The user may specify the physical interface to bridge
with. Defaults to en0.
* "Host" mode / "Shared" mode: The user may specify the DHCP range and
subnet. Allocated by vmnet if not provided.

vmnet also offers some extra configuration options that are not
supported by this patch:

* Enable isolation from other VMs using vmnet
* Port forwarding rules
* Enabling TCP segmentation offload
* Only applicable in "shared" mode: specifying the NAT IPv6 prefix
* Only available in "host" mode: specifying the IP address for the VM
within an isolated network

Note that this patch requires macOS 10.15 as a minimum, as this is when
bridging support was implemented in vmnet.framework.

This is my first QEMU contribution, so please feel free to let me know
what I’ve missed or what needs improving. Thanks very much for taking a
look =)

Phillip Tennen (2):
  build: add configure flag to indicate when the host is Darwin
  net: implement vmnet-based netdev

 configure         |   6 +-
 net/clients.h     |   6 +
 net/meson.build   |   1 +
 net/net.c         |   3 +
 net/vmnet-macos.c | 444 ++++++++++++++++++++++++++++++++++++++++++++++
 qapi/net.json     |  64 ++++++-
 qemu-options.hx   |   9 +
 7 files changed, 530 insertions(+), 3 deletions(-)
 create mode 100644 net/vmnet-macos.c

-- 
2.24.3 (Apple Git-128)



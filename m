Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BF46BBB32
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 18:45:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVAq-00034g-CA; Wed, 15 Mar 2023 13:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAh-0002fb-5q
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:44:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAG-0000n6-Rx
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:44:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so1821283wmq.1
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0p39ugLOaQczYK3TkGEmL7O7L8Oc7idQkhckXfJwmM=;
 b=L6TgbpaKg3Edkx/Y//n4gApyrjCUyTeLy9IxlIxXNXRUXnUb7a9kRIUYEUEdmIu39S
 Pu52UMnXk0A0/9ghApZAnv+qxn48udTQLLNTJb6uuFUumQfQ7FlbVWiYPoER4b/lfoPO
 jE6rz0Uzd/uftZo5Lo3ixO21Hn7pEJ4werNmu+3UweAtzEytzuD0hMm7jrfCfs1GoLDf
 94D5iJfczesQDjnwmnhEso9mmrDROiis9hegOFdMnBdF3XaddDLG3BzKrBzuTI3fQFkp
 SidO5vqUrlwobV2SVsC7lQ/2ou0f0Zef2KUmdFDmm5S54FBEwAs2x2Y3YOizNRZ3rsye
 ltLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v0p39ugLOaQczYK3TkGEmL7O7L8Oc7idQkhckXfJwmM=;
 b=7iNFG3VYcPRxnrEMcK9odpg8GXCFfFBnf2Kf4BcWOvaYM1oQklc+88PQXpToRTm6Jr
 2gx08GxS+uDfMzbMkL0GLZXyqwaXUoZ1IdoRDyJYS+wCFRry/2wHrDVE172DkK0SSQO7
 UY/WR0ewY8rFTup5bZeoWFaJz7pFJEaETdke7moaYwsWrGe+Pb49JWKHCck+j+a086Qw
 jc+hkHNewQYUpK/qYWqvYseFEGF75jBZJ8ex07LXvxCn+MvLntDAeay6h1Pv7pQqZxcR
 SIvLpg9rzOhRuJYWfmQbel2vZEPBVULnnB4DAXQPWflBGJFhe4Od52t0uli+aeNuyr0B
 CtMg==
X-Gm-Message-State: AO0yUKU+3LgbSTwEKRdpK7GPgYHN4cVNS7DLJoA9Lc26BLTGNQXWJiyQ
 TZ1cusBzO1S1ygaCLX+23s5SrQ==
X-Google-Smtp-Source: AK7set+0XdSgmxCsuywCuQQEiQovrT78qUyLQqXs0AjgohDoSBgaCSQGBx5YLPMamDwmwdIz/Yr9Bg==
X-Received: by 2002:a05:600c:4453:b0:3eb:1432:a78c with SMTP id
 v19-20020a05600c445300b003eb1432a78cmr19256411wmn.37.1678902231077; 
 Wed, 15 Mar 2023 10:43:51 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a1c6a06000000b003ed2fb86f85sm2498909wmc.47.2023.03.15.10.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 562151FFD6;
 Wed, 15 Mar 2023 17:43:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Vikram Garhwal <vikram.garhwal@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Tong Ho <tong.ho@xilinx.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
Subject: [PATCH v2 32/32] contrib/gitdm: add group map for AMD
Date: Wed, 15 Mar 2023 17:43:31 +0000
Message-Id: <20230315174331.2959-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

AMD recently acquired Xilinx and contributors have been transitioning
their emails across.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Cc: Tong Ho <tong.ho@xilinx.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
Message-Id: <20230310180332.2274827-11-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map    | 1 -
 contrib/gitdm/group-map-amd | 8 ++++++++
 gitdm.config                | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 contrib/gitdm/group-map-amd

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index fa9cb5430f..f78c69fa54 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -49,6 +49,5 @@ virtuozzo.com   Virtuozzo
 vrull.eu        VRULL
 wdc.com         Western Digital
 windriver.com   Wind River
-xilinx.com      Xilinx
 yadro.com       YADRO
 yandex-team.ru  Yandex
diff --git a/contrib/gitdm/group-map-amd b/contrib/gitdm/group-map-amd
new file mode 100644
index 0000000000..bda4239a8a
--- /dev/null
+++ b/contrib/gitdm/group-map-amd
@@ -0,0 +1,8 @@
+# AMD acquired Xilinx and contributors have been slowly updating emails
+
+edgar.iglesias@xilinx.com
+fnu.vikram@xilinx.com
+francisco.iglesias@xilinx.com
+sai.pavan.boddu@xilinx.com
+stefano.stabellini@xilinx.com
+tong.ho@xilinx.com
diff --git a/gitdm.config b/gitdm.config
index df4ba829ca..9db43ca142 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -32,6 +32,7 @@ EmailMap contrib/gitdm/domain-map
 #
 
 GroupMap contrib/gitdm/group-map-alibaba Alibaba
+GroupMap contrib/gitdm/group-map-amd AMD
 GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
 GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-facebook Facebook
-- 
2.39.2



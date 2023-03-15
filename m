Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998706BBB63
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 18:50:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVGD-0003Jc-IH; Wed, 15 Mar 2023 13:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFm-00027e-SY
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:49:34 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFc-00029u-Hw
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:49:34 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 bh21-20020a05600c3d1500b003ed1ff06fb0so1829412wmb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 10:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fw0yP+1ZBc/H2+o37ZgzxeatA+xGyE5UatghhgQrblQ=;
 b=PK6Qx2aRoV5zGR34fqA44kbG5SL34c4aG9XoK14NFI1vNkR58VJFp6iYJzwahWraro
 WMzZ0OnyjAvroGfTigg2jjF70WRV1+CvKYr/3QxYVd84QD6/l8fbHjEcR9amdzMVo2y5
 GOmXm43nw1k7zoMiC72SJipwi2L3Z1Wq2fZZ8kcJGr2oAYYN1ae5XxLTAb9llw4pD75F
 rk4aBg0g/Q/ambXEU/vM56V0n4Mr469XXlsGI/S8s2LlCx/373glwaCnhoOG75vMAHNC
 cKHL7HEGo+8UTHu//jsY9h3gdCK8T2JPZ+Vk7GSHWhM37IJuuMhbkeTA9xoZr3m93bPC
 eCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fw0yP+1ZBc/H2+o37ZgzxeatA+xGyE5UatghhgQrblQ=;
 b=NIiOMbCFIaOYDUrEUjN07NFWy7twdcQADaH606zoKt3nsplOd0qhi2cJcJwG/VDJbe
 XdP0+yLhCyNWMQ9pxWCPFucebtUA7Vvo+VDQTFhnIKX7I1AkXXFY8p2GjlfHYw7Aa188
 mr6cB+yXf4NQIQK0WyyNWfGiGDnJUz6qthJCMjDKAOiwEK5h8L1jpnFVrkF+cEs80jAL
 JwKECYGeAlYQxZ1ZzmHOjAg3+qm7Dko0uF/9PVOUB/Nx/N2u6LBzLspfqPMT+KWw8ytg
 jyJlTKyyoGmUeRTUyHB0YOjdr0QK5RGtazg+ojXZXB+oCl+o2vtZUbtrJ+hF197oBvs6
 hZiQ==
X-Gm-Message-State: AO0yUKXiGN5h8vRrq2wO/QNcqKKhNIYNnnD6/VmohaCg3Uh2dYsezqsm
 EulufBP7WF3vrllknGWDPdoUTg==
X-Google-Smtp-Source: AK7set/WxodbZQv1TUH+U8tfvK59Z2utbmdpUZyMxUbYmyQsFkwsyXpo2gdfq3IDshVI0z2h/4yBTw==
X-Received: by 2002:a05:600c:4e10:b0:3ea:f883:53ea with SMTP id
 b16-20020a05600c4e1000b003eaf88353eamr18557177wmq.7.1678902562398; 
 Wed, 15 Mar 2023 10:49:22 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 iz11-20020a05600c554b00b003ed201ddef2sm2641602wmb.2.2023.03.15.10.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:49:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D228C1FFD2;
 Wed, 15 Mar 2023 17:43:44 +0000 (GMT)
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
 Alexander Graf <graf@amazon.com>, Paul Durrant <pdurrant@amazon.com>,
 David Wooodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v2 28/32] contrib/gitdm: add Amazon to the domain map
Date: Wed, 15 Mar 2023 17:43:27 +0000
Message-Id: <20230315174331.2959-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

We have multiple contributors from both .co.uk and .com versions of
the address.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Alexander Graf <graf@amazon.com>
Cc: Paul Durrant <pdurrant@amazon.com>
Cc: David Wooodhouse <dwmw@amazon.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230310180332.2274827-7-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 4a988c5b5f..8dce276a1c 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -4,6 +4,8 @@
 # This maps email domains to nice easy to read company names
 #
 
+amazon.com      Amazon
+amazon.co.uk    Amazon
 amd.com         AMD
 aspeedtech.com  ASPEED Technology Inc.
 baidu.com       Baidu
-- 
2.39.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819E6BBB6B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 18:52:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVGB-000300-Lh; Wed, 15 Mar 2023 13:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFl-0001wA-2W
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:49:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFb-00029V-Tj
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:49:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id ay8so7868206wmb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 10:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/pYU24xJraNXcb1pbvZQddkU2/+s0yp2C0zt4F7Fw+M=;
 b=jNvHwdOpNMv2UO8KMK8p2lj29uq1MkeOJqe6I3QK1DNX6M21D2Hwea3rS4NXyPvGj/
 KGssmV4fPVqU2GH5Df0bzdCiC7ey4LDtsUcsSGXGA8YkYHAPumMbU9EnIkjULxtuLT04
 Yp7NDv2AV9JPi42jBr18x7v+e8wi82GLpxwcix3b6hzt2tzxvABSB7kOxVUAWyiMXgOG
 Ihb7JyJYEz8DsHzrF/P3+QevNJ0bbGfiMc0GFi4eeMWDHyfNYmUz8PsGRVA+KGTjuKpz
 821zpWvYkr3zbPFxWfzZr2qraNazUvTcuAo35GOMyFaPE3RQJTkToRONF3J418BB1mk6
 SnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pYU24xJraNXcb1pbvZQddkU2/+s0yp2C0zt4F7Fw+M=;
 b=xi0RsE/iJmzRZUUX6vj6IBmzZQxbQ1v70kKPCD+hxnZC8x9pORNaWC6UtxyUeaUVsw
 Id4DE03h0XzsteJmPhYlHc8bAuDQYFuUcnjNM2ay7ooAmAwn5lBYlXQMeukz8sTtpKQ9
 BtCKT20lWE/WonQt8ICO7FNKJWWTwrT+VAReh3UwR05yUkybLMdoL6mzh5yL/e7V9Spb
 QmesJqEa7abhzwDXSDNRvHVHvU9hXV8UHpsX9MVRvcDt4h5C+BuMsT1ib2mSUMwyPJZS
 e/BKaL1cYQNiYlnUHzl+3gs1XWrIlOkgqSsnM00VvxvgRqLC1tY/xVtDUDTVhzgaPJgm
 yGqQ==
X-Gm-Message-State: AO0yUKXKhY/BSv07HiJLJ1gMa07X6ACJ1X3zN1MwZH2k39vPotW+pXdY
 HLT5+J1GREnf7jLCNvZ81qQAVA==
X-Google-Smtp-Source: AK7set8yW+v7N/LBrGTYDq31McYh/t3FUJbbTwjEk/vI7LeqQDU0nd/+3ZVCM769O91zKqkJGMfXqQ==
X-Received: by 2002:a05:600c:a0a:b0:3df:eecc:de2b with SMTP id
 z10-20020a05600c0a0a00b003dfeeccde2bmr18189537wmp.11.1678902561952; 
 Wed, 15 Mar 2023 10:49:21 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 az40-20020a05600c602800b003e2096da239sm2724726wmb.7.2023.03.15.10.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:49:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36CF21FFD5;
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
 Bernhard Beschow <shentey@gmail.com>,
 Amarjargal Gundjalam <amarjargal16@gmail.com>,
 Bin Meng <bmeng@tinylab.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2 31/32] contrib/gitdm: add more individual contributors
Date: Wed, 15 Mar 2023 17:43:30 +0000
Message-Id: <20230315174331.2959-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

I've only added the names explicitly acked.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>
Cc: Amarjargal Gundjalam <amarjargal16@gmail.com>
Cc: Bin Meng <bmeng@tinylab.org>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Acked-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20230310180332.2274827-10-alex.bennee@linaro.org>
---
 contrib/gitdm/group-map-individuals | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index e2263a5ee3..3264c7383d 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -38,3 +38,4 @@ paul@nowt.org
 git@xen0n.name
 simon@simonsafar.com
 research_trasio@irq.a4lg.com
+shentey@gmail.com
-- 
2.39.2



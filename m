Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AEC6BBB3D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 18:46:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVAG-0002C5-UI; Wed, 15 Mar 2023 13:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAE-00028v-AY
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:43:50 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVA2-0000e2-Df
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:43:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id ay8so7857421wmb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 10:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDK+aMGOP0xpM2yh43emDI7/ZdusXKwC3yy2K8RboBM=;
 b=cYPfFClnzeGxmVf2UT21TxMcZfXew1UtQ5Edief9qGCRA9JNtB+9QK2k3Xl5/eBKxI
 ThWW+wzyYQYFhzb1zvoGoW40K7v9Oh9fUFg6eb+ggaj5gnZzAjYq1hxLktXyfkLcRr+1
 Olsp3LHclUSQ5BrukvA2cL/7uahUoLbUD9gNX6+R/JhPbGe7pR6lTVUFHn5jaUrNzm3d
 TvgtySdTuAMzkZOVkng2cducQ/KpL+VbuAkmwLZqRemLeECL22o4jgN9qukPzR771bcJ
 ZLPss0TtYhugedtvJkUiWiVLBJnKcvn+dI1AGtqfaIIphIvbNotOIv+74Dg+vNVUNs5w
 iPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDK+aMGOP0xpM2yh43emDI7/ZdusXKwC3yy2K8RboBM=;
 b=KpbsVZITvFoeRFF/rw5FjgT/6Z5iTtzhQtYNMMP4btkeI/LVy4RRNImeiXUkabZzZQ
 RF8ry0NKEHRS33W3x4ktozaT5rkqgPXPZSEfV1IHMRiGFyosWyiDMZhluL0xJV1jt94V
 NQELPTqa0ayPesiKY7ABJh4pWWHMHaIqTmSc4zymtcxAMMwN1S9Mutb+oRKyYQTZGdVw
 RkVYQPC914ez4pAbg4N+oWeDQOzeaXXEZuIgQOIm6tFp9MEu1VEGweB0HuJfOcf/ceEn
 4GVU5I0v0zqRSGM8/KCuRtEvtg1KERM8m8kgsmyhGVTIlYOMkVRYxpw8CVDr1+qb+s7P
 ZjDA==
X-Gm-Message-State: AO0yUKWjVo0TYrES2z6ygA4/iUUOss4gs5Eaf59F0toWRHe9Bcg6/ffw
 VLdxMFDs0uBPyoPgkHOoHSvikA==
X-Google-Smtp-Source: AK7set/RAVB/FJAZyi4lkXqHU8ODU4l/Ll614CXhsVCLNCrkHkgbiyy0IhPld5MaOM4OMR99nZ6/Jg==
X-Received: by 2002:a05:600c:198e:b0:3dc:405b:99bf with SMTP id
 t14-20020a05600c198e00b003dc405b99bfmr19401156wmq.15.1678902216357; 
 Wed, 15 Mar 2023 10:43:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003ebff290a52sm2854532wmo.28.2023.03.15.10.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E55CE1FFBE;
 Wed, 15 Mar 2023 17:43:31 +0000 (GMT)
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 06/32] include/qemu: add documentation for memory callbacks
Date: Wed, 15 Mar 2023 17:43:05 +0000
Message-Id: <20230315174331.2959-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

Some API documentation was missed, rectify that.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1497
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 47 ++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index d0e9d03adf..50a9957279 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -481,17 +481,56 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);
  */
 const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h);
 
-typedef void
-(*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
-                             qemu_plugin_meminfo_t info, uint64_t vaddr,
-                             void *userdata);
+/**
+ * typedef qemu_plugin_vcpu_mem_cb_t - memory callback function type
+ * @vcpu_index: the executing vCPU
+ * @info: an opaque handle for further queries about the memory
+ * @vaddr: the virtual address of the transaction
+ * @userdata: any user data attached to the callback
+ */
+typedef void (*qemu_plugin_vcpu_mem_cb_t) (unsigned int vcpu_index,
+                                           qemu_plugin_meminfo_t info,
+                                           uint64_t vaddr,
+                                           void *userdata);
 
+/**
+ * qemu_plugin_register_vcpu_mem_cb() - register memory access callback
+ * @insn: handle for instruction to instrument
+ * @cb: callback of type qemu_plugin_vcpu_mem_cb_t
+ * @flags: (currently unused) callback flags
+ * @rw: monitor reads, writes or both
+ * @userdata: opaque pointer for userdata
+ *
+ * This registers a full callback for every memory access generated by
+ * an instruction. If the instruction doesn't access memory no
+ * callback will be made.
+ *
+ * The callback reports the vCPU the access took place on, the virtual
+ * address of the access and a handle for further queries. The user
+ * can attach some userdata to the callback for additional purposes.
+ *
+ * Other execution threads will continue to execute during the
+ * callback so the plugin is responsible for ensuring it doesn't get
+ * confused by making appropriate use of locking if required.
+ */
 void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
                                       qemu_plugin_vcpu_mem_cb_t cb,
                                       enum qemu_plugin_cb_flags flags,
                                       enum qemu_plugin_mem_rw rw,
                                       void *userdata);
 
+/**
+ * qemu_plugin_register_vcpu_mem_inline() - register an inline op to any memory access
+ * @insn: handle for instruction to instrument
+ * @rw: apply to reads, writes or both
+ * @op: the op, of type qemu_plugin_op
+ * @ptr: pointer memory for the op
+ * @imm: immediate data for @op
+ *
+ * This registers a inline op every memory access generated by the
+ * instruction. This provides for a lightweight but not thread-safe
+ * way of counting the number of operations done.
+ */
 void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
                                           enum qemu_plugin_mem_rw rw,
                                           enum qemu_plugin_op op, void *ptr,
-- 
2.39.2



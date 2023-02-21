Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E5569EB39
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUc19-0005HI-Rj; Tue, 21 Feb 2023 18:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc15-0005FH-0b
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc10-0002eG-Ba
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:46 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o4-20020a05600c4fc400b003e1f5f2a29cso4888384wmq.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8SOiO6SUqRICLIJPyMazSs+K23fbT+t1yx1l1at9jCs=;
 b=GR0ZEVjfnRKb3kLaXpnRUVEpkF+ngvRlSoE6P8NUuMwzMVv5lVCVwy7dg7HcZrr6Ay
 6pPYsbbc74Db7gPZ/vg80DHZGhOaNHeHnESobJeTuFqyn/w+tMfzdUCMgjrqIu2DsiKO
 eATl/iA15+QMsyqvC3GmzuWMYKUGs/FGyPa58MfHmWMFWPWXMbta8+xn2JzMVQCYCZ8Y
 aRx06cc4zwWZ+IMqR0a7ny3FTJAJFK3UMHrvsyvlo0tmrCGIVqkeFfQ2/m5XOtQsyL7I
 inxeCdU6vsn/gxyrlAXem8APTMeH6r/fLf0IREWfv35ezA2rZc6GTVNTiMs2UqGhK3+1
 MQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8SOiO6SUqRICLIJPyMazSs+K23fbT+t1yx1l1at9jCs=;
 b=eUveOJ/Sv7HRA1bXMRfH3oFPpGc54XHySFFkyannYBABZAA6iuJTJoQB61jkISj/iU
 pBldeqn1Xwncso6qED2IIybSYwSB4mrfPByGnWwmzQbFCZKd3xk5mZvu5FgW9FZFhJiI
 iVALittI4uOZEM0zv4LFXfeoERR2Emj4i5Fn4Z/ZnSz1QLJ5S4bAQglCcozXQF9ThwFr
 GFKKaAKra4D4bG/Qv7cLd8YiStcpIU8Pugc5uOQJ09mvLzR1Ka3vd9AriosXsCMOisw6
 jTWDjiyFCgMlwsH5hrDW9g6Amj2rUPBplpVqqHjGG2/4VlQLH5luRK0VsW6WiGUWJC0M
 Wznw==
X-Gm-Message-State: AO0yUKUf6lv8zTRoKrMho5PXQ8AuBVnwuwlhc83HyHOfMBe70QWNRzyz
 FVQXuFAhNfALp4Vd10AiJn2Fan3i3BICG8eT
X-Google-Smtp-Source: AK7set8O3y4xbVB84SZCqtzXrCsksUTCY9WnE13A2tQdEk8H7sITNJCcFQ4B3XHdH3NF9jjWeM38qQ==
X-Received: by 2002:a05:600c:1da5:b0:3e2:1dac:b071 with SMTP id
 p37-20020a05600c1da500b003e21dacb071mr5590135wms.13.1677021940513; 
 Tue, 21 Feb 2023 15:25:40 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003e4326a6d53sm7943109wmb.35.2023.02.21.15.25.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Feb 2023 15:25:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Corey Minyard <minyard@acm.org>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 3/5] bulk: Replace [g_]assert(0) -> g_assert_not_reached()
Date: Wed, 22 Feb 2023 00:25:18 +0100
Message-Id: <20230221232520.14480-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221232520.14480-1-philmd@linaro.org>
References: <20230221232520.14480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

In order to avoid warnings such commit c0a6665c3c ("target/i386:
Remove compilation errors when -Werror=maybe-uninitialized"),
replace all assert(0) and g_assert(0) by g_assert_not_reached().

Remove any code following g_assert_not_reached().

See previous commit for rationale.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/spin/aio_notify_accept.promela |   6 +-
 docs/spin/aio_notify_bug.promela    |   6 +-
 hw/acpi/aml-build.c                 |   3 +-
 hw/arm/highbank.c                   |   2 +-
 hw/char/avr_usart.c                 |   2 +-
 hw/core/numa.c                      |   2 +-
 hw/net/i82596.c                     |   2 +-
 hw/watchdog/watchdog.c              |   2 +-
 migration/migration-hmp-cmds.c      |   2 +-
 migration/postcopy-ram.c            |  21 ++----
 migration/ram.c                     |   8 +--
 qobject/qlit.c                      |   2 +-
 qobject/qnum.c                      |  12 ++--
 softmmu/rtc.c                       |   2 +-
 target/mips/sysemu/physaddr.c       |   3 +-
 target/mips/tcg/msa_helper.c        | 104 ++++++++++++++--------------
 target/ppc/dfp_helper.c             |   8 +--
 target/ppc/mmu_helper.c             |   2 +-
 tests/qtest/ipmi-bt-test.c          |   2 +-
 tests/qtest/ipmi-kcs-test.c         |   4 +-
 tests/qtest/rtl8139-test.c          |   2 +-
 21 files changed, 91 insertions(+), 106 deletions(-)

diff --git a/docs/spin/aio_notify_accept.promela b/docs/spin/aio_notify_accept.promela
index 9cef2c955d..f929d30328 100644
--- a/docs/spin/aio_notify_accept.promela
+++ b/docs/spin/aio_notify_accept.promela
@@ -118,7 +118,7 @@ accept_if_req_not_eventually_false:
     if
         :: req -> goto accept_if_req_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 
 #else
@@ -141,12 +141,12 @@ accept_if_event_not_eventually_true:
         :: !event && notifier_done  -> do :: true -> skip; od;
         :: !event && !notifier_done -> goto accept_if_event_not_eventually_true;
     fi;
-    assert(0);
+    g_assert_not_reached();
 
 accept_if_event_not_eventually_false:
     if
         :: event     -> goto accept_if_event_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 #endif
diff --git a/docs/spin/aio_notify_bug.promela b/docs/spin/aio_notify_bug.promela
index b3bfca1ca4..ce6f5177ed 100644
--- a/docs/spin/aio_notify_bug.promela
+++ b/docs/spin/aio_notify_bug.promela
@@ -106,7 +106,7 @@ accept_if_req_not_eventually_false:
     if
         :: req -> goto accept_if_req_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 
 #else
@@ -129,12 +129,12 @@ accept_if_event_not_eventually_true:
         :: !event && notifier_done  -> do :: true -> skip; od;
         :: !event && !notifier_done -> goto accept_if_event_not_eventually_true;
     fi;
-    assert(0);
+    g_assert_not_reached();
 
 accept_if_event_not_eventually_false:
     if
         :: event     -> goto accept_if_event_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index ea331a20d1..97dfdcdd2f 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -534,8 +534,7 @@ void aml_append(Aml *parent_ctx, Aml *child)
     case AML_NO_OPCODE:
         break;
     default:
-        assert(0);
-        break;
+        g_assert_not_reached();
     }
     build_append_array(parent_ctx->buf, buf);
     build_free_array(buf);
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index f12aacea6b..fc212195ca 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -198,7 +198,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         machine->cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     for (n = 0; n < smp_cpus; n++) {
diff --git a/hw/char/avr_usart.c b/hw/char/avr_usart.c
index 5bcf9db0b7..e738a2ca97 100644
--- a/hw/char/avr_usart.c
+++ b/hw/char/avr_usart.c
@@ -86,7 +86,7 @@ static void update_char_mask(AVRUsartState *usart)
         usart->char_mask = 0b11111111;
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
diff --git a/hw/core/numa.c b/hw/core/numa.c
index d8d36b16d8..26ef02792a 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -381,7 +381,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
         }
         lb_data.data = node->bandwidth;
     } else {
-        assert(0);
+        g_assert_not_reached();
     }
 
     g_array_append_val(hmat_lb->list, lb_data);
diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index ec21e2699a..eda0f586fb 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -285,7 +285,7 @@ static void command_loop(I82596State *s)
         case CmdDump:
         case CmdDiagnose:
             printf("FIXME Command %d !!\n", cmd & 7);
-            assert(0);
+            g_assert_not_reached();
         }
 
         /* update status */
diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
index 955046161b..d0ce3c4ac5 100644
--- a/hw/watchdog/watchdog.c
+++ b/hw/watchdog/watchdog.c
@@ -85,7 +85,7 @@ void watchdog_perform_action(void)
         break;
 
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index ef25bc8929..4e07c95801 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -602,7 +602,7 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
                    "through QMP");
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     if (err) {
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index f54f44d899..59c8032a21 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1347,49 +1347,42 @@ int postcopy_ram_incoming_init(MigrationIncomingState *mis)
 
 int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
 {
-    assert(0);
-    return -1;
+    g_assert_not_reached();
 }
 
 int postcopy_ram_prepare_discard(MigrationIncomingState *mis)
 {
-    assert(0);
-    return -1;
+    g_assert_not_reached();
 }
 
 int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
                                  uint64_t client_addr, uint64_t rb_offset)
 {
-    assert(0);
-    return -1;
+    g_assert_not_reached();
 }
 
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
-    assert(0);
-    return -1;
+    g_assert_not_reached();
 }
 
 int postcopy_place_page(MigrationIncomingState *mis, void *host, void *from,
                         RAMBlock *rb)
 {
-    assert(0);
-    return -1;
+    g_assert_not_reached();
 }
 
 int postcopy_place_page_zero(MigrationIncomingState *mis, void *host,
                         RAMBlock *rb)
 {
-    assert(0);
-    return -1;
+    g_assert_not_reached();
 }
 
 int postcopy_wake_shared(struct PostCopyFD *pcfd,
                          uint64_t client_addr,
                          RAMBlock *rb)
 {
-    assert(0);
-    return -1;
+    g_assert_not_reached();
 }
 #endif
 
diff --git a/migration/ram.c b/migration/ram.c
index 96e8a19a58..93f5a4a416 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2061,19 +2061,17 @@ bool ram_write_tracking_available(void)
 
 bool ram_write_tracking_compatible(void)
 {
-    assert(0);
-    return false;
+    g_assert_not_reached();
 }
 
 int ram_write_tracking_start(void)
 {
-    assert(0);
-    return -1;
+    g_assert_not_reached();
 }
 
 void ram_write_tracking_stop(void)
 {
-    assert(0);
+    g_assert_not_reached();
 }
 #endif /* defined(__linux__) */
 
diff --git a/qobject/qlit.c b/qobject/qlit.c
index be8332136c..a62865b642 100644
--- a/qobject/qlit.c
+++ b/qobject/qlit.c
@@ -118,7 +118,7 @@ QObject *qobject_from_qlit(const QLitObject *qlit)
     case QTYPE_QBOOL:
         return QOBJECT(qbool_from_bool(qlit->value.qbool));
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     return NULL;
diff --git a/qobject/qnum.c b/qobject/qnum.c
index 2bbeaedc7b..dd8ea49565 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -85,8 +85,7 @@ bool qnum_get_try_int(const QNum *qn, int64_t *val)
         return false;
     }
 
-    assert(0);
-    return false;
+    g_assert_not_reached();
 }
 
 /**
@@ -123,8 +122,7 @@ bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
         return false;
     }
 
-    assert(0);
-    return false;
+    g_assert_not_reached();
 }
 
 /**
@@ -156,8 +154,7 @@ double qnum_get_double(QNum *qn)
         return qn->u.dbl;
     }
 
-    assert(0);
-    return 0.0;
+    g_assert_not_reached();
 }
 
 char *qnum_to_string(QNum *qn)
@@ -172,8 +169,7 @@ char *qnum_to_string(QNum *qn)
         return g_strdup_printf("%.17g", qn->u.dbl);
     }
 
-    assert(0);
-    return NULL;
+    g_assert_not_reached();
 }
 
 /**
diff --git a/softmmu/rtc.c b/softmmu/rtc.c
index f7114bed7d..a2145da23d 100644
--- a/softmmu/rtc.c
+++ b/softmmu/rtc.c
@@ -63,7 +63,7 @@ static time_t qemu_ref_timedate(QEMUClockType clock)
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
     return value;
 }
diff --git a/target/mips/sysemu/physaddr.c b/target/mips/sysemu/physaddr.c
index 2970df8a09..05990aa5bb 100644
--- a/target/mips/sysemu/physaddr.c
+++ b/target/mips/sysemu/physaddr.c
@@ -70,8 +70,7 @@ static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
         /* is this AM mapped in current execution mode */
         return ((adetlb_mask << am) < 0);
     default:
-        assert(0);
-        return TLBRET_BADADDR;
+        g_assert_not_reached();
     };
 }
 
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 736283e2af..29b31d70fe 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -5333,7 +5333,7 @@ void helper_msa_shf_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
     msa_move_v(pwd, pwx);
 }
@@ -5368,7 +5368,7 @@ void helper_msa_ ## helper ## _df(CPUMIPSState *env, uint32_t df,       \
         }                                                               \
         break;                                                          \
     default:                                                            \
-        assert(0);                                                      \
+        g_assert_not_reached();                                         \
     }                                                                   \
 }
 
@@ -5413,7 +5413,7 @@ void helper_msa_ldi_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
        break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -5461,7 +5461,7 @@ void helper_msa_ ## helper ## _df(CPUMIPSState *env, uint32_t df, uint32_t wd, \
         }                                                               \
         break;                                                          \
     default:                                                            \
-        assert(0);                                                      \
+        g_assert_not_reached();                                         \
     }                                                                   \
 }
 
@@ -5511,7 +5511,7 @@ void helper_msa_ ## helper ## _df(CPUMIPSState *env, uint32_t df,       \
         }                                                               \
         break;                                                          \
     default:                                                            \
-        assert(0);                                                      \
+        g_assert_not_reached();                                         \
     }                                                                   \
 }
 
@@ -5557,7 +5557,7 @@ static inline void msa_sld_df(uint32_t df, wr_t *pwd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -5632,7 +5632,7 @@ void helper_msa_ ## func ## _df(CPUMIPSState *env, uint32_t df,         \
         pwd->d[1] = msa_ ## func ## _df(df, pws->d[1], pwt->d[1]);      \
         break;                                                          \
     default:                                                            \
-        assert(0);                                                      \
+        g_assert_not_reached();                                         \
     }                                                                   \
 }
 
@@ -5771,7 +5771,7 @@ void helper_msa_ ## func ## _df(CPUMIPSState *env, uint32_t df, uint32_t wd,  \
         pwd->d[1] = msa_ ## func ## _df(df, pwd->d[1], pws->d[1], pwt->d[1]); \
         break;                                                                \
     default:                                                                  \
-        assert(0);                                                            \
+        g_assert_not_reached();                                               \
     }                                                                         \
 }
 
@@ -5811,7 +5811,7 @@ static inline void msa_splat_df(uint32_t df, wr_t *pwd,
         }
        break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -5869,7 +5869,7 @@ void helper_msa_##FUNC(CPUMIPSState *env, uint32_t df, uint32_t wd, \
         MSA_LOOP_D;                                                 \
         break;                                                      \
     default:                                                        \
-        assert(0);                                                  \
+        g_assert_not_reached();                                     \
     }                                                               \
     msa_move_v(pwd, pwx);                                           \
 }
@@ -6090,7 +6090,7 @@ void helper_msa_insve_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         pwd->d[n] = (int64_t)pws->d[0];
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -6150,7 +6150,7 @@ void helper_msa_fill_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
        break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -6565,7 +6565,7 @@ static inline void compare_af(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6596,7 +6596,7 @@ static inline void compare_un(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6625,7 +6625,7 @@ static inline void compare_eq(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6654,7 +6654,7 @@ static inline void compare_ueq(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6683,7 +6683,7 @@ static inline void compare_lt(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6712,7 +6712,7 @@ static inline void compare_ult(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6741,7 +6741,7 @@ static inline void compare_le(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6770,7 +6770,7 @@ static inline void compare_ule(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6799,7 +6799,7 @@ static inline void compare_or(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6828,7 +6828,7 @@ static inline void compare_une(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6857,7 +6857,7 @@ static inline void compare_ne(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -7107,7 +7107,7 @@ void helper_msa_fadd_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7137,7 +7137,7 @@ void helper_msa_fsub_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7167,7 +7167,7 @@ void helper_msa_fmul_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7198,7 +7198,7 @@ void helper_msa_fdiv_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7245,7 +7245,7 @@ void helper_msa_fmadd_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7280,7 +7280,7 @@ void helper_msa_fmsub_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7317,7 +7317,7 @@ void helper_msa_fexp2_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7371,7 +7371,7 @@ void helper_msa_fexdo_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7417,7 +7417,7 @@ void helper_msa_ftq_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7526,7 +7526,7 @@ void helper_msa_fmin_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 
     } else {
 
-        assert(0);
+        g_assert_not_reached();
 
     }
 
@@ -7555,7 +7555,7 @@ void helper_msa_fmin_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         FMAXMIN_A(min, max, pwx->d[0], pws->d[0], pwt->d[0], 64, status);
         FMAXMIN_A(min, max, pwx->d[1], pws->d[1], pwt->d[1], 64, status);
     } else {
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7628,7 +7628,7 @@ void helper_msa_fmax_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 
     } else {
 
-        assert(0);
+        g_assert_not_reached();
 
     }
 
@@ -7657,7 +7657,7 @@ void helper_msa_fmax_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         FMAXMIN_A(max, min, pwx->d[0], pws->d[0], pwt->d[0], 64, status);
         FMAXMIN_A(max, min, pwx->d[1], pws->d[1], pwt->d[1], 64, status);
     } else {
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7681,7 +7681,7 @@ void helper_msa_fclass_df(CPUMIPSState *env, uint32_t df,
         pwd->d[0] = float_class_d(pws->d[0], status);
         pwd->d[1] = float_class_d(pws->d[1], status);
     } else {
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -7723,7 +7723,7 @@ void helper_msa_ftrunc_s_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7753,7 +7753,7 @@ void helper_msa_ftrunc_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7783,7 +7783,7 @@ void helper_msa_fsqrt_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7832,7 +7832,7 @@ void helper_msa_frsqrt_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7862,7 +7862,7 @@ void helper_msa_frcp_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7892,7 +7892,7 @@ void helper_msa_frint_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7946,7 +7946,7 @@ void helper_msa_flog2_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7983,7 +7983,7 @@ void helper_msa_fexupl_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -8019,7 +8019,7 @@ void helper_msa_fexupr_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -8046,7 +8046,7 @@ void helper_msa_ffql_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     msa_move_v(pwd, pwx);
@@ -8072,7 +8072,7 @@ void helper_msa_ffqr_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     msa_move_v(pwd, pwx);
@@ -8100,7 +8100,7 @@ void helper_msa_ftint_s_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -8130,7 +8130,7 @@ void helper_msa_ftint_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -8166,7 +8166,7 @@ void helper_msa_ffint_s_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -8196,7 +8196,7 @@ void helper_msa_ffint_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 5967ea07a9..ecc3f79326 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -249,7 +249,7 @@ static void dfp_set_FPRF_from_FRT_with_context(struct PPC_DFP *dfp,
         fprf = 0x05;
         break;
     default:
-        assert(0); /* should never get here */
+        g_assert_not_reached();
     }
     dfp->env->fpscr &= ~FP_FPRF;
     dfp->env->fpscr |= (fprf << FPSCR_FPRF);
@@ -1243,7 +1243,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
         } else if (decNumberIsQNaN(&dfp.b)) {                  \
             vt.VsrD(1) = -2;                                   \
         } else {                                               \
-            assert(0);                                         \
+            g_assert_not_reached();                            \
         }                                                      \
         set_dfp64(t, &vt);                                     \
     } else {                                                   \
@@ -1252,7 +1252,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
         } else if ((size) == 128) {                            \
             vt.VsrD(1) = dfp.b.exponent + 6176;                \
         } else {                                               \
-            assert(0);                                         \
+            g_assert_not_reached();                            \
         }                                                      \
         set_dfp64(t, &vt);                                     \
     }                                                          \
@@ -1300,7 +1300,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,          \
         raw_inf = 0x1e000;                                                \
         bias = 6176;                                                      \
     } else {                                                              \
-        assert(0);                                                        \
+        g_assert_not_reached();                                           \
     }                                                                     \
                                                                           \
     if (unlikely((exp < 0) || (exp > max_exp))) {                         \
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 64e30435f5..b064f3bd04 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -353,7 +353,7 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
         break;
     default:
         /* Should never reach here with other MMU models */
-        assert(0);
+        g_assert_not_reached();
     }
 #else
     ppc_tlb_invalidate_all(env);
diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
index ed431e34e6..5bd6b769d3 100644
--- a/tests/qtest/ipmi-bt-test.c
+++ b/tests/qtest/ipmi-bt-test.c
@@ -251,7 +251,7 @@ static void emu_msg_handler(void)
         msg[msg_len++] = 0xa0;
         write_emu_msg(msg, msg_len);
     } else {
-        g_assert(0);
+        g_assert_not_reached();
     }
 }
 
diff --git a/tests/qtest/ipmi-kcs-test.c b/tests/qtest/ipmi-kcs-test.c
index afc24dd3e4..3186c6ad64 100644
--- a/tests/qtest/ipmi-kcs-test.c
+++ b/tests/qtest/ipmi-kcs-test.c
@@ -145,7 +145,7 @@ static void kcs_cmd(uint8_t *cmd, unsigned int cmd_len,
         break;
 
     default:
-        g_assert(0);
+        g_assert_not_reached();
     }
     *rsp_len = j;
 }
@@ -184,7 +184,7 @@ static void kcs_abort(uint8_t *cmd, unsigned int cmd_len,
         break;
 
     default:
-        g_assert(0);
+        g_assert_not_reached();
     }
 
     /* Start the abort here */
diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
index 8fa3313cc3..37e352c651 100644
--- a/tests/qtest/rtl8139-test.c
+++ b/tests/qtest/rtl8139-test.c
@@ -59,7 +59,7 @@ PORT(IntrMask, w, 0x3c)
 PORT(IntrStatus, w, 0x3E)
 PORT(TimerInt, l, 0x54)
 
-#define fatal(...) do { g_test_message(__VA_ARGS__); g_assert(0); } while (0)
+#define fatal(...) do { g_test_message(__VA_ARGS__); g_assert_not_reached(); } while (0)
 
 static void test_timer(void)
 {
-- 
2.38.1


